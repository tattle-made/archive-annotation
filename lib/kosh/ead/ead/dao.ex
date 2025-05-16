defmodule Kosh.EAD.Dao do
  use Ecto.Schema
  import Ecto.Changeset

  # dao stands for Digital Archival Object

  @primary_key false
  embedded_schema do
    field :xlink_actuate, :string
    field :xlink_href, :string
    field :xlink_title, :string
    field :xlink_type, :string
  end

  @doc false
  def changeset(dao, attrs) do
    dao
    |> cast(attrs, [:xlink_actuate, :xlink_href, :xlink_title, :xlink_type])
  end
end
