defmodule Bugex.Bugs do
  @moduledoc """
  The Bugs context.
  """

  import Ecto.Query, warn: false
  alias Bugex.Repo

  alias Bugex.Bugs.Bug

  @doc """
  Returns the list of bugs.

  ## Examples

      iex> list_bugs()
      [%Bug{}, ...]

  """
  def list_bugs do
    Repo.all(Bug)
  end

  @doc """
  Gets a single bug.

  Raises `Ecto.NoResultsError` if the Bug does not exist.

  ## Examples

      iex> get_bug!(123)
      %Bug{}

      iex> get_bug!(456)
      ** (Ecto.NoResultsError)

  """
  def get_bug!(id), do: Repo.get!(Bug, id)

  @doc """
  Creates a bug.

  ## Examples

      iex> create_bug(%{field: value})
      {:ok, %Bug{}}

      iex> create_bug(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_bug(attrs \\ %{}) do
    %Bug{}
    |> Bug.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a bug.

  ## Examples

      iex> update_bug(bug, %{field: new_value})
      {:ok, %Bug{}}

      iex> update_bug(bug, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_bug(%Bug{} = bug, attrs) do
    bug
    |> Bug.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Bug.

  ## Examples

      iex> delete_bug(bug)
      {:ok, %Bug{}}

      iex> delete_bug(bug)
      {:error, %Ecto.Changeset{}}

  """
  def delete_bug(%Bug{} = bug) do
    Repo.delete(bug)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking bug changes.

  ## Examples

      iex> change_bug(bug)
      %Ecto.Changeset{source: %Bug{}}

  """
  def change_bug(%Bug{} = bug) do
    Bug.changeset(bug, %{})
  end
end
