defmodule Kosh.EAD.XML.Saxmap do
  @moduledoc """
  Parse xml file into Elixir map using saxmap
  """
  alias SAXMap

  def parse(doc) do
    SAXMap.from_string(doc, ignore_attribute: false)
  end

  def process_ead_map(nil), do: nil

  def process_ead_map(str) when is_binary(str), do: str

  def process_ead_map(%{"content" => value} = map)
      when map_size(map) == 1 and not is_map(value) and not is_list(value) do
    # Map has only "content" and it's a primitive — just return it
    value
  end

  # def process_ead_map(list) when is_list(list) do
  #   Enum.map(list, &process_ead_map/1)
  # end
  def process_ead_map(list) when is_list(list) do
    list
    |> Enum.map(&process_ead_map/1)
    |> Enum.map(fn
      str when is_binary(str) -> String.trim(str)
      other -> other
    end)
    |> Enum.reject(fn
      nil -> true
      "" -> true
      [] -> true
      _ -> false
    end)
    |> case do
      [single] -> single
      other -> other
    end
  end

  def process_ead_map(map) when is_map(map) do
    Enum.reduce(map, %{}, fn
      # Special “content” key: handle but don’t directly put under "content"
      {"content", v}, acc ->
        processed = process_ead_map(v)

        cond do
          processed in [nil, [], %{}] ->
            acc

          is_map(processed) ->
            Map.merge(acc, processed)

          true ->
            Map.put(acc, "content", processed)
        end

      # All other keys: put processed under its key, then ignore merging
      {k, v}, acc ->
        Map.put(acc, k, process_ead_map(v))
    end)
  end
end
