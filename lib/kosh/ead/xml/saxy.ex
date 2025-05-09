defmodule Kosh.EAD.XML.Saxy do
  @moduledoc """
  Parse xml file into Elixir map
  """

  def parse(doc) do
    Saxy.parse_string(doc, EADSaxyHandler, {nil, %{}})
  end
end
