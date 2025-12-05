defmodule Scripts.SeedLcnafTypes do
  alias Kosh.Repo
  alias Kosh.EAD.LcnafType
  require Logger

  # @filename "priv/static/lcnaf_seed/lcnaf_types_seed.json"

  def run do
    file_path =
      :kosh
      |> :code.priv_dir()
      |> Path.join("static/lcnaf_seed/lcnaf_types_seed.json")

    with raw_types <- File.read!(file_path),
         {:ok, types} <- Jason.decode(raw_types) do
      for type <- types do
        %LcnafType{} |> LcnafType.changeset(%{type: type}) |> Repo.insert()
      end
    else
      error -> IO.inspect(error, label: "Something went wrong while inserting lcnaf types")
    end
  end
end
