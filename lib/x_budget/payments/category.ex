defmodule XBudget.Payments.Category do
  use Ecto.Schema
  import Ecto.Changeset

  alias XBudget.Payments.Payment

  schema "categories" do
    field(:title, :string)
    has_many(:payments, Payment)

    timestamps(updated_at: false)
  end

  def changeset(category, attrs) do
    category
    |> cast(attrs, [:title])
    |> validate_required([:title])
  end
end
