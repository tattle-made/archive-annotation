defmodule Kosh.Repo.Migrations.CreateDefinedEmotions do
  use Ecto.Migration

  def change do
    create table(:defined_emotions) do
      add :name, :string, null: false
      add :lcsh_url, :string
      timestamps(type: :utc_datetime)
    end

    # Add case-insensitive unique index
    execute "CREATE UNIQUE INDEX defined_emotions_lower_name_index ON defined_emotions (lower(name))"
  end
end
