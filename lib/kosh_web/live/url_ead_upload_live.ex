defmodule KoshWeb.UrlEadUploadLive do
  @moduledoc """
  Upload the EAD from the NCBS OAI Endpoint through a URL.
  """
  use KoshWeb, :live_view
  alias Kosh.EAD
  import Ecto.Changeset
  alias KoshWeb.UploadHelpers
  require Logger

  def mount(_params, _session, socket) do
    changeset = Ecto.Changeset.cast({%{}, %{endpoint: :string}}, %{}, [:endpoint])

    {:ok,
     assign(socket,
       form: to_form(changeset, as: "form"),
       message: nil,
       message_type: nil
     )}
  end

  def handle_event("get-ead", %{"form" => form_params}, socket) do

    changeset =
      Ecto.Changeset.cast({%{}, %{endpoint: :string}}, form_params, [:endpoint])
      |> validate_required([:endpoint])
      |> validate_format(:endpoint, ~r/^https?:\/\//, message: "must be a valid URL")

    case changeset do
      %{valid?: true, changes: %{endpoint: endpoint}} ->
        with {:ok, %HTTPoison.Response{status_code: 200, body: body}} <- HTTPoison.get(endpoint),
             {:ok, %{file_name: file_name, temp_path: temp_path, processed_map: processed_map}} <-
               EAD.process_and_get_fetched_ead_details(body),
             dest_full <- Path.join([:code.priv_dir(:kosh), "static", "uploads", file_name]) do
          if File.exists?(dest_full) do
            {:noreply,
             socket
             |> assign(
               form: to_form(changeset, as: "form"),
               message: "File with the same name #{file_name} already exists",
               message_type: "error"
             )}
          else
            UploadHelpers.ensure_uploads_dir()

            case EAD.import_fetched_ead_content(processed_map, temp_path, dest_full) do
              {:ok, _collection} ->
                changeset = Ecto.Changeset.cast({%{}, %{endpoint: :string}}, %{}, [:endpoint])

                {:noreply,
                 socket
                 |> assign(
                   message: "Successfully processed URL: #{endpoint}",
                   message_type: "success",
                   form: to_form(changeset, as: "form")
                 )}

              {:error, reason} ->
                # IO.inspect(reason)
                Logger.error("Error while processing EAD #{inspect(reason, pretty: true)}")

                {:noreply,
                 socket
                 |> assign(
                   form: to_form(changeset, as: "form"),
                   message:
                     "Error while processing EAD content: #{inspect(reason, pretty: true)}",
                   message_type: "error"
                 )}
            end
          end
        else
          {:error, %HTTPoison.Error{reason: reason}} ->
            {:noreply,
             socket
             |> assign(
               form: to_form(changeset, as: "form"),
               message: "Failed to fetch URL: #{inspect(reason, pretty: true)}",
               message_type: "error"
             )}

          {:ok, %HTTPoison.Response{status_code: status}} ->
            {:noreply,
             socket
             |> assign(
               form: to_form(changeset, as: "form"),
               message: "Received non-200 status code: #{status}",
               message_type: "error"
             )}

          {:error, reason} when is_binary(reason) ->
            {:noreply,
             socket
             |> assign(
               form: to_form(changeset, as: "form"),
               message: "Error processing EAD: #{reason}",
               message_type: "error"
             )}

          error ->
            {:noreply,
             socket
             |> assign(
               form: to_form(changeset, as: "form"),
               message: "Unexpected error: #{inspect(error, pretty: true)}",
               message_type: "error"
             )}
        end

      %{valid?: false} ->
        error_messages =
          changeset
          |> format_errors(fn {msg, _opts} -> msg end)
          |> Enum.map_join(", ", fn {_, [msg | _]} -> msg end)

        IO.inspect(error_messages, label: "Form validation errors")

        {:noreply,
         socket
         |> assign(
           form: to_form(changeset, as: "form"),
           message: error_messages,
           message_type: "error"
         )}
    end
  end

  defp format_errors(changeset, msg_func) when is_function(msg_func, 1) do
    changeset
    |> Ecto.Changeset.traverse_errors(msg_func)
    |> Enum.map(fn {k, v} -> {k, List.wrap(v)} end)
  end

  def render(assigns) do
    ~H"""
    <div class="w-full">
      <div class="w-full p-6 mt-6">
        <div class="rounded-lg border border-gray-300 p-8 mx-auto max-w-2xl">
          <h2 class="text-2xl font-semibold text-secondary-purple mb-6">
            Fetch and Import EAD XML File from OAI Endpoint
          </h2>

          <%= if @message do %>
            <div class={"mb-4 p-3 rounded-md #{if @message_type == "error", do: "bg-red-100 text-red-800", else: "bg-green-100 text-green-800"}"}>
              <%= @message %>
            </div>
          <% end %>

          <.form for={@form} phx-submit="get-ead" class="flex flex-col w-full">
            <div class="w-full flex items-center">
              <div class="flex-grow">
                <.input
                  field={@form[:endpoint]}
                  value={@form[:endpoint].value}
                  placeholder="OAI Endpoint..."
                  class="w-full h-10 rounded-r-none !text-primary-purple placeholder:text-primary-purple/70 !text-body-md-18 border !border-primary-purple"
                  phx-debounce="300"
                />
                <%= if error = @form[:endpoint].errors do %>
                  <p class="mt-1 text-sm text-red-600">
                    <%= for {msg, _opts} <- error, do: msg %>
                  </p>
                <% end %>
              </div>
              <button
                type="submit"
                class="btn-primary-purple text-body-md-18 font-semibold py-2 px-4 h-10 w-auto rounded-l-none mt-1 whitespace-nowrap"
                phx-disable-with="Processing..."
              >
                Search
              </button>
            </div>
          </.form>
        </div>
      </div>
    </div>
    """
  end
end
