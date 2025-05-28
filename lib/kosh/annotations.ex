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
  defp maybe_filter_by_status(queryable, status) when status in [:pending, :accepted, :rejected] do
    from(q in queryable, where: q.status == ^status)
  end
end
