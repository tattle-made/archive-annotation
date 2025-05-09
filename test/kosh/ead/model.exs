defmodule Kosh.EAD.ModelTest  do
  alias Ecto.Changeset
  alias Kosh.EAD.Model
  alias Kosh.EADFixtures
  use ExUnit.Case

  test "changeset/2" do
    map = EADFixtures.simple_xml_map()
    changeset = Model.changeset(%Model{}, map)
    struct = Changeset.apply_changes(changeset)

    assert struct.ead.content.eadheader.content.eadid.countrycode == "IN"
    assert struct.ead.content.archdesc.content.did.content.repository.content.corpname.content ==
             "Archives at NCBS"
    assert Enum.at(struct.ead.content.eadheader.content.address.content.addressline, 1).content == "Bangalore, Karnataka 560065"
  end
end
