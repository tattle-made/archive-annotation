defmodule Kosh.Repo.Migrations.CreateSubjectsAnnotations do
  use Ecto.Migration

  def change do
    create table(:subjects_annotations) do
      add :file_id, references(:files, on_delete: :delete_all), null: false
      add :user_id, references(:users, on_delete: :nothing), null: false
      add :admin_id, references(:users, on_delete: :nothing)
      add :status, :annotation_status, null: false, default: "pending"

      timestamps()
    end

    create index(:subjects_annotations, [:file_id])
    create index(:subjects_annotations, [:user_id])
    create index(:subjects_annotations, [:admin_id])
    create index(:subjects_annotations, [:status])
  end
end
