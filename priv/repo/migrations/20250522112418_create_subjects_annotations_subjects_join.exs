defmodule Kosh.Repo.Migrations.CreateSubjectsAnnotationsSubjectsJoin do
  use Ecto.Migration

  def change do
    create table(:subjects_annotations_subjects) do
      add :subjects_annotation_id,
          references(:subjects_annotations, on_delete: :delete_all),
          null: false

      add :subject_id,
          references(:subjects, on_delete: :delete_all),
          null: false

      timestamps()
    end

    create index(:subjects_annotations_subjects, [:subjects_annotation_id])
    create index(:subjects_annotations_subjects, [:subject_id])

    create unique_index(
      :subjects_annotations_subjects,
      [:subjects_annotation_id, :subject_id],
      name: :uniq_subann_subj
    )
  end
end
