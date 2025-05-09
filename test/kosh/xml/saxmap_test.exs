defmodule Kosh.XML.SaxmapTest do
  alias Kosh.EAD.Model
  alias Kosh.EAD.XML.Saxmap
  use ExUnit.Case
  alias Ecto.Changeset

  @tag timeout: :infinity
  test "parse/1" do
    xml_content =
      Path.join([File.cwd!(), "test", "support", "fixtures", "xml_fixtures", "simple.xml"])
      |> File.read!()

    {:ok, parsed_map} = Saxmap.parse(xml_content)
    IO.inspect(parsed_map)

    ead = get_in(parsed_map, ["ead", "content"])
    eadid = get_in(ead, ["eadheader", "content", "eadid"])

    corpname =
      get_in(ead, ["archdesc", "content", "did", "content", "repository", "content", "corpname"])

    assert eadid["countrycode"] == "IN"
    assert corpname["content"] == "Archives at NCBS"
  end

  test "parsed XML to struct" do
    xml_content =
      Path.join([File.cwd!(), "test", "support", "fixtures", "xml_fixtures", "simple.xml"])
      |> File.read!()

    {:ok, parsed_map} = Saxmap.parse(xml_content)
    changeset = Model.changeset(%Model{}, parsed_map)
    struct = Changeset.apply_changes(changeset)
    IO.inspect(struct, label: "STRUCTTT")

    assert struct.ead.content.eadheader.content.eadid.countrycode == "IN"

    assert struct.ead.content.archdesc.content.did.content.repository.content.corpname.content ==
             "Archives at NCBS"
  end
end
