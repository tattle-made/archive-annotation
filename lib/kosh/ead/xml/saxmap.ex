defmodule Kosh.EAD.XML.Saxmap do
  @moduledoc """
  Parse xml file into Elixir map using saxmap
  """
  alias SAXMap
  alias Kosh.EAD.XML.LeslieMap

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
      # Special "content" key: handle but don't directly put under "content"
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

  def extract_contents_from_processed_map(map) when is_map(map) do
    with ead when not is_nil(ead) <- get_in(map, ["ead"]),
         archdesc when not is_nil(archdesc) <- get_in(ead, ["archdesc"]),
         collection_did when not is_nil(collection_did) <- get_in(archdesc, ["did"]),
         collection_title when not is_nil(collection_title) <- get_in(collection_did, ["unittitle"]) do
      collection_scopecontent = get_in(archdesc, ["scopecontent"]) || %{}
      collection_subjects = get_in(archdesc, ["controlaccess", "subject"]) || []
      collection_unitdate = get_in(collection_did, ["unitdate"]) || %{}

      {collection_unitid, collection_unit_code} =
        extract_unitid(collection_did)

      collection = %{
        title: collection_title,
        unit_code: collection_unit_code,
        scopecontent: collection_scopecontent,
        subjects: collection_subjects,
        unitdate: collection_unitdate,
        unitid: collection_unitid
      }

      children = archdesc |> get_in(["dsc", "c"]) |> List.wrap()
      nested_structure = process_children_nodes(children)

      {:ok, {collection, nested_structure}}
    else
      nil -> {:error, "Invalid EAD structure: missing required fields"}
    end
  end

  defp process_children_nodes(nodes) when is_list(nodes) do
    Enum.map(nodes, &process_node/1)
  end

  defp process_node(node) do
    case node["level"] do
      "series" ->
        with title when not is_nil(title) <- node["did"]["unittitle"] do
          %{
            type: :series,
            title: title,
            unitid: extract_unitid(node["did"]) |> elem(0),
            children: process_children_nodes(List.wrap(node["c"]))
          }
        else
          nil -> nil
        end

      "subseries" ->
        with title when not is_nil(title) <- node["did"]["unittitle"] do
          %{
            type: :subseries,
            title: title,
            unitid: extract_unitid(node["did"]) |> elem(0),
            children: process_children_nodes(List.wrap(node["c"]))
          }
        else
          nil -> nil
        end

      "file" ->
        with title when not is_nil(title) <- node["did"]["unittitle"] do
          %{
            type: :file,
            title: title,
            unitid: extract_unitid(node["did"]) |> elem(0),
            description:
              node
              |> get_in(["scopecontent", "p"])
              |> List.wrap(),
            unitdate: node["did"]["unitdate"] || %{},
            dao: node["did"]["daogrp"] |> extract_dao(),
            subjects: node["controlaccess"]["subject"] |> List.wrap()
          }
        else
          nil -> nil
        end

      _ ->
        nil
    end
  end

  defp extract_dao(daogrp) do
    case daogrp do
      %{
        "daoloc" => daolocs,
        "xlink:title" => title,
        "xlink:type" => type
      } ->
        %{
          xlink_title: title,
          xlink_type: type,
          daolocs:
            Enum.map(daolocs, fn loc ->
              %{
                xlink_href: loc["xlink:href"],
                xlink_type: loc["xlink:type"]
              }
            end)
        }

      _ ->
        %{}
    end
  end

  defp extract_unitid(did) do
    case get_in(did, ["unitid"]) do
      [id, %{"content" => uri, "type" => type}] ->
        {%{id: id, uri: uri, type: type}, id}

      id when is_binary(id) ->
        {%{id: id}, id}

      _ ->
        {%{}, nil}
    end
  end

  def getmap() do
    map = LeslieMap.get_map()
    ans = extract_contents_from_processed_map(map)
    IO.inspect(ans, label: "ans", limit: :infinity)
  end
end
