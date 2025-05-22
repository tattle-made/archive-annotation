defmodule Kosh.Annotations.DescriptionAnnotation do
  use Ecto.Schema
  import Ecto.Changeset

  schema "description_annotations" do
    field :description, :string
    belongs_to :file, Kosh.EAD.File
    belongs_to :user, Kosh.Accounts.User
    belongs_to :admin, Kosh.Accounts.User, foreign_key: :admin_id
    field :status, Ecto.Enum, values: [:pending, :accepted, :rejected], default: :pending

    timestamps()
  end

  def changeset(description_annotation, attrs) do
    description_annotation
    |> cast(attrs, [:description, :file_id, :user_id, :status, :admin_id])
    |> validate_required([:description, :file_id, :user_id])
    |> cast_assoc(:file, with: &Kosh.EAD.File.changeset/2)
  end
end
