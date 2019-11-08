defmodule BugexWeb.BugControllerTest do
  use BugexWeb.ConnCase

  alias Bugex.Bugs

  @create_attrs %{description: "some description", name: "some name"}
  @update_attrs %{description: "some updated description", name: "some updated name"}
  @invalid_attrs %{description: nil, name: nil}

  def fixture(:bug) do
    {:ok, bug} = Bugs.create_bug(@create_attrs)
    bug
  end

  describe "index" do
    test "lists all bugs", %{conn: conn} do
      conn = get(conn, Routes.bug_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Bugs"
    end
  end

  describe "new bug" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.bug_path(conn, :new))
      assert html_response(conn, 200) =~ "New Bug"
    end
  end

  describe "create bug" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.bug_path(conn, :create), bug: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.bug_path(conn, :show, id)

      conn = get(conn, Routes.bug_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Bug"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.bug_path(conn, :create), bug: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Bug"
    end
  end

  describe "edit bug" do
    setup [:create_bug]

    test "renders form for editing chosen bug", %{conn: conn, bug: bug} do
      conn = get(conn, Routes.bug_path(conn, :edit, bug))
      assert html_response(conn, 200) =~ "Edit Bug"
    end
  end

  describe "update bug" do
    setup [:create_bug]

    test "redirects when data is valid", %{conn: conn, bug: bug} do
      conn = put(conn, Routes.bug_path(conn, :update, bug), bug: @update_attrs)
      assert redirected_to(conn) == Routes.bug_path(conn, :show, bug)

      conn = get(conn, Routes.bug_path(conn, :show, bug))
      assert html_response(conn, 200) =~ "some updated description"
    end

    test "renders errors when data is invalid", %{conn: conn, bug: bug} do
      conn = put(conn, Routes.bug_path(conn, :update, bug), bug: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Bug"
    end
  end

  describe "delete bug" do
    setup [:create_bug]

    test "deletes chosen bug", %{conn: conn, bug: bug} do
      conn = delete(conn, Routes.bug_path(conn, :delete, bug))
      assert redirected_to(conn) == Routes.bug_path(conn, :index)
      assert_error_sent 404, fn ->
        get(conn, Routes.bug_path(conn, :show, bug))
      end
    end
  end

  defp create_bug(_) do
    bug = fixture(:bug)
    {:ok, bug: bug}
  end
end
