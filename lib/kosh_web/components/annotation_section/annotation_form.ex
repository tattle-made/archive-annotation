defmodule KoshWeb.Components.AnnotationSection.AnnotationForm do
  use Phoenix.LiveComponent
  import KoshWeb.CoreComponents
  import LiveSelect
  alias Kosh.EAD
  alias Kosh.Annotations
  import Phoenix.LiveView
  require Logger

  @impl true
  def mount(socket) do
    form = to_form(%{}, as: "annotation_form")

    # ignore_type = [
    #   "http://www.loc.gov/standards/mads/rdf/v1#Geographic",
    #   "http://xmlns.com/foaf/0.1/Group",
    #   "http://xmlns.com/foaf/0.1/Organization",
    #   "http://xmlns.com/foaf/0.1/Person"
    # ]

    keep_types = [
      "madsrdf:Title",
      "madsrdf:PersonalName",
      "madsrdf:Geographic",
      "madsrdf:CorporateName",
      "madsrdf:FamilyName",
      "madsrdf:Occupation"
    ]

    # agents_types_raw = EAD.get_all_lcnaf_types()
    agents_types_raw = :persistent_term.get(:lcnaf_types_raw)

    agent_types_map =
      agents_types_raw
      |> Enum.reduce(%{}, fn type, acc -> Map.put(acc, type.id, type.type) end)

    agent_types_options =
      agents_types_raw
      |> Enum.filter(fn t -> Enum.member?(keep_types, t.type) end)
      |> Enum.map(fn t -> {t.type, to_string(t.id)} end)

    socket =
      assign(socket,
        form: form,
        subjects_options: [],
        agents_curr_text: "",
        agents_no_suggestions: false,
        agents_custom_form_options: [],
        agents_submitted_customs: nil,
        agent_types: agent_types_options,
        agent_types_map: agent_types_map,
        subjects_loading: false,
        agents_loading: false
      )

    {:ok, socket}
  end

  @impl true
  def update(new_assigns, socket) do
    socket = assign(socket, new_assigns)
    # IO.inspect(socket, label: "socket from update")

    {:ok, socket}
  end

  @impl true
  def handle_async(:search_agents, {:ok, results}, socket) do
    # results = EAD.search_agents(text)

    display_option =
      results
      |> Enum.map(fn o ->
        {"#{o.name}", o.id}
      end)

    # To Display the options with Types:

    # display_option =
    #   results
    #   |> Enum.map(fn o ->
    #     {"#{o.name} - #{Enum.map(o.type_ids, fn id -> socket.assigns.agent_types_map[id] end) |> Enum.join(", ")}",
    #      o.id}
    #   end)

    send_update(LiveSelect.Component, id: "annotation_agents", options: display_option)

    no_suggestions =
      if length(results) > 0 do
        false
      else
        true
      end

    socket =
      assign(socket,
        # agents_curr_text: text,
        agents_no_suggestions: no_suggestions,
        agents_loading: false
      )

    {:noreply, socket}
  end

  def handle_async(:search_agents, {:exit, reason}, socket) do
    Logger.warning("Agent search async task failed: #{inspect(reason)}")
    {:noreply, assign(socket, agents_loading: false)}
  end

  @impl true
  def handle_async(:search_subjects, {:ok, {text, subjects}}, socket) do
    # subjects = EAD.search_subjects(text)
    normalized_text = String.downcase(String.trim(text))
    options = Enum.map(subjects, fn subject -> {subject.content, subject.id} end)

    socket = assign(socket, subjects_options: options)

    has_exact_match =
      Enum.any?(options, fn {opt_text, _} ->
        String.downcase(String.trim(opt_text)) == normalized_text
      end)

    display_options =
      cond do
        # If no options found, show "Add new Subject" option
        options == [] ->
          [{"Add new Subject \"#{text}\" to Milli Local Knowledge", "new:#{text}"}]

        # If no exact match and options >= 100, show both "Add new" and "Show more"
        not has_exact_match and length(options) >= 100 ->
          options ++
            [
              {"No exact match found, Add new Subject \"#{text}\" to Milli Local Knowledge", "new:#{text}"},
              {"Show more for #{text}", "__SHOW_MORE__"}
            ]

        # If no exact match, show "Add new" option
        not has_exact_match ->
          options ++ [{"No exact match found, Add new Subject \"#{text}\" to Milli Local Knowledge", "new:#{text}"}]

        # If options >= 100, show "Show more" option
        length(options) >= 100 ->
          options ++ [{"Show more for #{text}", "__SHOW_MORE__"}]

        # Otherwise just show the options
        true ->
          options
      end

    send_update(LiveSelect.Component, id: "annotation_subjects", options: display_options)
    {:noreply, assign(socket, subjects_loading: false)}
  end

  def handle_async(:search_subjects, {:exit, reason}, socket) do
    Logger.warning("Subject search async task failed: #{inspect(reason)}")
    {:noreply, assign(socket, subjects_loading: false)}
  end

  def handle_event("live_select_change", %{"text" => text, "id" => "annotation_subjects"}, socket) do
    # normalized_text = String.downcase(String.trim(text))
    socket = assign(socket, subjects_loading: true)
    send_update(LiveSelect.Component, id: "annotation_subjects", options: [])
    {:noreply, start_async(socket, :search_subjects, fn -> {text, EAD.search_subjects(text)} end)}
  end

  @impl true
  def handle_event("live_select_change", %{"text" => text, "id" => "annotation_agents"}, socket) do
    socket = assign(socket, agents_curr_text: text, agents_loading: true)
    send_update(LiveSelect.Component, id: "annotation_agents", options: [])
    {:noreply, start_async(socket, :search_agents, fn -> EAD.search_agents(text) end)}
  end

  def handle_event("live_select_change", %{"text" => text, "id" => live_select_id}, socket)
      when is_binary(live_select_id) do
    if String.starts_with?(live_select_id, "custom-types") do
      all_types = socket.assigns.agent_types

      case String.trim(text) do
        "" ->
          send_update(LiveSelect.Component, id: live_select_id, options: all_types)

        _ ->
          filtered_types =
            all_types |> Enum.filter(fn {type, _id} -> String.contains?(type, text) end)

          send_update(LiveSelect.Component, id: live_select_id, options: filtered_types)
      end

      {:noreply, socket}
    else
      {:noreply, socket}
    end
  end

  @impl true
  def handle_event("validate", %{"annotation_form" => new_params}, socket) do
    # Get current form params
    current_params = socket.assigns.form.params

    # IO.inspect(current_params, label: "current_params")
    # IO.inspect(current_form, label: "current_form")
    # IO.inspect(new_params, label: "new_params")
    # IO.inspect(socket, label: "SOCKET IN VALIDATE")

    # Only update description, keep everything else the same because live_select is not updating properly
    updated_params = Map.put(current_params, "description", new_params["description"])

    selected_subjs = get_in(new_params, ["subjects"]) || []

    {selected_subjs, is_show_more?} =
      if "__SHOW_MORE__" in selected_subjs do
        {Enum.filter(selected_subjs, fn sub -> sub != "__SHOW_MORE__" end), true}
      else
        {selected_subjs, false}
      end

    if is_show_more? do
      # Get the stored options
      stored_options = socket.assigns.subjects_options || []

      # Map selected values to their label-value pairs
      selected_with_labels =
        Enum.flat_map(selected_subjs, fn value ->
          case Enum.find(stored_options, fn {_label, v} -> to_string(v) == to_string(value) end) do
            {label, value} -> [{label, value}]
            # Skip if not found in stored options
            _ -> []
          end
        end)

      socket
      |> assign(:form, to_form(updated_params, as: "annotation_form"))
      |> push_event("open_new_tab", %{
        url: "/search-subjects?q=#{new_params["subjects_text_input"]}"
      })
      |> then(fn socket ->
        send_update(LiveSelect.Component,
          id: "annotation_subjects",
          value: selected_with_labels
        )

        socket
      end)
      |> then(fn socket -> {:noreply, socket} end)
    else
      {:noreply, assign(socket, :form, to_form(updated_params, as: "annotation_form"))}
    end

    # IO.inspect(updated_params, label: "updated_params")
    # socket = assign(socket, :form, to_form(updated_params, as: "annotation_form"))
    # {:noreply, socket}
  end

  @impl true
  def handle_event("add-custom", %{"name" => name}, socket) do
    trimmed = String.trim(name || "")
    curr_customs = socket.assigns.agents_custom_form_options || []

    exists =
      curr_customs
      |> Enum.any?(fn n -> String.downcase(n) == String.downcase(trimmed) end)

    if trimmed != "" and not exists do
      new_list = curr_customs ++ [trimmed]
      {:noreply, assign(socket, :agents_custom_form_options, new_list)}
    else
      {:noreply, socket}
    end
  end

  def handle_event("remove-custom", %{"index" => idx_str}, socket) do
    idx = String.to_integer(idx_str)
    new_agents = List.delete_at(socket.assigns.agents_custom_form_options || [], idx)
    {:noreply, assign(socket, :agents_custom_form_options, new_agents)}
  end

  def handle_event("submit", params, socket) do
    IO.inspect(params, label: "GOT PARAMS: ")
    %{"annotation_form" => form_data} = params
    subjects = form_data["subjects"] || []
    description = String.trim(form_data["description"] || "")
    agents = form_data["agents"] || []

    customs_param = Map.get(form_data, "customs", %{})

    custom_types =
      form_data
      |> Enum.filter(fn {key, _} -> String.starts_with?(key, "custom-types-") end)
      |> Enum.into(%{}, fn {"custom-types-" <> idx, val} -> {idx, normalize_types(val)} end)

    parsed_customs =
      customs_param
      |> Enum.map(fn {idx, row_map} ->
        name = row_map |> Map.get("name", "") |> String.trim()
        types = Map.get(custom_types, idx, [])
        %{index: idx, name: name, types: types}
      end)
      |> Enum.sort_by(fn %{index: idx} ->
        case Integer.parse(idx) do
          {val, _} -> val
          _ -> 0
        end
      end)
      |> Enum.map(fn %{name: name, types: types} -> %{name: name, types: types} end)

    IO.inspect(parsed_customs, label: "PARSED CUSTOMS: ")

    missing_types_custom =
      parsed_customs
      |> Enum.find(fn %{name: name, types: types} -> name != "" and types == [] end)

    if missing_types_custom do
      send(
        self(),
        {:flash, :error,
         "Please select at least one type for custom agent \"#{missing_types_custom.name}\""}
      )

      {:noreply, socket}
    else
      has_description? = description != ""
      has_subjects? = subjects != nil and subjects != []
      has_custom_agents? = parsed_customs |> Enum.any?(fn %{name: name} -> name != "" end)
      has_agents? = (agents != nil and agents != []) or has_custom_agents?

      unless has_description? or has_subjects? or has_agents? do
        send(self(), {:flash, :error, "Add a description, subject, or agent before submitting"})
        {:noreply, socket}
      else
        proceed_submit(socket, subjects, description, agents, parsed_customs)
      end
    end
  end

  defp proceed_submit(socket, subjects, description, agents, parsed_customs) do
    # Get the current user and file from socket assigns
    current_user = socket.assigns.current_user
    file = socket.assigns.file

    # Check for existing subjects
    {existing_subjects_ids, new_subjects} = split_number_words(subjects)

    # The new: is added to all the new subjects in the annotation form in case there is an pure integer entry, it won't be treated as a Subject ID.
    new_subjects =
      Enum.map(new_subjects, fn sub ->
        case sub do
          "new:" <> rest -> rest
          _ -> sub
        end
      end)

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
      existing_agent_map =
        (file.accepted_agent_annotations || [])
        |> Enum.flat_map(fn ann -> ann.agents || [] end)
        |> Enum.reduce(%{}, fn agent, acc -> Map.put(acc, agent.id, agent.name) end)

      existing_agent_ids = Map.keys(existing_agent_map)

      existing_custom_agent_names =
        (file.accepted_agent_annotations || [])
        |> Enum.flat_map(fn ann -> ann.new_agents || [] end)
        |> Enum.map(fn m -> m["name"] || m[:name] || "" end)
        |> Enum.map(&String.trim/1)
        |> Enum.map(&String.downcase/1)
        |> Enum.reject(&(&1 == ""))

      duplicate_agent_ids =
        agents
        |> Enum.map(fn id ->
          case Integer.parse(to_string(id)) do
            {val, _} -> val
            _ -> nil
          end
        end)
        |> Enum.reject(&is_nil/1)
        |> Enum.filter(&(&1 in existing_agent_ids))

      duplicate_custom_agents =
        parsed_customs
        |> Enum.filter(fn %{name: name} -> name != "" end)
        |> Enum.map(fn %{name: name} -> name |> String.trim() |> String.downcase() end)
        |> Enum.filter(&(&1 in existing_custom_agent_names))

      if duplicate_agent_ids != [] or duplicate_custom_agents != [] do
        dup_agents_msg =
          if duplicate_agent_ids != [] do
            labels =
              duplicate_agent_ids
              |> Enum.uniq()
              |> Enum.map(fn id ->
                name = Map.get(existing_agent_map, id)
                display_agent_label_flash(name, id)
              end)
              |> Enum.join(", ")

            "Agent(s) #{labels}"
          end

        dup_customs_msg =
          if duplicate_custom_agents != [] do
            names_str = duplicate_custom_agents |> Enum.uniq() |> Enum.join(", ")
            "Custom agent(s) \"#{names_str}\""
          end

        parts =
          [dup_agents_msg, dup_customs_msg]
          |> Enum.reject(&is_nil/1)
          |> Enum.join(" and ")

        send(self(), {:flash, :error, "#{parts} already exist in approved annotations"})
        {:noreply, socket}
      else
        agent_presence? =
          (agents != nil and agents != []) or
            Enum.any?(parsed_customs, fn %{name: name} -> name != "" end)

        agent_result =
          if agent_presence? do
            agent_params = %{
              "file_id" => file.id,
              "user_id" => current_user.id,
              "agents" => Enum.map(agents || [], &%{id: &1}),
              "new_agents" =>
                parsed_customs
                |> Enum.filter(fn %{name: name} -> name != "" end)
                |> Enum.map(fn %{name: name, types: types} ->
                  %{
                    "name" => name,
                    "types" =>
                      Enum.map(types, fn t ->
                        case Integer.parse(to_string(t)) do
                          {val, _} -> val
                          _ -> t
                        end
                      end)
                  }
                end)
            }

            case Annotations.create_agent_annotation(agent_params) do
              {:ok, annotation} ->
                {{:ok, "Agent annotation created successfully"}, annotation}

              {:error, changeset} ->
                {{:error, "Failed to create agent annotation: #{inspect(changeset.errors)}"}, nil}
            end
          else
            nil
          end

        agent_annotation =
          case agent_result do
            {{:ok, _}, ann} -> ann
            _ -> nil
          end

        {subjects_result, subjects_annotation} =
          if subjects != nil and subjects != [] do
            subjects_params = %{
              "file_id" => file.id,
              "user_id" => current_user.id,
              "subjects" => Enum.map(existing_subjects_ids, &%{id: &1}),
              "new_subjects" => new_subjects
            }

            case Annotations.create_subject_annotation(subjects_params) do
              {:ok, {:ok, annotation}} ->
                {{:ok, "Subjects annotation created successfully"}, annotation}

              {:error, changeset} ->
                {{:error, "Failed to create subjects annotation: #{inspect(changeset.errors)}"},
                 nil}
            end
          else
            {nil, nil}
          end

        {description_result, description_annotation} =
          if description != nil and description != "" and String.trim(description) != "" do
            description_params = %{
              "file_id" => file.id,
              "user_id" => current_user.id,
              "description" => String.trim(description)
            }

            case Annotations.create_description_annotation(description_params) do
              {:ok, annotation} ->
                {{:ok, "Description annotation created successfully"}, annotation}

              {:error, changeset} ->
                {{:error,
                  "Failed to create description annotation: #{inspect(changeset.errors)}"}, nil}
            end
          else
            {nil, nil}
          end

        created_annotations =
          [description_annotation, subjects_annotation, agent_annotation]
          |> Enum.reject(&is_nil/1)

        if created_annotations != [] do
          Kosh.EmailNotifications.deliver_admin_bundle_notifications(
            current_user,
            created_annotations
          )

          Enum.each(created_annotations, fn ann ->
            Kosh.Notifications.notify_admins_about_annotation(ann, current_user.id)
          end)
        end

        normalized_results =
          [subjects_result, description_result, agent_result]
          |> Enum.map(fn
            {{:ok, msg}, _ann} -> {:ok, msg}
            {{:error, msg}, _ann} -> {:error, msg}
            nil -> nil
            other -> other
          end)

        success_msgs =
          normalized_results
          |> Enum.filter(&match?({:ok, _}, &1))
          |> Enum.map(fn {:ok, msg} -> msg end)

        error_msgs =
          normalized_results
          |> Enum.filter(&match?({:error, _}, &1))
          |> Enum.map(fn {:error, msg} -> msg end)

        message =
          cond do
            error_msgs != [] -> {:error, Enum.join(error_msgs, "; ")}
            success_msgs != [] -> {:info, Enum.join(success_msgs, " | ")}
            true -> {:error, "No annotations were created"}
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
                  "description" => nil,
                  "agents" => [],
                  "agents_text_input" => ""
                },
                as: "annotation_form"
              )
            )
            |> assign(:agents_custom_form_options, [])
            |> assign(:agents_curr_text, "")
            |> assign(:agents_no_suggestions, false)
            |> then(fn socket ->
              send_update(LiveSelect.Component,
                id: "annotation_subjects",
                options: [],
                value: nil,
                current_text: ""
              )

              send_update(LiveSelect.Component,
                id: "annotation_agents",
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
  end

  defp normalize_types(nil), do: []
  defp normalize_types([]), do: []
  defp normalize_types(val) when is_binary(val), do: [val]
  defp normalize_types(val) when is_list(val), do: val

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

  defp display_agent_label_flash(nil, id), do: "##{id}"

  defp display_agent_label_flash(name, _id) do
    trimmed = String.trim(name || "")

    if String.length(trimmed) > 5 do
      String.slice(trimmed, 0, 5) <> "…"
    else
      trimmed
    end
  end

  defp extract_label_from_extra_option(option) do
    "Show more for " <> text = option
    text
  end

  @impl true
  def render(assigns) do
    ~H"""
    <div class="grow flex flex-col space-y-10">
      <.form for={@form} phx-change="validate" phx-submit="submit" phx-target={@myself}>
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
            <p class="text-secondary-purple font-bold text-body-md-18 ">Subjects</p>
            <p class="font-normal text-xs mb-3 text-primary-purple">
              Search Subjects from
              <span
                class="underline font-medium cursor-pointer"
                title="Library of Congress Subject Headings"
              >
                LCSH</span>
              or add new subjects
            </p>
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
            >
              <:option :let={option}>
                <%= if option.value == "__SHOW_MORE__" do %>
                  <a
                    href="#"
                    class="block w-full h-full p-2 text-primary-purple font-bold hover:text-secondary-purple cursor-pointer"
                    phx-click={"
                 event.preventDefault();
                 window.open('/search-subjects?q=#{extract_label_from_extra_option(option.label)}', '_blank');
                 "}
                  >
                    <%= option.label %>
                  </a>
                <% else %>
                  <div class="p-2">
                    <%= option.label %>
                  </div>
                <% end %>
              </:option>
            </.live_select>
            <div
              :if={@subjects_loading}
              class="mt-1 inline-flex items-center gap-2 text-xs text-secondary-purple"
            >
              <span class="h-3 w-3 animate-spin rounded-full border-2 border-primary-purple border-t-transparent">
              </span>
              Searching...
            </div>
          </div>
        </div>

        <div class="flex flex-col mt-4">
          <p class="text-secondary-purple font-bold text-body-md-18">People, Places, Organisations</p>
          <p class="font-normal text-xs mb-3 text-primary-purple">
            Search People, Places, Organizations from
            <span
              class="underline font-medium cursor-pointer"
              title="Library of Congress Name Authority File"
            >
              LCNAF</span>
            or add new
          </p>

          <.live_select
            id="annotation_agents"
            field={@form[:agents]}
            phx-target={@myself}
            update_min_len={1}
            options={[]}
            debounce={1000}
            mode={:quick_tags}
            placeholder="Search People, Places, Organisations..."
            text_input_class="w-full p-3 text-secondary-purple border-2 border-primary-purple border-dotted rounded-[4px] focus:border-secondary-purple active:border-primary-purple focus:ring-0 focus:outline-none focus:border-solid focus:rounded-none active:outline-none outline-none ring-0"
            container_extra_class="gap-5 flex flex-col"
            tags_container_class="w-full flex flex-col gap-5 [&:not(:has(*))]:hidden"
            tag_class="border-2 border-primary-purple text-primary-grey p-3 relative"
            clear_tag_button_class="absolute -top-3 -right-3 bg-secondary-pale-grey rounded-full text-primary-purple cursor-pointer"
            option_class="!text-primary-grey !p-2 sm:!p-3 hover:bg-secondary-lilac"
            active_option_class="!bg-secondary-lilac"
            dropdown_extra_class="max-h-40 sm:max-h-56 overflow-y-auto"
          />

          <button
            :if={String.length(@agents_curr_text) > 3 && @agents_no_suggestions}
            type="button"
            phx-click="add-custom"
            phx-value-name={@agents_curr_text}
            phx-target={@myself}
            class="text-sm text-secondary-purple mr-auto mt-1"
          >
            No Results Found. Add Custom Entry to Milli Local Knowledge: <b>"<%= @agents_curr_text %>"</b>
          </button>
          <div
            :if={@agents_loading}
            class="mt-1 inline-flex items-center gap-2 text-xs text-secondary-purple"
          >
            <span class="h-3 w-3 animate-spin rounded-full border-2 border-primary-purple border-t-transparent">
            </span>
            Searching...
          </div>
          <div class="mt-4 space-y-3">
            <%= for {agent, idx} <- Enum.with_index(@agents_custom_form_options || []) do %>
              <div id={"custom-agent-#{idx}"} class="flex items-end gap-2">
                <input
                  type="text"
                  name={"annotation_form[customs][#{idx}][name]"}
                  value={agent}
                  readonly
                  class="p-2 h-10 border rounded w-1/3 flex-1 min-w-0 text-secondary-purple border-2 border-primary-purple rounded-[4px] focus:border-secondary-purple active:border-primary-purple focus:ring-0 focus:outline-none focus:border-solid focus:rounded-none active:outline-none outline-none ring-0"
                />

                <.live_select
                  id={"custom-types-#{idx}"}
                  field={@form["custom-types-#{idx}"]}
                  phx-target={@myself}
                  update_min_len={0}
                  options={@agent_types}
                  debounce={1000}
                  max_selectable={1}
                  mode={:quick_tags}
                  placeholder="Select Agent Types..."
                  text_input_class="w-full h-10 p-3 text-secondary-purple border-2 border-primary-purple rounded-[4px] focus:border-secondary-purple active:border-primary-purple focus:ring-0 focus:outline-none focus:border-solid focus:rounded-none active:outline-none outline-none ring-0 flex-1 min-w-0"
                  container_extra_class="flex-1 min-w-0"
                  tag_extra_class="bg-primary-purple text-white"
                  option_class="!text-primary-grey !p-2 sm:!p-3 hover:bg-secondary-lilac"
                  active_option_class="!bg-secondary-lilac"
                  dropdown_extra_class="max-h-40 sm:max-h-56 overflow-y-auto"
                />

                <button
                  type="button"
                  phx-click="remove-custom"
                  phx-value-index={idx}
                  phx-target={@myself}
                  class="p-1 mt-1 rounded-full bg-gray-200 hover:bg-gray-300 flex-none self-center transition-colors"
                >
                  <svg
                    width="20"
                    height="20"
                    viewBox="0 0 24 24"
                    fill="none"
                    xmlns="http://www.w3.org/2000/svg"
                  >
                    <circle cx="12" cy="12" r="10" class="stroke-transparent" stroke-width="2" />
                    <path
                      d="M8 8L16 16M16 8L8 16"
                      class="stroke-primary-purple"
                      stroke-width="2"
                      stroke-linecap="round"
                    />
                  </svg>
                </button>
              </div>
            <% end %>
          </div>
        </div>

        <div class="w-full flex justify-end mt-2">
          <button type="submit" class="btn-primary-purple">
            Save
          </button>
        </div>
      </.form>
    </div>
    """
  end
end
