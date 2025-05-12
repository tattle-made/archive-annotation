defmodule Kosh.Repo.Migrations.CreateEadsAndSubjects do
  use Ecto.Migration

  def change do
    create table(:eads) do
      add :corpname,     :string, null: false
      add :address,      {:array, :text}, default: []
      add :country_code, :string, null: false

      timestamps(type: :utc_datetime)
    end

    create table(:subjects) do
      add :ead_id,  references(:eads, on_delete: :delete_all), null: false
      add :content, :string, null: false
      add :source,  :string, null: false

      timestamps(type: :utc_datetime)
    end

    create index(:subjects, [:ead_id])
    create index(:eads, [:country_code])
    create index(:eads, [:corpname])
  end
end
