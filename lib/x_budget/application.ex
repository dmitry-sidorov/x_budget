defmodule XBudget.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      XBudgetWeb.Telemetry,
      # Start the Ecto repository
      XBudget.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: XBudget.PubSub},
      # Start Finch
      {Finch, name: XBudget.Finch},
      # Start the Endpoint (http/https)
      XBudgetWeb.Endpoint
      # Start a worker by calling: XBudget.Worker.start_link(arg)
      # {XBudget.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: XBudget.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    XBudgetWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
