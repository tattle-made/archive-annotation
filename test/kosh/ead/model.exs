defmodule Kosh.EAD.ModelTest  do
  alias Ecto.Changeset
  alias Kosh.EAD.Model
  alias Kosh.EADFixtures
  use ExUnit.Case

  # test to check if a given map fits with the defined struct

  test "changeset/2" do
    map = EADFixtures.simple_xml_map()
    changeset = Model.changeset(%Model{}, map)
    IO.inspect(changeset, label: "CHANGESET")
    struct = Changeset.apply_changes(changeset)

    IO.inspect(struct)

    assert struct.ead.eadheader.eadid.countrycode == "IN"
    assert struct.ead.archdesc.did.repository.corpname == "Archives at NCBS"
    assert Enum.at(struct.ead.eadheader.address.addressline, 1) == "Bangalore, Karnataka 560065"
    assert Enum.at(struct.ead.archdesc.controlaccess.subject,0).content == "Agriculture"
    assert Enum.at(struct.ead.archdesc.controlaccess.subject,0).source == "local"
  end
end
