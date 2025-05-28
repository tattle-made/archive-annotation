defmodule Kosh.Annotations.SubjectsAnnotation do
  use Ecto.Schema
  import Ecto.Changeset
  alias Kosh.Repo

  schema "subjects_annotations" do
    belongs_to :file, Kosh.EAD.File
    belongs_to :user, Kosh.Accounts.User
    belongs_to :admin, Kosh.Accounts.User, foreign_key: :admin_id
    field :status, Ecto.Enum, values: [:pending, :accepted, :rejected], default: :pending
    field :new_subjects, {:array, :string}, default: []

    many_to_many :subjects, Kosh.EAD.Subject,
      join_through: "subjects_annotations_subjects",
      on_delete: :nothing,
      on_replace: :delete

    timestamps()
  end

  def changeset(subjects_annotation, attrs) do
    subjects_annotation
    |> cast(attrs, [:file_id, :user_id, :status, :admin_id, :new_subjects])
    |> validate_required([:file_id, :user_id])
    |> cast_assoc(:file, with: &Kosh.EAD.File.changeset/2)
  end

  def create_with_subjects(attrs) do
    now = NaiveDateTime.utc_now() |> NaiveDateTime.truncate(:second)

    Repo.transaction(fn ->
      case %__MODULE__{} |> changeset(attrs) |> Repo.insert() do
        {:ok, annotation} ->
          if subjects = attrs["subjects"] do
            subject_ids = Enum.map(subjects, fn %{id: id} ->
              {id_int, _} = Integer.parse(to_string(id))
              id_int
            end)

            # Insert join table entries with timestamps
            {count, _} = Repo.insert_all(
              "subjects_annotations_subjects",
              Enum.map(subject_ids, fn subject_id ->
                %{
                  subjects_annotation_id: annotation.id,
                  subject_id: subject_id,
                  inserted_at: now,
                  updated_at: now
                }
              end)
            )

            if count == length(subject_ids) do
              {:ok, annotation}
            else
              Repo.rollback("Failed to insert all subject associations")
            end
          else
            {:ok, annotation}
          end

        {:error, changeset} ->
          Repo.rollback(changeset)
      end
    end)
  end
end
