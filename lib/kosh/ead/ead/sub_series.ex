defmodule Kosh.EAD.SubSeries do
  use Ecto.Schema
  import Ecto.Changeset

  schema "sub_series" do
    field :title, :string

    has_many :files, Kosh.EAD.File
    embeds_one :unitid, Kosh.EAD.UnitId, on_replace: :update
    belongs_to :series, Kosh.EAD.Series
    belongs_to :collection, Kosh.EAD.Collection

    timestamps()
  end

  @doc false
  def changeset(sub_series, attrs) do
    sub_series
    |> cast(attrs, [:title, :series_id, :collection_id])
    |> cast_embed(:unitid)
    |> validate_required([:title, :series_id, :collection_id])
    |> assoc_constraint(:series)
    |> assoc_constraint(:collection)
    |> unique_constraint(:title, name: :sub_series_title_series_id_index)
  end
end
