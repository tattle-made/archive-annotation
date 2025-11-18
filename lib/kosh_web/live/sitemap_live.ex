defmodule KoshWeb.SitemapLive do
  @moduledoc """
  LiveView for displaying the sitemap of the application.

  Currently, this is being used to list non-navigable routes that aren't
  accessible through the main navigation but should still be discoverable.
  """
  use KoshWeb, :live_view

  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  def render(assigns) do
    ~H"""
    <div class="max-w-4xl mx-auto px-4 py-8">
      <h1 class="text-2xl font-bold mb-6">Sitemap</h1>

      <div class="mb-8">
        <h2 class="text-xl font-semibold mb-4">Non-navigable Routes</h2>
        <ul class="list-disc pl-6 space-y-2">
          <li>
            <.link href="/notifications" class="text-blue-600 hover:underline">App Notifications</.link>
          </li>
        </ul>
      </div>
    </div>
    """
  end
end
