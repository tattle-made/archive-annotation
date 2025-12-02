defmodule KoshWeb.ExportSubjectsLive do
  use KoshWeb, :live_view
  alias Kosh.ExportSubjects

  @impl Phoenix.LiveView
  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  def handle_event("export", _params, socket) do
    case ExportSubjects.export_mlk_subjects() do
      {:ok, output_str} ->
        {:noreply,
         push_event(socket, "download", %{
           content: output_str,
           filename: "milli-local-knowledge-subjects.jsonld",
           type: "application/ld+json"
         })}

      {:error, reason} ->
        {:noreply,
         socket
         |> put_flash(:error, "Failed to export Subjects: #{reason}")}

      _ ->
        {:noreply,
         socket
         |> put_flash(:error, "Unexpected Error. Failed to export subjects.")}
    end
  end

  @impl Phoenix.LiveView
  def render(assigns) do
    ~H"""
    <div id="export-handler" phx-hook="Download" class="p-6">
      <div class="mb-6">
        <h2 class="text-2xl font-semibold text-primary-black mb-2">Export Subjects</h2>
        <p class="text-primary-grey">Download the complete list of Milli-Local-Knowledge subjects in JSON-LD format.</p>
      </div>

      <button
        phx-click="export"
        class="px-4 py-2 bg-primary-purple text-white rounded hover:bg-secondary-purple transition-colors"
      >
        Export Subjects
      </button>
    </div>
    """
  end
end
