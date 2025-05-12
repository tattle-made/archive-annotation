# lib/kosh/ead/ead.ex
defmodule Kosh.EAD.EAD do
  use Ecto.Schema
  import Ecto.Changeset

  schema "eads" do
    field :corpname, :string
    field :address, {:array, :string}, default: []
    field :country_code, :string

    has_many :subjects, Kosh.EAD.Subject, on_delete: :delete_all

    timestamps(type: :utc_datetime)
  end

  def changeset(ead, attrs) do
    ead
    |> cast(attrs, [:corpname, :address, :country_code])
    |> validate_required([:corpname, :country_code])
    |> cast_assoc(:subjects, with: &Kosh.EAD.Subject.changeset/2)
  end

  @doc """
  Example Map= %{
  "ead" => %{
    "archdesc" => %{
      "controlaccess" => %{
        "subject" => [
          %{"content" => "Agriculture", "source" => "local"},
          %{"content" => "Betel nut", "source" => "local"},
          %{"content" => "Coffee berry borer", "source" => "local"},
          %{"content" => "Coffee plantations", "source" => "local"},
          %{"content" => "Colonial portraits", "source" => "local"},
          %{"content" => "Colonial administrators", "source" => "local"},
          %{"content" => "Colonies", "source" => "local"},
          %{"content" => "Farm supplies", "source" => "local"},
          %{"content" => "Field experiments", "source" => "local"}
        ]
      },
      "did" => %{"repository" => %{"corpname" => "Archives at NCBS"}}
    },
    "eadheader" => %{
      "address" => %{
        "addressline" => ["National Centre for Biological Sciences - Tata Institute of Fundamental Research",
         "Bangalore, Karnataka 560065", "Business Number: +9180 6717 6010",
         "Business Number: +9180 6717 6011", "archives@ncbs.res.in"]
      },
      "eadid" => %{"countrycode" => "IN"}
    }
  }
  }
  """
end
