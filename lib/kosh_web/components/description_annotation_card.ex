defmodule KoshWeb.Components.DescriptionAnnotationCard do
  use Phoenix.Component
  # alias Timex

  attr :annotation, :map, required: true
  # or "approved"
  # or accepted or draft or rejected
  attr :type, :string, default: "submitted"
  attr :current_user, :map, default: nil
  attr :on_approve, :string, default: nil
  attr :on_delete, :string, default: nil
  attr :display_only?, :boolean, default: false

  def description_annotation_card(assigns) do
    ~H"""
    <%!-- <div class="flex flex-col space-y-[2px] items-center break-inside-avoid"> for columns layout --%>
    <div class="flex flex-col space-y-[2px] items-center ">
      <div class="bg-bg-lilac p-3 relative w-80 rounded-t-[4px]">
        <div class="flex items-center justify-between mb-3">
          <div class="flex items-center bg-bg-grey gap-1 p-2">
            <img src="/images/description-annotation-icon.svg" alt="Description" class="w-4 h-4" />
            <span class="text-meta-12 font-bold text-primary-grey ">
              Description
            </span>
          </div>
          <%= if !@display_only? do %>
          <div class="relative w-4 h-4" x-data="{ open: false }">
            <%!-- <svg
              class=" h-4 w-4 text-gray-400 cursor-pointer bg-secondary-lime rounded-full "
              fill="#8c4673"
              stroke="currentColor"
              stroke-width="0.5"
              viewBox="0 0 24 24"
            >
              <circle cx="5" cy="12" r="2" /><circle cx="12" cy="12" r="2" /><circle
                cx="19"
                cy="12"
                r="2"
              />
            </svg> --%>

            <div
              class="absolute -top-2 -right-2 bg-white text-primary-grey rounded p-2 pt-8 w-44 flex flex-col gap-2 items-end drop-shadow-[0_4px_4px_rgba(0,0,0,0.25)] z-0"
              x-show="open"
              @click.outside="open = false"
            >
              <%= if(@current_user.role == :admin and @annotation.status == :pending) do %>
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
          <%= @annotation.description %>
        </div>
        <div class="text-caption-14 text-primary-grey">
          <%= @annotation.file && @annotation.file.title %>
        </div>
      </div>

      <div class="flex justify-between items-center text-base text-primary-grey bg-bg-lilac w-80 rounded-b-[4px] ">
        <div class=" px-3 py-2">
          <span class="uppercase text-meta-12 text-primary-grey">
            <%= @annotation.inserted_at
            |> Timex.to_datetime("Asia/Kolkata")
            |> Timex.format!("{D} {Mfull} {YYYY}") %>
          </span>
        </div>
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
