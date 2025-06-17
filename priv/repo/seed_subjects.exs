alias Kosh.Repo
alias Kosh.EAD.Subject
require Logger

defmodule Loader do
  @moduledoc """
  Stream the newline‐delimited JSON‐LD file and insert subjects in batches.
  """

  @filename "priv/static/subjects_seed/subjects.madsrdf.jsonld"
  @batch_size 1_000

  def run do

    timestamp =
      NaiveDateTime.utc_now()
      |> NaiveDateTime.truncate(:second)

    File.stream!(@filename, [], :line)
    |> Stream.map(&String.trim/1)
    |> Stream.reject(&(&1 == ""))                     # skip any blank lines
    |> Stream.map(&safe_parse_subject_line/1)
    |> Stream.reject(&is_nil/1)                        # drop any lines we couldn’t parse
    |> Stream.map(fn base_map ->

      Map.merge(base_map, %{
        inserted_at: timestamp,
        updated_at: timestamp
      })
    end)
    |> Stream.chunk_every(@batch_size)
    |> Stream.each(fn batch ->
      Repo.insert_all(Subject, batch, on_conflict: :nothing, conflict_target: :content)
      Logger.info("Inserted batch of #{length(batch)} subjects")
    end)
    |> Stream.run()

    Logger.info("Finished inserting all subjects.")
  end

  defp safe_parse_subject_line(line) do
    case Jason.decode(line) do
      {:ok, %{"@graph" => graph}} ->
        extract_from_graph(graph)

      {:ok, _other} ->
        # “@graph” key wasn’t present → skip
        nil

      {:error, _reason} ->
        # Malformed JSON → skip
        nil
    end
  end

  defp extract_from_graph(graph) do
    authority_node =
      Enum.find(graph, fn
        %{"@type" => types} when is_list(types) ->
          Enum.any?(types, &(&1 == "madsrdf:Authority"))
        _ ->
          false
      end) || hd(graph)

    case authority_node["madsrdf:authoritativeLabel"] do
      %{"@value" => title} when is_binary(title) ->
        subject_id = authority_node["@id"] || ""
        if subject_id == "" or title == "" do
          nil
        else
          %{
            unitid: subject_id,
            content: title,
            source: "lcsh"
          }
        end

      _ ->
        # No authoritativeLabel or unexpected structure → skip
        nil
    end
  end
end

Loader.run()
