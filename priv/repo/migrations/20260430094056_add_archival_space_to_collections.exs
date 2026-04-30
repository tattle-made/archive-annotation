defmodule Kosh.Repo.Migrations.AddArchivalSpaceToCollections do
  use Ecto.Migration

  def change do
    alter table(:collections) do
      add :archival_space, :string, null: false
      add :oai_identifier, :string, null: false
    end

    drop_if_exists unique_index(:collections, [:title])
    drop_if_exists unique_index(:collections, [:unit_code])
    create unique_index(:collections, [:upload_path])
    create unique_index(:collections, [:oai_identifier])
    create unique_index(:collections, [:archival_space, :title])
    create unique_index(:collections, [:archival_space, :unit_code])
  end
end
