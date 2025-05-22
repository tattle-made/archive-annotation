defmodule Kosh.Repo.Migrations.CreateSubjectsAnnotations do
  use Ecto.Migration

  def change do
    create table(:subjects_annotations) do
      add :file_id, references(:files, on_delete: :delete_all), null: false

      timestamps()
    end

    create index(:subjects_annotations, [:file_id])
  end
end
