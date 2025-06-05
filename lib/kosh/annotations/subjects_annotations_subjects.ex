defmodule Kosh.Annotations.SubjectsAnnotationsSubjects do
  use Ecto.Schema

  @primary_key false
  schema "subjects_annotations_subjects" do
    belongs_to :subjects_annotation, Kosh.Annotations.SubjectsAnnotation
    belongs_to :subject, Kosh.EAD.Subject

    timestamps()
  end
  end
