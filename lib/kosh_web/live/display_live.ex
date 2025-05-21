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
    <div class="section-gutter w-full">
      <div class="w-full text-secondary-purple font-semibold bg-[#E6E9F5]/50 mt-[2px] flex items-center text-body-md-18 h-12 px-4 sm:text-body-lg-24 sm:h-14 sm:px-6 xl:text-heading-28 xl:h-16 xl:px-8">
        Miili's Archives Annotation Tool
      </div>

      <div class="py-6  mx-auto">
        <div class="grid grid-cols-1 md:grid-cols-3 gap-6">
          <!-- Title Section -->
          <div>
            <h2 class="text-primary-purple font-bold mb-2">Title</h2>
            <div class="bg-gray-100 rounded p-4">
              <p class="text-secondary-purple"><%= @file.title %></p>
            </div>
          </div>

          <!-- Subject(s) Section -->
          <div>
            <h2 class="text-primary-purple font-bold mb-2">Subject(s)</h2>
            <div class="space-y-2">
              <%= for subject <- @file.subjects do %>
                <div class="bg-gray-100 rounded p-4">
                  <p class="text-secondary-purple"><%= subject.content %></p>
                </div>
              <% end %>
              <%= if Enum.empty?(@file.subjects) do %>
                <div class="bg-gray-100 rounded p-4">
                  <p class="text-gray-500">No subjects</p>
                </div>
              <% end %>
            </div>
          </div>

          <!-- Description Section -->
          <div>
            <h2 class="text-primary-purple font-bold mb-2">Description</h2>
            <div class="bg-gray-100 rounded p-4">
              <%= if @file.description && length(@file.description) > 0 do %>
                <p class="text-secondary-purple"><%= Enum.join(@file.description, " ") %></p>
              <% else %>
                <p class="text-gray-500">No description available</p>
              <% end %>
            </div>
          </div>

          <!-- Collection Section -->
          <div>
            <h2 class="text-primary-purple font-bold mb-2">Collection</h2>
            <div class="bg-gray-100 rounded p-4">
              <p class="text-secondary-purple"><%= @file.collection.title %></p>
            </div>
          </div>

          <!-- Series Section -->
          <div>
            <h2 class="text-primary-purple font-bold mb-2">Series</h2>
            <div class="bg-gray-100 rounded p-4">
              <%= if @file.series do %>
                <p class="text-secondary-purple"><%= @file.series.title %></p>
              <% else %>
                <p class="text-gray-500">No series</p>
              <% end %>
            </div>
          </div>

          <!-- Sub-series Section -->
          <div>
            <h2 class="text-primary-purple font-bold mb-2">Sub-series</h2>
            <div class="bg-gray-100 rounded p-4">
              <%= if @file.sub_series do %>
                <p class="text-secondary-purple"><%= @file.sub_series.title %></p>
              <% else %>
                <p class="text-gray-500">No sub-series</p>
              <% end %>
            </div>
          </div>

          <!-- Date(s) Section -->
          <div>
            <h2 class="text-primary-purple font-bold mb-2">Date(s)</h2>
            <div class="bg-gray-100 rounded p-4">
              <%= if @file.unitdate && @file.unitdate.content do %>
                <p class="text-secondary-purple"><%= @file.unitdate.content %></p>
              <% else %>
                <p class="text-gray-500">No date available</p>
              <% end %>
            </div>
          </div>

          <!-- Identifier Section -->
          <div>
            <h2 class="text-primary-purple font-bold mb-2">Identifier</h2>
            <div class="bg-gray-100 rounded p-4">
              <%= if @file.unitid && @file.unitid.id do %>
                <p class="text-secondary-purple"><%= @file.unitid.id %></p>
              <% else %>
                <p class="text-gray-500">No identifier available</p>
              <% end %>
            </div>
          </div>

          <!-- Key Object Links Section -->
          <div>
            <h2 class="text-primary-purple font-bold mb-2">Key Object Links</h2>
            <%= if @file.dao && map_size(@file.dao) > 0 && @file.dao.daolocs && length(@file.dao.daolocs) > 0 do %>
              <div class="space-y-2">
                <%= for loc <- @file.dao.daolocs do %>
                  <div class="bg-gray-100 rounded p-4 flex items-center justify-between">
                    <p class="text-secondary-purple truncate flex-1">
                      <%= loc["xlink_href"] && "Digital Object URL..." || "No URL" %>
                    </p>
                    <%= if loc["xlink_href"] do %>
                      <a href={loc["xlink_href"]} target="_blank" rel="noopener noreferrer" class="ml-2 flex-shrink-0">
                        <span class="inline-block ml-2">↗</span>
                      </a>
                    <% end %>
                  </div>
                <% end %>
              </div>
            <% else %>
              <div class="bg-gray-100 rounded p-4">
                <p class="text-gray-500">No digital objects available</p>
              </div>
            <% end %>
          </div>
        </div>

        <div class="flex justify-between mt-8">
          <.link
            navigate={~p"/upload"}
            class="px-4 py-2 text-primary-purple border border-primary-purple rounded hover:bg-primary-purple/10"
          >
            Back to Upload
          </.link>
          <.link
            navigate={~p"/display"}
            class="px-4 py-2 text-white bg-primary-purple rounded hover:bg-purple-700"
          >
            Files Index
          </.link>
        </div>
      </div>
    </div>
    """
  end
end
