defmodule Kosh.EAD.Collection do
  use Ecto.Schema
  import Ecto.Changeset

  schema "collections" do
    field :title, :string
    # will be derived from unitid, separate field for better querying and indexing
    field :unit_code, :string
    field :scopecontent, :map, default: %{}

    many_to_many :subjects, Kosh.EAD.Subject,
      join_through: "collections_subjects",
      on_delete: :nothing,
      on_replace: :delete

    has_many :series, Kosh.EAD.Series
    embeds_one :unitdate, Kosh.EAD.UnitDate, on_replace: :update
    embeds_one :unitid, Kosh.EAD.UnitId, on_replace: :update

    timestamps()
  end

  @doc false
  def changeset(collection, attrs) do
    collection
    |> cast(attrs, [:title, :unit_code, :scopecontent])
    |> cast_embed(:unitdate)
    |> cast_embed(:unitid)
    |> validate_required([:title, :unit_code])
    |> unique_constraint(:title)
    |> unique_constraint(:unit_code)
  end
end
