defmodule Kosh.Repo do
  use Ecto.Repo,
    otp_app: :kosh,
    adapter: Ecto.Adapters.Postgres
end
