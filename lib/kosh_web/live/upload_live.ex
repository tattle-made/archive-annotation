defmodule KoshWeb.UploadLive do
  use KoshWeb, :live_view
  alias Kosh.EAD

  @impl Phoenix.LiveView
  def mount(_params, _session, socket) do
    # Ensure uploads directory exists
    ensure_uploads_dir()

    {:ok,
     socket
     |> assign(:uploaded_files, [])
     |> assign(:processing_status, nil)
     |> allow_upload(:xml_file,
       accept: ~w(.xml),
       max_entries: 1,
       # 5MB in bytes
       max_file_size: 5_000_000,
       chunk_size: 64_000,
       progress: &handle_progress/3,
       auto_upload: true
     )}
  end

  @impl Phoenix.LiveView
  def handle_event("validate", _params, socket) do
    {:noreply, socket}
  end

  @impl Phoenix.LiveView
  def handle_event("cancel-upload", %{"ref" => ref}, socket) do
    {:noreply, cancel_upload(socket, :xml_file, ref)}
  end

  @impl Phoenix.LiveView
  def handle_event("save", _params, socket) do
    uploaded_files =
      consume_uploaded_entries(socket, :xml_file, fn %{path: temp_path}, entry ->
        # Check if file with same name already exists in uploads
        dest_full = Path.join([:code.priv_dir(:kosh), "static", "uploads", entry.client_name])

        if File.exists?(dest_full) do
          {:ok,
           %{
             path: nil,
             processed: false,
             error: "A file with the name '#{entry.client_name}' already exists"
           }}
        else
          # First try to process the file from its temporary location
          case EAD.process_xml_file(temp_path, dest_full) do
            # {:ok, collection} ->
            #   # Only if processing is successful, save to uploads directory
            #   ensure_uploads_dir()
            #   File.cp!(temp_path, dest_full)
            #   destination_path = "/uploads/#{entry.client_name}"

            #   {:ok,
            #    %{
            #      path: destination_path,
            #      processed: true,
            #      collection_id: collection.id,
            #      title: collection.title
            #    }}
            {:ok, collection} ->
              {:ok,
               %{
                 path: "/uploads/" <> entry.client_name,
                 processed: true,
                 collection_id: collection.id,
                 title: collection.title
               }}

            {:error, reason} ->
              {:ok, %{path: nil, processed: false, error: format_error(reason)}}
          end
        end
      end)

    processing_status =
      case uploaded_files do
        [%{processed: true, collection_id: collection_id, title: title}] ->
          {:success, "File processed successfully. Collection '#{title}' has been created.",
           collection_id}

        [%{processed: false, error: reason}] ->
          {:error, reason}

        _ ->
          nil
      end

    {:noreply,
     socket
     |> update(:uploaded_files, fn existing ->
       (existing ++
          Enum.map(uploaded_files, fn f ->
            if f.processed, do: f.path, else: nil
          end))
       |> Enum.reject(&is_nil/1)
     end)
     |> assign(:processing_status, processing_status)}
  end

  # Format error messages in a user-friendly way
  defp format_error(error) when is_binary(error) do
    cond do
      String.contains?(error, "has already been taken") ->
        "A collection with this title already exists. Please use a different title."

      true ->
        "There was an error processing the file. Please check the file format and try again."
    end
  end

  defp handle_progress(:xml_file, entry, socket) do
    if entry.done? do
      {:noreply, socket}
    else
      {:noreply, socket}
    end
  end

  @impl Phoenix.LiveView
  def render(assigns) do
    ~H"""
    <div class="w-full">
      <div class="w-full p-6 mt-6">
        <div class="rounded-lg border border-gray-300 p-8 mx-auto max-w-xl">
          <h2 class="text-2xl font-semibold text-secondary-purple mb-6">Upload EAD XML File</h2>
          <p class="text-gray-600 mb-6">Max Size: 5MB</p>

          <form phx-submit="save" phx-change="validate">
            <div class="mb-4">
              <.live_file_input
                upload={@uploads.xml_file}
                class="block w-full text-secondary-purple file:mr-4 file:py-2 file:px-4 file:rounded file:border-0 file:text-sm file:font-semibold file:bg-primary-purple file:text-white hover:file:bg-violet-700"
              />
            </div>

            <%= for entry <- @uploads.xml_file.entries do %>
              <div class="mt-4 mb-6">
                <div class="flex items-center gap-4">
                  <div class="grow">
                    <div class="text-sm text-gray-600"><%= entry.client_name %></div>
                    <div class="bg-gray-200 rounded-full h-2.5 mt-1">
                      <div
                        class="bg-primary-purple h-2.5 rounded-full"
                        style={"width: #{entry.progress}%"}
                      >
                      </div>
                    </div>
                  </div>
                  <button
                    type="button"
                    phx-click="cancel-upload"
                    phx-value-ref={entry.ref}
                    class="text-sm text-red-500"
                  >
                    Cancel
                  </button>
                </div>

                <%= for err <- upload_errors(@uploads.xml_file, entry) do %>
                  <div class="mt-1 text-sm text-red-500">
                    <%= error_to_string(err) %>
                  </div>
                <% end %>
              </div>
            <% end %>

            <%= for err <- upload_errors(@uploads.xml_file) do %>
              <div class="mb-4 text-sm text-red-500">
                <%= error_to_string(err) %>
              </div>
            <% end %>

            <button
              type="submit"
              class="btn-primary-purple text-white font-semibold py-2 px-6 rounded"
              phx-disable-with="Processing..."
            >
              Upload EAD XML
            </button>
          </form>

          <%= if @processing_status do %>
            <%= case @processing_status do %>
              <% {:success, message, collection_id} -> %>
                <div class="mt-8 p-4 border border-green-200 bg-green-50 rounded">
                  <h3 class="text-lg font-medium text-green-800 mb-2"><%= message %></h3>
                  <p class="text-green-700">
                    <.link navigate={~p"/display"} class="underline font-medium">
                      View collection details
                    </.link>
                  </p>
                </div>
              <% {:error, message} -> %>
                <div class="mt-8 p-4 border border-red-200 bg-red-50 rounded">
                  <h3 class="text-lg font-medium text-red-800 mb-2">Error Processing File</h3>
                  <p class="text-red-700"><%= message %></p>
                </div>
            <% end %>
          <% end %>

          <%= if length(@uploaded_files) > 0 do %>
            <div class="mt-8 p-4 border border-green-200 bg-green-50 rounded">
              <h3 class="text-lg font-medium text-green-800 mb-2">Successfully Uploaded Files</h3>
              <ul class="list-disc pl-5">
                <%= for file <- @uploaded_files do %>
                  <li class="text-green-700"><%= Path.basename(file) %></li>
                <% end %>
              </ul>
            </div>
          <% end %>
        </div>
      </div>
    </div>
    """
  end

  defp error_to_string(:too_large), do: "File is too large (max 5MB)"
  defp error_to_string(:not_accepted), do: "You can only upload XML files"
  defp error_to_string(:too_many_files), do: "You can only upload 1 file at a time"
  defp error_to_string(_), do: "Invalid file"

  # Ensure uploads directory exists
  defp ensure_uploads_dir do
    uploads_dir = Path.join([:code.priv_dir(:kosh), "static", "uploads"])
    unless File.dir?(uploads_dir), do: File.mkdir_p!(uploads_dir)
  end
end
