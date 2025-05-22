defmodule Kosh.Repo.Migrations.CreateDescriptionAnnotations do
  use Ecto.Migration

  def change do
    create table(:description_annotations) do
      add :description, :text,    null: false
      add :file_id,     references(:files, on_delete: :delete_all), null: false

      timestamps()
    end

    create index(:description_annotations, [:file_id])
  end
end
