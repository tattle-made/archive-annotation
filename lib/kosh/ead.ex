defmodule Kosh.EAD do
  alias Kosh.EAD.{EAD, Subject, XML.Saxmap, Model}
  alias Kosh.Repo
  import Ecto.Query

  @moduledoc """
  Context for handling EAD documents
  """

  @doc """
  Process an XML file and store its data in the database.
  Returns {:ok, ead} if successful, {:error, reason} otherwise.
  """
  def process_xml_file(file_path) do
    with {:ok, xml_content} <- File.read(file_path),
         {:ok, parsed_map} <- Saxmap.parse(xml_content),
         processed_map <- Saxmap.process_ead_map(parsed_map),
         ead_map <- extract_ead_data(processed_map) do
      create_ead(ead_map)
    else
      {:error, reason} -> {:error, reason}
      error -> {:error, "Unexpected error: #{inspect(error)}"}
    end
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

  @doc """
  Create a new EAD record with its associated subjects.
  """
  def create_ead(attrs) do
    %EAD{}
    |> EAD.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  List all EADs with their subjects.
  """
  def list_eads do
    EAD
    |> Repo.all()
    |> Repo.preload(:subjects)
  end

  @doc """
  Get a single EAD with its subjects.
  """
  def get_ead(id) do
    EAD
    |> Repo.get(id)
    |> Repo.preload(:subjects)
  end

  def load(filepath) do
    # map = XML.parse(filepath)
    # struct = DataModel.new(map)
    # struct.EADHeader.EADID.countrycode
    # struct.Archdesc.did.repository.corpname
  end
end
