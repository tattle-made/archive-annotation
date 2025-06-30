defmodule Kosh.Search do
  @moduledoc """
  Provides file search functionality over Files, their embeds, associations, and accepted annotations.
  """
  import Ecto.Query, warn: false
  alias Kosh.Repo
  alias Kosh.EAD.{File, Collection, Series, SubSeries, Subject}
  alias Kosh.Annotations.{DescriptionAnnotation, SubjectsAnnotation}

  @doc """
  Searches Files by the given query string `q` across:
    - File fields: title, description (array), uri
    - Embeds: unitid.id, dao.xlink_title
    - Associations: Collection.title, Series.title, SubSeries.title, Subjects.content
    - Accepted annotations: DescriptionAnnotation.description, SubjectsAnnotation.new_subjects and associated Subjects.content
  Returns a list of maps, each including only the matching annotation texts.
  """
  def search_files(q, page, page_size) when is_binary(q) and q != "" and is_integer(page) and is_integer(page_size) do
    pattern = "%#{q}%"
    offset = (page - 1) * page_size

    # Use a helper to build the base query with all joins and where
    base_query = build_search_base_query(pattern)

    # Step 1: Get matching file URIs (with distinct, pagination)
    file_uris_query =
      base_query
      |> select([f], f.uri)
      |> distinct([f], f.uri)
      |> limit(^page_size)
      |> offset(^offset)

    file_uris = Repo.all(file_uris_query)

    # Step 2: Get total count (distinct uris)
    total_count_query =
      base_query
      |> select([f], f.uri)
      |> distinct([f], f.uri)

    total_count = Repo.aggregate(total_count_query, :count, :uri)

    # Step 3: Fetch files by URI, with all associations preloaded
    files_query =
      File
      |> where([f], f.uri in ^file_uris)
      |> preload([
        :collection,
        :series,
        :sub_series,
        :subjects,
        :accepted_description_annotations,
        accepted_subjects_annotations: [:subjects]
      ])

    results =
      Repo.all(files_query)
      |> Enum.uniq_by(& &1.uri)
      |> Enum.map(&format_file(&1, q))

    %{results: results, total_count: total_count}
  end

  def search_files(q) when is_binary(q) and q != "" do
    search_files(q, 1, 20)
  end

  defp match_any(pattern) do
    dynamic(
      [f, c, s, ss, subj, desc_ann, subj_ann, ann_subj],
      ilike(f.title, ^pattern) or
        ilike(f.uri, ^pattern) or
        fragment("array_to_string(?, ' ') ILIKE ?", f.description, ^pattern) or
        fragment("?->>'id' ILIKE ?", f.unitid, ^pattern) or
        fragment(
          """
            EXISTS (
              SELECT 1
              FROM jsonb_array_elements(
                CASE
                  WHEN jsonb_typeof(?->'daolocs') = 'array' THEN ?->'daolocs'
                  ELSE '[]'::jsonb
                END
              ) AS elem
              WHERE elem->>'xlink_href' ILIKE ?
            )
          """,
          f.dao,
          f.dao,
          ^pattern
        ) or
        ilike(c.title, ^pattern) or
        ilike(s.title, ^pattern) or
        ilike(ss.title, ^pattern) or
        ilike(subj.content, ^pattern) or  # file's direct subjects
        ilike(desc_ann.description, ^pattern) or
        ilike(ann_subj.content, ^pattern) # subjects of each annotation
    )
  end

  defp format_file(%File{} = file, q) do
    %{
      file_name: file.title,
      collection_name: file.collection && file.collection.title,
      series_name: file.series && file.series.title,
      sub_series_name: file.sub_series && file.sub_series.title,
      description: Enum.join(file.description || [], " "),
      uri: file.uri,
      unitid: file.unitid && file.unitid.id,
      dao_links:
        (file.dao
        |> Map.get(:daolocs, [])
        |> Kernel.||([])
        |> Enum.map(&Map.get(&1, "xlink_href"))
        |> Enum.filter(& &1)), # remove nils
      subjects: Enum.map(file.subjects || [], & &1.content),
      matched_description_annotations:
        (file.accepted_description_annotations || [])
        |> Enum.filter(&String.contains?(String.downcase(&1.description), String.downcase(q)))
        |> Enum.map(& &1.description),
      matched_subjects_annotations:
        (file.accepted_subjects_annotations || [])
        |> Enum.flat_map(fn ann ->
          (ann.subjects || [])
          |> Enum.map(& &1.content)
          |> Enum.filter(&String.contains?(String.downcase(&1), String.downcase(q)))
        end)
    }
  end

  defp build_search_base_query(pattern) do
    File
    |> join(:left, [f], c in assoc(f, :collection))
    |> join(:left, [f, c], s in assoc(f, :series))
    |> join(:left, [f, c, s], ss in assoc(f, :sub_series))
    |> join(:left, [f, c, s, ss], subj in assoc(f, :subjects))
    |> join(:left, [f, c, s, ss, subj], desc_ann in assoc(f, :accepted_description_annotations))
    |> join(:left, [f, c, s, ss, subj, desc_ann], subj_ann in assoc(f, :accepted_subjects_annotations))
    |> join(:left, [f, c, s, ss, subj, desc_ann, subj_ann], ann_subj in assoc(subj_ann, :subjects))
    |> where(^match_any(pattern))
  end
end
