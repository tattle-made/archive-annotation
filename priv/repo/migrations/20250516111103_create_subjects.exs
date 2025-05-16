defmodule Kosh.Repo.Migrations.CreateSubjects do
  use Ecto.Migration

  def change do
    create table(:subjects) do
      add :content, :string, null: false
      add :source,  :string, null: false

      timestamps()
    end

    create unique_index(:subjects, [:content, :source], name: :subjects_content_source_index)
  end
end
