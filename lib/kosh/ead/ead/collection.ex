defmodule Kosh.EAD.Collection do
  use Ecto.Schema
  import Ecto.Changeset

  schema "collections" do
    field :title, :string
    # will be derived from unitid, separate field for better querying and indexing
    field :unit_code, :string
    field :scopecontent, :map, default: %{}
    field :upload_path, :string
    field :oai_identifier, :string
    field :archival_space, :string

    many_to_many :subjects, Kosh.EAD.Subject,
      join_through: Kosh.EAD.CollectionsSubject,
      on_delete: :nothing,
      on_replace: :delete

    has_many :series, Kosh.EAD.Series
    has_many :files, Kosh.EAD.File
    embeds_one :unitdate, Kosh.EAD.UnitDate, on_replace: :delete
    embeds_one :unitid, Kosh.EAD.UnitId, on_replace: :update

    timestamps()
  end

  @doc false
  def changeset(collection, attrs) do
    collection
    |> cast(attrs, [:title, :unit_code, :scopecontent, :upload_path, :oai_identifier, :archival_space])
    |> cast_embed(:unitdate)
    |> cast_embed(:unitid)
    |> validate_required([:title, :unit_code, :oai_identifier, :archival_space])
    |> unique_constraint(:upload_path)
    |> unique_constraint(:oai_identifier)
    |> unique_constraint([:archival_space, :title])
    |> unique_constraint([:archival_space, :unit_code])
  end
end
