defmodule KoshWeb.AnnotationsIndexLive do
  use KoshWeb, :live_view

  alias Kosh.Annotations

  def mount(_params, _session, socket) do
    {submitted_subjects, submitted_descriptions} = {
      Annotations.list_subject_annotations(:pending),
      Annotations.list_description_annotations(:pending)
    }
    {approved_subjects, approved_descriptions} = {
      Annotations.list_subject_annotations(:accepted),
      Annotations.list_description_annotations(:accepted)
    }

    # IO.inspect(submitted_subjects, label: "submitted_subjects")
    # IO.inspect(submitted_descriptions)


    socket =
      socket
      |> assign(:submitted_subjects, submitted_subjects)
      |> assign(:submitted_descriptions, submitted_descriptions)
      |> assign(:approved_subjects, approved_subjects)
      |> assign(:approved_descriptions, approved_descriptions)

    {:ok, socket}
  end
end
