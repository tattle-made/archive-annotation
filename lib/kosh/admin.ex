defmodule Kosh.Admin do
  @moduledoc """
  Admin-only module for operational maintenance tasks.

  This module is intended to be used from the terminal by project administrators,
  not through public user-facing routes.
  """
  alias Kosh.EAD.Collection
  alias Kosh.EAD.File
  alias Kosh.EAD.Series
  alias Kosh.EAD.SubSeries
  alias Kosh.Repo
  require Logger

  @spec delete_all_ead_entities() :: :ok | {:error, String.t()}
  def delete_all_ead_entities do
    result =
      Repo.transaction(fn ->
        {_count_files, _deleted_files} = Repo.delete_all(File)
        {_count_subseries, _deleted_subseries} = Repo.delete_all(SubSeries)
        {_count_series, _deleted_series} = Repo.delete_all(Series)
        {_count_collections, _deleted_collection} = Repo.delete_all(Collection)
      end)

    case result do
      {:ok, _} ->
        Logger.info(
          "All EAD Entities are deleted: Collections, Series, Sub-Series, Files. All annotation types tied to files are also deleted."
        )

        :ok

      {:error, reason} ->
        Logger.error(
          "Error while performing admin action of deleting all EAD entities: #{inspect(reason)}"
        )

        {:error, "Failed to delete all EAD entities"}
    end
  rescue
    error ->
      Logger.error(
        "Unexpected error while performing admin action of deleting all EAD entities: #{inspect(error)}"
      )

      {:error, "Failed to delete all EAD entities"}
  end
end
