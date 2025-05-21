defmodule Kosh.Repo.Migrations.CreateCollectionsSubjectsJoin do
  use Ecto.Migration

  def change do
    create table(:collections_subjects, primary_key: false) do
      add :collection_id, references(:collections, on_delete: :delete_all), null: false
      add :subject_id,    references(:subjects,    on_delete: :nothing),    null: false

      timestamps()
    end

    create unique_index(:collections_subjects, [:collection_id, :subject_id], name: :collections_subjects_unique_index)
  end
end
