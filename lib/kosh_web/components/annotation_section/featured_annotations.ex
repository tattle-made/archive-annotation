defmodule KoshWeb.Components.AnnotationSection.FeaturedAnnotations do
  use Phoenix.LiveComponent
  import KoshWeb.CoreComponents
  alias Kosh.EAD
  alias Kosh.Annotations
  import Phoenix.LiveView
  import KoshWeb.Components.DescriptionAnnotationCard
  import KoshWeb.Components.SubjectAnnotationCard

  def mount(socket) do
    {:ok, socket}
  end

  def update(new_assigns, socket) do
    socket = assign(socket, new_assigns)
    # IO.inspect(socket, label: "socket from update")

    {:ok, socket}
  end
end
