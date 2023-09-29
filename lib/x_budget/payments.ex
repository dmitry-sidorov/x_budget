defmodule XBudget.Payments do
  import Ecto.Query, warn: false

  alias XBudget.Payments.Category
  alias XBudget.Payments.Payment
  alias XBudget.Repo

  def list_payments() do
    Repo.all(Payment)
  end

  def list_categories() do
    Repo.all(Category)
  end
end
