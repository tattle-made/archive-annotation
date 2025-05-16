defmodule Kosh.EAD.UnitId do
  use Ecto.Schema
  import Ecto.Changeset

  # "unitid" => [
  # "MS-024-9-9-31-9",
  # %{
  # "content" => "/repositories/2/archival_objects/19114",
  # "type" => "aspace_uri"
  # }
  # ]

  @primary_key false
  embedded_schema do
    field :id, :string
    field :uri, :string
    field :type, :string
  end

  @doc false
  def changeset(dao, attrs) do
    dao
    |> cast(attrs, [:id, :uri, :type])
  end
end
