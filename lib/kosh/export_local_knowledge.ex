defmodule Kosh.ExportLocalKnowledge do
  import Ecto.Query
  alias Kosh.EAD.Agent
  alias Kosh.EAD.Subject
  alias Kosh.Repo

  def export_mlk_subjects() do
    # all_mlk_subjs = Subject |> where(source: "mlk") |> Repo.all()
    # output = "";

    # output = Enum.reduce(all_mlk_subjs, "", fn sub,acc ->
    #   acc <> "{\"content\": \"#{sub.content}\", \"source\": \"#{sub.source}\"}\n"
    #  end)

    # IO.inspect(output)
    # {:ok, output}
    subjects = Subject |> where(source: "mlk") |> Repo.all()
    agents = Agent |> where(source: "mlk") |> Repo.all()

    agents_types_map = :persistent_term.get(:lcnaf_types_map)

    output_subjects = Enum.map_join(subjects, "\n", fn sub ->
      %{
        "@context" => "https://schema.org",
        "@type" => "DefinedTerm",
        "name" => sub.content,
        "inDefinedTermSet" => sub.source
      }
      |> Jason.encode!()
    end)

    output_agents = Enum.map_join(agents, "\n", fn agent ->
      agent_type_id = List.first(agent.type_ids || [])

      %{
        "@context" => "https://schema.org",
        "@type" => Map.get(agents_types_map, agent_type_id, ""),
        "name" => agent.name,
        "inDefinedTermSet" => agent.source
      }
      |> Jason.encode!()
    end)

    output =
      [output_subjects, output_agents]
      |> Enum.reject(&(&1 == ""))
      |> Enum.join("\n")

    {:ok, output}
  end
end
