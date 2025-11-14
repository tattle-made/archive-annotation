defmodule Kosh.Notifications do
  @moduledoc """
  The Notifications context handles all notification-related functionality.
  """

  import Ecto.Query
  alias Kosh.Annotations
  alias Kosh.Repo
  alias Kosh.Workers.AppNotificationWorker
  alias Kosh.Notifications.{Notification, Delivery}
  alias Kosh.Accounts
  alias Kosh.Annotations.{DescriptionAnnotation, SubjectsAnnotation}

  @doc """
  Notify admins about a new annotation that needs review.
  """
  def notify_admins_about_annotation(annotation, actor_id) do
    admin_ids =
      Accounts.list_users_by_role(:admin)
      |> Enum.map(& &1.id)

    enqueue_notification(
      :annotation_created,
      annotation,
      actor_id,
      admin_ids
    )
  end

  @doc """
  Notify a user about their annotation's status change.
  """
  def notify_user_about_annotation_status(annotation, actor_id, :annotation_approved) do
    enqueue_notification(
      :annotation_approved,
      annotation,
      actor_id,
      [annotation.user_id]
    )
  end

  def notify_user_about_annotation_status(annotation, actor_id, :annotation_deleted) do
    enqueue_notification(
      :annotation_deleted,
      annotation,
      actor_id,
      [annotation.user_id]
    )
  end

  @doc """
  Create a notification and its deliveries in a transaction.
  """
  def create_notification(attrs) do
    %{
      action: action,
      resource_type: resource_type,
      resource_id: resource_id,
      resource_data: resource_data,
      actor_id: actor_id,
      recipient_ids: recipient_ids,
      changes: changes
    } = attrs

    # Get the resource if it exists
    # resource_result =
    #   case resource_type do
    #     :description_annotation -> Annotations.get_description_annotation(resource_id)
    #     :subjects_annotation -> Annotations.get_subject_annotation(resource_id)
    #     _ -> {:ok, %{}}
    #   end

    case generate_notification_content(
           action,
           resource_type,
           resource_id,
           resource_data,
           actor_id
         ) do
      {title, body} ->
        Repo.transaction(fn ->
          # Create the notification
          notification =
            %Notification{}
            |> Notification.changeset(%{
              action: action,
              resource_type: resource_type,
              resource_id: resource_id,
              actor_id: actor_id,
              title: title,
              body: body,
              changes: changes || %{}
            })
            |> Repo.insert!()

          # Create deliveries for each recipient
          now = DateTime.utc_now() |> DateTime.truncate(:second)

          deliveries =
            recipient_ids
            |> Enum.map(fn recipient_id ->
              %Delivery{}
              |> Delivery.changeset(%{
                notification_id: notification.id,
                recipient_id: recipient_id,
                status: :unread,
                inserted_at: now,
                updated_at: now
              })
              |> Repo.insert!()
            end)

          {notification, deliveries}
        end)

      _ ->
        {:error, :failed_to_generate_content}
    end
  end

  @doc """
  Mark a delivery as read.
  """
  def mark_as_read(delivery_id, recipient_id) do
    update_delivery_status(delivery_id, recipient_id, :read)
  end

  @doc """
  Update delivery status (read/unread).
  
  ## Parameters
    * `delivery_id` - The ID of the delivery
    * `recipient_id` - The ID of the recipient
    * `status` - The new status (:read or :unread)
  
  Returns `{:ok, delivery}` on success, `{:error, changeset}` otherwise.
  """
  def update_delivery_status(delivery_id, recipient_id, status) when status in [:read, :unread] do
    case Repo.get_by(Delivery, id: delivery_id, recipient_id: recipient_id) do
      nil ->
        {:error, :not_found}

      delivery ->
        attrs = %{
          status: status,
          read_at: if(status == :read, do: DateTime.utc_now(), else: nil),
          updated_at: DateTime.utc_now()
        }
        
        delivery
        |> Delivery.changeset(attrs)
        |> Repo.update()
    end
  end

  @doc """
  List all notifications for a user.
  """
  def list_user_notifications(user_id, opts \\ []) do
    limit = Keyword.get(opts, :limit, 20)
    unread_only = Keyword.get(opts, :unread_only, false)

    query =
      from d in Delivery,
        join: n in assoc(d, :notification),
        where: d.recipient_id == ^user_id,
        order_by: [desc: n.inserted_at],
        preload: [notification: :actor],
        limit: ^limit

    query =
      if unread_only do
        from [d, n] in query, where: d.status == :unread
      else
        query
      end

    Repo.all(query)
  end

  @doc """
  Count unread notifications for a user.
  """
  def count_unread_notifications(user_id) do
    query =
      from d in Delivery,
        where: d.recipient_id == ^user_id and d.status == :unread,
        select: count(d.id)

    Repo.one(query)
  end

  @doc """
  Mark all unread notifications as read for a user.
  Returns {:ok, count} where count is the number of notifications updated.
  """
  def mark_all_as_read(user_id) do
    now = DateTime.utc_now()
    
    {count, _} = 
      from(d in Delivery, 
        where: d.recipient_id == ^user_id and d.status == :unread
      )
      |> Repo.update_all(
        set: [
          status: :read, 
          read_at: now, 
          updated_at: now
        ]
      )
    
    {:ok, count}
  end

  @doc """
  List paginated notifications for a user.
  
  ## Parameters
    * `user_id` - The ID of the user
    * `page` - The page number (1-based)
    * `per_page` - Number of items per page
  
  Returns a tuple `{notifications, has_more}` where:
    * `notifications` - List of notification maps with delivery info
    * `has_more` - Boolean indicating if there are more pages
  """
  def list_notifications(user_id, page, per_page) when is_integer(page) and page > 0 do
    offset = (page - 1) * per_page
    
    # Get total count for pagination
    total_query = 
      from d in Delivery,
        where: d.recipient_id == ^user_id
    
    total = Repo.aggregate(total_query, :count, :id)
    
    # Get paginated deliveries with preloaded notifications
    deliveries = 
      Delivery
      |> where([d], d.recipient_id == ^user_id)
      |> order_by([d], desc: d.inserted_at)
      |> preload(:notification)
      |> limit(^per_page)
      |> offset(^offset)
      |> Repo.all()
    
    # Format the data for the view
    notifications = 
      deliveries
      |> Enum.map(fn delivery ->
        %{
          id: delivery.id,
          notification: delivery.notification,
          status: delivery.status,
          inserted_at: delivery.notification.inserted_at
        }
      end)
    
    has_more = offset + per_page < total
    {notifications, has_more}
  end

  defp enqueue_notification(action, resource, actor_id, recipient_ids) do
    resource_type =
      case resource do
        %DescriptionAnnotation{} -> :description_annotation
        %SubjectsAnnotation{} -> :subjects_annotation
        _ -> "unknown"
      end

    resource_data =
      case resource do
        %DescriptionAnnotation{} ->
          %{description: resource.description}

        %SubjectsAnnotation{} ->
          %{
            all_subjs:
              resource.new_subjects ++ Enum.map(resource.subjects || [], fn sub -> sub.content end)
          }

        _ ->
          "unknown"
      end

    %{
      action: to_string(action),
      resource_type: resource_type,
      resource_id: resource.id,
      resource_data: resource_data,
      actor_id: actor_id,
      recipient_ids: recipient_ids,
      changes: %{status: "#{action}"}
    }
    |> AppNotificationWorker.new()
    |> Oban.insert()
  end

  defp generate_notification_content(
         action,
         resource_type,
         resource_id,
         resource_data,
         actor_id
       ) do
    actor = if actor_id, do: Repo.get(Accounts.User, actor_id)

    case {action, resource_type} do
      {:annotation_created, :description_annotation} ->
        {"New Description Annotation",
         "#{actor.email} created a new description annotation. New Desc. Annotation ID: #{resource_id}."}

      {:annotation_created, :subjects_annotation} ->
        {"New Subjects Annotation",
         "#{actor.email} created a new subjects annotation. New Subjects Annotation ID: #{resource_id}."}

      {:annotation_approved, _} ->
        {"Annotation Approved", "Your annotation (ID: #{resource_id}) has been approved."}

      {:annotation_deleted, _} ->
        {"Annotation discarded",
         "Your annotation has been discarded. Content: #{if resource_type == :description_annotation do
           resource_data["description"]
         else
           Enum.join(resource_data["all_subjs"], "; ")
         end} "}

      _ ->
        {"New Notification", "You have a new notification"}
    end
  end
end
