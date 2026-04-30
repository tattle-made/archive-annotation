defmodule KoshWeb.OaiController do
  use KoshWeb, :controller
    alias Kosh.OAI
  @allowed_formats ["oai_ead"]

  # single entry-point for /oai
  def index(conn, params) do
    case params["verb"] do
      "GetRecord" -> handle_get_record(conn, params)
      _ -> send_oai_error(conn, params, "badVerb", "Illegal OAI verb")
    end
  end

  # --- GetRecord handler ---
  defp handle_get_record(conn, %{"identifier" => id, "metadataPrefix" => mp} = _params) do
    cond do
      mp not in @allowed_formats ->
        send_oai_error(
          conn,
          %{"verb" => "GetRecord", "metadataPrefix" => mp},
          "cannotDisseminateFormat",
          "metadataPrefix not supported"
        )

      true ->
        case parse_oai_identifier(id) do
          {:ok, valid_identifier} ->


            case OAI.get_and_export_ead_record(valid_identifier) do
              {:ok, ead_xml} ->
                datestamp = Date.utc_today() |> Date.to_iso8601()
                xml = build_getrecord_xml(conn, id, mp, datestamp, ead_xml)

                conn
                |> put_resp_content_type("text/xml; charset=utf-8")
                |> send_resp(200, xml)

              {:error, :not_found} ->
                send_oai_error(
                  conn,
                  %{"verb" => "GetRecord", "identifier" => id, "metadataPrefix" => mp},
                  "idDoesNotExist",
                  "No matching identifier"
                )

              {:error, reason} ->
                send_oai_error(
                  conn,
                  %{"verb" => "GetRecord", "identifier" => id, "metadataPrefix" => mp},
                  "badArgument",
                  "Server error: #{inspect(reason)}"
                )
            end

          {:error, _} ->
            send_oai_error(conn, %{"verb" => "GetRecord"}, "badArgument", "Invalid identifier")
        end
    end
  end

  defp handle_get_record(conn, _params) do
    send_oai_error(
      conn,
      %{"verb" => "GetRecord"},
      "badArgument",
      "Missing identifier or metadataPrefix"
    )
  end

  # --- helpers ---

  # validate oai:<authority>:<localid> or oai:<authority>:<path/...>
  defp parse_oai_identifier("oai:" <> rest) do
    parts = String.split(rest, ":", parts: 2)

    case parts do
      [authority, local] when authority != "" and local != "" -> {:ok, "oai:" <> rest}
      _ -> {:error, :invalid}
    end
  end

  defp parse_oai_identifier(_), do: {:error, :invalid}

  defp build_getrecord_xml(conn, identifier, metadata_prefix, datestamp, ead_xml) do
    rd = DateTime.utc_now() |> DateTime.to_iso8601()

    request_tag =
      build_request_tag(conn, %{
        "verb" => "GetRecord",
        "identifier" => identifier,
        "metadataPrefix" => metadata_prefix
      })

    """
    <?xml version="1.0" encoding="UTF-8"?>
    <OAI-PMH xmlns="http://www.openarchives.org/OAI/2.0/"
             xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
             xsi:schemaLocation="http://www.openarchives.org/OAI/2.0/
                                 http://www.openarchives.org/OAI/2.0/OAI-PMH.xsd">
      <responseDate>#{rd}</responseDate>
      #{request_tag}
      <GetRecord>
        <record>
          <header>
            <identifier>#{escape_text(identifier)}</identifier>
            <datestamp>#{escape_text(datestamp)}</datestamp>
          </header>
          <metadata>#{ead_xml}</metadata>
        </record>
      </GetRecord>
    </OAI-PMH>
    """
  end

  # Build <request ...>baseURL</request> including attributes present in params
  defp build_request_tag(conn, attrs_map) do
    base = request_base(conn)

    attrs =
      attrs_map
      |> Enum.filter(fn {_k, v} -> v && v != "" end)
      |> Enum.map(fn {k, v} -> ~s(#{k}="#{escape_attr(v)}") end)
      |> Enum.join(" ")

    if attrs == "", do: "<request>#{base}</request>", else: "<request #{attrs}>#{base}</request>"
  end

  # Generic OAI error response (200 OK with error element) — conforms with spec
  defp send_oai_error(conn, params_map, code, message \\ nil) do
    rd = DateTime.utc_now() |> DateTime.to_iso8601()

    request_tag =
      build_request_tag(
        conn,
        Map.take(params_map || %{}, ["verb", "identifier", "metadataPrefix"])
      )

    msg_fragment =
      case message do
        nil -> ""
        msg -> msg
      end

    xml = """
    <?xml version="1.0" encoding="UTF-8"?>
    <OAI-PMH xmlns="http://www.openarchives.org/OAI/2.0/"
             xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
             xsi:schemaLocation="http://www.openarchives.org/OAI/2.0/
                                 http://www.openarchives.org/OAI/2.0/OAI-PMH.xsd">
      <responseDate>#{rd}</responseDate>
      #{request_tag}
      <error code="#{code}">#{escape_text(msg_fragment)}</error>
    </OAI-PMH>
    """

    conn
    |> put_resp_content_type("text/xml; charset=utf-8")
    |> send_resp(200, xml)
  end

  # Build base request URL (scheme://host[:port]path)
  defp request_base(conn) do
    port_part =
      case {conn.scheme, conn.port} do
        {:http, 80} -> ""
        {:https, 443} -> ""
        _ -> ":" <> Integer.to_string(conn.port)
      end

    "#{conn.scheme}://#{conn.host}#{port_part}#{conn.request_path}"
  end

  # minimal escaping for XML attribute values and text nodes
  defp escape_attr(s),
    do:
      s
      |> to_string()
      |> String.replace("&", "&amp;")
      |> String.replace("\"", "&quot;")
      |> String.replace("<", "&lt;")
      |> String.replace(">", "&gt;")

  defp escape_text(s),
    do:
      s
      |> to_string()
      |> String.replace("&", "&amp;")
      |> String.replace("<", "&lt;")
      |> String.replace(">", "&gt;")
end
