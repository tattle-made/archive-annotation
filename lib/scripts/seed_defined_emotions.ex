defmodule Scripts.SeedDefinedEmotions do
  alias Kosh.Repo
  alias Kosh.EAD.DefinedEmotion
  require Logger

  # @filename "priv/static/emotions_seed/emotions.json"

  def run do
    file_path =
      :kosh
      |> :code.priv_dir()
      |> Path.join("static/emotions_seed/emotions.json")

    with raw_data <- File.read!(file_path),
         {:ok, emotions} <- Jason.decode(raw_data) do
      for emotion <- emotions do
        %DefinedEmotion{}
        |> DefinedEmotion.changeset(%{name: emotion["emotion"], lcsh_url: emotion["source"]})
        |> Repo.insert()
      end
    else
      error -> IO.inspect(error, label: "Something went wrong while inserting defined emotions")
    end
  end
end
