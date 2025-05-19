defmodule Kosh.EAD do
  alias Kosh.EAD.{Subject, XML.Saxmap, Collection, Series, SubSeries, File, UnitId, UnitDate, Dao}
  alias Kosh.Repo
  import Ecto.Query
  # import File, only: [read: 1]

  @moduledoc """
  Context for handling EAD documents
  """

  # Collection functions
  def create_collection(attrs \\ %{}) do
    %Collection{}
    |> Collection.changeset(attrs)
    |> Repo.insert()
  end

  def add_subjects_to_collection(collection, subjects) do
    processed_subjects = process_subjects(subjects)
    now = NaiveDateTime.utc_now() |> NaiveDateTime.truncate(:second)
    Repo.insert_all("collections_subjects",
      Enum.map(processed_subjects, fn subject ->
        %{
          collection_id: collection.id,
          subject_id: subject.id,
          inserted_at: now,
          updated_at: now
        }
      end)
    )
    {:ok, collection}
  end

  # Series functions
  def create_series(attrs \\ %{}) do
    %Series{}
    |> Series.changeset(attrs)
    |> Repo.insert()
  end

  # SubSeries functions
  def create_sub_series(attrs \\ %{}) do
    %SubSeries{}
    |> SubSeries.changeset(attrs)
    |> Repo.insert()
  end

  # File functions
  def create_file(attrs \\ %{}) do
    %File{}
    |> File.changeset(attrs)
    |> Repo.insert()
  end

  def add_subjects_to_file(file, subjects) do
    processed_subjects = process_subjects(subjects)
    Repo.insert_all("files_subjects",
      Enum.map(processed_subjects, fn subject ->
        %{
          file_id: file.id,
          subject_id: subject.id,
          inserted_at: NaiveDateTime.utc_now() |> NaiveDateTime.truncate(:second),
          updated_at: NaiveDateTime.utc_now() |> NaiveDateTime.truncate(:second)
        }
      end)
    )
    {:ok, file}
  end

  def get_file(id) do
    File
    |> preload([:subjects, :collection, :series, :sub_series])
    |> Repo.get(id)
  end

  def list_files do
    File
    |> preload(:subjects)
    |> Repo.all()
  end

  # Subject functions
  defp process_subjects(subjects) when is_list(subjects) do
    Enum.map(subjects, fn subject ->
      content = if is_map(subject), do: subject["content"], else: subject
      source = if is_map(subject), do: subject["source"], else: "EAD"

      case Repo.get_by(Subject, content: content) do
        nil ->
          {:ok, inserted_subject} = Repo.insert(
            Subject.changeset(%Subject{}, %{content: content, source: source})
          )
          inserted_subject
        existing_subject ->
          existing_subject
      end
    end)
  end

  # Main EAD processing function
  def process_xml_file(file_path) do
    with {:ok, xml_content} <- Elixir.File.read(file_path),
         {:ok, parsed_map} <- Saxmap.parse(xml_content),
         processed_map <- Saxmap.process_ead_map(parsed_map),
         {collection, nested_structure} <- Saxmap.extract_contents_from_processed_map(processed_map) do
      insert_ead_contents({collection, nested_structure})
    else
      {:error, reason} -> {:error, reason}
      error -> {:error, "Unexpected error: #{inspect(error)}"}
    end
  end

  defp insert_ead_contents({collection, nested_structure}) do
    # Process subjects first
    subjects = collection.subjects
    collection_without_subjects = Map.drop(collection, [:subjects])

    # Create collection without subjects
    case create_collection(collection_without_subjects) do
      {:ok, inserted_collection} ->
        IO.inspect(inserted_collection.id, label: "Created Collection ID")
        # Add subjects to collection
        {:ok, _} = add_subjects_to_collection(inserted_collection, subjects)

        # Process nested structure
        process_nested_structure(nested_structure, inserted_collection.id, nil, nil)

        {:ok, inserted_collection}

      {:error, changeset} ->
        # If collection already exists, return error
        {:error, "Collection with title '#{collection.title}' already exists"}
    end
  end

  defp process_nested_structure(nodes, collection_id, series_id, sub_series_id) when is_list(nodes) do
    IO.inspect(collection_id, label: "Collection ID in process_nested_structure")
    Enum.each(nodes, fn node ->
      process_node_for_db(node, collection_id, series_id, sub_series_id)
    end)
  end

  defp process_node_for_db(%{type: :series} = node, collection_id, _series_id, _sub_series_id) do
    # Drop non-schema fields and add collection_id
    series_attrs = node
      |> Map.drop([:type, :children])
      |> Map.put(:collection_id, collection_id)

    # Insert series
    {:ok, inserted_series} = create_series(series_attrs)

    # Process children with new series_id
    process_nested_structure(node.children, collection_id, inserted_series.id, nil)
  end

  defp process_node_for_db(%{type: :subseries} = node, collection_id, series_id, _sub_series_id) do
    # Drop non-schema fields and add collection_id and series_id
    sub_series_attrs = node
      |> Map.drop([:type, :children])
      |> Map.merge(%{
        collection_id: collection_id,
        series_id: series_id
      })

    IO.inspect(sub_series_attrs, label: "SubSeries attrs before insert")
    IO.inspect(String.length(sub_series_attrs.title), label: "Title length")

    # Insert subseries
    {:ok, inserted_sub_series} = create_sub_series(sub_series_attrs)

    # Process children with new sub_series_id
    process_nested_structure(node.children, collection_id, series_id, inserted_sub_series.id)
  end

  defp process_node_for_db(%{type: :file} = node, collection_id, series_id, sub_series_id) do
    # Drop non-schema fields and add IDs
    file_attrs = node
      |> Map.drop([:type])
      |> Map.merge(%{
        collection_id: collection_id,
        series_id: series_id,
        sub_series_id: sub_series_id
      })

    # Insert file
    {:ok, inserted_file} = create_file(file_attrs)

    # Add subjects to file
    {:ok, _} = add_subjects_to_file(inserted_file, node.subjects)
  end

  @doc """
  Extract relevant data from the processed EAD map.
  """
  def extract_ead_data(processed_map) do
    ead = get_in(processed_map, ["ead"])

    # Extract repository corpname
    corpname = get_in(ead, ["archdesc", "did", "repository", "corpname"]) || "Unknown Repository"

    # Extract country code
    country_code = get_in(ead, ["eadheader", "eadid", "countrycode"]) || "Unknown"

    # Extract address lines
    address_lines = get_in(ead, ["eadheader", "address", "addressline"]) || []
    address = if is_list(address_lines), do: address_lines, else: [address_lines]

    # Extract subjects
    subjects = get_in(ead, ["archdesc", "controlaccess", "subject"]) || []
    subjects = if is_list(subjects), do: subjects, else: [subjects]

    # Create the map for EAD creation
    %{
      corpname: corpname,
      country_code: country_code,
      address: address,
      subjects:
        Enum.map(subjects, fn subject ->
          %{
            content: subject["content"] || "Untitled Subject",
            source: subject["source"] || "unknown"
          }
        end)
    }
  end


  def load(filepath) do
    # map = XML.parse(filepath)
    # struct = DataModel.new(map)
    # struct.EADHeader.EADID.countrycode
    # struct.Archdesc.did.repository.corpname
  end
end
