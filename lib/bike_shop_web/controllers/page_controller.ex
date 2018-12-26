defmodule BikeShopWeb.PageController do
  use BikeShopWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
