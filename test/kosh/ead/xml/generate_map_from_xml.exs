defmodule Kosh.EAD.XML.GenerateMapFromXML do

  @doc """
  Generate a map from provided XML and save it in a file. Change the name of the file in the first line to generate a different map.
  """
  def generate_map_from_XML() do
    xml_content =
      Path.join([File.cwd!(), "test", "support", "fixtures", "xml_fixtures", "ms-042.xml"])
      |> File.read!()

    {:ok, parsed_map} = parse(xml_content)

    # IO.inspect(parsed_map)

    processed_map = process_ead_map(parsed_map)

    # IO.inspect(processed_map)


    save_map(processed_map, "lib/kosh/ead/xml/ms042_processed.ex")

  end

  @default_path "lib/kosh/my_map.ex"

  @doc """
  Save `map` into `path` as:

      defmodule MyApp.MyMap do
        @moduledoc false

        def get_map do
          %{
            ...map literal...
          }
        end
      end

  If you omit `path`, it will default to `"lib/my_app/my_map.ex"`.
  """
  @spec save_map(map(), String.t()) :: :ok | {:error, term()}
  def save_map(map, path \\ @default_path) when is_map(map) do
    # Convert the map to a nicely-indented Elixir literal
    map_string = inspect(map, pretty: true, limit: :infinity, printable_limit: :infinity)

    # Build the module source
    code = """
    defmodule Kosh.EAD.XML.MS042Processed do
      @moduledoc false


      def get_map do
        #{map_string}
      end
    end
    """

    # Elixir’s code formatter for consistent styling
    formatted =
      code
      |> Code.format_string!()
      |> IO.iodata_to_binary()

    File.write(path, formatted)
  end
end
