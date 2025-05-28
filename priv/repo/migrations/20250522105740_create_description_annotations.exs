defmodule Kosh.Repo.Migrations.CreateDescriptionAnnotations do
  use Ecto.Migration

  def change do
    create table(:description_annotations) do
      add :description, :text,    null: false
      add :file_id,     references(:files, on_delete: :delete_all), null: false
      add :user_id,     references(:users, on_delete: :nothing), null: false
      add :admin_id,    references(:users, on_delete: :nothing)
      add :status,      :annotation_status, null: false, default: "pending"
      # The annotation_status enum is created in the previous migration 20250522105739_create_annotation_status_enum.exs

      timestamps()
    end

    create index(:description_annotations, [:file_id])
    create index(:description_annotations, [:user_id])
    create index(:description_annotations, [:admin_id])
    create index(:description_annotations, [:status])
  end
end
