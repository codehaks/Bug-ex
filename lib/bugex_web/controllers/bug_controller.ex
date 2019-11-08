defmodule BugexWeb.BugController do
  use BugexWeb, :controller

  alias Bugex.Bugs
  alias Bugex.Bugs.Bug

  def index(conn, _params) do
    bugs = Bugs.list_bugs()
    render(conn, "index.html", bugs: bugs)
  end

  def new(conn, _params) do
    changeset = Bugs.change_bug(%Bug{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"bug" => bug_params}) do
    case Bugs.create_bug(bug_params) do
      {:ok, bug} ->
        conn
        |> put_flash(:info, "Bug created successfully.")
        |> redirect(to: Routes.bug_path(conn, :show, bug))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    bug = Bugs.get_bug!(id)
    render(conn, "show.html", bug: bug)
  end

  def edit(conn, %{"id" => id}) do
    bug = Bugs.get_bug!(id)
    changeset = Bugs.change_bug(bug)
    render(conn, "edit.html", bug: bug, changeset: changeset)
  end

  def update(conn, %{"id" => id, "bug" => bug_params}) do
    bug = Bugs.get_bug!(id)

    case Bugs.update_bug(bug, bug_params) do
      {:ok, bug} ->
        conn
        |> put_flash(:info, "Bug updated successfully.")
        |> redirect(to: Routes.bug_path(conn, :show, bug))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", bug: bug, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    bug = Bugs.get_bug!(id)
    {:ok, _bug} = Bugs.delete_bug(bug)

    conn
    |> put_flash(:info, "Bug deleted successfully.")
    |> redirect(to: Routes.bug_path(conn, :index))
  end
end
