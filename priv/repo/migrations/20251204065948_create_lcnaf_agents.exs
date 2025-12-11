defmodule Kosh.Repo.Migrations.CreateLcnafAgents do
  use Ecto.Migration

  def change do
    # enable trigram extension for fast substring searches
    execute("CREATE EXTENSION IF NOT EXISTS pg_trgm;")

    create table(:agents) do
      add :name, :text, null: false
      add :normalized_name, :text, null: false
      add :source, :string, null: false
      add :unitid, :string
      add :type_ids, {:array, :integer}, default: [], null: false
      timestamps(type: :utc_datetime)
    end

    # GIN for array membership (fast checks like contains/overlap)
    create index(:agents, [:type_ids], using: :gin)

    # trigram (GIN) index for fast ILIKE '%term%' on normalized_name
    execute("""
    CREATE INDEX agents_normalized_name_trgm_idx ON agents USING gin (normalized_name gin_trgm_ops);
    """)

    # unique index on normalized_name (case-insensitive uniqueness since normalized_name is lowercased in app)
    create unique_index(:agents, [:normalized_name], name: :agents_normalized_name_index)

    create index(:agents, [:unitid])
  end
end
