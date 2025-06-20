defmodule KoshWeb.AdminRoutesDisplayLive do
  use KoshWeb, :live_view

  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  def render(assigns) do
    ~H"""
    <div class="section-gutter w-full  ">
      <div class="text-secondary-purple font-semibold bg-[#E6E9F5]/50 mt-[2px] flex items-center text-body-md-18 h-12 px-4 sm:text-body-lg-24 sm:h-14 sm:px-6 xl:text-heading-28 xl:h-16 xl:px-8
    ">
        Admin
      </div>
      <h1 class="text-primary-purple text-xl font-bold mb-3 mt-4">Admin Only Routes</h1>
      <div class="flex flex-col gap-4 mb-8">
        <.link
          navigate={~p"/admin/all-annotations"}
          class="flex items-center text-secondary-purple font-semibold hover:underline"
        >
          <span>View all annotations submitted by all the users</span>
          <img src="/images/redirect-color-primary.svg" alt="logo">
        </.link>
        <.link
          navigate={~p"/admin/upload"}
          class="flex items-center text-secondary-purple font-semibold hover:underline"
        >
          <span>Upload a new EAD XML file</span>
          <img src="/images/redirect-color-primary.svg" alt="logo">
        </.link>
        <.link
          navigate={~p"/admin/export-ead"}
          class="flex items-center text-secondary-purple font-semibold hover:underline"
        >
          <span>Export EAD XML Collections with updated annotations</span>
          <img src="/images/redirect-color-primary.svg" alt="logo">
        </.link>
      </div>

      <div class="mt-8">
        <h2 class="text-primary-purple text-xl font-bold">View All Files</h2>
        <p class="text-secondary-purple text-xs mb-3">
          (Not an admin-only route, but not navigable from inside the application anywhere else)
        </p>
        <.link
          navigate={~p"/annotation/display-files"}
          class="flex items-center text-secondary-purple font-semibold hover:underline"
        >
          <span>View all Files</span>
          <img src="/images/redirect-color-primary.svg" alt="logo">
        </.link>
      </div>
    </div>
    """
  end
end
