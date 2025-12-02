defmodule KoshWeb.SearchSubjectsLive do
  use KoshWeb, :live_view
  alias Kosh.SearchSubjects

  @default_page_size 80
  @max_pages_to_show 5

  def mount(_params, _session, socket) do
    {:ok, assign(socket,
      query: "",
      page: 1,
      results: %{entries: [], page_number: 1, total_pages: 0, total_entries: 0},
      show_pagination: false,
      page_links: 1..1
    )}
  end

  def handle_params(params, _uri, socket) do
    page = (params["page"] || "1") |> String.to_integer()
    query = params["q"] || ""

    if connected?(socket) do
      perform_search(socket, query, page)
    else
      # Set the query in the socket even when not connected
      {:noreply, assign(socket, query: query, page: page)}
    end
  end

  def handle_event("search", %{"query" => query}, socket) do
    {:noreply, push_patch(socket, to: "/search-subjects?q=#{URI.encode_www_form(query)}&page=1")}
  end

  def handle_event("paginate", %{"page" => page}, socket) do
    {:noreply, push_patch(socket, to: "/search-subjects?q=#{URI.encode_www_form(socket.assigns.query)}&page=#{page}")}
  end

  defp perform_search(socket, query, page) do
    page = max(1, page)
    results = SearchSubjects.search_subjects(query, page, @default_page_size)
    
    # If the requested page is beyond the total pages, redirect to the last page
    if page > results.total_pages && results.total_pages > 0 do
      {:noreply, push_patch(socket, to: "/search-subjects?q=#{URI.encode_www_form(query)}&page=#{results.total_pages}")}
    else
      {:noreply, assign(socket,
        query: query,
        page: min(page, max(1, results.total_pages)),
        results: results,
        show_pagination: results.total_pages > 1,
        page_links: page_links(min(page, results.total_pages), results.total_pages)
      )}
    end
  end

  defp page_links(current_page, total_pages) do
    if total_pages <= @max_pages_to_show do
      1..total_pages
    else
      half = div(@max_pages_to_show, 2)
      first = max(1, current_page - half)
      last = min(total_pages, first + @max_pages_to_show - 1)
      first..last
    end
  end

  def render(assigns) do
    ~H"""
    <div class="max-w-4xl mx-auto px-4 py-4">
      <div class="bg-white rounded p-4 mb-4 border border-secondary-pale-grey">
        <h1 class="text-heading-28 font-bold text-primary-black mb-1">Search Subjects</h1>
        
        <form phx-submit="search" class="mt-3">
          <div class="flex gap-2">
            <input
              type="text"
              name="query"
              value={@query}
              placeholder="Search subjects..."
              class="flex-1 p-2 border border-secondary-pale-grey rounded focus:ring-2 focus:ring-primary-purple focus:border-transparent transition-all duration-150 text-body-sm-16"
              autofocus
              phx-debounce="300"
            />
            <button 
              type="submit" 
              class="bg-primary-purple hover:bg-secondary-purple text-white px-4 py-2 rounded font-medium transition-colors duration-150 flex items-center gap-2 text-body-sm-16"
            >
              <svg xmlns="http://www.w3.org/2000/svg" class="h-4 w-4" viewBox="0 0 20 20" fill="currentColor">
                <path fill-rule="evenodd" d="M8 4a4 4 0 100 8 4 4 0 000-8zM2 8a6 6 0 1110.89 3.476l4.817 4.817a1 1 0 01-1.414 1.414l-4.816-4.816A6 6 0 012 8z" clip-rule="evenodd" />
              </svg>
              Search
            </button>
          </div>
        </form>
      </div>

      <%= if @query != "" do %>
        <div>
          <p class="text-body-sm-16 text-primary-grey mb-3">
            <span class="font-medium text-primary-black"><%= @results.total_entries %></span> results found
            <%= if @results.total_entries > 0 do %>
              <span class="text-secondary-grey">(page <%= @results.page_number %> of <%= @results.total_pages %>)</span>
            <% end %>
          </p>

          <div class="space-y-2">
            <%= for subject <- @results.entries do %>
              <div class="bg-white rounded border border-secondary-pale-grey hover:shadow-milli-1 transition-shadow duration-150">
                <div class="p-3">
                  <p class="text-body-sm-16 text-primary-black"><%= subject.content %></p>
                  <%= if subject.source do %>
                    <div class="mt-1">
                      <span class="inline-flex items-center px-2 py-0.5 rounded text-meta-12 font-medium bg-secondary-lilac text-secondary-grey">
                        <%= subject.source %>
                      </span>
                    </div>
                  <% end %>
                </div>
              </div>
            <% end %>
          </div>

          <%= if @show_pagination do %>
            <div class="flex flex-wrap justify-center gap-1.5 mt-4">
              <%= if @results.total_pages > 1 && @page > 1 do %>
                <button
                  phx-click="paginate"
                  phx-value-page={1}
                  class="px-3 py-1.5 border border-secondary-pale-grey rounded text-body-sm-16 text-primary-grey bg-white hover:bg-bg-lilac focus:outline-none focus:ring-1 focus:ring-primary-purple"
                  title="Go to first page"
                >
                  First
                </button>
              <% end %>
              
              <%= if @page > 1 do %>
                <button
                  phx-click="paginate"
                  phx-value-page={@page - 1}
                  class="px-3 py-1.5 border border-secondary-pale-grey rounded text-body-sm-16 text-primary-grey bg-white hover:bg-bg-lilac focus:outline-none focus:ring-1 focus:ring-primary-purple"
                >
                  Previous
                </button>
              <% end %>

              <%= for page <- @page_links do %>
                <button
                  phx-click="paginate"
                  phx-value-page={page}
                  class={"px-3 py-1.5 border rounded text-body-sm-16 font-medium #{if page == @page, do: "bg-primary-purple text-white border-transparent hover:bg-secondary-purple", else: "border-secondary-pale-grey text-primary-grey bg-white hover:bg-bg-lilac"} focus:outline-none focus:ring-1 focus:ring-primary-purple"}
                >
                  <%= page %>
                </button>
              <% end %>

              <%= if @page < @results.total_pages do %>
                <button
                  phx-click="paginate"
                  phx-value-page={@page + 1}
                  class="px-3 py-1.5 border border-secondary-pale-grey rounded text-body-sm-16 text-primary-grey bg-white hover:bg-bg-lilac focus:outline-none focus:ring-1 focus:ring-primary-purple"
                >
                  Next
                </button>
              <% end %>
              
              <%= if @results.total_pages > 1 && @page < @results.total_pages do %>
                <button 
                  phx-click="paginate" 
                  phx-value-page={@results.total_pages}
                  class="px-3 py-1.5 border border-secondary-pale-grey rounded text-body-sm-16 text-primary-grey bg-white hover:bg-bg-lilac focus:outline-none focus:ring-1 focus:ring-primary-purple"
                  title="Go to last page"
                >
                  Last
                </button>
              <% end %>
            </div>
          <% end %>
        </div>
      <% end %>
    </div>
    """
  end
end
