defmodule KoshWeb.ExportEADLive do
  use KoshWeb, :live_view
  alias Kosh.EAD

  def mount(_params, _session, socket) do
    collections = EAD.list_collections()
    {:ok, assign(socket, :collections, collections)}
  end

  def handle_event("export", %{"id" => collection_id}, socket) do
    collection = Enum.find(socket.assigns.collections, &(to_string(&1.id) == collection_id))

    case EAD.export_collection(collection_id) do
      {:ok, xml_content} ->
        {:noreply,
         push_event(socket, "download", %{
           content: xml_content,
           filename: "#{collection.title}_annotated.xml",
           type: "application/xml"
         })}

      {:error, reason} ->
        {:noreply,
         socket
         |> put_flash(:error, "Failed to export collection: #{reason}")}
    end
  end

  def render(assigns) do
    ~H"""
    <div class="section-gutter w-full" id="export-container" phx-hook="Download">
      <div class="text-secondary-purple font-semibold bg-[#E6E9F5]/50 mt-[2px] flex items-center text-body-md-18 h-12 px-4 sm:text-body-lg-24 sm:h-14 sm:px-6 xl:text-heading-28 xl:h-16 xl:px-8">
        Export EAD Collections
      </div>

      <div class="mt-8">
        <div class="grid gap-4">
          <%= for collection <- @collections do %>
            <div class="bg-white p-4 rounded-lg shadow-sm border border-gray-200 flex justify-between items-center">
              <div class="text-secondary-purple text-body-md-18">
                <%= collection.title %>
              </div>
              <button
                phx-click="export"
                phx-value-id={collection.id}
                class="btn-primary-purple px-6 py-2 text-body-md-18 font-semibold rounded">
                Export
              </button>
            </div>
          <% end %>
        </div>
      </div>
    </div>
    """
  end
end
