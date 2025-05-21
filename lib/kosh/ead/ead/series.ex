defmodule Kosh.EAD.Series do
  use Ecto.Schema
  import Ecto.Changeset

  schema "series" do
    field :title, :string
    has_many :sub_series, Kosh.EAD.SubSeries
    embeds_one :unitid, Kosh.EAD.UnitId, on_replace: :update
    belongs_to :collection, Kosh.EAD.Collection

    timestamps()
  end

    @doc false
  def changeset(series, attrs) do
    series
    |> cast(attrs, [:title, :collection_id])
    |> cast_embed(:unitid)
    |> validate_required([:title, :collection_id])
    |> assoc_constraint(:collection)
    |> unique_constraint(:title, name: :series_title_collection_id_index) #check for unique value in series_collection_index column and project it to title
  end
end
