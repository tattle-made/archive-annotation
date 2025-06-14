defmodule Kosh.Annotations do
  alias Kosh.Annotations.SubjectsAnnotation
  alias Kosh.Annotations.DescriptionAnnotation
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

  def approve_description_annotation(id) do
    case Repo.get(DescriptionAnnotation, id) do
      nil ->
        {:error, :not_found}

      annotation ->
        annotation
        |> DescriptionAnnotation.changeset(%{status: :accepted})
        |> Repo.update()
    end
  end

  def delete_description_annotation(id) do
    case Repo.get(DescriptionAnnotation, id) do
      nil -> {:error, :not_found}
      annotation -> Repo.delete(annotation)
    end
  end

  def approve_subject_annotation(id) do
    Repo.transaction(fn ->
      # Get the annotation, preload subjects and file (with accepted_subjects_annotations)
      annotation =
        Repo.get(SubjectsAnnotation, id)
        |> Repo.preload([:subjects, file: [:accepted_subjects_annotations]])

      if annotation == nil do
        Repo.rollback({:error, :not_found})
      end

      # Insert new subjects if needed
      new_subjects =
        (annotation.new_subjects || [])
        |> Enum.map(fn sub ->
          Repo.get_by(Kosh.EAD.Subject, content: sub) ||
            Repo.insert!(
              Kosh.EAD.Subject.changeset(%Kosh.EAD.Subject{}, %{content: sub, source: "local"})
            )
        end)

      # Collect all subjects (existing + new, no duplicates)
      all_subjects =
        (annotation.subjects ++ new_subjects)
        |> Enum.uniq_by(& &1.id)

      # Update annotation status and subjects association
      {:ok, updated_annotation} =
        annotation
        |> SubjectsAnnotation.changeset(%{status: :accepted})
        |> Repo.update()

      updated_annotation
      |> Ecto.Changeset.change()
      |> Ecto.Changeset.put_assoc(:subjects, all_subjects)
      |> Repo.update()

      {:ok, updated_annotation}
    end)
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

  @doc """
  Lists description annotations filtered by status.
  Status can be :pending, :accepted, or :rejected.
  If status is nil, returns all description annotations.
  """
  def list_description_annotations(status \\ nil) do
    DescriptionAnnotation
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
end
