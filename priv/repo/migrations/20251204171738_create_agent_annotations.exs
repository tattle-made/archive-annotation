defmodule Kosh.Repo.Migrations.CreateAgentAnnotations do
  use Ecto.Migration

  def change do
    create table(:agent_annotations) do
      add :file_id, references(:files, on_delete: :delete_all), null: false
      add :user_id, references(:users, on_delete: :nothing), null: false
      add :admin_id, references(:users, on_delete: :nothing)
      add :status, :string, null: false, default: "pending"
      add :new_agents, {:array, :map}, default: []

      timestamps(type: :utc_datetime)
    end

    create index(:agent_annotations, [:file_id])
    create index(:agent_annotations, [:user_id])
    create index(:agent_annotations, [:admin_id])
    create index(:agent_annotations, [:status])
  end
end
