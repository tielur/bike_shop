defmodule BikeShop.Bikes do
  @moduledoc """
  The Bikes context.
  """

  import Ecto.Query, warn: false
  alias BikeShop.Repo

  alias BikeShop.Bikes.Bike

  @doc """
  Returns the list of bikes.

  ## Examples

      iex> list_bikes()
      [%Bike{}, ...]

  """
  def list_bikes do
    Repo.all(Bike)
  end

  @doc """
  Gets a single bike.

  Raises `Ecto.NoResultsError` if the Bike does not exist.

  ## Examples

      iex> get_bike!(123)
      %Bike{}

      iex> get_bike!(456)
      ** (Ecto.NoResultsError)

  """
  def get_bike!(id), do: Repo.get!(Bike, id)

  @doc """
  Creates a bike.

  ## Examples

      iex> create_bike(%{field: value})
      {:ok, %Bike{}}

      iex> create_bike(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_bike(attrs \\ %{}) do
    %Bike{}
    |> Bike.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a bike.

  ## Examples

      iex> update_bike(bike, %{field: new_value})
      {:ok, %Bike{}}

      iex> update_bike(bike, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_bike(%Bike{} = bike, attrs) do
    bike
    |> Bike.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Bike.

  ## Examples

      iex> delete_bike(bike)
      {:ok, %Bike{}}

      iex> delete_bike(bike)
      {:error, %Ecto.Changeset{}}

  """
  def delete_bike(%Bike{} = bike) do
    Repo.delete(bike)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking bike changes.

  ## Examples

      iex> change_bike(bike)
      %Ecto.Changeset{source: %Bike{}}

  """
  def change_bike(%Bike{} = bike) do
    Bike.changeset(bike, %{})
  end
end
