defmodule Bugex.Bugs.Bug do
  use Ecto.Schema
  import Ecto.Changeset

  schema "bugs" do
    field :description, :string
    field :name, :string

    # timestamps()
  end

  @doc false
  def changeset(bug, attrs) do
    bug
    |> cast(attrs, [:name, :description])
    |> validate_required([:name, :description])
  end
end
