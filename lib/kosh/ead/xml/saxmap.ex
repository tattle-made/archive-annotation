defmodule Kosh.EAD.XML.Saxmap do
  @moduledoc """
  Parse xml file into Elixir map using saxmap
  """
  alias SAXMap

  def parse(doc) do
    SAXMap.from_string(doc, ignore_attribute: false)
  end
end
