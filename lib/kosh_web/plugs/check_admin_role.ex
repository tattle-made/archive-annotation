defmodule KoshWeb.Plugs.CheckAdminRole do
  use KoshWeb, :controller

  require Logger

  def init(opts) do
    opts
  end

  def call(conn, opts) do
    case conn.assigns[:current_user] do
      %{role: :admin} ->
        conn

      _ ->
        conn
        |> put_flash(:error, opts[:error_msg] || "You must be an admin to access that page.")
        |> redirect(to: opts[:unauthorized_path] || "/")
        |> halt()
    end
  end
end
