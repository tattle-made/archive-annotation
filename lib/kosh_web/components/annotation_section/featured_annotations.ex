defmodule KoshWeb.Components.AnnotationSection.FeaturedAnnotations do
  use Phoenix.LiveComponent
  import KoshWeb.Components.DescriptionAnnotationCard
  import KoshWeb.Components.SubjectAnnotationCard
  import KoshWeb.Components.AgentAnnotationCard

  def mount(socket) do
    {:ok, socket}
  end

  def update(new_assigns, socket) do
    socket = assign(socket, new_assigns)
    # IO.inspect(socket, label: "socket from update")

    {:ok, socket}
  end
end
