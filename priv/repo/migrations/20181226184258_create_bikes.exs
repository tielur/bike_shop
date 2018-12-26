defmodule BikeShop.Repo.Migrations.CreateBikes do
  use Ecto.Migration

  def change do
    create table(:bikes) do
      add :color, :string

      timestamps()
    end

  end
end
