defmodule KoshWeb.PublicDisplayAllAnnotationsLive do
  alias Kosh.Annotations
  use KoshWeb, :live_view
  import KoshWeb.Components.DescriptionAnnotationCard
  import KoshWeb.Components.SubjectAnnotationCard

  def mount(_params, _session, socket) do
    {subjects, descriptions} = Annotations.list_all_annotations(:accepted)
    socket = assign(socket, approved_descriptions: descriptions, approved_subjects: subjects)
    {:ok, socket}
  end

  def render(assigns) do
    ~H"""
    <div class="section-gutter w-full mb-2">
      <div class="text-secondary-purple font-semibold bg-[#E6E9F5]/50 mt-[2px] flex items-center text-body-md-18 mb-4 h-12 px-4 sm:text-body-lg-24 sm:h-14 sm:px-6 xl:text-heading-28 xl:h-16 xl:px-8
    ">
        View All Approved Annotations
      </div>

      <div class="flex flex-wrap gap-6">
        <%= if Enum.empty?(@approved_descriptions) and Enum.empty?(@approved_subjects) do %>
          <p class="text-gray-500 text-sm">No entries to display</p>
        <% else %>
          <%= for annotation <- @approved_descriptions do %>
            <.description_annotation_card
              annotation={annotation}
              type="approved"
              display_only?={true}
            />
          <% end %>
          <%= for annotation <- @approved_subjects do %>
            <.subject_annotation_card annotation={annotation} type="approved" display_only?={true} />
          <% end %>
        <% end %>
      </div>
    </div>
    """
  end
end
