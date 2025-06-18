
defmodule Kosh.Repo.Migrations.CreateFilesSubjectsJoin do
  use Ecto.Migration

  def change do
    create table(:files_subjects, primary_key: false) do
      add :file_id,    references(:files,    on_delete: :delete_all), null: false
      add :subject_id, references(:subjects, on_delete: :nothing),    null: false

      timestamps()
    end

    create unique_index(:files_subjects, [:file_id, :subject_id], name: :files_subjects_unique_index)
  end
end
