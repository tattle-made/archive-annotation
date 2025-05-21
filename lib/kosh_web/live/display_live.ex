defmodule KoshWeb.DisplayLive do
  use KoshWeb, :live_view
  alias Kosh.EAD

  @impl Phoenix.LiveView
  def mount(%{"id" => id}, _session, socket) do
    case EAD.get_file(id) do
      nil ->
        {:ok,
         socket
         |> put_flash(:error, "File not found")
         |> redirect(to: ~p"/upload")}

      file ->
        {:ok, assign(socket, file: file)}
    end
  end

  @impl Phoenix.LiveView
  def render(assigns) do
    ~H"""
    <div class="w-full max-w-4xl mx-auto p-6">
      <div class="bg-white rounded-lg shadow-md overflow-hidden">
        <div class="bg-primary-purple p-6">
          <h1 class="text-2xl font-bold text-white">File: <%= @file.title %></h1>
        </div>

        <div class="p-6 space-y-6">
          <div>
            <h2 class="text-xl font-semibold text-secondary-purple mb-4">Hierarchy</h2>
            <div class="bg-gray-50 rounded-lg p-4">
              <div class="space-y-4">
                <div>
                  <h3 class="text-sm font-medium text-gray-500">Collection</h3>
                  <p class="text-lg"><%= @file.collection.title %></p>
                </div>
                <%= if @file.series do %>
                  <div>
                    <h3 class="text-sm font-medium text-gray-500">Series</h3>
                    <p class="text-lg"><%= @file.series.title %></p>
                  </div>
                <% end %>
                <%= if @file.sub_series do %>
                  <div>
                    <h3 class="text-sm font-medium text-gray-500">Sub-Series</h3>
                    <p class="text-lg"><%= @file.sub_series.title %></p>
                  </div>
                <% end %>
              </div>
            </div>
          </div>

          <div>
            <h2 class="text-xl font-semibold text-secondary-purple mb-4">File Details</h2>
            <div class="bg-gray-50 rounded-lg p-4">
              <div class="grid grid-cols-1 md:grid-cols-2 gap-4">
                <div>
                  <h3 class="text-sm font-medium text-gray-500">Unit ID</h3>
                  <p class="text-lg"><%= @file.unitid.id %></p>
                  <%= if @file.unitid.uri do %>
                    <p class="text-sm text-gray-500">URI: <%= @file.unitid.uri %></p>
                  <% end %>
                  <%= if @file.unitid.type do %>
                    <p class="text-sm text-gray-500">Type: <%= @file.unitid.type %></p>
                  <% end %>
                </div>
                <div>
                  <h3 class="text-sm font-medium text-gray-500">Unit Date</h3>
                  <p class="text-lg"><%= @file.unitdate.content %></p>
                  <%= if @file.unitdate.datechar do %>
                    <p class="text-sm text-gray-500">Date Characteristic: <%= @file.unitdate.datechar %></p>
                  <% end %>
                  <%= if @file.unitdate.normal do %>
                    <p class="text-sm text-gray-500">Normalized Date: <%= @file.unitdate.normal %></p>
                  <% end %>
                </div>
              </div>
            </div>
          </div>

          <div>
            <h2 class="text-xl font-semibold text-secondary-purple mb-4">Description</h2>
            <div class="bg-gray-50 rounded-lg p-4">
              <%= if @file.description && length(@file.description) > 0 do %>
                <div class="prose max-w-none">
                  <%= for paragraph <- @file.description do %>
                    <p class="text-gray-600 mb-4"><%= paragraph %></p>
                  <% end %>
                </div>
              <% else %>
                <p class="text-gray-500">No description available</p>
              <% end %>
            </div>
          </div>

          <div>
            <h2 class="text-xl font-semibold text-secondary-purple mb-4">
              Subjects (<%= length(@file.subjects) %>)
            </h2>
            <div class="bg-gray-50 rounded-lg p-4">
              <%= if @file.subjects && length(@file.subjects) > 0 do %>
                <div class="grid grid-cols-1 md:grid-cols-2 gap-x-4 gap-y-2">
                  <%= for subject <- @file.subjects do %>
                    <div class="flex items-center">
                      <span class="inline-flex items-center px-2.5 py-0.5 rounded-full text-xs font-medium bg-indigo-100 text-indigo-800 mr-2">
                        <%= subject.source || "unspecified" %>
                      </span>
                      <span><%= subject.content %></span>
                    </div>
                  <% end %>
                </div>
              <% else %>
                <p class="text-gray-500">No subjects available</p>
              <% end %>
            </div>
          </div>

          <%= if @file.dao && map_size(@file.dao) > 0 do %>
            <div>
              <h2 class="text-xl font-semibold text-secondary-purple mb-4">Digital Objects</h2>
              <div class="bg-gray-50 rounded-lg p-4">
                <div class="space-y-4">
                  <%= if @file.dao.xlink_title do %>
                    <div>
                      <h3 class="text-sm font-medium text-gray-500">Title</h3>
                      <p class="text-lg"><%= @file.dao.xlink_title %></p>
                    </div>
                  <% end %>
                  <%= if @file.dao.xlink_type do %>
                    <div>
                      <h3 class="text-sm font-medium text-gray-500">Type</h3>
                      <p class="text-lg"><%= @file.dao.xlink_type %></p>
                    </div>
                  <% end %>
                  <%= if @file.dao.daolocs && length(@file.dao.daolocs) > 0 do %>
                    <div>
                      <h3 class="text-sm font-medium text-gray-500 mb-2">Locations</h3>
                      <div class="space-y-2">
                        <%= for loc <- @file.dao.daolocs do %>
                          <div class="flex items-center">
                            <%= if loc["xlink_type"] do %>
                              <span class="inline-flex items-center px-2.5 py-0.5 rounded-full text-xs font-medium bg-green-100 text-green-800 mr-2">
                                <%= loc["xlink_type"] %>
                              </span>
                            <% end %>
                            <%= if loc["xlink_href"] do %>
                              <a href={loc["xlink_href"]} class="text-primary-purple hover:text-indigo-700" target="_blank">
                                <%= loc["xlink_href"] %>
                              </a>
                            <% end %>
                          </div>
                        <% end %>
                      </div>
                    </div>
                  <% end %>
                </div>
              </div>
            </div>
          <% end %>
        </div>

        <div class="border-t border-gray-200 p-4">
          <div class="flex justify-between">
            <%!-- <div class="text-sm text-gray-500">
              Created: <%= Calendar.strftime(@file.inserted_at, "%B %d, %Y at %I:%M %p") %>
            </div> --%>
            <.link
              navigate={~p"/upload"}
              class="text-primary-purple hover:text-indigo-700 font-medium"
            >
              Back to Upload
            </.link>
            <.link
              navigate={~p"/display"}
              class="text-primary-purple hover:text-indigo-700 font-medium"
            >
              Files Index
            </.link>
          </div>
        </div>
      </div>
    </div>
    """
  end
end
