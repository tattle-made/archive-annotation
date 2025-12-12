defmodule Kosh.Annotations.EmotionAnnotation do
  use Ecto.Schema
  import Ecto.Changeset

  schema "emotion_annotations" do
    belongs_to :user, Kosh.Accounts.User
    belongs_to :file, Kosh.EAD.File
    belongs_to :defined_emotion, Kosh.EAD.DefinedEmotion

    field :weight, Ecto.Enum, values: [:high, :low]

    timestamps(type: :utc_datetime)
  end

  def changeset(annotation, attrs) do
    annotation
    |> cast(attrs, [:user_id, :file_id, :defined_emotion_id, :weight])
    |> validate_required([:user_id, :file_id, :defined_emotion_id, :weight])
    |> unique_constraint([:user_id, :file_id, :defined_emotion_id],
      name: :unique_user_file_emotion_index,
      message: "You have already added this emotion to this file."
    )
  end
end
