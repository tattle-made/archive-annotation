defmodule Kosh.Annotations do
  alias Kosh.Annotations.SubjectsAnnotation
  alias Kosh.Annotations.DescriptionAnnotation
  alias Kosh.Annotations.AgentAnnotation
  alias Kosh.EAD.Agent
  alias Kosh.Repo
  import Ecto.Query

  def create_subject_annotation(params) do
    SubjectsAnnotation.create_with_subjects(params)
  end

  def create_description_annotation(params) do
    %DescriptionAnnotation{}
    |> DescriptionAnnotation.changeset(params)
    |> Repo.insert()
  end

  def create_agent_annotation(params) do
    AgentAnnotation.create_with_agents(params)
  end

  def approve_description_annotation(annotation_id, admin_id) do
    case Repo.get(DescriptionAnnotation, annotation_id) do
      nil ->
        {:error, :not_found}

      annotation ->
        annotation
        |> DescriptionAnnotation.changeset(%{status: :accepted, admin_id: admin_id})
        |> Repo.update()
    end
  end

  def approve_agent_annotation(annotation_id, admin_id) do
    case Repo.transaction(fn ->
           annotation =
             Repo.get(AgentAnnotation, annotation_id)
             |> Repo.preload([
               :agents,
               file: [accepted_agent_annotations: [:agents]]
             ])

           if annotation == nil do
             Repo.rollback({:error, :not_found})
           end

           existing_file_agents =
             (annotation.file.accepted_agent_annotations || [])
             |> Enum.flat_map(& &1.agents)
             |> Enum.uniq_by(& &1.id)

           new_agents_created =
             (annotation.new_agents || [])
             |> Enum.flat_map(fn attrs ->
               cond do
                 is_map(attrs) ->
                  name =
                    attrs["name"] || attrs[:name] || ""
                    |> case do
                      v when is_binary(v) -> String.trim(v)
                      v -> v |> to_string() |> String.trim()
                    end

                   types =
                     (attrs["types"] || attrs[:types] || [])
                     |> Enum.map(fn t ->
                       case Integer.parse(to_string(t)) do
                         {v, _} -> v
                         _ -> nil
                       end
                     end)
                     |> Enum.reject(&is_nil/1)

                   if name == "" do
                     []
                   else
                     normalized = Agent.normalize_name(name)

                     [
                       Repo.get_by(Agent, normalized_name: normalized) ||
                         Repo.insert!(Agent.changeset(%Agent{}, %{
                           name: name,
                           source: "mlk",
                           type_ids: types
                         }))
                     ]
                   end

                 true ->
                   []
               end
             end)

           all_agents =
             (annotation.agents ++ new_agents_created)
             |> Enum.uniq_by(& &1.id)
             |> Enum.reject(fn agent -> Enum.any?(existing_file_agents, &(&1.id == agent.id)) end)

           if Enum.empty?(all_agents) do
             Repo.rollback({:error, :all_agents_already_present})
           else
             {:ok, updated_annotation} =
               annotation
               |> AgentAnnotation.changeset(%{status: :accepted, admin_id: admin_id, new_agents: []})
               |> Ecto.Changeset.put_assoc(:agents, all_agents)
               |> Repo.update()

             {:ok, updated_annotation}
           end
         end) do
      {:ok, result} -> result
      {:error, error} -> error
    end
  end

  def delete_description_annotation(id) do
    case Repo.get(DescriptionAnnotation, id) do
      nil -> {:error, :not_found}
      annotation -> Repo.delete(annotation)
    end
  end

  @doc """
  Gets a single description annotation by ID.

  ## Examples

      iex> get_description_annotation(123)
      {:ok, %DescriptionAnnotation{}}

      iex> get_description_annotation(456)
      {:error, :not_found}
  """
  def get_description_annotation(id) do
    case Repo.get(DescriptionAnnotation, id) do
      nil -> {:error, :not_found}
      annotation -> {:ok, Repo.preload(annotation, [:user, file: :collection])}
    end
  end

  @doc """
  Gets a single subject annotation by ID.

  ## Examples

      iex> get_subject_annotation(123)
      {:ok, %SubjectsAnnotation{} }

      iex> get_subject_annotation(456)
      {:error, :not_found}
  """
  def get_subject_annotation(id) do
    case Repo.get(SubjectsAnnotation, id) do
      nil -> {:error, :not_found}
      annotation -> {:ok, Repo.preload(annotation, [:user, :subjects, file: :collection])}
    end
  end

  def approve_subject_annotation(annotation_id, admin_id) do
    case Repo.transaction(fn ->
           # Get the annotation, preload subjects and file (with accepted_subjects_annotations)
           annotation =
             Repo.get(SubjectsAnnotation, annotation_id)
             |> Repo.preload([
               :subjects,
               file: [accepted_subjects_annotations: [:subjects], subjects: []]
             ])

           if annotation == nil do
             Repo.rollback({:error, :not_found})
           end

           # Get all existing subjects from file's accepted annotations and file's own subjects
           existing_subjects =
             (annotation.file.accepted_subjects_annotations || [])
             |> Enum.flat_map(& &1.subjects)
             |> Enum.concat(annotation.file.subjects || [])
             |> Enum.uniq_by(& &1.id)

           # Filter out subjects that already exist
           new_subjects =
             (annotation.new_subjects || [])
             |> Enum.map(fn sub ->
               Repo.get_by(Kosh.EAD.Subject, content: sub) ||
                 Repo.insert!(
                   Kosh.EAD.Subject.changeset(%Kosh.EAD.Subject{}, %{
                     content: sub,
                     source: "mlk"
                   })
                 )
             end)

           # Collect all subjects (existing + new, no duplicates) and filter out ones that already exist in the file
           all_subjects =
             (annotation.subjects ++ new_subjects)
             |> Enum.uniq_by(& &1.id)
             |> Enum.reject(fn subject ->
               Enum.any?(existing_subjects, fn existing -> existing.id == subject.id end)
             end)

           # If no new subjects to add, return early
           if Enum.empty?(all_subjects) do
             Repo.rollback({:error, :all_subjects_already_present})
           else
             # Update annotation status and subjects association
             {:ok, updated_annotation} =
               annotation
               |> SubjectsAnnotation.changeset(%{status: :accepted, admin_id: admin_id})
               |> Repo.update()

             updated_annotation
             |> Ecto.Changeset.change()
             |> Ecto.Changeset.put_assoc(:subjects, all_subjects)
             |> Repo.update()

             {:ok, updated_annotation}
           end
         end) do
      {:ok, result} -> result
      {:error, error} -> error
    end
  end

  @doc """
  Deletes a subject annotation.
  """
  def delete_subject_annotation(id) do
    case Repo.get(SubjectsAnnotation, id) do
      nil -> {:error, :not_found}
      annotation -> Repo.delete(annotation)
    end
  end

  def delete_agent_annotation(id) do
    case Repo.get(AgentAnnotation, id) do
      nil -> {:error, :not_found}
      annotation -> Repo.delete(annotation)
    end
  end

  @doc """
  Lists subject annotations filtered by status.
  Status can be :pending, :accepted, or :rejected.
  If status is nil, returns all subject annotations.
  """
  def list_subject_annotations(status \\ nil) do
    SubjectsAnnotation
    |> maybe_filter_by_status(status)
    |> preload([:file, :user, :admin, :subjects])
    |> Repo.all()
  end

  def list_subject_annotations_of_user(user_id, status \\ nil) do
    SubjectsAnnotation
    |> where([a], a.user_id == ^user_id)
    |> maybe_filter_by_status(status)
    |> preload([:file, :user, :admin, :subjects])
    |> Repo.all()
  end

  def list_agent_annotations(status \\ nil) do
    AgentAnnotation
    |> maybe_filter_by_status(status)
    |> preload([:file, :user, :admin, :agents])
    |> Repo.all()
  end

  def list_agent_annotations_of_user(user_id, status \\ nil) do
    AgentAnnotation
    |> where([a], a.user_id == ^user_id)
    |> maybe_filter_by_status(status)
    |> preload([:file, :user, :admin, :agents])
    |> Repo.all()
  end

  def get_agent_annotation(id) do
    case Repo.get(AgentAnnotation, id) do
      nil -> {:error, :not_found}
      annotation -> {:ok, Repo.preload(annotation, [:user, :agents, file: :collection])}
    end
  end

  @doc """
  Lists description annotations filtered by status.
  Status can be :pending, :accepted, or :rejected.
  If status is nil, returns all description annotations.
  """
  def list_description_annotations(status \\ nil) do
    DescriptionAnnotation
    |> maybe_filter_by_status(status)
    |> preload([:user, :admin, file: :collection])
    |> Repo.all()
  end

  def list_description_annotations_of_user(user_id, status \\ nil) do
    DescriptionAnnotation
    |> where([a], a.user_id == ^user_id)
    |> maybe_filter_by_status(status)
    |> preload([:file, :user, :admin])
    |> Repo.all()
  end

  @doc """
  Lists all annotations (both subject and description) filtered by status.
  Status can be :pending, :accepted, or :rejected.
  If status is nil, returns all annotations.
  """
  def list_all_annotations(status \\ nil) do
    subjects = list_subject_annotations(status)
    descriptions = list_description_annotations(status)
    {subjects, descriptions}
  end

  # Helper function to filter by status if provided
  defp maybe_filter_by_status(queryable, nil), do: queryable

  defp maybe_filter_by_status(queryable, status)
       when status in [:pending, :accepted, :rejected] do
    from(q in queryable, where: q.status == ^status)
  end

  def count_total_annotations_of_user(user_id) do
    subject_count =
      SubjectsAnnotation
      |> where([a], a.user_id == ^user_id)
      |> select([a], count(a.id))
      |> Repo.one()

    description_count =
      DescriptionAnnotation
      |> where([a], a.user_id == ^user_id)
      |> select([a], count(a.id))
      |> Repo.one()

    subject_count + description_count
  end

  def count_total_approved_annotations do
    subject_count =
      SubjectsAnnotation
      |> where([a], a.status == :accepted)
      |> select([a], count(a.id))
      |> Repo.one()

    description_count =
      DescriptionAnnotation
      |> where([a], a.status == :accepted)
      |> select([a], count(a.id))
      |> Repo.one()

    subject_count + description_count
  end
end
