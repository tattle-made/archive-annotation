defmodule Kosh.EAD.XML.SaxmapTest do
  alias Kosh.EAD.Model
  alias Kosh.EAD.XML.Saxmap
  use ExUnit.Case
  alias Ecto.Changeset

  # Test for xml to map
  test "parse/1" do
    xml_content =
      Path.join([File.cwd!(), "test", "support", "fixtures", "xml_fixtures", "simple.xml"])
      |> File.read!()

    {:ok, parsed_map} = Saxmap.parse(xml_content)

    IO.inspect(parsed_map)

    processed_map = Saxmap.process_ead_map(parsed_map)

    ead = get_in(processed_map, ["ead"])

    eadid = get_in(ead, ["eadheader", "eadid"])

    corpname = get_in(ead, ["archdesc", "did", "repository", "corpname"])

    subjects = get_in(ead, ["archdesc", "controlaccess", "subject"])

    test_subject = Enum.at(subjects,0)


    assert eadid["countrycode"] == "IN"
    assert corpname == "Archives at NCBS"
    assert test_subject["content"] == "Agriculture"
    assert test_subject["source"] == "local"
  end
end
