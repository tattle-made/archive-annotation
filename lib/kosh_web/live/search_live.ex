defmodule KoshWeb.SearchLive do
  use KoshWeb, :live_view

  @impl true
  def mount(params, _session, socket) do
    # The mount only triggers once when the liveview is mounted. Handle Params get truggered on every URL change.
    # The push_navigate remounts the liveview completely. The push_patch just changes the URL without remounting the liveview, hence not triggering the mount.
    # Here, the query is added through push_patch and will be handled in handle_params

    {:ok, assign(socket, subview: :none)}
  end

  def handle_event("submit-search", unsigned_params, socket) do
    # IO.inspect(unsigned_params, label: "FORM SUBMITTED: ")

    query = get_in(unsigned_params, ["search_form", "search_query"])

    socket = socket |> push_patch(to: "/search?q=#{query}")

    {:noreply, socket}
  end

  def handle_params(unsigned_params, _uri, socket) do
    query = unsigned_params["q"]

    default_search_form_map =
      if unsigned_params == %{} do
        %{}
      else
        %{"search_query" => query}
      end

    form = to_form(default_search_form_map, as: "search_form")

    results =
      if is_binary(query) and String.trim(query) != "" do
        Kosh.Search.search_files(query)
      else
        []
      end

    # IO.inspect(results, label: "SEARCH RESULTS: ")

    {:noreply,
     assign(socket,
       results: results,
       query: query,
       search_form: form,
       temporary_assigns: [search_form: nil]
     )}
  end

  # Helper to highlight the search term in text fields
  defp highlight(text, term) when is_binary(text) and is_binary(term) and term != "" do
    regex = ~r/(#{Regex.escape(term)})/i
    String.replace(text, regex, "<mark>\\1</mark>")
  end

  defp highlight(nil, _term), do: nil
  defp highlight(text, _term), do: text

  @impl Phoenix.LiveView
  def render(assigns) do
    ~H"""
    <div class="section-gutter">
      <.form for={@search_form} phx-submit="submit-search" class="flex items-center w-full mb-8">
        <div class="w-full">
          <.input
            field={@search_form[:search_query]}
            placeholder="Search our collection..."
            class="w-full h-10 rounded-r-none !text-primary-purple placeholder:text-primary-purple/70  border !border-primary-purple  "
          />
        </div>
        <button class="btn-primary-purple  font-semibold rounded-l-none mt-2 h-10 ">
          Search
        </button>
      </.form>

      <%= if !@query || String.trim(@query) == ""  do %>
        <div class="text-secondary-purple text-body-md-18 text-center">
          Please enter a search term above.
        </div>
      <% end %>
      <%= if @query && String.trim(@query) != "" do %>
        <div class="mt-6">
          <%= if Enum.empty?(@results) do %>
            <div class="text-secondary-purple text-body-md-18 text-center">
              No results found for "<%= @query %>".
            </div>
          <% else %>
            <p class=" text-secondary-purple">Found <span class="font-bold"><%=length(@results) %></span> Search Results for <span class="font-bold">"<%= @query %>"</span></p>
            <div class="grid gap-6">
              <%= for result <- @results do %>
                <div class="bg-white rounded-lg shadow-milli-1 border border-secondary-pale-grey p-6">
                  <div class="flex flex-col gap-2">
                    <%= if result.file_name do %>
                      <.link navigate={~p"/annotation/display?uri=#{result.uri}"}>
                        <span class="text-primary-purple font-bold text-xl hover:underline">
                          <%= Phoenix.HTML.raw(highlight(result.file_name, @query)) %>
                        </span>
                      </.link>
                    <% end %>
                    <%= if result.collection_name do %>
                      <div>
                        <span class="font-bold text-primary-purple">Collection:</span>
                        <span class="text-secondary-purple">
                          <%= Phoenix.HTML.raw(highlight(result.collection_name, @query)) %>
                        </span>
                      </div>
                    <% end %>
                    <%= if result.series_name do %>
                      <div>
                        <span class="font-bold text-primary-purple">Series:</span>
                        <span class="text-secondary-purple">
                          <%= Phoenix.HTML.raw(highlight(result.series_name, @query)) %>
                        </span>
                      </div>
                    <% end %>
                    <%= if result.sub_series_name do %>
                      <div>
                        <span class="font-bold text-primary-purple">Sub-series:</span>
                        <span class="text-secondary-purple">
                          <%= Phoenix.HTML.raw(highlight(result.sub_series_name, @query)) %>
                        </span>
                      </div>
                    <% end %>
                    <%= if result.description && String.trim(result.description) != "" do %>
                      <div>
                        <span class="font-bold text-primary-purple">Scope and Contents:</span>
                        <span class="text-secondary-purple">
                          <%= Phoenix.HTML.raw(highlight(result.description, @query)) %>
                        </span>
                      </div>
                    <% end %>
                    <%= if result.uri do %>
                      <div>
                        <span class="font-bold text-primary-purple">URI:</span>
                        <span class="text-secondary-purple">
                          <%= Phoenix.HTML.raw(highlight(result.uri, @query)) %>
                        </span>
                      </div>
                    <% end %>
                    <%= if result.unitid do %>
                      <div>
                        <span class="font-bold text-primary-purple">Unit ID:</span>
                        <span class="text-secondary-purple">
                          <%= Phoenix.HTML.raw(highlight(result.unitid, @query)) %>
                        </span>
                      </div>
                    <% end %>
                    <%= if result.dao_links && length(result.dao_links) > 0 do %>
                      <div>
                        <span class="font-bold text-primary-purple">Digital Object Links:</span>
                        <ul class="list-disc ml-6 mt-1">
                          <%= for link <- result.dao_links do %>
                            <li>
                              <a
                                href={link}
                                target="_blank"
                                class="underline text-primary-purple hover:text-secondary-purple"
                              >
                                <%= Phoenix.HTML.raw(highlight(link, @query)) %>
                              </a>
                            </li>
                          <% end %>
                        </ul>
                      </div>
                    <% end %>
                    <%= if result.subjects && length(result.subjects) > 0 do %>
                      <div>
                        <span class="font-bold text-primary-purple">Subjects:</span>
                        <span class="text-secondary-purple">
                          <%= for {subject, idx} <- Enum.with_index(result.subjects) do %>
                            <%= Phoenix.HTML.raw(highlight(subject, @query)) %><%= if idx <
                                                                                        length(
                                                                                          result.subjects
                                                                                        ) - 1,
                                                                                      do: ", " %>
                          <% end %>
                        </span>
                      </div>
                    <% end %>
                    <%= if result.matched_description_annotations && length(result.matched_description_annotations) > 0 do %>
                      <div>
                        <span class="font-bold text-primary-purple">
                          Matched Description Annotations:
                        </span>
                        <ul class="list-disc ml-6">
                          <%= for ann <- result.matched_description_annotations do %>
                            <li class="text-secondary-purple">
                              <%= Phoenix.HTML.raw(highlight(ann, @query)) %>
                            </li>
                          <% end %>
                        </ul>
                      </div>
                    <% end %>
                    <%= if result.matched_subjects_annotations && length(result.matched_subjects_annotations) > 0 do %>
                      <div>
                        <span class="font-bold text-primary-purple">
                          Matched Subjects Annotations:
                        </span>
                        <ul class="list-disc ml-6">
                          <%= for ann <- result.matched_subjects_annotations do %>
                            <li class="text-secondary-purple">
                              <%= Phoenix.HTML.raw(highlight(ann, @query)) %>
                            </li>
                          <% end %>
                        </ul>
                      </div>
                    <% end %>
                  </div>
                </div>
              <% end %>
            </div>
          <% end %>
        </div>
      <% end %>
    </div>
    """
  end
end
