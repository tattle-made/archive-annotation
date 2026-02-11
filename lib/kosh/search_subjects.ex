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
    normalized =
      if is_binary(search_term) && String.trim(search_term) != "" do
        String.downcase(String.trim(search_term))
      end

    like_term = if normalized, do: "%#{normalized}%"
    starts_with = if normalized, do: "#{normalized}%"

    base = from(s in Subject)

    # Total count
    total_entries =
      if normalized do
        from(s in base,
          # Include words that includes the term itself (using ILIKE) or similar to the term (using similarity from the pg_trgm postgres extension)
          where:
            fragment(
              "lower(?) LIKE ? OR similarity(lower(?), ?) > 0.3",
              s.content,
              ^like_term,
              s.content,
              ^normalized
            )
        )
      else
        base
      end
      |> select([s], count(s.id))
      |> Repo.one()

    total_pages = div(total_entries + page_size - 1, page_size)
    offset = (max(1, page) - 1) * page_size

    # Results query with ranking
    entries =
      if normalized do
        from(s in base,
          where:
            fragment(
              "lower(?) LIKE ? OR similarity(lower(?), ?) > 0.3",
              s.content,
              ^like_term,
              s.content,
              ^normalized
            ),
          order_by: [
            desc: fragment("lower(?) = ?", s.content, ^normalized),
            desc: fragment("lower(?) LIKE ?", s.content, ^starts_with),
            desc: fragment("similarity(lower(?), ?)", s.content, ^normalized),
            asc: fragment("lower(?)", s.content)
          ]
        )
      else
        from(s in base, order_by: [desc: s.id])
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
