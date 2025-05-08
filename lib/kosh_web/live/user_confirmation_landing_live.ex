defmodule KoshWeb.UserConfirmationLandingLive do
  use KoshWeb, :live_view

  @impl Phoenix.LiveView
  def render(assigns) do
    ~H"""
    <div class="section-gutter text center mt-10">
      <h1 class="text-4xl text-center font-bold text-secondary-purple">Welcome!</h1>
      <div class="text-center text-primary-purple">
        <p class="mt-2 ">
          <%= if @reason == "resend" do %>
            If your email is in our system and it has not been confirmed yet, you will receive an email with instructions shortly.
          <% else %>
            A confirmation email has been sent to your registered email address. Please check your inbox and follow the instructions to confirm your email.
          <% end %>
        </p>
        <p>
          If you didn’t receive a confirmation email or if your confirmation link has expired, click
          <.link navigate={~p"/users/confirm"} class="text-blue-500 underline">here</.link>
          to resend it.
        </p>
      </div>
    </div>
    """
  end

  def mount(params, _session, socket) do
    reason = Map.get(params, "reason")
    {:ok, assign(socket, reason: reason)}
  end
end
