defmodule BikeShopWeb.BikeController do
  use BikeShopWeb, :controller

  alias BikeShop.Bikes
  alias BikeShop.Bikes.Bike

  def index(conn, _params) do
    bikes = Bikes.list_bikes()
    render(conn, "index.html", bikes: bikes)
  end

  def new(conn, _params) do
    changeset = Bikes.change_bike(%Bike{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"bike" => bike_params}) do
    case Bikes.create_bike(bike_params) do
      {:ok, bike} ->
        conn
        |> put_flash(:info, "Bike created successfully.")
        |> redirect(to: bike_path(conn, :show, bike))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    bike = Bikes.get_bike!(id)
    render(conn, "show.html", bike: bike)
  end

  def edit(conn, %{"id" => id}) do
    bike = Bikes.get_bike!(id)
    changeset = Bikes.change_bike(bike)
    render(conn, "edit.html", bike: bike, changeset: changeset)
  end

  def update(conn, %{"id" => id, "bike" => bike_params}) do
    bike = Bikes.get_bike!(id)

    case Bikes.update_bike(bike, bike_params) do
      {:ok, bike} ->
        conn
        |> put_flash(:info, "Bike updated successfully.")
        |> redirect(to: bike_path(conn, :show, bike))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", bike: bike, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    bike = Bikes.get_bike!(id)
    {:ok, _bike} = Bikes.delete_bike(bike)

    conn
    |> put_flash(:info, "Bike deleted successfully.")
    |> redirect(to: bike_path(conn, :index))
  end
end
