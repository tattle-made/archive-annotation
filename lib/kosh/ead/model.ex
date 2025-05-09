defmodule Kosh.EAD.Model do
  use Ecto.Schema
  import Ecto.Changeset

  embedded_schema do
    embeds_one :ead, EAD, primary_key: false do
      embeds_one :content, Content, primary_key: :false do
        embeds_one :eadheader, EADHeader, primary_key: false do
          embeds_one :content, Content, primary_key: false do
            embeds_one :eadid, EADID, primary_key: :false do
              field :country_code, :string
            end
          end
        end
        # embeds_one :archdesc, ArchDesc, primary_key: :false do
        #   embeds_one :content, Content, primary_key: :false do
        #     embeds_one :did, DID, primary_key: :false do
        #       embeds_one :content, Content, primary_key: :false do
        #         embeds_one :repository, Repository, primary_key: :false do
        #           embeds_one :content, Content, primary_key: :false do
        #             embeds_one :corpname, Corpname, primary_key: :false do
        #               field :content, :string
        #             end
        #           end
        #         end
        #       end
        #     end
        #   end
        # end
      end
    end
  end

  def changeset(data, attrs \\ %{}) do
    data
    |> cast_embed(:ead, with: &ead_changeset/2 )
  end


  def ead_changeset(ead, attrs) do
    ead
    # |> cast_embed(:content, with: &ead_content_changeset/2 )
  end

  def ead_content_changeset(ead_content, attrs) do
    ead_content
    |> cast_embed(:eadheader, with: &eadheader_changeset/2)
    # |> cast_embed(:archdesc, with: &archdesc_changeset/2)
  end

  def eadheader_changeset(eadheader, attrs) do
    eadheader
    |> cast_embed(:content, with: &eadheader_content_changeset/2)
  end

  def eadheader_content_changeset(data, attrs) do
    data
    |> cast_embed(:eadid, with: &eadid_changeset/2)
  end

  def eadid_changeset(data, attrs) do
    data
    |> cast(attrs, [:country_code])
  end
end
