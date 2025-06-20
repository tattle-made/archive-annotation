defmodule KoshWeb.Components.AnnotationSection.AnnotationForm do
  use Phoenix.LiveComponent
  import KoshWeb.CoreComponents
  import LiveSelect
  alias Kosh.EAD
  alias Kosh.Annotations
  import Phoenix.LiveView




  @impl true
  def mount(socket) do
    # IO.puts(">>> mounting MyComponent pid=#{inspect(self())}")
    # IO.inspect(socket, label: "socket from MOunt")
    form = to_form(%{}, as: "annotation_form")
    # socket = assign(socket, assigns)
    socket = assign(socket, form: form)
    # IO.inspect(socket, label: "socket")
    {:ok, socket}
  end

  @impl true
  def update(new_assigns, socket) do
    socket = assign(socket, new_assigns)
    # IO.inspect(socket, label: "socket from update")

    {:ok, socket}
  end

  @impl true
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

  @impl true
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

  @impl true
  def handle_event("submit", params, socket) do
    %{"annotation_form" => form_data} = params
    subjects = form_data["subjects"] || []
    description = form_data["description"] || ""

    # Get the current user and file from socket assigns
    current_user = socket.assigns.current_user
    file = socket.assigns.file

    # Check for existing subjects
    {existing_subjects_ids, new_subjects} = split_number_words(subjects)

    # Get all existing subjects from accepted annotations
    existing_subjects =
      file.accepted_subjects_annotations
      |> Enum.flat_map(fn annotation ->
        annotation.subjects ++ Enum.map(annotation.new_subjects, &%{content: &1})
      end)
      |> Enum.map(& &1.content)
      |> Enum.map(&String.trim/1)
      |> Enum.map(&String.downcase/1)
      |> Kernel.++(Enum.map(file.subjects, & &1.content))
      |> Enum.map(&String.trim/1)
      |> Enum.map(&String.downcase/1)

    # Check if any of the new subjects already exist
    duplicate_subjects =
      new_subjects
      |> Enum.map(&String.trim/1)
      |> Enum.map(&String.downcase/1)
      |> Enum.filter(&(&1 in existing_subjects))
      |> Enum.map(&"\"#{&1}\"")

    # Check if any of the existing subject IDs are already annotated
    duplicate_ids =
      existing_subjects_ids
      |> Enum.filter(fn id ->
        id_int = String.to_integer(id)
        # Check in file.subjects
        file_has_subject = Enum.any?(file.subjects, &(&1.id == id_int))
        # Check in accepted annotations
        annotation_has_subject =
          file.accepted_subjects_annotations
          |> Enum.any?(fn annotation ->
            Enum.any?(annotation.subjects, &(&1.id == id_int))
          end)

        file_has_subject or annotation_has_subject
      end)
      |> Enum.map(fn id ->
        id_int = String.to_integer(id)
        # First check in file.subjects
        case Enum.find(file.subjects, &(&1.id == id_int)) do
          nil ->
            # If not in file.subjects, check in annotations
            file.accepted_subjects_annotations
            |> Enum.flat_map(& &1.subjects)
            |> Enum.find(&(&1.id == id_int))
            |> Map.get(:content)

          subject ->
            subject.content
        end
      end)
      |> Enum.map(&String.trim/1)
      |> Enum.map(&String.downcase/1)
      |> Enum.map(&"\"#{&1}\"")

    if duplicate_subjects != [] or duplicate_ids != [] do
      error_message =
        cond do
          duplicate_subjects != [] and duplicate_ids != [] ->
            "Subjects #{Enum.join(duplicate_subjects ++ duplicate_ids, ", ")} already exist"

          duplicate_subjects != [] ->
            "Subjects #{Enum.join(duplicate_subjects, ", ")} already exist"

          true ->
            "Subjects #{Enum.join(duplicate_ids, ", ")} already exist"
        end

      send(self(), {:flash, :error, error_message})
      {:noreply, socket}
    else
      # Create subjects annotation if subjects are selected
      subjects_result =
        if subjects != nil and subjects != [] do
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
  end

  # Splits a list of strings into {numbers, words}, where numbers are
  # those strings which are valid integers with no extra chars.

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

  @impl true
  def render(assigns) do
    ~H"""
    <div class="grow flex flex-col space-y-10">
      <.form
        for={@form}
        phx-change="validate"
        phx-submit="submit"
        phx-target={@myself}
      >
        <div class="flex flex-col lg:flex-row space-y-10 lg:space-y-0 lg:space-x-10">
          <div class="w-full lg:w-1/2">
            <p class="text-secondary-purple font-bold text-body-md-18">Descriptions</p>
            <.input
              field={@form[:description]}
              type="textarea"
              name="annotation_form[description]"
              value={@form.params["description"]}
              placeholder="Add your descriptions here..."
              class="h-60 sm:h-70 xl:h-80 border-2 !border-primary-purple focus:!border-secondary-purple border-dotted !text-primary-grey focus:!text-secondary-purple focus:border-solid !rounded-[4px]"
            />
          </div>
          <div class="w-full lg:w-1/2 subjects text-gray-500 h-fit">
            <p class="text-secondary-purple font-bold text-body-md-18 mb-2">Subjects</p>
            <.live_select
              id="annotation_subjects"
              field={@form[:subjects]}
              phx-target={@myself}
              update_min_len={1}
              options={[]}
              debounce={1000}
              mode={:quick_tags}
              placeholder="Add a subject..."
              text_input_class="w-full p-3 text-secondary-purple border-2 border-primary-purple border-dotted rounded-[4px] focus:border-secondary-purple active:border-primary-purple focus:ring-0 focus:outline-none focus:border-solid focus:rounded-none active:outline-none outline-none ring-0"
              container_extra_class="gap-5 flex flex-col"
              tags_container_class="w-full flex flex-col gap-5 [&:not(:has(*))]:hidden"
              tag_class="border-2 border-primary-purple text-primary-grey p-3 relative"
              clear_tag_button_class="absolute -top-3 -right-3 bg-secondary-pale-grey rounded-full text-primary-purple cursor-pointer"
              option_class="!text-primary-grey !p-2 sm:!p-3 hover:bg-secondary-lilac"
              active_option_class="!bg-secondary-lilac"
              dropdown_extra_class="max-h-40 sm:max-h-56 overflow-y-auto"
            />
          </div>
        </div>
        <div class="w-full flex justify-end">
          <button type="submit" class="btn-primary-purple">
            Save
          </button>
        </div>
      </.form>
    </div>
    """
  end
end
