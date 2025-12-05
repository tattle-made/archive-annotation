defmodule Kosh.Annotations.AgentAnnotation do
  use Ecto.Schema
  import Ecto.Changeset
  require Logger
  alias Kosh.Repo
  alias Kosh.EAD.Agent, as: EADAgent

  schema "agent_annotations" do
    belongs_to :file, Kosh.EAD.File
    belongs_to :user, Kosh.Accounts.User
    belongs_to :admin, Kosh.Accounts.User, foreign_key: :admin_id
    field :status, Ecto.Enum, values: [:pending, :accepted, :rejected], default: :pending
    field :new_agents, {:array, :map}, default: []

    many_to_many :agents, EADAgent,
      join_through: Kosh.Annotations.AgentAnnotationsAgents,
      on_delete: :nothing,
      on_replace: :delete

    timestamps(type: :utc_datetime)
  end

  def changeset(agent_annotation, attrs) do
    agent_annotation
    |> cast(attrs, [:file_id, :user_id, :status, :admin_id, :new_agents])
    |> validate_required([:file_id, :user_id])
  end

  @doc """
  Creates an Agent Annotation, then links it with the accociated agents through the join table.
  """
  def create_with_agents(attrs) do
    now = NaiveDateTime.utc_now() |> NaiveDateTime.truncate(:second)
    Logger.debug("Creating agent annotation with attrs: #{inspect(attrs)}")

    Repo.transaction(fn ->
      case %__MODULE__{} |> changeset(attrs) |> Repo.insert() do
        {:ok, annotation} ->
          Logger.debug("Created agent annotation: #{inspect(annotation)}")

          if agents = attrs["agents"] do
            Logger.debug("Processing agents: #{inspect(agents)}")

            agent_ids =
              Enum.map(agents, fn %{id: id} ->
                case id do
                  id when is_integer(id) ->
                    id

                  id when is_binary(id) ->
                    {id_int, _} = Integer.parse(id)
                    id_int
                end
              end)

            Logger.debug("Parsed agent IDs: #{inspect(agent_ids)}")

            # Insert join table entries with timestamps
            {count, _} =
              Repo.insert_all(
                "agent_annotations_agents",
                Enum.map(agent_ids, fn agent_id ->
                  %{
                    agent_annotation_id: annotation.id,
                    agent_id: agent_id,
                    inserted_at: now,
                    updated_at: now
                  }
                end),
                returning: true
              )

            Logger.debug("Inserted #{count} agent associations")

            # Reload the annotation with preloaded agents
            Repo.preload(annotation, :agents)
          else
            annotation
          end

        {:error, changeset} ->
          Logger.error("Failed to create agent annotation: #{inspect(changeset.errors)}")
          Repo.rollback(changeset)
      end
    end)
  end
end
