defmodule Kosh.Annotations.AgentAnnotationsAgents do
  use Ecto.Schema

  @primary_key false
  schema "agent_annotations_agents" do
    belongs_to :agent_annotation, Kosh.Annotations.AgentAnnotation
    belongs_to :agent, Kosh.EAD.Agent

    timestamps(type: :utc_datetime)
  end
end
