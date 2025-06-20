defmodule KoshWeb.Components.AnnotationSection.AnnotationSectionWrapper do
  alias Kosh.Annotations
  use Phoenix.LiveComponent
  @impl true
  def mount(socket) do
    socket = assign(socket, render_annotation_form: false)
    # IO.inspect(socket, label: "Socket inside wrapper: ")
    {:ok, socket}
  end

  @impl true
  def update(new_assigns, socket) do
    socket = assign(socket, new_assigns)

    total_user_annotations =
      if socket.assigns.current_user do
        Annotations.count_total_annotations_of_user(socket.assigns.current_user.id)
      else
        []
      end

    total_annotations = Annotations.count_total_approved_annotations()

    socket =
      assign(socket,
        total_user_annotations: total_user_annotations,
        total_annotations: total_annotations
      )

    file = socket.assigns.file

    latest_accepted_description_annotations =
      file.accepted_description_annotations
      |> Enum.sort_by(& &1.inserted_at, :desc)
      |> Enum.take(3)

    latest_accepted_subjects_annotations =
      file.accepted_subjects_annotations
      |> Enum.sort_by(& &1.inserted_at, :desc)
      |> Enum.take(3)

    socket =
      assign(socket,
        latest_accepted_description_annotations: latest_accepted_description_annotations,
        latest_accepted_subjects_annotations: latest_accepted_subjects_annotations
      )

    # IO.inspect(socket, label: "Socket inside wrapper in update: ")

    {:ok, socket}
  end

  @impl true
  def handle_event("show_featured", _unsigned_params, socket) do
    socket = assign(socket, render_annotation_form: false)
    {:noreply, socket}
  end

  @impl true
  def handle_event("show_form", _unsigned_params, socket) do
    socket = assign(socket, render_annotation_form: true)
    {:noreply, socket}
  end
end
