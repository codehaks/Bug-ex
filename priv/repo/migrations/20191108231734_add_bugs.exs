defmodule Bugex.Repo.Migrations.AddBugs do
  use Ecto.Migration

  def change do
    create table(:bugs) do
      add :name, :string
      add :description, :string
    end
  end
end
