defmodule Kosh.XML.SaxmapTest do
  alias Kosh.EAD.Model
  alias Kosh.EAD.XML.Saxmap
  alias Kosh.XML.EADSaxyHandler
  alias Kosh.XML.Parser
  use ExUnit.Case

  @tag timeout: :infinity
  test "parse/1" do
    {:ok, map} = Path.join( [File.cwd!(),  "test", "support", "fixtures", "xml_fixtures", "simple.xml"])
    |> File.read!()
    |> Saxmap.parse()
    |> IO.inspec

    assert map["ead"]["content"]["archdesc"] != nil
    assert map["ead"]["content"]["eadheader"] != nil
    assert map["ead"]["content"]["archdesc"]["content"]["did"]["content"]["repository"]["content"]["corpname"]["content"] == "Archives at NCBS"

    assert map["ead"]["content"]["eadheader"]["content"]["eadid"]["countrycode"] == "IN"

    struct = Model.changeset(%Model{}, map)
    |> IO.inspect()

    assert %Model{} = struct
  end

end
