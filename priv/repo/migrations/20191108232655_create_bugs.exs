defmodule Bugex.Repo.Migrations.CreateBugs do
  use Ecto.Migration

  def change do
    create table(:bugs) do
      add :name, :string
      add :description, :string

      timestamps()
    end

  end
end
