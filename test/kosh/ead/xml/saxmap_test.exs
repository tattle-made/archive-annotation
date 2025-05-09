defmodule Kosh.EAD.XML.SaxmapTest do
  alias Kosh.EAD.Model
  alias Kosh.EAD.XML.Saxmap
  use ExUnit.Case
  alias Ecto.Changeset


  test "parse/1" do
    xml_content =
      Path.join([File.cwd!(), "test", "support", "fixtures", "xml_fixtures", "simple.xml"])
      |> File.read!()

    {:ok, parsed_map} = Saxmap.parse(xml_content)

    ead = get_in(parsed_map, ["ead", "content"])
    eadid = get_in(ead, ["eadheader", "content", "eadid"])

    corpname =
      get_in(ead, ["archdesc", "content", "did", "content", "repository", "content", "corpname"])

    assert eadid["countrycode"] == "IN"
    assert corpname["content"] == "Archives at NCBS"
  end
end
