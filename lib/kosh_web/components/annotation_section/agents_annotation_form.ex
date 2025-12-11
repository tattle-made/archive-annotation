defmodule KoshWeb.Components.AnnotationSection.AgentsAnnotationForm do
  use Phoenix.LiveComponent
  import KoshWeb.CoreComponents
  import LiveSelect
  alias Kosh.EAD
  alias Kosh.Annotations
  import Phoenix.LiveView

  @moduledoc """
  Currently not being used anywhere.
  """

  @impl true
  def mount(socket) do
    form = to_form(%{}, as: "agents_annotation_form")
    all_types_raw = EAD.get_all_lcnaf_types()

    all_types =
      all_types_raw
      |> Enum.reduce(%{}, fn type, acc -> Map.put(acc, type.id, type.type) end)

    types_form_options = all_types_raw |> Enum.map(fn t -> {t.type, to_string(t.id)} end)

    socket =
      assign(socket,
        form: form,
        curr_text: "",
        all_types: all_types,
        no_suggestions: false,
        custom_form_options: [],
        submitted_customs: nil,
        types: types_form_options
        # form_all_types: types_form_options
      )

    {:ok, socket}
  end

  @impl true
  def update(new_assigns, socket) do
    socket = assign(socket, new_assigns)
    {:ok, socket}
  end

  @impl true
  def handle_event("live_select_change", %{"text" => text, "id" => live_select_id}, socket)
      when live_select_id == "annotation_agents" do
    results = EAD.search_agents(text)

    display_option =
      results
      |> Enum.map(fn o ->
        {"#{o.name} - #{Enum.map(o.type_ids, fn id -> socket.assigns.all_types[id] end) |> Enum.join(", ")}",
         o.id}
      end)

    send_update(LiveSelect.Component, id: live_select_id, options: display_option)

    no_suggestions =
      if length(results) > 0 do
        false
      else
        true
      end

    socket = assign(socket, curr_text: text, no_suggestions: no_suggestions)
    {:noreply, socket}
  end

  def handle_event("live_select_change", %{"text" => text, "id" => live_select_id}, socket) do
    if String.starts_with?(live_select_id, "custom-types") do
      all_types = socket.assigns.types

      case String.trim(text) do
        "" ->
          send_update(LiveSelect.Component, id: live_select_id, options: all_types)

        _ ->
          filtered_types =
            all_types |> Enum.filter(fn {type, _id} -> String.contains?(type, text) end)

          send_update(LiveSelect.Component, id: live_select_id, options: filtered_types)
      end
    end

    {:noreply, socket}
  end

  @impl true
  def handle_event("add-custom", %{"name" => name}, socket) do
    trimmed = String.trim(name || "")
    curr_customs = socket.assigns.custom_form_options || []

    exists =
      curr_customs
      |> Enum.any?(fn n -> String.downcase(n) == String.downcase(trimmed) end)

    if trimmed != "" and not exists do
      new_list = curr_customs ++ [trimmed]
      {:noreply, assign(socket, :custom_form_options, new_list)}
    else
      {:noreply, socket}
    end
  end

  # remove a custom row by index
  @impl true
  def handle_event("remove-custom", %{"index" => idx_str}, socket) do
    idx = String.to_integer(idx_str)
    new_agents = List.delete_at(socket.assigns.custom_form_options || [], idx)
    {:noreply, assign(socket, :custom_form_options, new_agents)}
  end

  @impl true
  def handle_event("submit", params, socket) do
    # We expect the form to submit a "customs" map:
    # params["customs"] => %{"0" => %{"name" => "...", "types" => [".."]}, "1" => ...}
    IO.inspect(params, label: "GOT PARAMS: ")
    customs_param = Map.get(params, "customs", %{})

    parsed =
      customs_param
      |> Enum.map(fn {idx_str, row_map} ->
        raw_types = Map.get(row_map, "types", [])
        types = normalize_types(raw_types)
        %{index: String.to_integer(idx_str), name: Map.get(row_map, "name", ""), types: types}
      end)
      |> Enum.sort_by(& &1.index)
      |> Enum.map(fn %{name: name, types: types} -> %{name: name, types: types} end)

    # assign result so you can inspect/use it in the parent or for debugging
    {:noreply, assign(socket, :submitted_customs, parsed)}
  end

  # helper to normalize the types param into a list
  defp normalize_types(nil), do: []
  defp normalize_types([]), do: []
  defp normalize_types(val) when is_binary(val), do: [val]
  defp normalize_types(val) when is_list(val), do: val

  @impl true
  def render(assigns) do
    ~H"""
    <div class="grow flex flex-col space-y-10">
      <.form for={@form} phx-submit="submit" phx-target={@myself}>
        <div class="flex flex-col ">
          <p class="text-secondary-purple font-bold text-body-md-18 mb-4">Agent Annotations</p>

          <.live_select
            id="annotation_agents"
            field={@form[:agents]}
            phx-target={@myself}
            update_min_len={1}
            options={[]}
            debounce={1000}
            mode={:quick_tags}
            placeholder="Search Agents..."
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
            :if={String.length(@curr_text) > 3 && @no_suggestions}
            phx-click="add-custom"
            phx-value-name={@curr_text}
            phx-target={@myself}
            class="text-sm text-secondary-purple mr-auto mt-1"
          >
            No Results Found. Add Custom Agent: <b>"<%= @curr_text %>"</b>
          </button>
          <!-- NEW: render a prefilled disabled input and a types control per new custom agent -->
          <div class="mt-4 space-y-3">
            <%= for {agent, idx} <- Enum.with_index(@custom_form_options || []) do %>
              <div id={"custom-agent-#{idx}"} class="flex items-end gap-2">
                <!-- prefilled disabled input (included in form submission via the `name` attr) -->
                <input
                  type="text"
                  name={"customs[#{idx}][name]"}
                  value={agent}
                  readonly
                  class="p-2 h-10 border rounded w-1/3 flex-1 min-w-0 text-secondary-purple border-2 border-primary-purple rounded-[4px] focus:border-secondary-purple active:border-primary-purple focus:ring-0 focus:outline-none focus:border-solid focus:rounded-none active:outline-none outline-none ring-0"
                />
                <!-- types selector: uses @types (you said you'll provide this assign) -->
                <!-- multiple select will serialize as customs[idx][types][] -->
                <.live_select
                  id={"custom-types-#{idx}"}
                  field={@form["custom-types-#{idx}"]}
                  phx-target={@myself}
                  update_min_len={0}
                  options={@types}
                  debounce={1000}
                  max_selectable={3}
                  mode={:quick_tags}
                  placeholder="Select Agent Types..."
                  text_input_class="w-full h-10 p-3 text-secondary-purple border-2 border-primary-purple rounded-[4px] focus:border-secondary-purple active:border-primary-purple focus:ring-0 focus:outline-none focus:border-solid focus:rounded-none active:outline-none outline-none ring-0 flex-1 min-w-0"
                  container_extra_class="flex-1 min-w-0"
                  tag_extra_class="bg-primary-purple text-white"
                  option_class="!text-primary-grey !p-2 sm:!p-3 hover:bg-secondary-lilac"
                  active_option_class="!bg-secondary-lilac"
                  dropdown_extra_class="max-h-40 sm:max-h-56 overflow-y-auto"
                />
                <!-- remove button -->
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
