defmodule Kosh.EAD.Agent do
  use Ecto.Schema
  import Ecto.Changeset

  alias Kosh.Repo
  alias Kosh.EAD.LcnafType

  schema "agents" do
    field :name, :string
    field :normalized_name, :string
    field :source, :string
    field :unitid, :string, default: nil

    # store the types as an array of type IDs
    field :type_ids, {:array, :integer}, default: []

    many_to_many :agent_annotations, Kosh.Annotations.AgentAnnotation,
      join_through: Kosh.Annotations.AgentAnnotationsAgents,
      on_replace: :delete

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(agent, attrs) do
    agent
    |> cast(attrs, [:name, :source, :unitid, :type_ids])
    |> validate_required([:name, :source])
    |> put_change(
      :normalized_name,
      normalize_name(get_field(agent, :name) || attrs["name"] || attrs[:name])
    )
    |> unique_constraint(:normalized_name, name: "agents_normalized_name_index")
  end

  defp normalize_name(nil), do: nil

  defp normalize_name(name) when is_binary(name) do
    name
    |> String.trim()
    |> String.normalize(:nfc)
    |> String.downcase()
  end
end
