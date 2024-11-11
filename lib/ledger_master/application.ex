defmodule LedgerMaster.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      LedgerMasterWeb.Telemetry,
      LedgerMaster.Repo,
      {DNSCluster, query: Application.get_env(:ledger_master, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: LedgerMaster.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: LedgerMaster.Finch},
      # Start a worker by calling: LedgerMaster.Worker.start_link(arg)
      # {LedgerMaster.Worker, arg},
      # Start to serve requests, typically the last entry
      LedgerMasterWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: LedgerMaster.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    LedgerMasterWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
