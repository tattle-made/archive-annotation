defmodule Kosh.Repo.Migrations.AddArchivalSpaceToFiles do
  use Ecto.Migration

  def change do
    alter table(:files) do
      add :archival_space, :string, null: false
    end

    create unique_index(:files, [:archival_space, :uri])

  end
end
