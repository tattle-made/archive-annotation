defmodule Kosh.EAD.XML.SaxyUpdateEadHandler do
  @behaviour Saxy.Handler

  @moduledoc """
  Saxy Handler for parsing the EAD XML and add annotations to it.
  Format of files data from the database:
  [
    %{
      unitid: %{
        id: "MS-012-1-1-1-1",
        uri: "/repositories/2/archival_objects/9728",
        type: "aspace_uri"
      },
      description_annotations: [
        %{id: 1, description: "Annotation 1"},
        %{id: 2, description: "Annotation 2"}
      ],
      subjects_annotations: [
            %{
              content: "Trail Creek Watershed (Jackson County, Or.)",
              source: "loc",
              unitid: "http://id.loc.gov/authorities/subjects/sh00000015"
            }

      ]
    }
  ]
  """
  defstruct io: nil,
            files: [],
            current_tag: "",
            current_file_id: "",
            current_file: nil,
            descriptions_stack: [],
            subjects_stack: [],
            in_file: false,
            in_file_unitid: false,
            in_scopecontent: false,
            in_controlaccess: false,
            in_subject_tag: false

  @impl true
  def handle_event(:start_document, prolog, state) do
    write(state, "<?xml#{format_attrs(Enum.reverse(prolog))}?>\n")
    {:ok, state}
  end

  # When the start element is "c" tag with level file
  @impl true
  def handle_event(:start_element, {name, attrs}, state)
      when name == "c" do
    # Write start tag, e.g. <food type="snack">
    write(state, "<#{name}#{format_attrs(attrs)}>")

    state =
      if Enum.any?(attrs, fn {k, v} -> k == "level" and v == "file" end) do
        # IO.puts("Setting File")
        %{state | in_file: true}
      else
        state
      end

    {:ok, state}
  end

  # When the start element is unitid with aspace_uri INSIDE a file
  @impl true
  def handle_event(:start_element, {name, attrs}, %{in_file: in_file} = state)
      when name == "unitid" and in_file do
    # Write start tag, e.g. <food type="snack">
    write(state, "<#{name}#{format_attrs(attrs)}>")

    state =
      if Enum.any?(attrs, fn {k, v} -> k == "type" and v == "aspace_uri" end) do
        # IO.puts("Inside aspace_uri")
        %{state | in_file_unitid: true}
      else
        state
      end

    {:ok, state}
  end

  @impl true
  def handle_event(
        :start_element,
        {name, attrs},
        %{current_file: current_file, in_file: in_file} = state
      )
      when name == "scopecontent" and in_file and not is_nil(current_file) do
    # when name == "scopecontent" and in_file and current_file do
    # Debug logging
    # IO.puts("DEBUG: scopecontent handler - name: #{name}, in_file: #{inspect(in_file)}, current_file: #{inspect(current_file)}")
    # Write start tag, e.g. <food type="snack">
    write(state, "<#{name}#{format_attrs(attrs)}>")

    IO.puts("inside scope content")

    state = %{state | in_scopecontent: true}
    {:ok, state}
  end

  @impl true
  def handle_event(:start_element, {name, attrs}, %{current_file: current_file} = state)
      when name == "controlaccess" and not is_nil(current_file) do
    # Write start tag, e.g. <food type="snack">
    write(state, "<#{name}#{format_attrs(attrs)}>")

    state = %{state | in_controlaccess: true}
    {:ok, state}
  end

  @impl true
  def handle_event(
        :start_element,
        {name, attrs},
        %{current_file: current_file, in_controlaccess: in_controlaccess} = state
      )
      when name == "subject" and not is_nil(current_file) and in_controlaccess do
    # Write start tag, e.g. <food type="snack">
    write(state, "<#{name}#{format_attrs(attrs)}>")

    state = %{state | in_subject_tag: true}
    {:ok, state}
  end

  @impl true
  def handle_event(:start_element, {name, attrs}, state) do
    # Write start tag, e.g. <food type="snack">
    write(state, "<#{name}#{format_attrs(attrs)}>")
    {:ok, state}
  end

  # On character data inside unitid INSIDE a file
  @impl true
  def handle_event(
        :characters,
        chars,
        %{in_file: in_file, in_file_unitid: in_file_unitid} = state
      )
      when in_file and in_file_unitid do
    write(state, chars)

    # IO.inspect(chars, label: "CHARS")

    current_file =
      Enum.find(state.files, fn file -> get_in(file, [:unitid, :uri]) == String.trim(chars) end)

    # if current_file != nil do IO.inspect(current_file, label: "CURRENT_FILE: ") end

    state = %{state | current_file_id: chars, current_file: current_file}
    {:ok, state}
  end

  # Characters inside scopecontent
  @impl true
  def handle_event(
        :characters,
        chars,
        %{current_file: current_file, in_scopecontent: in_scopecontent} = state
      )
      when not is_nil(current_file) and in_scopecontent do
    write(state, chars)
    state = %{state | descriptions_stack: [chars | state.descriptions_stack]}
    {:ok, state}
  end

  @impl true
  def handle_event(
        :characters,
        chars,
        %{
          current_file: current_file,
          in_controlaccess: in_controlaccess,
          in_subject_tag: in_subject_tag
        } = state
      )
      when not is_nil(current_file) and in_controlaccess and in_subject_tag do
    write(state, chars)
    state = %{state | subjects_stack: [chars | state.subjects_stack]}
    {:ok, state}
  end

  # On character data: write as-is
  @impl true
  def handle_event(:characters, chars, state) do
    write(state, chars)
    {:ok, state}
  end

  # On CDATA: wrap and write
  @impl true
  def handle_event(:cdata, data, state) do
    write(state, "<![CDATA[#{data}]]>")
    {:ok, state}
  end

  # Reset everything when the file ends.
  @impl true
  def handle_event(:end_element, name, %{current_file: current_file} = state)
      when name == "c" do
    # check for scopecontent. Possible that there are new description annotations
    # to be added but the scopecontent is not present. If it is the case,
    # add new descriptions after creating scopecontent
    # IO.puts("DEBUG: Condition check - in_scopecontent: #{inspect(state.in_scopecontent)}, current_file: #{inspect(current_file)}")
    if state.in_scopecontent == false and not is_nil(current_file) do
      new_descs = get_in(state.current_file, [:description_annotations]) || []

      if(new_descs != []) do
        write(state, "<scopecontent>")

        Enum.each(new_descs, fn desc ->
          write(state, "<p>#{xml_escape(desc.description)}</p>")
        end)

        write(state, "</scopecontent>")
      end
    end

    # Same as above but for controlaccess.
    if !state.in_controlaccess and not is_nil(current_file) do
      new_subs = state.current_file.subjects_annotations || []

      if(new_subs != []) do
        write(state, "<controlaccess>")

        Enum.each(new_subs, fn sub ->
          write_new_subject(state, sub)
        end)

        write(state, "</controlaccess>")
      end
    end

    write(state, "</#{name}>")

    state = %{
      state
      | current_tag: "",
        current_file_id: "",
        current_file: nil,
        descriptions_stack: [],
        subjects_stack: [],
        in_file: false,
        in_file_unitid: false,
        in_scopecontent: false,
        in_controlaccess: false
    }

    {:ok, state}
  end

  @impl true
  def handle_event(:end_element, name, %{in_file: in_file, current_file: current_file} = state)
      when name == "scopecontent" and in_file and not is_nil(current_file) do
    new_descs =
      (current_file.description_annotations || [])
      |> Enum.map(fn annotation -> annotation.description end)

    new_descs = remove_existing_descriptions(state.descriptions_stack, new_descs)

    Enum.each(new_descs, fn desc ->
      write(state, "<p>#{xml_escape(desc)}</p>")
    end)

    write(state, "</#{name}>")
    # state = %{state | in_scopecontent: false}
    {:ok, state}
  end

  @impl true
  def handle_event(:end_element, name, %{in_file: in_file, current_file: current_file} = state)
      when name == "controlaccess" and in_file and not is_nil(current_file) do
    new_subs = current_file.subjects_annotations || []

    new_subs = remove_existing_subjects(state.subjects_stack, new_subs)

    Enum.each(new_subs, fn sub ->
      write_new_subject(state, sub)
    end)

    write(state, "</#{name}>")
    # state = %{state | in_controlaccess: false}
    {:ok, state}
  end

  @impl true
  def handle_event(
        :end_element,
        name,
        %{
          current_file: current_file,
          in_controlaccess: in_controlaccess,
          in_subject_tag: in_subject_tag
        } = state
      )
      when name == "subject" and in_controlaccess and in_subject_tag and not is_nil(current_file) do
    write(state, "</#{name}>")

    state = %{state | in_subject_tag: false}
    {:ok, state}
  end

  @impl true
  def handle_event(:end_element, name, state) when name == "unitid" do
    write(state, "</#{name}>")
    state = %{state | in_file_unitid: false}
    {:ok, state}
  end

  @impl true
  def handle_event(:end_element, name, state) do
    write(state, "</#{name}>")
    {:ok, state}
  end

  # On end of document: just keep state
  @impl true
  def handle_event(:end_document, _data, state) do
    {:ok, state}
  end

  # Helper: format attributes list into e.g. ` type="snack" id="123"`
  defp format_attrs([]), do: ""

  defp format_attrs(attrs) do
    attrs
    |> Enum.map(fn {k, v} -> " #{k}=\"#{v}\"" end)
    |> Enum.join()
  end

  defp xml_escape(nil), do: ""

  defp xml_escape(val) do
    val
    |> to_string()
    |> String.replace("&", "&amp;")
    |> String.replace("<", "&lt;")
    |> String.replace(">", "&gt;")
    |> String.replace("\"", "&quot;")
  end

  # Takes subject object and writes corresponding Subject Tag
  defp write_new_subject(state, sub) do
    IO.inspect(sub, label: "write_new_subject received sub")
    source = Map.get(sub, :source)
    unitid = Map.get(sub, :unitid)
    content = Map.get(sub, :content)

    attrs =
      for {value, attr} <- [
            {source, "source"},
            {unitid, "id"}
          ],
          value not in [nil, ""] do
        "#{attr}=\"#{xml_escape(value)}\""
      end
      |> Enum.join(" ")

    escaped_content = xml_escape(content)

    str =
      case attrs do
        "" -> "<subject>#{escaped_content}</subject>"
        _ -> "<subject #{attrs}>#{escaped_content}</subject>"
      end

    write(
      state,
      str
    )
  end

  # Helper: write string to the IO device in state
  defp write(%{io: device}, string) when is_pid(device) do
    :ok = IO.binwrite(device, string)
  end

  # Removes any description in `new_descriptions` that is already in `prev_descriptions`. Exact (case-sensitive) matches only.
  defp remove_existing_descriptions(prev_descriptions, new_descriptions) do
    prev_set = MapSet.new(prev_descriptions)

    Enum.reject(new_descriptions, fn desc ->
      MapSet.member?(prev_set, desc)
    end)
  end

  # new subjects is an array of Subject Objects
  defp remove_existing_subjects(prev_subjects, new_subjects) do
    prev_set = MapSet.new(prev_subjects)

    Enum.reject(new_subjects, fn subj ->
      MapSet.member?(prev_set, subj.content)
    end)
  end

  @doc """
  Streams and processes an XML file with the given annotations.

  ## Parameters
    - xml_path: Path to the XML file to process
    - input: List of files with their annotations

  ## Returns
    - `{:ok, string}` - The processed XML content
    - `{:error, reason}` - If an error occurs during processing

  ## Examples
      iex> run_stream_read("/path/to/file.xml", [%{unitid: %{id: "123"}}])
      {:ok, "<xml>processed content</xml>"}

      iex> run_stream_read("/nonexistent.xml", [])
      {:error, "File not found: /nonexistent.xml"}
  """
  @spec run_stream_read(Path.t(), list(map())) :: {:ok, String.t()} | {:error, String.t()}
  def run_stream_read(xml_path, input) when is_binary(xml_path) do
    try do
      # Open a StringIO to capture output
      input_stream = File.stream!(xml_path, [], 2048)
      {:ok, out_device} = StringIO.open("")
      initial_state = %__MODULE__{io: out_device, files: input}

      # Parse the string in SAX mode, streaming events to this module
      {:ok, final_state} = Saxy.parse_stream(input_stream, __MODULE__, initial_state)

      # Retrieve the accumulated output
      {_input, output} = StringIO.contents(final_state.io)
      StringIO.close(final_state.io)
      {:ok, output}
    rescue
      e in RuntimeError ->
        IO.puts("Error: #{e}")
        {:error, e.message}

      e ->
        IO.puts("Error processing XML: #{inspect(e)}")
        {:error, "Failed to process the collection file"}
    end
  end

  def run_stream_read(_invalid_path, _input) do
    {:error, "Invalid file path"}
  end
end
