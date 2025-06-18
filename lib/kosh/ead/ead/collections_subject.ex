defmodule Kosh.EAD.CollectionsSubject do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  schema "collections_subjects" do
    belongs_to :collection, Kosh.EAD.Collection, primary_key: true
    belongs_to :subject, Kosh.EAD.Subject, primary_key: true

    timestamps()
  end

  def changeset(collections_subject, attrs) do
    collections_subject
    |> cast(attrs, [:collection_id, :subject_id])
    |> validate_required([:collection_id, :subject_id])
  end
end
