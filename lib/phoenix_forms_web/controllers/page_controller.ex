defmodule PhoenixFormsWeb.PageController do
  use PhoenixFormsWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
