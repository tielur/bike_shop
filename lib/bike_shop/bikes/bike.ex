defmodule BikeShop.Bikes.Bike do
  use Ecto.Schema
  import Ecto.Changeset


  schema "bikes" do
    field :color, :string

    timestamps()
  end

  @doc false
  def changeset(bike, attrs) do
    bike
    |> cast(attrs, [:color])
    |> validate_required([:color])
  end
end
