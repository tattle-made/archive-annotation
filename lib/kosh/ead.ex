defmodule Kosh.EAD do
  alias Kosh.EAD.{
    Subject,
    XML.Saxmap,
    Collection,
    Series,
    SubSeries,
    File,
    Agent,
    LcnafType,
    DefinedEmotion
  }

  alias Kosh.Repo
  import Ecto.Query
  alias Kosh.EAD.XML.SaxyUpdateEadHandler
  # import File, only: [read: 1]

  @moduledoc """
  Context for handling EAD documents
  """

  # DefinedEmotion functions
  @doc """
  Lists all defined emotions in the system.

  ## Examples
      iex> list_defined_emotions()
      [%Kosh.EAD.DefinedEmotion{}, ...]
  """
  @spec list_defined_emotions() :: [%Kosh.EAD.DefinedEmotion{}]
  def list_defined_emotions do
    emotions = Repo.all(DefinedEmotion)
    emotions
  end

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

  def get_collection_from_uri(uri) do
    from(c in Collection,
      where: c.unitid["uri"] == ^uri
    )
    |> Repo.one()
  end

  @doc """
  Outputs a collection with pre-loaded files, and each file has all the accepted annotations lists, and
  each annotation is also preloaded with subjects and agents depending on the annotation.

  Collection can be get through the id (postgres table id), or the uri.

  Example:
  - To get with ID:
  get_collection_with_detailed_files(:id, 16)

  - To get with uri
  get_collection_with_detailed_files(:uri, "/repositories/2/resources/28")

  """
  def get_collection_with_detailed_files(:uri, uri) do
    from(c in Collection,
      where: c.unitid["uri"] == ^uri
    )
    |> Repo.one()
    |> Repo.preload([
      :subjects,
      files: [
        :accepted_description_annotations,
        [accepted_subjects_annotations: [:subjects]],
        [accepted_agent_annotations: [:agents]],
        :emotion_annotations
      ]
    ])
  end

  def get_collection_with_detailed_files(:id, id) when is_binary(id) do
    case Integer.parse(id) do
      {parsed_id, _} -> get_collection_with_detailed_files(:id, parsed_id)
      :error -> nil
    end
  end

  def get_collection_with_detailed_files(:id, id) do
    Collection
    |> Repo.get(id)
    |> Repo.preload([
      :subjects,
      files: [
        :accepted_description_annotations,
        [accepted_subjects_annotations: [:subjects]],
        [accepted_agent_annotations: [:agents]],
        :emotion_annotations
      ]
    ])
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

  @doc """
  To generate export XML for the OAI endpoint. Similar to the above function, but this does not throw any errors
  even if there are 0 annotations for a collection.
  """
  @spec export_collection_oai(integer() | String.t()) :: {:ok, any()} | {:error, String.t()}
  def export_collection_oai(collection_id) when is_binary(collection_id) do
    case Integer.parse(collection_id) do
      {id, _} -> export_collection_oai(id)
      :error -> {:error, "Invalid collection ID"}
    end
  end

  def export_collection_oai(collection_id) when is_integer(collection_id) do
    try do
      collection = get_collection(collection_id)

      if is_nil(collection) do
        {:error, "Collection not found"}
      else
        case list_files_with_approved_annotations(collection_id) do
          # {:ok, []} ->
          #   {:error, "The Collection has no annotations"}

          {:ok, files_with_annotations} ->
            file_path = Path.join([:code.priv_dir(:kosh), "static", collection.upload_path])

            if not Elixir.File.exists?(file_path) do
              {:error, "Collection file not found at path: #{file_path}"}
            else
              SaxyUpdateEadHandler.run_stream_read(file_path, files_with_annotations,
                include_xml_declaration: false
              )
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

  def export_collection_oai(_invalid) do
    {:error, "Invalid collection ID type"}
  end

  # Series functions
  @spec create_series(map()) :: {:ok, struct()} | {:error, Ecto.Changeset.t()}
  def create_series(attrs \\ %{}) do
    %Series{}
    |> Series.changeset(attrs)
    |> Repo.insert()
  end

  def get_series_from_uri(uri) do
    from(s in Series,
      where: s.unitid["uri"] == ^uri
    )
    |> Repo.one()
  end

  def get_sub_series_from_uri(uri) do
    from(s in SubSeries,
      where: s.unitid["uri"] == ^uri
    )
    |> Repo.one()
  end

  @doc """
  Searches an existing Sub-Series record from the URI. If not found, then create a new series
  """
  def update_sub_series(attrs) do
    uri = get_in(attrs, [:unitid, :uri])

    if not is_nil(uri) do
      result =
        case get_sub_series_from_uri(uri) do
          nil ->
            case create_sub_series(attrs) do
              {:ok, inserted_series} ->
                {:ok, inserted_series}

              {:error, changeset} ->
                {:error, changeset}
            end

          series ->
            changeset = SubSeries.changeset(series, attrs)

            case Repo.update(changeset) do
              {:ok, updated} ->
                {:ok, updated}

              {:error, changeset} ->
                {:error, changeset}
            end
        end

      case result do
        {:ok, series} ->
          {:ok, series}

        {:error, changeset} ->
          {:error, "Error while updating series: #{inspect(changeset)}"}
      end
    else
      {:error,
       "Error while updating the Sub-Series, URI not found. Sub-Series Attributes: #{inspect(attrs)}"}
    end
  end

  @doc """
  Searches an existing Series record from the URI. If not found, then create a new series
  """
  def update_series(attrs) do
    uri = get_in(attrs, [:unitid, :uri])

    if not is_nil(uri) do
      result =
        case get_series_from_uri(uri) do
          nil ->
            case create_series(attrs) do
              {:ok, inserted_series} ->
                {:ok, inserted_series}

              {:error, changeset} ->
                {:error, changeset}
            end

          series ->
            changeset = Series.changeset(series, attrs)

            case Repo.update(changeset) do
              {:ok, updated} ->
                {:ok, updated}

              {:error, changeset} ->
                {:error, changeset}
            end
        end

      case result do
        {:ok, series} ->
          {:ok, series}

        {:error, changeset} ->
          {:error, "Error while updating series: #{inspect(changeset)}"}
      end
    else
      {:error,
       "Error while updating the Series, URI not found. Series Attributes: #{inspect(attrs)}"}
    end
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

  def get_file_from_uri(uri) do
    File
    |> preload([
      :subjects,
      :collection,
      :series,
      :sub_series,
      accepted_description_annotations: [:file, :user],
      accepted_subjects_annotations: [:subjects, :file, :user],
      accepted_agent_annotations: [:agents, :file, :user],
      emotion_annotations: [:defined_emotion]
    ])
    |> Repo.get_by(uri: uri)
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
        |> preload([
          :accepted_description_annotations,
          accepted_subjects_annotations: [:subjects]
        ])
        |> Repo.all()

      result =
        files
        |> Enum.filter(fn f ->
          f.accepted_description_annotations != [] or f.accepted_subjects_annotations != []
        end)
        # |> IO.inspect(label: "FILTERED FILES WITH ANNOTATIONS: ")
        |> Enum.map(fn f ->
          %{
            unitid: %{
              id: f.unitid && f.unitid.id,
              uri: f.unitid && f.unitid.uri,
              type: f.unitid && f.unitid.type
            },
            description_annotations:
              Enum.map(f.accepted_description_annotations, fn da ->
                %{
                  id: da.id,
                  description: da.description,
                  user_id: da.user_id,
                  inserted_at: to_sql_ms(da.inserted_at)
                }
              end),
            subjects_annotations:
              f.accepted_subjects_annotations
              |> Enum.flat_map(fn sa ->
                (sa.subjects || [])
                |> Enum.map(fn s ->
                  Map.merge(s, %{
                    anno_id: sa.id,
                    user_id: sa.user_id,
                    anno_inserted_at: sa.inserted_at
                  })
                end)
              end)
              |> Enum.map(fn s ->
                %{
                  content: s.content,
                  source: s.source,
                  unitid: s.unitid,
                  anno_id: s.anno_id,
                  user_id: s.user_id,
                  inserted_at: to_sql_ms(s.anno_inserted_at)
                }
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
      source = if is_map(subject), do: subject["source"], else: "mlk"

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
    normalized = String.downcase(name)
    search_term = "%#{normalized}%"
    starts_with = "#{normalized}%"

    # Include words that includes the term itself (using ILIKE) or similar to the term (using similarity from the pg_trgm postgres extension)
    Subject
    |> where(
      [s],
      fragment(
        "lower(?) LIKE ? OR similarity(lower(?), ?) > 0.3",
        s.content,
        ^search_term,
        s.content,
        ^normalized
      )
    )
    |> order_by(
      [s],
      # exact match first
      desc: fragment("lower(?) = ?", s.content, ^normalized),

      # then prefix matches
      desc: fragment("lower(?) LIKE ?", s.content, ^starts_with),

      # then trigram similarity
      desc: fragment("similarity(lower(?), ?)", s.content, ^normalized),

      # stable alphabetical order
      asc: fragment("lower(?)", s.content)
    )
    |> limit(100)
    |> Repo.all()
  end

  def search_agents(name) when is_binary(name) do
    normalized = Agent.normalize_name(name)
    search_term = "%#{normalized}%"
    starts_with = "#{normalized}%"

    Agent
    |> where(
      [s],
      fragment(
        "? LIKE ?",
        s.normalized_name,
        ^search_term
      )
    )
    |> order_by(
      [s],
      # exact match first
      desc: fragment("? = ?", s.normalized_name, ^normalized),

      # then prefix matches
      desc: fragment("? LIKE ?", s.normalized_name, ^starts_with),

      # then trigram similarity
      desc: fragment("similarity(?, ?)", s.normalized_name, ^normalized),

      # stable alphabetical order
      asc: fragment("?", s.normalized_name)
    )
    |> limit(100)
    |> Repo.all()
  end

  # def search_agents(name) when is_binary(name) do
  #   Agent
  #   |> where([s], ilike(s.normalized_name, ^"%#{Agent.normalize_name(name)}%"))
  #   |> limit(100)
  #   |> Repo.all()
  # end

  def get_all_lcnaf_types() do
    LcnafType |> Repo.all()
  end

  @fmt "%Y-%m-%d %H:%M:%S.%3f"

  # Accept a DateTime (any timezone) — convert to UTC then format
  def to_sql_ms(dt) do
    dt
    |> Timex.Timezone.convert("Etc/UTC")
    |> Timex.format!(@fmt, :strftime)
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

  def process_and_get_fetched_ead_details(body) do
    with {:ok, parsed_map} <- Saxmap.parse(body),
         processed_map <- Saxmap.process_ead_map(parsed_map),
         title when is_binary(title) <- get_name_from_fetched_ead_content(processed_map),
         {:ok, file_name, tmp_path} <- create_temp_file_for_fetched_ead_content(body, title) do
      {:ok, %{file_name: file_name, temp_path: tmp_path, processed_map: processed_map}}
    else
      {:error, reason} -> {:error, reason}
      error -> {:error, "Unexpected error: #{inspect(error)}"}
    end
  end

  # @spec process_fetched_ead_content(String.t() :: {:ok, struct()} | {:error, String.t()})
  def import_fetched_ead_content(processed_map, tmp_path, dest_full) do
    upload_path = "/uploads/" <> Path.basename(dest_full)

    with {:ok, {collection_map, nested_structure}} <-
           Saxmap.extract_contents_from_processed_map(processed_map) do
      insert_ead_contents({collection_map, nested_structure}, tmp_path, dest_full, upload_path)
    else
      {:error, reason} -> {:error, reason}
      error -> {:error, "Unexpected error: #{inspect(error)}"}
    end
  end

  defp get_name_from_fetched_ead_content(ead_map) do
    get_in(ead_map, [
      "OAI-PMH",
      "GetRecord",
      "record",
      "metadata",
      "ead",
      "eadheader",
      "filedesc",
      "titlestmt",
      "titleproper",
      "content"
    ])
  end

  # Creates a temporary file with the given content and returns its path.
  defp create_temp_file_for_fetched_ead_content(body, title) do
    file_name = "#{title}_#{System.unique_integer([:positive])}.xml"

    temp_path =
      System.tmp_dir!()
      |> Path.join(file_name)
      |> Path.expand()

    case Elixir.File.write(temp_path, body) do
      :ok -> {:ok, file_name, temp_path}
      {:error, reason} -> {:error, "Failed to create temp file: #{inspect(reason)}"}
    end
  end

  def update_data(processed_map, tmp_path, dest_full) do
    upload_path = "/uploads/" <> Path.basename(dest_full)

    with {:ok, {collection_map, nested_structure}} <-
           Saxmap.extract_contents_from_processed_map(processed_map) do
      update_ead_contents({collection_map, nested_structure}, tmp_path, dest_full, upload_path)
    else
      {:error, reason} -> {:error, reason}
      error -> {:error, "Unexpected error: #{inspect(error)}"}
    end
  end

  def update_collection(%Collection{} = collection, subjects, changeset_attrs) do
    case Repo.transaction(fn ->
           collection = Repo.preload(collection, :subjects)
           changeset = Collection.changeset(collection, changeset_attrs)

           case Repo.update(changeset) do
             {:ok, updated} ->
               if subjects in [nil] do
                 updated
               else
                 case add_subjects_to_collection(updated, subjects) do
                   {:ok, _} ->
                     Repo.get!(Collection, updated.id) |> Repo.preload(:subjects)

                   {:error, reason} ->
                     Repo.rollback(reason)
                 end
               end

             {:error, changeset} ->
               Repo.rollback(changeset)
           end
         end) do
      {:ok, collection} -> {:ok, collection}
      {:error, reason} -> {:error, reason}
    end
  end

  @spec update_file(any(), any()) :: {:error, any()} | {:ok, any()}
  def update_file(subjects, changeset_attrs) do
    case get_file_from_uri(changeset_attrs.uri) do
      nil ->
        case create_file(changeset_attrs) do
          {:ok, inserted_file} ->
            case add_subjects_to_file(inserted_file, subjects) do
              {:ok, _} -> {:ok, inserted_file}
              {:error, reason} -> {:error, "Failed to add subjects to file: #{reason}"}
            end

          {:error, changeset} ->
            {:error, "Failed to create file: #{inspect(changeset.errors)}"}
        end

      file ->
        case Repo.transaction(fn ->
               file = Repo.preload(file, :subjects)
               changeset = File.changeset(file, changeset_attrs)

               case Repo.update(changeset) do
                 {:ok, updated} ->
                   if subjects in [nil] do
                     updated
                   else
                     case add_subjects_to_file(updated, subjects) do
                       {:ok, _} ->
                         Repo.get!(File, updated.id) |> Repo.preload(:subjects)

                       {:error, reason} ->
                         Repo.rollback(reason)
                     end
                   end

                 {:error, changeset} ->
                   Repo.rollback(changeset)
               end
             end) do
          {:ok, file} -> {:ok, file}
          {:error, reason} -> {:error, reason}
        end
    end
  end

  defp update_nested_structure(nodes, collection_id, series_id, sub_series_id)
       when is_list(nodes) do
    try do
      Enum.each(nodes, fn node ->
        case update_node_for_db(node, collection_id, series_id, sub_series_id) do
          {:ok, _} -> :ok
          {:error, reason} -> throw({:error, reason})
        end
      end)

      :ok
    catch
      {:error, reason} -> {:error, reason}
    end
  end

  defp update_node_for_db(%{type: :series} = node, collection_id, _series_id, _sub_series_id) do
    series_attrs =
      node
      |> Map.drop([:type, :children])
      |> Map.put(:collection_id, collection_id)

    # Insert series
    case update_series(series_attrs) do
      {:ok, updated_series} ->
        case update_nested_structure(node.children, collection_id, updated_series.id, nil) do
          :ok -> {:ok, updated_series}
          {:error, reason} -> {:error, reason}
        end

      {:error, reason} ->
        {:error, "Failed to create series: #{inspect(reason)}"}
    end
  end

  defp update_node_for_db(%{type: :subseries} = node, collection_id, series_id, _sub_series_id) do
    # Drop non-schema fields and add collection_id and series_id
    sub_series_attrs =
      node
      |> Map.drop([:type, :children])
      |> Map.merge(%{
        collection_id: collection_id,
        series_id: series_id
      })

    # Insert subseries
    case update_sub_series(sub_series_attrs) do
      {:ok, inserted_sub_series} ->
        case update_nested_structure(
               node.children,
               collection_id,
               series_id,
               inserted_sub_series.id
             ) do
          :ok -> {:ok, inserted_sub_series}
          {:error, reason} -> {:error, reason}
        end

      {:error, reason} ->
        {:error, "Failed to create sub-series: #{inspect(reason)}"}
    end
  end

  defp update_node_for_db(%{type: :file} = node, collection_id, series_id, sub_series_id) do
    # Drop non-schema fields and add IDs
    file_uri = node.unitid.uri
    file_subjects = get_in(node, [:subjects]) || []

    file_attrs =
      node
      |> Map.drop([:type, :subjects])
      |> Map.merge(%{
        uri: file_uri,
        collection_id: collection_id,
        series_id: series_id,
        sub_series_id: sub_series_id
      })

    # Insert file
    case update_file(file_subjects, file_attrs) do
      {:ok, updated_file} ->
        {:ok, updated_file}

      {:error, reason} ->
        {:error, "Failed to update file: #{inspect(reason)}"}
    end
  end

  defp update_node_for_db(node, _collection_id, _series_id, _sub_series_id) do
    {:error, "Unknown node type: #{inspect(node)}"}
  end

  defp update_ead_contents({collection_map, nested_structure}, tmp_path, dest_full, upload_path) do
    case Repo.transaction(fn ->
           subjects = collection_map.subjects
           attrs = collection_map |> Map.drop([:subjects]) |> Map.put(:upload_path, upload_path)

           with collection_uri when not is_nil(collection_uri) <- get_in(attrs, [:unitid, :uri]),
                existing_collection when not is_nil(existing_collection) <-
                  get_collection_from_uri(collection_uri),
                {:ok, updated_collection} <-
                  update_collection(existing_collection, subjects, attrs) do
             case update_nested_structure(nested_structure, updated_collection.id, nil, nil) do
               :ok -> :ok
               {:error, reason} -> Repo.rollback("Failed to process nested structure: #{reason}")
             end

             case Elixir.File.cp(tmp_path, dest_full) do
               :ok ->
                 updated_collection

               {:error, reason} ->
                 Elixir.File.rm(dest_full)
                 Repo.rollback("Failed to copy file: #{inspect(reason)}")
             end
           else
             nil ->
               Repo.rollback(
                 "Failed to update collection, either collection does not exist or Collection URI is missing"
               )

             {:error, reason} ->
               Repo.rollback("Failed to update collection, #{inspect(reason)}")

             reason ->
               Repo.rollback("Failed to update collection, #{inspect(reason)}")
           end
         end) do
      {:ok, updated_collection} ->
        {:ok, updated_collection}

      {:error, reason} ->
        if Elixir.File.exists?(dest_full), do: Elixir.File.rm(dest_full)
        {:error, reason}
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
    # Drop non-schema fields and add IDs
    file_uri = node.unitid.uri
    file_subjects = get_in(node, [:subjects]) || []

    file_attrs =
      node
      |> Map.drop([:type, :subjects])
      |> Map.merge(%{
        uri: file_uri,
        collection_id: collection_id,
        series_id: series_id,
        sub_series_id: sub_series_id
      })

    # Insert file
    case create_file(file_attrs) do
      {:ok, inserted_file} ->
        case add_subjects_to_file(inserted_file, file_subjects) do
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
