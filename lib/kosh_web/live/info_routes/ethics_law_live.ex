defmodule KoshWeb.InfoRoutes.EthicsLawLive do
  use KoshWeb, :live_view

  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  def render(assigns) do
    ~H"""
    <div class="section-gutter w-full">
      <div class="w-full text-secondary-purple font-semibold bg-[#E6E9F5]/50 mt-[2px] flex items-center text-body-md-18 h-12 px-4 sm:text-body-lg-24 sm:h-14 sm:px-6 xl:text-heading-28 xl:h-16 xl:px-8">
        Ethics Law
      </div>

      <p class="text-primary-purple mt-2 ">Coming Soon...</p>
    </div>
    """
  end

end
