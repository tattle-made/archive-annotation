defmodule Kosh.Repo.Migrations.CreateLcnafTypes do
  use Ecto.Migration

  def change do
    create table(:lcnaf_types) do
      add :type, :string, null: false
      timestamps(type: :utc_datetime)
    end

    create unique_index(:lcnaf_types, [:type])
  end
end
