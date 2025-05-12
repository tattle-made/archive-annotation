defmodule Kosh.EAD.Model do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  embedded_schema do
    embeds_one :ead, EAD, primary_key: false do
      embeds_one :eadheader, EADHeader, primary_key: false do
        embeds_one :eadid, EADID, primary_key: false do
          field :countrycode, :string
        end

        embeds_one :address, Address, primary_key: false do
          field :addressline, {:array, :string}
        end
      end

      embeds_one :archdesc, ArchDesc, primary_key: false do
        embeds_one :did, DID, primary_key: false do
          embeds_one :repository, Repository, primary_key: false do
            field :corpname, :string
          end
        end

        embeds_one :controlaccess, ControlAccess, primary_key: false do
          embeds_many :subject, Subject do
            field :content, :string
            field :source, :string
          end
        end
      end
    end
  end

  def changeset(model, attrs \\ %{}) do
    model
    |> cast(attrs, [])
    |> cast_embed(:ead, with: &ead_changeset/2, required: false)
  end

  def ead_changeset(ead, attrs) do
    ead
    |> cast(attrs, [])
    |> cast_embed(:eadheader, with: &eadheader_changeset/2, required: false)
    |> cast_embed(:archdesc, with: &archdesc_changeset/2, required: false)
  end

  def eadheader_changeset(eadheader, attrs) do
    eadheader
    |> cast(attrs, [])
    |> cast_embed(:eadid, with: &eadid_changeset/2, required: false)
    |> cast_embed(:address, with: &address_changeset/2, required: false)
  end

  def address_changeset(address, attrs) do
    address
    |> cast(attrs, [:addressline])
  end

  def addressline_changeset(addressline, attrs) do
    case attrs do
      str when is_binary(str) -> addressline |> cast(%{content: str}, [:content])
      map when is_map(map) -> addressline |> cast(map, [:content])
      _ -> addressline |> cast(%{}, [])
    end
  end

  def eadid_changeset(eadid, attrs) do
    eadid
    |> cast(attrs, [:countrycode])
  end

  def archdesc_changeset(archdesc, attrs) do
    archdesc
    |> cast(attrs, [])
    |> cast_embed(:did, with: &did_changeset/2, required: false)
    |> cast_embed(:controlaccess, with: &controlaccess_changeset/2, required: false)
  end

  def did_changeset(did, attrs) do
    did
    |> cast(attrs, [])
    |> cast_embed(:repository, with: &repository_changeset/2, required: false)
  end

  def repository_changeset(repository, attrs) do
    repository
    |> cast(attrs, [])
    |> cast(attrs, [:corpname])
  end

  def controlaccess_changeset(controlaccess, attrs) do
    controlaccess
    |> cast(attrs, [])
    |> cast_embed(:subject, with: &subject_changeset/2, required: false)
  end

  def subject_changeset(subject, attrs) do
    subject
    |> cast(attrs, [:content, :source])
  end
end
