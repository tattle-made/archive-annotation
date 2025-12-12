defmodule Kosh.Repo.Migrations.CreateEmotionAnnotations do
  use Ecto.Migration

  def change do
    execute(
      "CREATE TYPE emotion_annotation_weight AS ENUM ('high', 'low')",
      "DROP TYPE emotion_annotation_weight"
    )

    create table(:emotion_annotations) do
      add :user_id, references(:users, on_delete: :delete_all), null: false
      add :file_id, references(:files, on_delete: :delete_all), null: false

      # Restrict deletion from the defined_emotions table if any of the emotion is referenced in this table
      add :defined_emotion_id, references(:defined_emotions, on_delete: :restrict), null: false
      add :weight, :emotion_annotation_weight, null: false

      timestamps(type: :utc_datetime)
    end

    # This enforces "User can add only one entry per emotion per file"
    create unique_index(:emotion_annotations, [:user_id, :file_id, :defined_emotion_id],
             name: :unique_user_file_emotion_index
           )
  end
end
