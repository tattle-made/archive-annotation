defmodule KoshWeb.DisplayLive do
  use KoshWeb, :live_view
  alias Kosh.EAD

  @impl Phoenix.LiveView

  def mount(%{"uri" => uri}, _session, socket) do
    # IO.inspect(socket, label: "id")
    case EAD.get_file_from_uri( URI.decode(uri)) do
      nil ->
        {:ok,
         socket
         |> put_flash(:error, "File not found")
         |> redirect(to: ~p"/")}

      file ->
        handle_url =
          if file.dao && file.dao.daolocs do
            case Enum.find(file.dao.daolocs, &String.contains?(&1["xlink_href"], "/handle/")) do
              nil -> nil
              loc -> Map.get(loc, "xlink_href")
            end
          else
            nil
          end

        item_uuid = if handle_url, do: fetch_item_uuid(handle_url), else: nil

        manifest_url =
          if item_uuid do
            URI.encode(
              "https://collections.archives.ncbs.res.in/server/iiif/#{item_uuid}/manifest"
            )
          else
            nil
          end
        # IO.inspect(file, label: "Display File")
        {:ok, assign(socket, file: file, manifest_url: manifest_url)}
    end
  end

  defp fetch_item_uuid(handle_url) do
    require Logger
    Logger.debug("fetch_item_uuid called with handle_url: #{inspect(handle_url)}")
    case HTTPoison.get(handle_url, [], follow_redirect: false) do
      {:ok, %HTTPoison.Response{status_code: code, headers: headers}} when code in [301, 302] ->
        Logger.debug("Received redirect response with status code: #{code}")
        case List.keyfind(headers, "Location", 0) do
          {"Location", location} ->
            Logger.debug("Found Location header: #{inspect(location)}")
            # If it's a relative path, prefix the site origin
            redirect_url =
              if String.starts_with?(location, "/") do
                Logger.debug("Location is a relative path, prefixing with site origin.")
                "https://collections.archives.ncbs.res.in" <> location
              else
                Logger.debug("Location is an absolute URL.")
                location
              end

            # Extract the UUID from /items/<UUID>
            case Regex.run(~r{/items/([0-9a-fA-F\-]+)}, redirect_url, capture: :all_but_first) do
              [uuid] ->
                Logger.debug("Extracted UUID: #{uuid}")
                uuid
              _ ->
                Logger.error("Could not extract UUID from redirect_url: #{inspect(redirect_url)}")
                nil
            end

          _ ->
            Logger.error("Location header not found in redirect response headers: #{inspect(headers)}")
            nil
        end

      {:ok, %HTTPoison.Response{status_code: code}} ->
        Logger.error("Unexpected status code received: #{code}")
        nil
      {:error, reason} ->
        Logger.error("HTTPoison.get failed: #{inspect(reason)}")
        nil
      other ->
        Logger.error("Unexpected response from HTTPoison.get: #{inspect(other)}")
        nil
    end
  end

  @impl Phoenix.LiveView
  def handle_info({:flash, kind, message}, socket) do
    {:noreply, put_flash(socket, kind, message)}
  end

  @impl Phoenix.LiveView
  def render(assigns) do
    ~H"""
    <div class="section-gutter w-full">
      <div class="w-full text-secondary-purple font-semibold bg-[#E6E9F5]/50 mt-[2px] flex items-center text-body-md-18 h-12 px-4 sm:text-body-lg-24 sm:h-14 sm:px-6 xl:text-heading-28 xl:h-16 xl:px-8">
        <%!-- Miili's Archives Annotation Tool --%>
        <%= @file.title %>
      </div>

      <%!--Sample Mirador Viewer --%>
      <%!-- <iframe
          _ngcontent-dspace-angular-c283=""
          title="Mirador Viewer"
          allowtransparency="true"
          id="mirador-viewer"
          class="w-full h-[60vh] rounded-lg border"
          src="https://collections.archives.ncbs.res.in/iiif/mirador/index.html?manifest=https%3A%2F%2Fcollections.archives.ncbs.res.in%2Fserver%2Fiiif%2F9835e173-cb7e-4cf6-994e-94cf57313b0c%2Fmanifest&amp;notMobile=true"
        >
        </iframe>  --%>

      <%= if @manifest_url do %>
        <iframe
          title="Mirador Viewer"
          allowtransparency="true"
          src={"https://collections.archives.ncbs.res.in/iiif/mirador/index.html?manifest=#{@manifest_url}&notMobile=true"}
          class="w-3/4 h-[60vh] mt-2 mb-4 mx-auto"
        >
        </iframe>
      <% else %>
        <div class="w-1/2 h-[60vh] mt-2 mb-4 mx-auto flex items-center justify-center bg-gray-100 rounded">
          <p class="text-gray-500">Digital object viewer not available</p>
        </div>
      <% end %>

      <div class="py-6  mx-auto">
        <div class="grid grid-cols-1 md:grid-cols-3 gap-6">
          <!-- Title Section -->
          <div>
            <h2 class="text-primary-purple font-bold mb-2 text-body-md-18">Title</h2>
            <div class="bg-gray-100 rounded p-4">
              <p class="text-secondary-purple"><%= @file.title %></p>
            </div>
          </div>
          <!-- Subject(s) Section -->
          <div>
            <h2 class="text-primary-purple font-bold mb-2 text-body-md-18">Subject(s)</h2>
            <div class="space-y-2 max-h-60 overflow-y-auto">
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
              <%= if length(@file.accepted_subjects_annotations) > 0 do %>
                <h3 class="text-primary-purple text-md font-bold mb-2 px-2">Annotations</h3>
                <%= for annotation <- @file.accepted_subjects_annotations do %>
                  <%= for sub <- annotation.subjects do %>
                    <p class="text-secondary-purple bg-gray-100 rounded p-4 mb-1">
                      <%= sub.content %>
                    </p>
                  <% end %>
                <% end %>
              <% end %>
            </div>
          </div>
          <!-- Description Section -->
          <div class="">
            <h2 class="text-primary-purple font-bold mb-2 text-body-md-18">Description</h2>
            <div class="max-h-60 overflow-y-auto">
              <div class="bg-gray-100 rounded p-4 mb-1">
                <%= if @file.description && length(@file.description) > 0 do %>
                  <p class="text-secondary-purple"><%= Enum.join(@file.description, " ") %></p>
                <% else %>
                  <p class="text-gray-500">No description available</p>
                <% end %>
              </div>
              <%= if length(@file.accepted_description_annotations) > 0 do %>
                <h3 class="text-primary-purple text-md font-bold mb-2 px-2">Annotations</h3>
                <%= for annotation <- @file.accepted_description_annotations do %>
                  <p class="text-secondary-purple bg-gray-100 rounded p-4 mb-1">
                    <%= annotation.description %>
                  </p>
                <% end %>
              <% end %>
            </div>
          </div>
          <!-- Collection Section -->
          <div>
            <h2 class="text-primary-purple font-bold mb-2 text-body-md-18">Collection</h2>
            <div class="bg-gray-100 rounded p-4">
              <p class="text-secondary-purple"><%= @file.collection.title %></p>
            </div>
          </div>
          <!-- Series Section -->
          <div>
            <h2 class="text-primary-purple font-bold mb-2 text-body-md-18">Series</h2>
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
            <h2 class="text-primary-purple font-bold mb-2 text-body-md-18">Sub-series</h2>
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
            <h2 class="text-primary-purple font-bold mb-2 text-body-md-18">Date(s)</h2>
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
            <h2 class="text-primary-purple font-bold mb-2 text-body-md-18">Identifier</h2>
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
            <h2 class="text-primary-purple font-bold mb-2 text-body-md-18">Key Object Links</h2>
            <%= if @file.dao && map_size(@file.dao) > 0 && @file.dao.daolocs && length(@file.dao.daolocs) > 0 do %>
              <div class="space-y-2">
                <%= for loc <- @file.dao.daolocs do %>
                  <div class="bg-gray-100 rounded p-4 flex items-center justify-between">
                    <p class="text-secondary-purple truncate flex-1">
                      <%= (loc["xlink_href"] && "Digital Object URL...") || "No URL" %>
                    </p>
                    <%= if loc["xlink_href"] do %>
                      <a
                        href={loc["xlink_href"]}
                        target="_blank"
                        rel="noopener noreferrer"
                        class="ml-2 flex-shrink-0"
                      >
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

        <%!-- <div class="flex justify-between mt-8">
          <.link
            navigate={~p"/admin/upload"}
            class="px-4 py-2 text-primary-purple border border-primary-purple rounded hover:bg-primary-purple/10"
          >
            Back to Upload
          </.link>
          <.link
            navigate={~p"/annotation/display-files"}
            class="px-4 py-2 text-white bg-primary-purple rounded hover:bg-purple-700"
          >
            Files Index
          </.link>
        </div> --%>
      </div>
    </div>
    <.live_component
      module={KoshWeb.Components.AnnotationSection.AnnotationSectionWrapper}
      id="annotation-section-wrapper"
      file={@file}
      current_user={@current_user}
    />
    """
  end
end
