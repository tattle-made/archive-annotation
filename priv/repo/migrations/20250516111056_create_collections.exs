defmodule Kosh.Repo.Migrations.CreateCollections do
  use Ecto.Migration

  def change do
    create table(:collections) do
      add :title, :string, null: false
      add :scopecontent, :map, default: %{}, null: false
      add :unitdate, :map, default: %{}, null: false
      add :unitid, :map, default: %{}, null: false

      timestamps()
    end

    create unique_index(:collections, [:title], name: :collections_title_index)
  end
end
