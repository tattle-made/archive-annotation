defmodule Kosh.Repo.Migrations.CreateFiles do
  use Ecto.Migration

  def change do
    create table(:files) do
      add :title, :text, null: false
      add :uri, :string, null: false
      add :description, {:array, :text}, default: [], null: false
      add :unitdate, :map, default: %{}, null: false
      add :unitid, :map, default: %{}, null: false
      add :dao, :map, default: %{}, null: false

      add :collection_id, references(:collections, on_delete: :restrict), null: false
      add :series_id,     references(:series,      on_delete: :restrict)
      add :sub_series_id, references(:sub_series,  on_delete: :restrict)

      timestamps()
    end

    create index(:files, [:collection_id])
    create index(:files, [:uri])
    # create index(:files, [:series_id])
    # create index(:files, [:sub_series_id])
  end
end
