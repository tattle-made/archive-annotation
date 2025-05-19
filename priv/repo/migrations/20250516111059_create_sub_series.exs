defmodule Kosh.Repo.Migrations.CreateSubSeries do
  use Ecto.Migration

  def change do
    create table(:sub_series) do
      add :title, :text, null: false
      add :unitid, :map, default: %{}, null: false
      add :series_id, references(:series, on_delete: :restrict), null: false
      add :collection_id, references(:collections, on_delete: :restrict), null: false

      timestamps()
    end

    create index(:sub_series, [:series_id])
    create index(:sub_series, [:collection_id])
    create unique_index(:sub_series, [:title, :series_id], name: :sub_series_title_series_id_index)
  end
end
