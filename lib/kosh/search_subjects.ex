defmodule Kosh.SearchSubjects do
  alias Kosh.EAD.Subject
  alias Kosh.Repo
  import Ecto.Query

  @default_page_size 10

  @doc """
  Search for subjects by content with pagination

  Returns a map with:
    - :entries: List of matching subjects for the current page
    - :page_number: Current page number
    - :page_size: Number of entries per page
    - :total_entries: Total number of matching subjects
    - :total_pages: Total number of pages
  """
  def search_subjects(search_term, page \\ 1, page_size \\ @default_page_size) do
    search_term =
      if is_binary(search_term) && String.trim(search_term) != "", do: "%#{search_term}%"

    # Base query for counting
    base_count_query = from(s in Subject)

    # Get total count first
    total_entries =
      if search_term do
        from(s in base_count_query, where: ilike(s.content, ^search_term))
      else
        base_count_query
      end
      |> select([s], count(s.id))
      |> Repo.one()

    # Calculate pagination values
    total_pages = div(total_entries + page_size - 1, page_size)
    offset = (max(1, page) - 1) * page_size

    # Base query for results
    base_query = from(s in Subject, order_by: [desc: s.id])

    # Get paginated results
    entries =
      if search_term do
        from(s in base_query, where: ilike(s.content, ^search_term))
      else
        base_query
      end
      |> offset(^offset)
      |> limit(^page_size)
      |> Repo.all()

    %{
      entries: entries,
      page_number: page,
      page_size: page_size,
      total_entries: total_entries,
      total_pages: total_pages
    }
  end
end
