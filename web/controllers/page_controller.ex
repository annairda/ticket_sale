defmodule TicketShop.PageController do
  use TicketShop.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
