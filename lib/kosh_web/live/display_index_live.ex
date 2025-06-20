defmodule KoshWeb.DisplayIndexLive do
  use KoshWeb, :live_view
  alias Kosh.EAD

  @impl Phoenix.LiveView
  def mount(_params, _session, socket) do
    files = EAD.list_files()
    {:ok, assign(socket, files: files)}
  end

  @impl Phoenix.LiveView
  def render(assigns) do
    ~H"""
    <div class="w-full max-w-6xl mx-auto p-6">
      <div class="bg-white rounded-lg shadow-md overflow-hidden">
        <div class="bg-primary-purple p-6 flex justify-between items-center">
          <h1 class="text-2xl font-bold text-white">Files</h1>
          <.link
            navigate={~p"/upload"}
            class="bg-white text-primary-purple px-4 py-2 rounded-lg font-medium hover:bg-gray-100"
          >
            Upload New
          </.link>
        </div>

        <div class="p-6">
          <%= if Enum.empty?(@files) do %>
            <div class="text-center py-12">
              <h3 class="text-lg font-medium text-gray-500 mb-4">
                No files have been processed yet
              </h3>
              <.link
                navigate={~p"/upload"}
                class="inline-flex items-center px-4 py-2 bg-primary-purple text-white rounded-lg"
              >
                Upload an XML file
              </.link>
            </div>
          <% else %>
            <div class="overflow-x-auto">
              <table class="min-w-full divide-y divide-gray-200">
                <thead>
                  <tr>
                    <th class="px-6 py-3 bg-gray-50 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                      Title
                    </th>
                    <th class="px-6 py-3 bg-gray-50 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                      Unit ID
                    </th>
                    <th class="px-6 py-3 bg-gray-50 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                      Subjects
                    </th>
                    <th class="px-6 py-3 bg-gray-50 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                      Date
                    </th>
                    <th class="px-6 py-3 bg-gray-50"></th>
                  </tr>
                </thead>
                <tbody class="bg-white divide-y divide-gray-200">
                  <%= for file <- @files do %>
                    <tr class="hover:bg-gray-50">
                      <td class="px-6 py-4 whitespace-nowrap text-sm font-medium text-gray-900">
                        <%= file.title %>
                      </td>
                      <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500">
                        <%= file.unitid.id %>
                      </td>
                      <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500">
                        <%= length(file.subjects) %>
                      </td>
                      <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500">
                        <%= Calendar.strftime(file.inserted_at, "%Y-%m-%d") %>
                      </td>
                      <td class="px-6 py-4 whitespace-nowrap text-right text-sm font-medium">
                        <.link
                          navigate={~p"/annotation/display?uri=#{file.uri}"}
                          class="text-primary-purple hover:text-indigo-900"
                        >
                          View
                        </.link>
                      </td>
                    </tr>
                  <% end %>
                </tbody>
              </table>
            </div>
          <% end %>
        </div>
      </div>
    </div>
    """
  end
end
