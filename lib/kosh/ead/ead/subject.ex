defmodule Kosh.EAD.Subject do
  use Ecto.Schema
  import Ecto.Changeset

  schema "subjects" do
    field :content, :string
    field :source, :string
    field :unitid, :string, default: nil

    many_to_many :files, Kosh.EAD.File,
      join_through: "files_subjects",
      on_delete: :nothing,
      on_replace: :delete

    many_to_many :collections, Kosh.EAD.Collection,
      join_through: "collections_subjects",
      on_delete: :nothing,
      on_replace: :delete

    many_to_many :annotations, Kosh.Annotations.SubjectsAnnotation,
      join_through: Kosh.Annotations.SubjectsAnnotationsSubjects,
      on_delete: :nothing,
      on_replace: :delete

    timestamps()
  end

  @doc false
  def changeset(subject, attrs) do
    subject
    |> cast(attrs, [:content, :source, :unitid])
    |> validate_required([:content, :source])
    |> unique_constraint(:content, name: :subjects_content_index)
  end
end
