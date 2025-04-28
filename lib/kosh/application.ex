defmodule Kosh.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      KoshWeb.Telemetry,
      Kosh.Repo,
      {DNSCluster, query: Application.get_env(:kosh, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: Kosh.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: Kosh.Finch},
      # Start a worker by calling: Kosh.Worker.start_link(arg)
      # {Kosh.Worker, arg},
      # Start to serve requests, typically the last entry
      KoshWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Kosh.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    KoshWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
