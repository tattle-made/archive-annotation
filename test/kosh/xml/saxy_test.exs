defmodule Kosh.XML.SaxyTest do
  alias Kosh.EAD.XML.Saxy
  alias Kosh.EAD.XML.SaxyHandler
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
