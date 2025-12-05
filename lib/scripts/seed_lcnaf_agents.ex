defmodule Scripts.SeedLcnafAgents do
  alias Kosh.Repo
  alias Kosh.EAD.Subject
  alias Kosh.EAD.Agent
  alias Kosh.EAD.LcnafType
  require Logger

  # @filename "priv/static/subjects_seed/subjects.madsrdf.jsonld"
  @batch_size 5_000  # Reduced from 10,000 to stay under PostgreSQL's 65,535 parameter limit

  def run do
    # file_path =
    #   :kosh
    #   |> :code.priv_dir()
    #   |> Path.join("static/subjects_seed/subjects.madsrdf.jsonld")
    file_path = Path.join(System.user_home!(), "Downloads/names.madsrdf.jsonld")

    timestamp =
      DateTime.utc_now()
      |> DateTime.truncate(:second)

    all_types =
      LcnafType
      |> Repo.all()
      |> Enum.reduce(%{}, fn type, acc -> Map.put(acc, type.type, type.id) end)

    File.stream!(file_path, [], :line)
    |> Stream.map(&String.trim/1)
    # skip any blank lines
    |> Stream.reject(&(&1 == ""))
    |> Stream.map(&safe_parse_subject_line(&1, all_types))
    # drop any lines we couldn’t parse
    |> Stream.reject(&is_nil/1)
    |> Stream.map(fn base_map ->
      Map.merge(base_map, %{
        inserted_at: timestamp,
        updated_at: timestamp
      })
    end)
    |> Stream.chunk_every(@batch_size)
    |> Stream.each(fn batch ->
      Repo.insert_all(Agent, batch, on_conflict: :nothing, conflict_target: :normalized_name)
      Logger.info("Inserted batch of #{length(batch)} Agent")
    end)
    |> Stream.run()

    Logger.info("Finished inserting all subjects.")
  end

  defp safe_parse_subject_line(line, all_types) do
    case Jason.decode(line) do
      {:ok, %{"@graph" => graph}} ->
        extract_from_graph(graph, all_types)

      {:ok, _other} ->
        # “@graph” key wasn’t present → skip
        nil

      {:error, _reason} ->
        # Malformed JSON → skip
        nil
    end
  end

  defp extract_from_graph(graph, all_types) do
    authority_node =
      Enum.find(graph, fn
        %{"madsrdf:authoritativeLabel" => authoritativeLabel} = authority_node ->
          true

        _ ->
          false
      end) || hd(graph)

    case authority_node["madsrdf:authoritativeLabel"] do
      title when is_binary(title) ->
        type_id = authority_node["@id"] || ""
        types = authority_node["@type"] || []
        types = types |> Enum.map(fn t -> all_types[t] end)

        if type_id == "" or title == "" do
          nil
        else
          %{
            name: title,
            normalized_name: normalize_name(title),
            unitid: type_id,
            source: "lcnaf",
            type_ids: types
          }
        end

      _ ->
        # No authoritativeLabel or unexpected structure → skip
        nil
    end
  end

  defp normalize_name(name) when is_binary(name) do
    name
    |> String.trim()
    |> String.normalize(:nfc)
    |> String.downcase()
  end
end
