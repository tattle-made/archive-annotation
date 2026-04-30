defmodule Kosh.OAI do
  @moduledoc """
  OAI Context. This module contains functions that will be called by the OAI controller.
  """
  alias Kosh.EAD
  alias Kosh.EAD.Collection

  def get_and_export_ead_record(oai_identifier) do
    case EAD.get_collection_from_oai_identifier(oai_identifier) do
      nil ->
        {:error, :not_found}

      %Collection{} = collection ->
        case EAD.export_collection_oai(collection.id) do
          {:ok, xml_content} ->
            {:ok, xml_content}

          {:error, reason} ->
            {:error, reason}
        end

      _ ->
        {:error, "Passed Identifier is not supported."}
    end
  end
end
