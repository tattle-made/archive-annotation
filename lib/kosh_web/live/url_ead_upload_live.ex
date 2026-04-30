defmodule KoshWeb.UrlEadUploadLive do
  @moduledoc """
  Upload the EAD from the NCBS OAI Endpoint through a URL.
  """
  use KoshWeb, :live_view
  alias Kosh.EAD
  alias Phoenix.LiveView.AsyncResult
  import Ecto.Changeset
  alias KoshWeb.UploadHelpers
  require Logger

  def mount(_params, _session, socket) do
    changeset = Ecto.Changeset.cast({%{}, %{endpoint: :string}}, %{}, [:endpoint])

    {:ok,
     assign(socket,
       form: to_form(changeset, as: "form"),
       import_result: nil
     )}
  end

  def handle_event("get-ead", %{"form" => form_params}, socket) do
    changeset = endpoint_changeset(form_params)

    case changeset do
      %{valid?: true, changes: %{endpoint: endpoint}} ->
        {:noreply,
         socket
         |> assign(form: to_form(changeset, as: "form"))
         |> assign_async(:import_result, fn ->
           import_ead_from_endpoint(endpoint)
         end, reset: true)}

      %{valid?: false} ->
        error_messages =
          changeset
          |> format_errors(fn {msg, _opts} -> msg end)
          |> Enum.map_join(", ", fn {_, [msg | _]} -> msg end)

        {:noreply,
         socket
         |> assign(form: to_form(changeset, as: "form"))
         |> assign(import_result: AsyncResult.ok(error_result(error_messages)))}
    end
  end

  defp endpoint_changeset(params) do
    Ecto.Changeset.cast({%{}, %{endpoint: :string}}, params, [:endpoint])
    |> validate_required([:endpoint])
    |> validate_format(:endpoint, ~r/^https?:\/\//, message: "must be a valid URL")
  end

  defp import_ead_from_endpoint(endpoint) do
    Logger.info("Starting fetch from endpoint: #{endpoint}")

    with {:ok, %HTTPoison.Response{status_code: 200, body: body}} <-
           HTTPoison.get(endpoint, [],
             timeout: 120_000,
             recv_timeout: 120_000,
             connect_timeout: 120_000
           ),
         {:ok, %{file_name: file_name, temp_path: temp_path, processed_map: processed_map}} <-
           EAD.process_and_get_fetched_ead_details(body) do
      dest_full = Path.join([:code.priv_dir(:kosh), "static", "uploads", file_name])

      if File.exists?(dest_full) do
        {:ok, %{import_result: error_result("File with the same name #{file_name} already exists")}}
      else
        UploadHelpers.ensure_uploads_dir()

        Elixir.File.write("caltech-processed.ex", inspect(processed_map, pretty: true, depth: :infinite))

        case EAD.import_fetched_ead_content(processed_map, temp_path, dest_full) do
          {:ok, _collection} ->
            {:ok, %{import_result: success_result("Successfully processed URL: #{endpoint}")}}

          {:error, reason} ->
            Logger.error("Error while processing EAD #{inspect(reason, pretty: true)}")

            {:ok,
             %{
               import_result:
                 error_result("Error while processing EAD content: #{inspect(reason, pretty: true)}")
             }}
        end
      end
    else
      {:error, %HTTPoison.Error{reason: reason}} ->
        Logger.error("HTTPoison error fetching #{endpoint}: #{inspect(reason, pretty: true)}")
        {:ok, %{import_result: error_result("Failed to fetch URL: #{inspect(reason, pretty: true)}")}}

      {:ok, %HTTPoison.Response{status_code: status}} ->
        {:ok, %{import_result: error_result("Received non-200 status code: #{status}")}}

      {:error, reason} when is_binary(reason) ->
        {:ok, %{import_result: error_result("Error processing EAD: #{reason}")}}

      error ->
        {:ok, %{import_result: error_result("Unexpected error: #{inspect(error, pretty: true)}")}}
    end
  rescue
    error ->
      Logger.error("Unexpected exception while processing EAD #{inspect(error, pretty: true)}")
      {:ok, %{import_result: error_result("Unexpected error: #{inspect(error, pretty: true)}")}}
  end

  defp success_result(message), do: %{message: message, message_type: "success"}
  defp error_result(message), do: %{message: message, message_type: "error"}

  defp loading?(%AsyncResult{loading: loading}) when not is_nil(loading), do: true
  defp loading?(_), do: false

  defp status_classes("error"), do: "bg-red-100 text-red-800"
  defp status_classes(_), do: "bg-green-100 text-green-800"

  defp format_async_failure({:exit, reason}), do: inspect(reason, pretty: true)
  defp format_async_failure(reason), do: inspect(reason, pretty: true)

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

          <%= if @import_result do %>
            <.async_result :let={result} assign={@import_result}>
              <:loading>
                <div class="mb-4 p-3 rounded-md bg-blue-100 text-blue-800">
                  Fetching and processing EAD. This can take a little while.
                </div>
              </:loading>
              <:failed :let={failure}>
                <div class="mb-4 p-3 rounded-md bg-red-100 text-red-800">
                  Error while processing EAD content: <%= format_async_failure(failure) %>
                </div>
              </:failed>
              <div class={"mb-4 p-3 rounded-md #{status_classes(result.message_type)}"}>
                <%= result.message %>
              </div>
            </.async_result>
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
                  disabled={loading?(@import_result)}
                />
                <%= if error = @form[:endpoint].errors do %>
                  <p class="mt-1 text-sm text-red-600">
                    <%= for {msg, _opts} <- error, do: msg %>
                  </p>
                <% end %>
              </div>
              <button
                type="submit"
                class="btn-primary-purple text-body-md-18 font-semibold py-2 px-4 h-10 w-auto rounded-l-none mt-1 whitespace-nowrap disabled:opacity-75 disabled:hover:bg-primary-purple"
                disabled={loading?(@import_result)}
                phx-disable-with="Processing..."
              >
                <%= if loading?(@import_result) do %>
                  <span class="inline-flex items-center gap-2">
                    <span class="h-4 w-4 rounded-full border-2 border-white border-t-transparent animate-spin"></span>
                    Processing...
                  </span>
                <% else %>
                  Search
                <% end %>
              </button>
            </div>
          </.form>
        </div>
      </div>
    </div>
    """
  end
end
