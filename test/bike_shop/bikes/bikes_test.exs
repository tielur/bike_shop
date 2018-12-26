defmodule BikeShop.BikesTest do
  use BikeShop.DataCase

  alias BikeShop.Bikes

  describe "bikes" do
    alias BikeShop.Bikes.Bike

    @valid_attrs %{color: "some color"}
    @update_attrs %{color: "some updated color"}
    @invalid_attrs %{color: nil}

    def bike_fixture(attrs \\ %{}) do
      {:ok, bike} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Bikes.create_bike()

      bike
    end

    test "list_bikes/0 returns all bikes" do
      bike = bike_fixture()
      assert Bikes.list_bikes() == [bike]
    end

    test "get_bike!/1 returns the bike with given id" do
      bike = bike_fixture()
      assert Bikes.get_bike!(bike.id) == bike
    end

    test "create_bike/1 with valid data creates a bike" do
      assert {:ok, %Bike{} = bike} = Bikes.create_bike(@valid_attrs)
      assert bike.color == "some color"
    end

    test "create_bike/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Bikes.create_bike(@invalid_attrs)
    end

    test "update_bike/2 with valid data updates the bike" do
      bike = bike_fixture()
      assert {:ok, bike} = Bikes.update_bike(bike, @update_attrs)
      assert %Bike{} = bike
      assert bike.color == "some updated color"
    end

    test "update_bike/2 with invalid data returns error changeset" do
      bike = bike_fixture()
      assert {:error, %Ecto.Changeset{}} = Bikes.update_bike(bike, @invalid_attrs)
      assert bike == Bikes.get_bike!(bike.id)
    end

    test "delete_bike/1 deletes the bike" do
      bike = bike_fixture()
      assert {:ok, %Bike{}} = Bikes.delete_bike(bike)
      assert_raise Ecto.NoResultsError, fn -> Bikes.get_bike!(bike.id) end
    end

    test "change_bike/1 returns a bike changeset" do
      bike = bike_fixture()
      assert %Ecto.Changeset{} = Bikes.change_bike(bike)
    end
  end
end
