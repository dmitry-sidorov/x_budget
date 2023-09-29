defmodule XBudget.Repo.Migrations.CreateCategoriesTable do
  use Ecto.Migration

  def change do
    create table("categories") do
      add :title, :string
      timestamps(updated_at: false)
    end
  end
end
