defmodule Kosh.EAD.XML.Saxmap do
  require Logger

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
    # When get a direct map from uploading OR when get EAD content after fetching from OAI endpoint.
    with ead when not is_nil(ead) <-
           get_in(map, ["ead"]) ||
             get_in(map, ["OAI-PMH", "GetRecord", "record", "metadata", "ead"]),
         archdesc when not is_nil(archdesc) <- get_in(ead, ["archdesc"]),
         collection_did when not is_nil(collection_did) <- get_in(archdesc, ["did"]),
         collection_title when not is_nil(collection_title) <-
           get_in(collection_did, ["unittitle"]) do
      collection_scopecontent = get_collection_scopecontent(archdesc)
      collection_subjects = (get_in(archdesc, ["controlaccess", "subject"]) || []) |> List.wrap()
      collection_unitdate = extract_unitdate(collection_did)

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

  defp get_collection_scopecontent(archdesc) do
    scopecontent = get_in(archdesc, ["scopecontent"]) || %{}

    if is_list(scopecontent) do
      List.first(scopecontent)
    else
      scopecontent
    end
  end

  defp process_children_nodes(nodes) when is_list(nodes) do
    Enum.map(nodes, &process_node/1)
    # skip unknown nodes like level = "item"
    |> Enum.reject(&is_nil/1)
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
          unitid = extract_unitid(node["did"]) |> elem(0)

          if is_nil(get_in(unitid, [:uri])) do
            Logger.warning("EAD file node missing unitid.uri title=#{inspect(title)} ")
          end

          %{
            type: :file,
            title: title,
            unitid: unitid,
            description:
              node
              |> get_in(["scopecontent", "p"])
              |> List.wrap(),
            unitdate: extract_unitdate(node["did"]),
            dao: node |> extract_dao(),
            subjects: node["controlaccess"]["subject"] |> List.wrap()
          }
        else
          nil -> nil
        end

      _ ->
        nil
    end
  end

  defp extract_dao(node) do
    if node["did"]["dao"] do
      extract_single_dao(node["did"]["dao"])
    else
      extract_daogrp(node["did"]["daogrp"])
    end
  end

  # Also handles in case dao is a list (multiple dao tags present)
  defp extract_single_dao(dao) do
    dao
    |> List.wrap()
    |> Enum.find(
      &match?(
        %{
          "xlink:href" => _,
          "xlink:title" => _,
          "xlink:type" => _
        },
        &1
      )
    )
    |> case do
      %{"xlink:title" => title, "xlink:type" => type} ->
        %{
          xlink_title: title,
          xlink_type: type,
          # Storing in DAOlocs as it is being used to render dao objects in the file display
          daolocs:
            Enum.map(List.wrap(dao), fn loc ->
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

  defp extract_daogrp(daogrp) do
    case daogrp do
      %{
        "daoloc" => daolocs,
        "xlink:title" => title,
        "xlink:type" => type
      } ->
        daolocs = List.wrap(daolocs)

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
    unitid = did |> get_in(["unitid"]) |> List.wrap()

    id = Enum.find(unitid, &is_binary/1)

    uri_map =
      Enum.find(unitid, fn
        %{"content" => _uri, "type" => "aspace_uri"} -> true
        _ -> false
      end)

    case {id, uri_map} do
      {id, %{"content" => uri, "type" => type}} when is_binary(id) ->
        {%{id: id, uri: uri, type: type}, id}

      {nil, %{"content" => uri, "type" => type}} ->
        {%{id: nil, uri: uri, type: type}, nil}

      {id, _} when is_binary(id) ->
        {%{id: id}, id}

      _ ->
        {%{}, nil}
    end
  end

  defp extract_unitdate(did) do
    unitdate = get_in(did, ["unitdate"]) || %{}

    if is_list(unitdate) do
      Enum.at(unitdate, 0)
    else
      unitdate
    end
  end
end
