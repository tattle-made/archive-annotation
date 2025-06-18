defmodule Kosh.EAD.FilesSubject do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  schema "files_subjects" do
    belongs_to :file, Kosh.EAD.File, primary_key: true
    belongs_to :subject, Kosh.EAD.Subject, primary_key: true

    timestamps()
  end

  def changeset(files_subject, attrs) do
    files_subject
    |> cast(attrs, [:file_id, :subject_id])
    |> validate_required([:file_id, :subject_id])
  end
end
