defmodule BugexWeb.PageController do
  use BugexWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
