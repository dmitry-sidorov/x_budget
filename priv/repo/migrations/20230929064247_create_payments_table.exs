defmodule XBudget.Repo.Migrations.CreatePaymentsTable do
  use Ecto.Migration

  def change do
    create table("payments") do
      add :amount, :float
      add :currency, :string
      add :description, :text
      add :user_id, references(:users), null: false
      add :category_id, references(:categories)
      add :subcategory, :string
      timestamps(updated_at: false)
    end
  end
end
