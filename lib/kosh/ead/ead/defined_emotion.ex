defmodule Kosh.EAD.DefinedEmotion do
  use Ecto.Schema
  import Ecto.Changeset

  schema "defined_emotions" do
    field :name, :string
    field :lcsh_url, :string

    timestamps(type: :utc_datetime)
  end

  @required_fields [:name, :lcsh_url]

  def changeset(defined_emotion, attrs) do
    # Normalize name using the normalize_name/1 function if present in attrs
    attrs =
      if Map.has_key?(attrs, :name) && attrs.name do
        Map.put(attrs, :name, normalize_name(attrs.name))
      else
        attrs
      end

    defined_emotion
    |> cast(attrs, @required_fields)
    |> validate_required(@required_fields)
    |> validate_length(:name, min: 1)
    |> validate_length(:lcsh_url, min: 1)
    |> unique_constraint(:name,
      name: :defined_emotions_lower_name_index,
      message: "already exists (case-insensitive)"
    )
  end

  @doc """
  Normalizes the given name by:
  1. Trimming whitespace
  2. Normalizing unicode characters (NFC form)
  3. Converting to lowercase

  Returns nil if the input is nil.
  """
  @spec normalize_name(String.t() | nil) :: String.t() | nil
  def normalize_name(nil), do: nil

  def normalize_name(name) when is_binary(name) do
    name
    |> String.trim()
    |> String.normalize(:nfc)
    |> String.downcase()
  end
end
