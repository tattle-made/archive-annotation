defmodule KoshWeb.Components.AnnotationFormComponent do
  use Phoenix.LiveComponent
  import KoshWeb.CoreComponents
  import LiveSelect
  alias Kosh.EAD
  alias Kosh.Annotations
  import Phoenix.LiveView
  @impl true
  def mount(socket) do
    IO.puts(">>> mounting MyComponent pid=#{inspect(self())}")
    # IO.inspect(socket, label: "socket from MOunt")
    form = to_form(%{}, as: "annotation_form")
    # socket = assign(socket, assigns)
    socket = assign(socket, form: form)
    # IO.inspect(socket, label: "socket")
    {:ok, socket}
  end

  def update(new_assigns, socket) do
    socket = assign(socket, new_assigns)
    # IO.inspect(socket, label: "socket from update")

    {:ok, socket}
  end

  def handle_event("live_select_change", %{"text" => text, "id" => live_select_id}, socket) do
    subjects = EAD.search_subjects(text)
    options = Enum.map(subjects, fn subject -> {subject.content, subject.id} end)

    options =
      case options do
        [] -> [{"Add new Subject \"#{text}\" ", text}]
        _ -> options
      end

    send_update(LiveSelect.Component, id: live_select_id, options: options)
    {:noreply, socket}
  end

  def handle_event("validate", %{"annotation_form" => new_params}, socket) do
    # Get current form params
    current_params = socket.assigns.form.params

    # IO.inspect(socket.assigns.form, label: "current_params")
    # IO.inspect(new_params, label: "new_params")
    # IO.inspect(socket, label: "SOCKET IN VALIDATE")

    # Only update description, keep everything else the same because live_select is not updating properly
    updated_params = Map.put(current_params, "description", new_params["description"])

    socket = assign(socket, :form, to_form(updated_params, as: "annotation_form"))
    {:noreply, socket}
  end

  def handle_event("submit", params, socket) do
    IO.inspect(params, label: "params")
    %{"annotation_form" => form_data} = params
    subjects = form_data["subjects"] || []
    description = form_data["description"] || ""

    # Get the current user and file from socket assigns
    current_user = socket.assigns.current_user
    file = socket.assigns.file

    # Create subjects annotation if subjects are selected
    subjects_result =
      if subjects != nil and subjects != [] do
        {existing_subjects_ids, new_subjects} = split_number_words(subjects)

        subjects_params = %{
          "file_id" => file.id,
          "user_id" => current_user.id,
          "subjects" => Enum.map(existing_subjects_ids, &%{id: &1}),
          "new_subjects" => new_subjects
        }

        case Annotations.create_subject_annotation(subjects_params) do
          {:ok, _annotation} ->
            {:ok, "Subjects annotation created successfully"}

          {:error, changeset} ->
            {:error, "Failed to create subjects annotation: #{inspect(changeset.errors)}"}
        end
      end

    # Create description annotation if description is not empty
    description_result =
      if description != nil and description != "" and String.trim(description) != "" do
        description_params = %{
          "file_id" => file.id,
          "user_id" => current_user.id,
          "description" => String.trim(description)
        }

        case Annotations.create_description_annotation(description_params) do
          {:ok, _annotation} ->
            {:ok, "Description annotation created successfully"}

          {:error, changeset} ->
            {:error, "Failed to create description annotation: #{inspect(changeset.errors)}"}
        end
      end

    # Reset form and handle results
    message =
      case {subjects_result, description_result} do
        {{:ok, _}, {:ok, _}} ->
          {:info, "Annotations created successfully"}

        {{:ok, _}, nil} ->
          {:info, "Annotations created successfully"}

        {nil, {:ok, _}} ->
          {:info, "Annotations created successfully"}

        {{:error, subjects_error}, {:error, desc_error}} ->
          {:error, "Failed to create annotations: #{subjects_error}, #{desc_error}"}

        {{:error, error}, nil} ->
          {:error, error}

        {nil, {:error, error}} ->
          {:error, error}

        _ ->
          {:error, "No annotations were created"}
      end

    socket =
      if elem(message, 0) == :info do
        socket
        |> assign(
          :form,
          to_form(
            %{
              "subjects" => [],
              "subjects_text_input" => "",
              "description" => nil
            },
            as: "annotation_form"
          )
        )
        |> then(fn socket ->
          send_update(LiveSelect.Component,
            id: "annotation_subjects",
            options: [],
            value: nil,
            current_text: ""
          )
          socket
        end)
      else
        socket
      end

    send(self(), {:flash, elem(message, 0), elem(message, 1)})
    {:noreply, socket}
  end

  @doc """
  Splits a list of strings into {numbers, words}, where numbers are
  those strings which are valid integers with no extra chars.
  """
  defp split_number_words(list) when is_list(list) do
    Enum.split_with(list, &is_integer_string?/1)
  end

  # Returns true if the whole string parses as an integer
  defp is_integer_string?(s) when is_binary(s) do
    case Integer.parse(s) do
      # parsed an integer and consumed all chars
      {_, ""} -> true
      # either parse failed, or leftover chars remain
      _ -> false
    end
  end
end
