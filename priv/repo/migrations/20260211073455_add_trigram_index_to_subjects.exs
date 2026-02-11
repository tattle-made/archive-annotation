defmodule Kosh.Repo.Migrations.AddTrigramIndexToSubjects do
  use Ecto.Migration

  def change do
    # Enable trigram extension (safe if already enabled)
    execute("CREATE EXTENSION IF NOT EXISTS pg_trgm")

    # GIN trigram index for fast substring search on lower(content)
    create index(:subjects, ["lower(content) gin_trgm_ops"],
             using: :gin,
             name: :subjects_content_trgm_idx
           )
  end
end
