defmodule Bugex.BugsTest do
  use Bugex.DataCase

  alias Bugex.Bugs

  describe "bugs" do
    alias Bugex.Bugs.Bug

    @valid_attrs %{description: "some description", name: "some name"}
    @update_attrs %{description: "some updated description", name: "some updated name"}
    @invalid_attrs %{description: nil, name: nil}

    def bug_fixture(attrs \\ %{}) do
      {:ok, bug} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Bugs.create_bug()

      bug
    end

    test "list_bugs/0 returns all bugs" do
      bug = bug_fixture()
      assert Bugs.list_bugs() == [bug]
    end

    test "get_bug!/1 returns the bug with given id" do
      bug = bug_fixture()
      assert Bugs.get_bug!(bug.id) == bug
    end

    test "create_bug/1 with valid data creates a bug" do
      assert {:ok, %Bug{} = bug} = Bugs.create_bug(@valid_attrs)
      assert bug.description == "some description"
      assert bug.name == "some name"
    end

    test "create_bug/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Bugs.create_bug(@invalid_attrs)
    end

    test "update_bug/2 with valid data updates the bug" do
      bug = bug_fixture()
      assert {:ok, %Bug{} = bug} = Bugs.update_bug(bug, @update_attrs)
      assert bug.description == "some updated description"
      assert bug.name == "some updated name"
    end

    test "update_bug/2 with invalid data returns error changeset" do
      bug = bug_fixture()
      assert {:error, %Ecto.Changeset{}} = Bugs.update_bug(bug, @invalid_attrs)
      assert bug == Bugs.get_bug!(bug.id)
    end

    test "delete_bug/1 deletes the bug" do
      bug = bug_fixture()
      assert {:ok, %Bug{}} = Bugs.delete_bug(bug)
      assert_raise Ecto.NoResultsError, fn -> Bugs.get_bug!(bug.id) end
    end

    test "change_bug/1 returns a bug changeset" do
      bug = bug_fixture()
      assert %Ecto.Changeset{} = Bugs.change_bug(bug)
    end
  end
end
