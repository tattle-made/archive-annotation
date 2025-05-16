defmodule Kosh.EAD.UnitDate do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  embedded_schema do
    field :calendar,  :string
    field :certainty, :string
    field :content,   :string
    field :datechar,  :string
    field :era,       :string
    field :normal,    :string
    field :type,      :string
  end

    @doc false
  def changeset(unitdate, attrs) do
    unitdate
    |> cast(attrs, [:calendar, :certainty, :content, :datechar, :era, :normal, :type])
  end
end
