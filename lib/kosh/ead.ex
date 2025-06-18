defmodule Kosh.EAD do
  alias Kosh.EAD.{Subject, XML.Saxmap, Collection, Series, SubSeries, File}
  alias Kosh.Repo
  import Ecto.Query
  alias Kosh.EAD.XML.SaxyUpdateEadHandler
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

    try do
      # Preload the collection with its subjects
      collection = Repo.preload(collection, :subjects)

      # Use Ecto's put_assoc to handle the many-to-many relationship
      collection
      |> Ecto.Changeset.change()
      |> Ecto.Changeset.put_assoc(:subjects, processed_subjects)
      |> Repo.update()

      {:ok, collection}
    rescue
      e in Ecto.QueryError -> {:error, "Database error: #{inspect(e)}"}
      e in Postgrex.Error -> {:error, "Database error: #{inspect(e)}"}
    end
  end

  def list_collections do
    Collection
    # |> preload(:subjects)
    |> Repo.all()
  end

  def get_collection(collection_id) do
    Collection
    |> Repo.get(collection_id)
  end

  @doc """
  Exports a collection with its approved annotations.

  ## Parameters
    - collection_id: The ID of the collection to export

  ## Returns
    - `{:ok, result}` - The exported collection data
    - `{:error, reason}` - If an error occurs during the operation

  ## Examples
      iex> export_collection(1)
      {:ok, "exported_data"}

      iex> export_collection("invalid")
      {:error, "Invalid collection ID"}
  """
  @spec export_collection(integer() | String.t()) :: {:ok, any()} | {:error, String.t()}
  def export_collection(collection_id) when is_binary(collection_id) do
    case Integer.parse(collection_id) do
      {id, _} -> export_collection(id)
      :error -> {:error, "Invalid collection ID"}
    end
  end

  def export_collection(collection_id) when is_integer(collection_id) do
    try do
      collection = get_collection(collection_id)

      if is_nil(collection) do
        {:error, "Collection not found"}
      else
        case list_files_with_approved_annotations(collection_id) do
          {:ok, []} ->
            {:error, "The Collection has no annotations"}
          {:ok, files_with_annotations} ->
            file_path = Path.join([:code.priv_dir(:kosh), "static", collection.upload_path])

            if not Elixir.File.exists?(file_path) do
              {:error, "Collection file not found at path: #{file_path}"}
            else
              SaxyUpdateEadHandler.run_stream_read(file_path, files_with_annotations)
            end
          {:error, reason} ->
            {:error, "Failed to get files with annotations: #{reason}"}
        end
      end
    rescue
      e in Ecto.QueryError ->
        {:error, "Database query error: #{inspect(e)}"}
      e in Postgrex.Error ->
        {:error, "Database error: #{inspect(e)}"}
      e in ArgumentError ->
        {:error, "Invalid argument: #{inspect(e)}"}
      e ->
        {:error, "Unexpected error: #{inspect(e)}"}
    end
  end

  def export_collection(_invalid) do
    {:error, "Invalid collection ID type"}
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

    try do
      # Preload the file with its subjects
      file = Repo.preload(file, :subjects)

      # Use Ecto's put_assoc to handle the many-to-many relationship
      file
      |> Ecto.Changeset.change()
      |> Ecto.Changeset.put_assoc(:subjects, processed_subjects)
      |> Repo.update()

      {:ok, file}
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

  @doc """
  Lists all files with approved annotations for a given collection.

  ## Parameters
    - collection_id: The ID of the collection to fetch files from

  ## Returns
    - `{:ok, list}` - A list of maps containing file information with approved annotations
    - `{:error, reason}` - If an error occurs during the operation

  ## Examples
      iex> list_files_with_approved_annotations(1)
      {:ok, [%{unitid: %{id: "123", uri: "http://example.com", type: "local"}, ...}]}

      iex> list_files_with_approved_annotations("invalid")
      {:error, "Invalid collection ID"}
  """
  @spec list_files_with_approved_annotations(integer() | String.t()) ::
          {:ok, list(map())} | {:error, String.t()}
  def list_files_with_approved_annotations(collection_id) when is_binary(collection_id) do
    case Integer.parse(collection_id) do
      {id, _} -> list_files_with_approved_annotations(id)
      :error -> {:error, "Invalid collection ID"}
    end
  end

  def list_files_with_approved_annotations(collection_id) when is_integer(collection_id) do
    try do
      files =
        File
        |> where([f], f.collection_id == ^collection_id)
        |> preload([:accepted_description_annotations, accepted_subjects_annotations: [:subjects]])
        |> Repo.all()

      result =
        files
        |> Enum.filter(fn f ->
          f.accepted_description_annotations != [] or f.accepted_subjects_annotations != []
        end)
        |> Enum.map(fn f ->
          %{
            unitid: %{
              id: f.unitid && f.unitid.id,
              uri: f.unitid && f.unitid.uri,
              type: f.unitid && f.unitid.type
            },
            description_annotations:
              Enum.map(f.accepted_description_annotations, fn da ->
                %{id: da.id, description: da.description}
              end),
            subjects_annotations:
              f.accepted_subjects_annotations
              |> Enum.flat_map(fn sa -> sa.subjects || [] end)
              |> Enum.map(fn s ->
                %{content: s.content, source: s.source, unitid: s.unitid}
              end)
          }
        end)

      {:ok, result}
    rescue
      e in Ecto.QueryError ->
        {:error, "Database query error: #{inspect(e)}"}
      e in Postgrex.Error ->
        {:error, "Database error: #{inspect(e)}"}
      e in ArgumentError ->
        {:error, "Invalid argument: #{inspect(e)}"}
      e ->
        {:error, "Unexpected error: #{inspect(e)}"}
    end
  end

  def list_files_with_approved_annotations(_invalid) do
    {:error, "Invalid collection ID type"}
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

  @spec process_xml_file(String.t(), String.t()) :: {:ok, struct()} | {:error, String.t()}
  def process_xml_file(tmp_path, dest_full) do
    upload_path = "/uploads/" <> Path.basename(dest_full)

    with {:ok, xml_content} <- Elixir.File.read(tmp_path),
         {:ok, parsed_map} <- Saxmap.parse(xml_content),
         processed_map <- Saxmap.process_ead_map(parsed_map),
         {:ok, {collection_map, nested_structure}} <-
           Saxmap.extract_contents_from_processed_map(processed_map) do
      insert_ead_contents({collection_map, nested_structure}, tmp_path, dest_full, upload_path)
    else
      {:error, reason} -> {:error, reason}
      error -> {:error, "Unexpected error: #{inspect(error)}"}
    end
  end

  @spec insert_ead_contents({map(), list()}, String.t(), String.t(), String.t()) ::
          {:ok, struct()} | {:error, String.t()}
  defp insert_ead_contents({collection_map, nested_structure}, tmp_path, dest_full, upload_path) do
    case Repo.transaction(fn ->
           subjects = collection_map.subjects
           attrs = collection_map |> Map.drop([:subjects]) |> Map.put(:upload_path, upload_path)

           inserted_collection =
             case create_collection(attrs) do
               {:ok, coll} ->
                 coll

               {:error, changeset} ->
                 Repo.rollback("Failed to create collection: #{inspect(changeset.errors)}")
             end

           case add_subjects_to_collection(inserted_collection, subjects) do
             {:ok, _} -> :ok
             {:error, reason} -> Repo.rollback("Failed to add subjects: #{reason}")
           end

           case process_nested_structure(nested_structure, inserted_collection.id, nil, nil) do
             :ok -> :ok
             {:error, reason} -> Repo.rollback("Failed to process nested structure: #{reason}")
           end

           case Elixir.File.cp(tmp_path, dest_full) do
             :ok ->
               inserted_collection

             {:error, reason} ->
               Elixir.File.rm(dest_full)
               Repo.rollback("Failed to copy file: #{inspect(reason)}")
           end
         end) do
      {:ok, inserted_collection} ->
        {:ok, inserted_collection}

      {:error, reason} ->
        if Elixir.File.exists?(dest_full), do: Elixir.File.rm(dest_full)
        {:error, reason}
    end
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

    IO.inspect(node, label: "FILE NODE: ")
    # Drop non-schema fields and add IDs
    file_uri = node.unitid.uri
    file_attrs =
      node
      |> Map.drop([:type])
      |> Map.merge(%{
        uri: file_uri,
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
