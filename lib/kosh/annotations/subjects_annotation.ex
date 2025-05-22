defmodule Kosh.Annotations.SubjectsAnnotation do
  use Ecto.Schema
  import Ecto.Changeset

  schema "subjects_annotations" do
    belongs_to :file, Kosh.EAD.File
    many_to_many :subjects, Kosh.EAD.Subject,
      join_through: "subjects_annotations_subjects",
      on_delete: :nothing,
      on_replace: :delete

    timestamps()
  end

  def changeset(subjects_annotation, attrs) do
    subjects_annotation
    |> cast(attrs, [:file_id])
    |> validate_required([:file_id])
    |> cast_assoc(:file, with: &Kosh.EAD.File.changeset/2)
  end
end
