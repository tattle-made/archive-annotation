defmodule Kosh.Repo.Migrations.CreateSeries do
  use Ecto.Migration

  def change do
    create table(:series) do
      add :title, :text, null: false
      add :unitid, :map, default: %{}, null: false
      add :collection_id, references(:collections, on_delete: :restrict), null: false

      timestamps()
    end

    create index(:series, [:collection_id])

    create unique_index(:series, [:title, :collection_id],
             name: :series_title_collection_id_index
           )
  end
end
