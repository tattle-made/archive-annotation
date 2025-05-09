defmodule Kosh.Xml.EADParser do
  alias Kosh.EAD.XML.Saxmap
  alias Kosh.EAD.XML.Saxy
  alias Kosh.XML.EADSaxyHandler
  alias Kosh.XML.Parser
  use ExUnit.Case

  test "parse simple file with saxy" do
    map = Path.join( [File.cwd!(),  "test", "support", "fixtures", "xml_fixtures", "simple.xml"])
    |> File.read!()
    |> Saxy.parse()
    |> IO.inspect()

    # json = map |> EAD.transform(map)
    # assert %{}EAD = map
  end
end
