defmodule Kosh.Repo.Migrations.CreateNotifications do
  use Ecto.Migration

  def change do
    create table(:notifications) do
      add :action, :string, null: false
      add :resource_type, :string, null: false
      add :resource_id, :integer, null: false
      add :body, :text, null: false
      add :title, :string, null: false
      add :changes, :map, default: %{}

      # References
      add :actor_id, references(:users, on_delete: :nilify_all), null: true

      timestamps(type: :utc_datetime)
    end

    create index(:notifications, [:actor_id])
    create index(:notifications, [:resource_type, :resource_id])
    create index(:notifications, :inserted_at)
  end
end
