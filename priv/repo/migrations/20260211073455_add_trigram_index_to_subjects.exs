defmodule Kosh.Repo.Migrations.AddTrigramIndexToSubjects do
  use Ecto.Migration

  def up do
    execute("CREATE EXTENSION IF NOT EXISTS pg_trgm")
    execute("CREATE INDEX IF NOT EXISTS subjects_content_trgm_idx ON subjects USING gin (lower(content) gin_trgm_ops)")
  end

  def down do
    execute("DROP INDEX IF EXISTS subjects_content_trgm_idx")
    execute("DROP EXTENSION IF EXISTS pg_trgm CASCADE")
  end
end
