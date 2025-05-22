defmodule Kosh.Annotations.DescriptionAnnotation do
  use Ecto.Schema
  import Ecto.Changeset

  schema "description_annotations" do
    field :description, :string
    belongs_to :file, Kosh.EAD.File

    timestamps()
  end

  def changeset(description_annotation, attrs) do
    description_annotation
    |> cast(attrs, [:description, :file_id])
    |> validate_required([:description, :file_id])
    |> cast_assoc(:file, with: &Kosh.EAD.File.changeset/2)
  end
end
