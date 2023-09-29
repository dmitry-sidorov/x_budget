defmodule XBudget.Payments.Payment do
  use Ecto.Schema

  import Ecto.Changeset

  alias XBudget.Accounts.User
  alias XBudget.Payments.Category

  @fields ~w(amount currency description subcategory user_id)a

  schema "payments" do
    field(:amount, :float)
    field(:currency, :string)
    field(:description, :string)
    field(:subcategory, :string)
    belongs_to(:category, Category)
    belongs_to(:user, User)

    timestamps(updated_at: false)
  end

  def changeset(payment, attrs) do
    payment
    |> cast(attrs, @fields)
    |> validate_required(@fields)
    |> validate_number(:amount, greater_than: 0)
    |> validate_inclusion(:currency, ["EUR", "USD", "GBP"])
  end
end
