defmodule XmerlFruitEditor do
  @moduledoc """
  Parse an XML string with :xmerl, extract <fruit name="…"/>,
  add new names, and rebuild the <fruits> XML, preserving root name and its attributes.
  """

  require Record

  # Define xmlElement and xmlAttribute records so we can pattern-match fields.
  Record.defrecordp(
    :xmlElement,
    :xmlElement,
    Record.extract(:xmlElement, from_lib: "xmerl/include/xmerl.hrl")
  )

  Record.defrecordp(
    :xmlAttribute,
    :xmlAttribute,
    Record.extract(:xmlAttribute, from_lib: "xmerl/include/xmerl.hrl")
  )

  @doc """
  Given `xml` (binary) and a list of new_names (binaries),
  parse with xmerl, extract existing <fruit> names, combine with new_names,
  and rebuild the document, preserving:
    - original root element name
    - original attributes on the root
    - but rebuilding only child <fruit> elements (other child nodes under root are discarded).
  If you need to preserve other child nodes (comments, text), more work is needed.
  """
  def add_fruits(xml, new_names) when is_binary(xml) and is_list(new_names) do
    # 1. Parse into xmerl document
    {doc, _rest} = :xmerl_scan.string(to_charlist(xml))

    # 2. Get root element: use XPath "/*"
    [root_elem] = :xmerl_xpath.string(to_charlist("/*"), doc)

    # root_elem is an xmlElement record
    # Extract root name and attributes
    root_name = xmlElement(root_elem, :name)
    root_attrs = xmlElement(root_elem, :attributes)
    # root_attrs is a list of xmlAttribute records

    # 3. Extract existing <fruit> names via XPath
    attrs = :xmerl_xpath.string(to_charlist("//fruit/@name"), doc)
    existing_names =
      for attr_rec <- attrs do
        # xmlAttribute record: value is a charlist
        xmlAttribute(attr_rec, :value)
        |> to_string()
      end

    updated_names = existing_names ++ new_names

    # 4. Build new children: only <fruit> elements
    # Keep root attributes unchanged. We discard other child nodes.
    children_tuples =
      Enum.map(updated_names, fn name ->
        # Build xmlAttribute tuples for export: {NameAtom, CharlistValue}
        attrs_for_child = [{:'name', to_charlist(name)}]
        {root_elem_name_atom = :'fruit', attrs_for_child, []}
      end)

    # 5. Rebuild root tree: one-element list for export_simple
    tree = [{root_name, extract_attr_tuples(root_attrs), children_tuples}]

    # 6. Export to iodata
    iodata = :xmerl.export_simple(tree, :xmerl_xml)
    body = IO.iodata_to_binary(iodata)

    # 7. Preserve original XML declaration if present, else default
    xml_out =
      case extract_xml_declaration(xml) do
        nil ->
          "<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n" <> body
        decl ->
          decl <> "\n" <> body
      end

    xml_out
  end

  # Helper: extract list of {NameAtom, CharlistValue} from xmlAttribute records
  defp extract_attr_tuples(attr_records) when is_list(attr_records) do
    for attr_rec <- attr_records do
      name = xmlAttribute(attr_rec, :name)
      value = xmlAttribute(attr_rec, :value)
      {name, value}
    end
  end

  # Helper: if xml starts with <?xml ...?>, return that line (binary), else nil
  defp extract_xml_declaration(xml) when is_binary(xml) do
    # Simple heuristic: take first line if it matches <?xml ...?>
    case String.split(xml, "\n", parts: 2) do
      [first | _rest] ->
        if String.match?(first, ~r/^<\?xml\s.*\?>/) do
          first
        else
          nil
        end

      _ ->
        nil
    end
  end
end

# Example usage:
xml = """
<?xml version="1.0" encoding="UTF-8"?>
<fruits category="tropical">
  <fruit name="Apple"/>
  <fruit name="Banana"/>
</fruits>
"""

new_xml = XmerlFruitEditor.add_fruits(xml, ["Cherry", "Date"])
IO.puts(new_xml)
