defmodule Kosh.EAD do
  alias Kosh.EAD.{Subject, XML.Saxmap, Collection, Series, SubSeries, File}
  alias Kosh.Repo
  import Ecto.Query
  # import File, only: [read: 1]

  @moduledoc """
  Context for handling EAD documents
  """

  # Collection functions
  @spec create_collection(map()) :: {:ok, struct()} | {:error, Ecto.Changeset.t()}
  def create_collection(attrs \\ %{}) do
    %Collection{}
    |> Collection.changeset(attrs)
    |> Repo.insert()
  end

  @spec add_subjects_to_collection(struct(), list()) :: {:ok, struct()} | {:error, String.t()}
  def add_subjects_to_collection(collection, subjects) do
    processed_subjects = process_subjects(subjects)
    now = NaiveDateTime.utc_now() |> NaiveDateTime.truncate(:second)

    try do
      {count, _} =
        Repo.insert_all(
          "collections_subjects",
          Enum.map(processed_subjects, fn subject ->
            %{
              collection_id: collection.id,
              subject_id: subject.id,
              inserted_at: now,
              updated_at: now
            }
          end)
        )

      if count == length(processed_subjects) do
        {:ok, collection}
      else
        {:error, "Failed to insert all subjects"}
      end
    rescue
      e in Ecto.QueryError -> {:error, "Database error: #{inspect(e)}"}
      e in Postgrex.Error -> {:error, "Database error: #{inspect(e)}"}
    end
  end

  # Series functions
  @spec create_series(map()) :: {:ok, struct()} | {:error, Ecto.Changeset.t()}
  def create_series(attrs \\ %{}) do
    %Series{}
    |> Series.changeset(attrs)
    |> Repo.insert()
  end

  # SubSeries functions
  @spec create_sub_series(map()) :: {:ok, struct()} | {:error, Ecto.Changeset.t()}
  def create_sub_series(attrs \\ %{}) do
    %SubSeries{}
    |> SubSeries.changeset(attrs)
    |> Repo.insert()
  end

  # File functions
  @spec create_file(map()) :: {:ok, struct()} | {:error, Ecto.Changeset.t()}
  def create_file(attrs \\ %{}) do
    %File{}
    |> File.changeset(attrs)
    |> Repo.insert()
  end

  @spec add_subjects_to_file(struct(), list()) :: {:ok, struct()} | {:error, String.t()}
  def add_subjects_to_file(file, subjects) do
    processed_subjects = process_subjects(subjects)
    now = NaiveDateTime.utc_now() |> NaiveDateTime.truncate(:second)

    try do
      {count, _} =
        Repo.insert_all(
          "files_subjects",
          Enum.map(processed_subjects, fn subject ->
            %{
              file_id: file.id,
              subject_id: subject.id,
              inserted_at: now,
              updated_at: now
            }
          end)
        )

      if count == length(processed_subjects) do
        {:ok, file}
      else
        {:error, "Failed to insert all subjects"}
      end
    rescue
      e in Ecto.QueryError -> {:error, "Database error: #{inspect(e)}"}
      e in Postgrex.Error -> {:error, "Database error: #{inspect(e)}"}
    end
  end

  @spec get_file(integer()) :: struct() | nil
  def get_file(id) do
    File
    |> preload([
      :subjects,
      :collection,
      :series,
      :sub_series,
      :accepted_description_annotations,
      accepted_subjects_annotations: :subjects
    ])
    |> Repo.get(id)
  end

  @spec list_files() :: [struct()]
  def list_files do
    File
    |> preload(:subjects)
    |> Repo.all()
  end

  # Subject functions
  @spec process_subjects(list()) :: [struct()]
  def process_subjects(subjects) when is_list(subjects) do
    Enum.map(subjects, fn subject ->
      content = if is_map(subject), do: subject["content"], else: subject
      source = if is_map(subject), do: subject["source"], else: "local"

      case Repo.get_by(Subject, content: content) do
        nil ->
          case Repo.insert(Subject.changeset(%Subject{}, %{content: content, source: source})) do
            {:ok, inserted_subject} ->
              inserted_subject

            {:error, changeset} ->
              # If insert fails, try to get the subject again in case it was inserted concurrently
              case Repo.get_by(Subject, content: content) do
                nil -> raise "Failed to create subject: #{inspect(changeset.errors)}"
                existing_subject -> existing_subject
              end
          end

        existing_subject ->
          existing_subject
      end
    end)
  end

  def search_subjects(name) when is_binary(name) do
    Subject
    |> where([s], ilike(s.content, ^"%#{name}%"))
    |> limit(10)
    |> Repo.all()
  end

  # Main EAD processing function
  @spec process_xml_file(String.t()) :: {:ok, struct()} | {:error, String.t()}
  def process_xml_file(file_path) do
    with {:ok, xml_content} <- Elixir.File.read(file_path),
         {:ok, parsed_map} <- Saxmap.parse(xml_content),
         processed_map <- Saxmap.process_ead_map(parsed_map),
         {:ok, {collection, nested_structure}} <-
           Saxmap.extract_contents_from_processed_map(processed_map) do
      insert_ead_contents({collection, nested_structure})
    else
      {:error, reason} -> {:error, reason}
      error -> {:error, "Unexpected error: #{inspect(error)}"}
    end
  end

  @spec insert_ead_contents({map(), list()}) :: {:ok, struct()} | {:error, String.t()}
  defp insert_ead_contents({collection, nested_structure}) do
    Repo.transaction(fn ->
      # Process subjects first
      subjects = collection.subjects
      collection_without_subjects = Map.drop(collection, [:subjects])

      # Create collection without subjects
      case create_collection(collection_without_subjects) do
        {:ok, inserted_collection} ->
          case add_subjects_to_collection(inserted_collection, subjects) do
            {:ok, _} ->
              case process_nested_structure(nested_structure, inserted_collection.id, nil, nil) do
                :ok -> inserted_collection
                {:error, reason} -> Repo.rollback("Failed to process nested structure: #{reason}")
              end

            {:error, reason} ->
              Repo.rollback("Failed to add subjects: #{reason}")
          end

        {:error, changeset} ->
          Repo.rollback("Failed to create collection: #{inspect(changeset.errors)}")
      end
    end)
  end

  @spec process_nested_structure(list(), integer(), integer() | nil, integer() | nil) ::
          :ok | {:error, String.t()}
  defp process_nested_structure(nodes, collection_id, series_id, sub_series_id)
       when is_list(nodes) do
    try do
      Enum.each(nodes, fn node ->
        case process_node_for_db(node, collection_id, series_id, sub_series_id) do
          {:ok, _} -> :ok
          {:error, reason} -> throw({:error, reason})
        end
      end)

      :ok
    catch
      {:error, reason} -> {:error, reason}
    end
  end

  @spec process_node_for_db(map(), integer(), integer() | nil, integer() | nil) ::
          {:ok, struct()} | {:error, String.t()}
  defp process_node_for_db(%{type: :series} = node, collection_id, _series_id, _sub_series_id) do
    # Drop non-schema fields and add collection_id
    series_attrs =
      node
      |> Map.drop([:type, :children])
      |> Map.put(:collection_id, collection_id)

    # Insert series
    case create_series(series_attrs) do
      {:ok, inserted_series} ->
        case process_nested_structure(node.children, collection_id, inserted_series.id, nil) do
          :ok -> {:ok, inserted_series}
          {:error, reason} -> {:error, reason}
        end

      {:error, changeset} ->
        {:error, "Failed to create series: #{inspect(changeset.errors)}"}
    end
  end

  defp process_node_for_db(%{type: :subseries} = node, collection_id, series_id, _sub_series_id) do
    # Drop non-schema fields and add collection_id and series_id
    sub_series_attrs =
      node
      |> Map.drop([:type, :children])
      |> Map.merge(%{
        collection_id: collection_id,
        series_id: series_id
      })

    # Insert subseries
    case create_sub_series(sub_series_attrs) do
      {:ok, inserted_sub_series} ->
        case process_nested_structure(
               node.children,
               collection_id,
               series_id,
               inserted_sub_series.id
             ) do
          :ok -> {:ok, inserted_sub_series}
          {:error, reason} -> {:error, reason}
        end

      {:error, changeset} ->
        {:error, "Failed to create subseries: #{inspect(changeset.errors)}"}
    end
  end

  defp process_node_for_db(%{type: :file} = node, collection_id, series_id, sub_series_id) do
    # Drop non-schema fields and add IDs
    file_attrs =
      node
      |> Map.drop([:type])
      |> Map.merge(%{
        collection_id: collection_id,
        series_id: series_id,
        sub_series_id: sub_series_id
      })

    # Insert file
    case create_file(file_attrs) do
      {:ok, inserted_file} ->
        case add_subjects_to_file(inserted_file, node.subjects) do
          {:ok, _} -> {:ok, inserted_file}
          {:error, reason} -> {:error, "Failed to add subjects to file: #{reason}"}
        end

      {:error, changeset} ->
        {:error, "Failed to create file: #{inspect(changeset.errors)}"}
    end
  end

  defp process_node_for_db(node, _collection_id, _series_id, _sub_series_id) do
    {:error, "Unknown node type: #{inspect(node)}"}
  end

  @spec load(String.t()) :: :ok
  def load(_filepath) do
    # map = XML.parse(filepath)
    # struct = DataModel.new(map)
    # struct.EADHeader.EADID.countrycode
    # struct.Archdesc.did.repository.corpname
    :ok
  end
end
