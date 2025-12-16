defmodule KoshWeb.Components.AnnotationSection.EmotionAnnotationSection do
  use Phoenix.LiveComponent
  alias Kosh.EAD
  alias Kosh.Annotations

  @impl true
  def update(assigns, socket) do
    socket = assign(socket, assigns)

    emotions = EAD.list_defined_emotions()

    user_votes =
      if socket.assigns.current_user do
        Annotations.list_user_emotion_annotations(
          socket.assigns.file.id,
          socket.assigns.current_user.id
        )
      else
        %{}
      end

    # IO.inspect(user_votes)
    emotion_counts = Annotations.get_emotion_counts(socket.assigns.file.id)

    socket =
      assign(socket,
        emotions: emotions,
        user_votes: user_votes,
        emotion_counts: emotion_counts
      )

    {:ok, socket}
  end

  @impl true
  def handle_event("toggle_vote", %{"emotion_id" => emotion_id, "weight" => weight}, socket) do
    if socket.assigns.current_user do
      case Annotations.toggle_emotion_annotation(
             socket.assigns.file.id,
             socket.assigns.current_user.id,
             emotion_id,
             String.to_atom(weight)
           ) do
        {:ok, _annotation} ->
          user_votes =
            Annotations.list_user_emotion_annotations(
              socket.assigns.file.id,
              socket.assigns.current_user.id
            )

          emotion_counts = Annotations.get_emotion_counts(socket.assigns.file.id)

          send(
            self(),
            {:flash, :info, "Emotion recorded"}
          )

          {:noreply,
           socket
           |> assign(:user_votes, user_votes)
           |> assign(:emotion_counts, emotion_counts)}

        {:error, _changeset} ->
          send(
            self(),
            {:flash, :error, "Failed to Record Emotion"}
          )

          {:noreply, socket}
      end
    else
      {:noreply, redirect(socket, to: "/users/log_in")}
    end
  end

  @impl true
  def render(assigns) do
    ~H"""
    <div class="grow flex flex-col space-y-6">
      <p class="text-secondary-purple font-bold text-body-md-18 mb-4">
        How do you feel about this archival object?
      </p>

      <div class="space-y-4">
        <%= for emotion <- @emotions do %>
          <div class="flex flex-col sm:flex-row items-start sm:items-center py-3 px-4 bg-white rounded-lg border border-secondary-lilac space-y-3 sm:space-y-0">
            <!-- Emotion Name -->
            <div class="w-full sm:w-1/4 mb-2 sm:mb-0">
              <span class="font-bold text-primary-purple">
                <%= String.capitalize(emotion.name) %>
              </span>
            </div>
            <!-- Middle: Toggle Buttons -->
            <div class="w-full sm:w-1/2 flex flex-wrap gap-2 sm:gap-3">
              <button
                phx-click="toggle_vote"
                phx-value-emotion_id={emotion.id}
                phx-value-weight="high"
                phx-target={@myself}
                class={
                  [
                    "flex-1 flex items-center justify-center px-4 py-2 rounded-full text-sm font-medium transition-colors border",
                    if(@user_votes[emotion.id] && @user_votes[emotion.id].weight == :high,
                      do:
                        "bg-primary-purple/10 border-primary-purple text-primary-purple font-semibold",
                      else:
                        "border-secondary-grey/30 bg-secondary-lilac/20 text-secondary-grey hover:bg-secondary-lilac/30"
                    )
                  ]
                  |> Enum.join(" ")
                }
                disabled={!@current_user}
              >
                <div class="flex items-center">
                  <span>High</span>
                  <span class="ml-2 text-xs bg-white/90 rounded-full px-2 py-0.5 text-secondary-grey">
                    <%= (@emotion_counts[emotion.id] && @emotion_counts[emotion.id][:high]) || 0 %>
                  </span>
                  <%= if @user_votes[emotion.id] && @user_votes[emotion.id].weight == :high do %>
                    <span class="ml-1 text-xs text-primary-purple whitespace-nowrap">• You</span>
                  <% end %>
                </div>
              </button>

              <button
                phx-click="toggle_vote"
                phx-value-emotion_id={emotion.id}
                phx-value-weight="low"
                phx-target={@myself}
                class={
                  [
                    "flex-1 flex items-center justify-center px-4 py-2 rounded-full text-sm font-medium transition-colors border",
                    if(@user_votes[emotion.id] && @user_votes[emotion.id].weight == :low,
                      do:
                        "bg-primary-purple/10 border-primary-purple text-primary-purple font-semibold",
                      else:
                        "border-secondary-grey/30 bg-secondary-lilac/20 text-secondary-grey hover:bg-secondary-lilac/30"
                    )
                  ]
                  |> Enum.join(" ")
                }
                disabled={!@current_user}
              >
                <div class="flex items-center">
                  <span>Low</span>
                  <span class="ml-2 text-xs bg-white/90 rounded-full px-2 py-0.5 text-secondary-grey">
                    <%= (@emotion_counts[emotion.id] && @emotion_counts[emotion.id][:low]) || 0 %>
                  </span>
                  <%= if @user_votes[emotion.id] && @user_votes[emotion.id].weight == :low do %>
                    <span class="ml-1 text-xs text-primary-purple whitespace-nowrap">• You</span>
                  <% end %>
                </div>
              </button>
            </div>
            <!-- Right: Total -->
            <div class="w-full sm:w-1/4 mt-2 sm:mt-0 text-left sm:text-right">
              <span class="text-sm text-secondary-grey whitespace-nowrap">
                <span class="font-bold">
                  <%= (@emotion_counts[emotion.id] && @emotion_counts[emotion.id][:total]) || 0 %>
                </span>
                total annotations
              </span>
            </div>
          </div>
        <% end %>
      </div>

      <%= if !@current_user do %>
        <div class="mt-4 text-sm text-secondary-grey bg-secondary-lilac/30 p-4 rounded-lg">
          <p>
            Please
            <a href="/users/log_in" class="text-primary-purple hover:underline font-medium">
              sign in
            </a>
            to add your own emotion annotations.
          </p>
        </div>
      <% end %>
    </div>
    """
  end
end
