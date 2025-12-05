defmodule Kosh.Repo.Migrations.CreateAgentAnnotationsAgentsJoin do
  use Ecto.Migration

  def change do
    create table(:agent_annotations_agents, primary_key: false) do
      add :agent_annotation_id, references(:agent_annotations, on_delete: :delete_all), null: false
      add :agent_id, references(:agents, on_delete: :delete_all), null: false

      timestamps(type: :utc_datetime)
    end

    create index(:agent_annotations_agents, [:agent_annotation_id])
    create index(:agent_annotations_agents, [:agent_id])

    # Unique index to prevent duplicate associations
    create unique_index(
      :agent_annotations_agents,
      [:agent_annotation_id, :agent_id],
      name: :agent_annotation_agent_unique_index
    )
  end
end
