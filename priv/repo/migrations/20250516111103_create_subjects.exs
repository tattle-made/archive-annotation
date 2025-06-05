defmodule Kosh.Repo.Migrations.CreateSubjects do
  use Ecto.Migration

  def change do
    create table(:subjects) do
      add :content, :string, null: false
      add :source, :string, null: false
      add :unitid, :string, null: true

      timestamps()
    end

    create unique_index(:subjects, [:content], name: :subjects_content_index)
  end
end
