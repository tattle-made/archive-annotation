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
      Enum.map(emotions, fn emotion ->
        attrs = %{name: emotion["emotion"], lcsh_url: emotion["source"]}

        case Repo.get_by(DefinedEmotion, name: DefinedEmotion.normalize_name(attrs.name)) do
          nil ->
            %DefinedEmotion{}
            |> DefinedEmotion.changeset(attrs)
            |> Repo.insert()

          existing ->
            {:ok, existing}
        end
      end)
    else
      error -> IO.inspect(error, label: "Something went wrong while inserting defined emotions")
    end
  end
end
