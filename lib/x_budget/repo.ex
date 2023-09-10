defmodule XBudget.Repo do
  use Ecto.Repo,
    otp_app: :x_budget,
    adapter: Ecto.Adapters.Postgres
end
