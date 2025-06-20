defmodule KoshWeb.GetPath do
  use KoshWeb, :live_view
    # This will run when a LiveView using this hook mounts.
    def on_mount(:get_path,_params, _session, socket) do
      # Attach a handler to handle_params: whenever handle_params/3 runs,
      # our function will also run to assign :current_path.
      socket = attach_hook(socket, :assign_path, :handle_params, fn _params, url, socket ->
        path =
          case URI.parse(url) do
            %URI{path: p, query: nil} -> p
            %URI{path: p, query: q} -> p <> "?" <> q
          end

        {:cont, assign(socket, :current_path, path)}
      end)

      {:cont, socket}
    end

end
