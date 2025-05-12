defmodule Kosh.EAD.Subject do
  use Ecto.Schema
  import Ecto.Changeset

  schema "subjects" do
    field :content, :string
    field :source, :string

    belongs_to :ead, Kosh.EAD.EAD

    timestamps(type: :utc_datetime)
  end

  def changeset(subject, attrs) do
    subject
    |> cast(attrs, [:content, :source])
    |> validate_required([:content, :source])
  end
end
