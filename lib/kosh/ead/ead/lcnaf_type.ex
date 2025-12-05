defmodule Kosh.EAD.LcnafType do
  use Ecto.Schema
  import Ecto.Changeset

  schema "lcnaf_types" do
    field :type, :string
    timestamps(type: :utc_datetime)
  end

  def changeset(type, attrs \\ %{}) do
    type
    |> cast(attrs, [:type])
    |> validate_required([:type])
  end
end
