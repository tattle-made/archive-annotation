defmodule KoshWeb.DisplayLive do
  use KoshWeb, :live_view
  alias Kosh.EAD

  @impl Phoenix.LiveView
  def mount(%{"id" => id}, _session, socket) do
    case EAD.get_ead(id) do
      nil ->
        {:ok,
         socket
         |> put_flash(:error, "EAD not found")
         |> redirect(to: ~p"/upload")}

      ead ->
        {:ok, assign(socket, ead: ead)}
    end
  end

  @impl Phoenix.LiveView
  def render(assigns) do
    ~H"""
    <div class="w-full max-w-4xl mx-auto p-6">
      <div class="bg-white rounded-lg shadow-md overflow-hidden">
        <div class="bg-primary-purple p-6">
          <h1 class="text-2xl font-bold text-white">EAD Metadata</h1>
        </div>

        <div class="p-6 space-y-6">
          <div>
            <h2 class="text-xl font-semibold text-secondary-purple mb-4">Repository Information</h2>
            <div class="bg-gray-50 rounded-lg p-4">
              <div class="grid grid-cols-1 md:grid-cols-2 gap-4">
                <div>
                  <h3 class="text-sm font-medium text-gray-500">Repository Name</h3>
                  <p class="text-lg"><%= @ead.corpname || "Not specified" %></p>
                </div>
                <div>
                  <h3 class="text-sm font-medium text-gray-500">Country Code</h3>
                  <p class="text-lg"><%= @ead.country_code || "Not specified" %></p>
                </div>
              </div>
            </div>
          </div>

          <div>
            <h2 class="text-xl font-semibold text-secondary-purple mb-4">Address</h2>
            <div class="bg-gray-50 rounded-lg p-4">
              <%= if @ead.address && length(@ead.address) > 0 do %>
                <ul class="space-y-1">
                  <%= for line <- @ead.address do %>
                    <li><%= line %></li>
                  <% end %>
                </ul>
              <% else %>
                <p class="text-gray-500">No address information available</p>
              <% end %>
            </div>
          </div>

          <div>
            <h2 class="text-xl font-semibold text-secondary-purple mb-4">
              Subjects (<%= length(@ead.subjects) %>)
            </h2>
            <div class="bg-gray-50 rounded-lg p-4">
              <%= if @ead.subjects && length(@ead.subjects) > 0 do %>
                <div class="grid grid-cols-1 md:grid-cols-2 gap-x-4 gap-y-2">
                  <%= for subject <- @ead.subjects do %>
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
        </div>

        <div class="border-t border-gray-200 p-4">
          <div class="flex justify-between">
            <div class="text-sm text-gray-500">
              Created: <%= Calendar.strftime(@ead.inserted_at, "%B %d, %Y at %I:%M %p") %>
            </div>
            <.link
              navigate={~p"/upload"}
              class="text-primary-purple hover:text-indigo-700 font-medium"
            >
              Back to Upload
            </.link>
          </div>
        </div>
      </div>
    </div>
    """
  end
end
