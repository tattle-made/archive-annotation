defmodule KoshWeb.AllAnnotationsIndexAdminLive do
alias Kosh.Notifications
alias Kosh.Notifications.Notification
  use KoshWeb, :live_view
  import KoshWeb.Components.DescriptionAnnotationCard
  import KoshWeb.Components.SubjectAnnotationCard

  alias Kosh.Annotations

  def mount(_params, _session, socket) do
    {submitted_subjects, submitted_descriptions} = {
      Annotations.list_subject_annotations(:pending),
      Annotations.list_description_annotations(:pending)
    }

    {approved_subjects, approved_descriptions} = {
      Annotations.list_subject_annotations(:accepted),
      Annotations.list_description_annotations(:accepted)
    }

    # IO.inspect(submitted_subjects, label: "submitted_subjects")
    # IO.inspect(submitted_descriptions)

    socket =
      socket
      |> assign(:submitted_subjects, submitted_subjects)
      |> assign(:submitted_descriptions, submitted_descriptions)
      |> assign(:approved_subjects, approved_subjects)
      |> assign(:approved_descriptions, approved_descriptions)

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
         {:ok, _} <- Annotations.approve_description_annotation(id, socket.assigns.current_user.id) do

      # Send approval notification email
      Task.start(fn ->
        EmailNotifications.deliver_approved_annotation_notification(annotation.user, annotation)
        Notifications.notify_user_about_annotation_status(annotation, socket.assigns.current_user.id, :annotation_approved)
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
        Notifications.notify_user_about_annotation_status(annotation, socket.assigns.current_user.id, :annotation_deleted)
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
        Notifications.notify_user_about_annotation_status(annotation, socket.assigns.current_user.id, :annotation_approved)
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
        Notifications.notify_user_about_annotation_status(annotation, socket.assigns.current_user.id, :annotation_deleted)
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
end
