defmodule Kosh.ExportSubjects do
  import Ecto.Query
  alias Kosh.Repo
  alias Kosh.EAD.Subject

  def export_mlk_subjects() do
    # all_mlk_subjs = Subject |> where(source: "mlk") |> Repo.all()
    # output = "";

    # output = Enum.reduce(all_mlk_subjs, "", fn sub,acc ->
    #   acc <> "{\"content\": \"#{sub.content}\", \"source\": \"#{sub.source}\"}\n"
    #  end)

    # IO.inspect(output)
    # {:ok, output}
    subjects = Subject |> where(source: "mlk") |> Repo.all()
   output =  Enum.map_join(subjects, "\n", fn sub ->
      %{
        "@context": "https://schema.org",
        "@type": "DefinedTerm", # Standard for "Subjects"
        "name": sub.content,
        "inDefinedTermSet": sub.source
      }
      |> Jason.encode!()
    end)
    {:ok, output}
  end
end
