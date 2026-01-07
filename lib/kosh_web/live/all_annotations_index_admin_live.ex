defmodule KoshWeb.AllAnnotationsIndexAdminLive do
  alias Kosh.Notifications
  use KoshWeb, :live_view
  import KoshWeb.Components.DescriptionAnnotationCard
  import KoshWeb.Components.SubjectAnnotationCard
  import KoshWeb.Components.AgentAnnotationCard
  alias Kosh.Annotations.DescriptionAnnotation
  alias Kosh.Annotations.SubjectsAnnotation
  alias Kosh.Annotations.AgentAnnotation

  alias Kosh.Annotations

  def mount(_params, _session, socket) do
    {submitted_subjects, submitted_descriptions, submitted_agents} =
      Annotations.list_all_annotations(:pending)

    combined_submitted_sorted = submitted_subjects ++ submitted_descriptions ++ submitted_agents

    combined_submitted_sorted =
      if length(combined_submitted_sorted) > 0 do
        combined_submitted_sorted
        |> Enum.sort_by(
          fn item ->
            case item.inserted_at do
              %DateTime{} = dt -> dt
              %NaiveDateTime{} = ndt -> DateTime.from_naive!(ndt, "Etc/UTC")
            end
          end,
          {:desc, DateTime}
        )
      else
        combined_submitted_sorted
      end

    {approved_subjects, approved_descriptions, approved_agents} =
      Annotations.list_all_annotations(:accepted)

    combined_approved_sorted = approved_subjects ++ approved_descriptions ++ approved_agents

    # Sort according to "updated_at", so the recently approved annotation appears first
    combined_approved_sorted =
      if length(combined_approved_sorted) > 0 do
        combined_approved_sorted
        |> Enum.sort_by(
          fn item ->
            case item.updated_at do
              %DateTime{} = dt -> dt
              %NaiveDateTime{} = ndt -> DateTime.from_naive!(ndt, "Etc/UTC")
            end
          end,
          {:desc, DateTime}
        )
      else
        combined_approved_sorted
      end

    socket =
      socket
      |> assign(:combined_submitted_sorted, combined_submitted_sorted)
      |> assign(:combined_approved_sorted, combined_approved_sorted)

    {:ok, socket}
  end

  # def handle_event("approve_description", %{"id" => id}, socket) do
  #   with {:ok, _} <- Annotations.approve_description_annotation(id) do
  #     socket = socket |> put_flash(:info, "Description annotation approved") |> push_navigate(to: "/admin/all-annotations")
  #     {:noreply, socket}
  #   else
  #     {:error, _} ->
  #       socket = put_flash(socket, :error, "Failed to approve description annotation")
  #       {:noreply, socket}
  #   end
  # end
  alias Kosh.EmailNotifications

  def handle_event("approve_description", %{"id" => id}, socket) do
    with {:ok, annotation} <- Annotations.get_description_annotation(id),
         {:ok, _} <-
           Annotations.approve_description_annotation(id, socket.assigns.current_user.id) do
      # Send approval notification email
      Task.start(fn ->
        EmailNotifications.deliver_approved_annotation_notification(annotation.user, annotation)

        Notifications.notify_user_about_annotation_status(
          annotation,
          socket.assigns.current_user.id,
          :annotation_approved
        )
      end)

      socket =
        socket
        |> put_flash(:info, "Description annotation approved")
        |> push_navigate(to: "/admin/all-annotations")

      {:noreply, socket}
    else
      {:error, :not_found} ->
        socket = socket |> put_flash(:error, "Description annotation not found")
        {:noreply, socket}

      {:error, changeset} ->
        socket =
          socket
          |> put_flash(
            :error,
            "Failed to approve description annotation: #{inspect(changeset.errors)}"
          )

        {:noreply, socket}
    end
  end

  def handle_event("delete_description", %{"id" => id}, socket) do
    with {:ok, annotation} <- Annotations.get_description_annotation(id),
         {:ok, _} <- Annotations.delete_description_annotation(id) do
      # Send rejection notification email
      Task.start(fn ->
        EmailNotifications.deliver_rejected_annotation_notification(annotation.user, annotation)

        Notifications.notify_user_about_annotation_status(
          annotation,
          socket.assigns.current_user.id,
          :annotation_deleted
        )
      end)

      socket =
        socket
        |> put_flash(:info, "Description annotation deleted")
        |> push_navigate(to: "/admin/all-annotations")

      {:noreply, socket}
    else
      {:error, :not_found} ->
        socket = socket |> put_flash(:error, "Description annotation not found")
        {:noreply, socket}

      {:error, changeset} ->
        socket =
          socket
          |> put_flash(
            :error,
            "Failed to delete description annotation: #{inspect(changeset.errors)}"
          )

        {:noreply, socket}
    end
  end

  def handle_event("approve_subject_annotation", %{"id" => id}, socket) do
    with {:ok, annotation} <- Annotations.get_subject_annotation(id),
         {:ok, _} <- Annotations.approve_subject_annotation(id, socket.assigns.current_user.id) do
      # Send approval notification email
      Task.start(fn ->
        EmailNotifications.deliver_approved_annotation_notification(annotation.user, annotation)

        Notifications.notify_user_about_annotation_status(
          annotation,
          socket.assigns.current_user.id,
          :annotation_approved
        )
      end)

      socket =
        socket
        |> put_flash(:info, "Subject annotation approved")
        |> push_navigate(to: "/admin/all-annotations")

      {:noreply, socket}
    else
      {:error, :not_found} ->
        socket = socket |> put_flash(:error, "Subject annotation not found")
        {:noreply, socket}

      {:error, :all_subjects_already_present} ->
        socket =
          socket
          |> put_flash(
            :error,
            "All the subjects in this annotation are already present in the file"
          )

        {:noreply, socket}

      {:error, changeset} ->
        socket =
          socket
          |> put_flash(
            :error,
            "Failed to approve subject annotation: #{inspect(changeset.errors)}"
          )

        {:noreply, socket}
    end
  end

  def handle_event("delete_subject", %{"id" => id}, socket) do
    with {:ok, annotation} <- Annotations.get_subject_annotation(id),
         {:ok, _} <- Annotations.delete_subject_annotation(id) do
      # Send rejection notification email
      Task.start(fn ->
        EmailNotifications.deliver_rejected_annotation_notification(annotation.user, annotation)

        Notifications.notify_user_about_annotation_status(
          annotation,
          socket.assigns.current_user.id,
          :annotation_deleted
        )
      end)

      socket =
        socket
        |> put_flash(:info, "Subject annotation deleted")
        |> push_navigate(to: "/admin/all-annotations")

      {:noreply, socket}
    else
      {:error, :not_found} ->
        socket = socket |> put_flash(:error, "Subject annotation not found")
        {:noreply, socket}

      {:error, changeset} ->
        socket =
          socket
          |> put_flash(
            :error,
            "Failed to delete subject annotation: #{inspect(changeset.errors)}"
          )

        {:noreply, socket}

      _error ->
        socket =
          socket
          |> put_flash(:error, "Something went wrong while deleting subject annotation")

        {:noreply, socket}
    end
  end

  def handle_event("approve_agent_annotation", %{"id" => id}, socket) do
    with {:ok, annotation} <- Annotations.get_agent_annotation(id),
         {:ok, _} <- Annotations.approve_agent_annotation(id, socket.assigns.current_user.id) do
      Task.start(fn ->
        EmailNotifications.deliver_approved_annotation_notification(annotation.user, annotation)

        Notifications.notify_user_about_annotation_status(
          annotation,
          socket.assigns.current_user.id,
          :annotation_approved
        )
      end)

      socket =
        socket
        |> put_flash(:info, "Agent annotation approved")
        |> push_navigate(to: "/admin/all-annotations")

      {:noreply, socket}
    else
      {:error, :not_found} ->
        socket = socket |> put_flash(:error, "Agent annotation not found")
        {:noreply, socket}

      {:error, :all_agents_already_present} ->
        socket =
          socket
          |> put_flash(
            :error,
            "All the agents in this annotation are already present in the file"
          )

        {:noreply, socket}

      {:error, changeset} ->
        socket =
          socket
          |> put_flash(
            :error,
            "Failed to approve agent annotation: #{inspect(changeset.errors)}"
          )

        {:noreply, socket}
    end
  end

  def handle_event("delete_agent", %{"id" => id}, socket) do
    with {:ok, annotation} <- Annotations.get_agent_annotation(id),
         {:ok, _} <- Annotations.delete_agent_annotation(id) do
      Task.start(fn ->
        EmailNotifications.deliver_rejected_annotation_notification(annotation.user, annotation)

        Notifications.notify_user_about_annotation_status(
          annotation,
          socket.assigns.current_user.id,
          :annotation_deleted
        )
      end)

      socket =
        socket
        |> put_flash(:info, "Agent annotation deleted")
        |> push_navigate(to: "/admin/all-annotations")

      {:noreply, socket}
    else
      {:error, :not_found} ->
        socket = socket |> put_flash(:error, "Agent annotation not found")
        {:noreply, socket}

      {:error, changeset} ->
        socket =
          socket
          |> put_flash(
            :error,
            "Failed to delete agent annotation: #{inspect(changeset.errors)}"
          )

        {:noreply, socket}

      _error ->
        socket =
          socket |> put_flash(:error, "Something went wrong while deleting agent annotation")

        {:noreply, socket}
    end
  end
end
