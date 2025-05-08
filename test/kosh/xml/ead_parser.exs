defmodule Kosh.Xml.EADParser do
  use ExUnit.Case

  test "simple file" do
    {:ok, map} = Path.join( [File.cwd!(),  "test", "support", "fixtures", "xml_fixtures", "simple.xml"])
    |> File.read!()
    |> SAXMap.from_string(ignore_attribute: false)
    |> IO.inspect()

    assert map["ead"]["content"]["archdesc"] != nil
    assert map["ead"]["content"]["eadheader"] != nil
    assert map["ead"]["content"]["archdesc"]["content"]["did"]["content"]["repository"]["content"]["corpname"]["content"] == "Archives at NCBS"

    assert map["ead"]["content"]["eadheader"]["content"]["eadid"]["countrycode"] == "IN"
  end
end
