defmodule KoshWeb.Components.SubjectAnnotationCard do
  use Phoenix.Component

  attr :annotation, :map, required: true
  # or "approved"
  attr :type, :string, default: "submitted"
  attr :current_user, :map, default: nil
  attr :on_approve, :string, default: nil
  attr :on_delete, :string, default: nil
  attr :display_only?, :boolean, default: false
  attr :is_featured?, :boolean, default: false

  def subject_annotation_card(assigns) do
    ~H"""
    <div class="flex flex-col space-y-[2px] items-center">
      <div class="bg-bg-lilac p-3 relative w-80 rounded-t-[4px]">
        <div class="flex items-center justify-between mb-3">
          <div class="flex items-center bg-bg-grey gap-1 p-2">
            <img src="/images/subject-annotation-icon.svg" alt="Annotation Icon" class="w-4 h-4" />
            <span class="text-meta-12 font-bold text-primary-grey ">
              Subject
            </span>
          </div>
          <%= if !@display_only? do %>
            <div class="relative w-4 h-4" x-data="{ open: false }">
              <div
                class="absolute -top-2 -right-2 bg-white text-primary-grey rounded p-2 pt-8 w-44 flex flex-col gap-2 items-end drop-shadow-[0_4px_4px_rgba(0,0,0,0.25)] z-0"
                x-show="open"
                @click.outside="open = false"
              >
                <%= if(@current_user.role == :admin and @annotation.status == :pending and !is_nil(@on_approve)) do %>
                  <button
                    class="px-2 py-1 w-full text-right hover:bg-bg-grey rounded"
                    phx-click={@on_approve}
                    phx-value-id={@annotation.id}
                  >
                    Approve
                  </button>
                <% end %>

                <%= if(@current_user.role == :admin or @current_user.id == @annotation.user_id) do %>
                  <button
                    class="px-2 py-1 w-full text-right hover:bg-bg-grey rounded"
                    phx-click={@on_delete}
                    phx-value-id={@annotation.id}
                  >
                    Delete
                  </button>
                <% end %>
              </div>

              <button class="absolute top-0 right-0 z-10 " @click="open = !open">
                <img src="/images/annotation-menu-icon.svg" alt="menu-icon" />
              </button>
            </div>
          <% end %>
        </div>
        <div class=" mb-3">
          <ul>
            <%= if Map.has_key?(@annotation, :subjects) && @annotation.subjects && length(@annotation.subjects) > 0 do %>
              <%= for subject <- @annotation.subjects do %>
                <li class="py-3 border-b border-white last:border-b-0">
                  <%!-- <%= subject.content %> --%>
                  <%= if @annotation.status == :pending do %>
                    <span><%= subject.content %></span>
                    <span class="text-primary-grey text-sm">
                      <%= if subject.source do
                        "- #{subject.source}"
                      end %>
                    </span>
                  <% end %>
                  <%= if @annotation.status == :accepted do %>
                    <%= if Enum.member?(@annotation.new_subjects || [], subject.content) do %>
                      <%= subject.content %><span class="text-primary-grey text-sm"> (new)</span>
                      <span class="text-primary-grey text-sm">
                        <%= if subject.source do
                          "- #{subject.source}"
                        end %>
                      </span>
                    <% else %>
                      <span><%= subject.content %></span>
                      <span class="text-primary-grey text-sm">
                        <%= if subject.source do
                          "- #{subject.source}"
                        end %>
                      </span>
                    <% end %>
                  <% end %>
                </li>
              <% end %>
            <% end %>
            <%= if Map.has_key?(@annotation, :new_subjects) && @annotation.new_subjects && length(@annotation.new_subjects) > 0 && @annotation.status == :pending do %>
              <%= for subject <- @annotation.new_subjects do %>
                <li>
                  <%= subject %> <span class="text-primary-grey text-sm">(new)</span><span class="text-primary-grey text-sm">
                        <%= if is_map(subject) and subject.source do
                          "- #{subject.source}"
                        end %>
                      </span>
                </li>
              <% end %>
            <% end %>
          </ul>
        </div>
        <%= if !@is_featured? do %>
          <div class="text-caption-14 text-primary-grey hover:text-secondary-grey">
            <%= if @annotation.file && @annotation.file.title do %>
              <.link navigate={"/annotation/display?uri=#{@annotation.file.uri}"}>
                <%= @annotation.file.title %>
              </.link>
              <%= if @annotation.file.unitid && @annotation.file.unitid.id do %>
                <span class="text-gray-500">
                  - <%= @annotation.file.unitid.id %>
                </span>
              <% end %>
            <% end %>
          </div>
        <% end %>
      </div>

      <div class="flex justify-between items-center text-base text-primary-grey bg-bg-lilac w-80 rounded-b-[4px] ">
        <div class=" px-3 py-2">
          <span class="uppercase text-meta-12 text-primary-grey">
            <%= @annotation.inserted_at
            |> Timex.to_datetime("Asia/Kolkata")
            |> Timex.format!("{D} {Mfull} {YYYY}") %>
          </span>
        </div>
        <%= if !!@annotation.user do %>
          <div class="text-meta-12 ml-auto mx-2 max-w-36 truncate">
            <%= @annotation.user.email %>
          </div>
        <% end %>
        <div class="bg-bg-grey px-3 py-2 rounded-br-[4px]">
          <span class="uppercase text-meta-12 text-primary-grey">
            <%!-- <%= @annotation.file && @annotation.file.unitid && @annotation.file.unitid.id %> --%>
            <%= @annotation.id %>
          </span>
        </div>
      </div>
    </div>
    """
  end
end
