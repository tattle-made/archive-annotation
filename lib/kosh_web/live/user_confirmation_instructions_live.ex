defmodule KoshWeb.UserConfirmationInstructionsLive do
  use KoshWeb, :live_view

  alias Kosh.Accounts

  def render(assigns) do
    ~H"""
    <div class="mx-auto max-w-fit">
      <.header class="text-center">
        <%= if @reason == "expired" do %>
          <p class="text-secondary-purple">Your confirmation link is either invalid or expired</p>
        <% else %>
          <p class="text-secondary-purple">No confirmation instructions received?</p>
        <% end %>
        <:subtitle><p class="text-primary-purple">We'll send a new confirmation link to your inbox</p></:subtitle>
      </.header>

      <.simple_form for={@form} id="resend_confirmation_form" phx-submit="send_instructions" class="">
        <.input field={@form[:email]} type="email" placeholder="Email" required class="w-full"/>
        <:actions>
          <button phx-disable-with="Sending..." class="w-full btn-primary-purple">
            Resend confirmation instructions
          </button>
        </:actions>
      </.simple_form>

      <p class="text-center mt-4 text-secondary-purple">
        <.link href={~p"/users/register"}>Register</.link>
        | <.link href={~p"/users/log_in"}>Log in</.link>
      </p>
    </div>
    """
  end

  def mount(params, _session, socket) do
    reason = Map.get(params, "reason")

    {:ok, assign(socket, form: to_form(%{}, as: "user"), reason: reason)}
  end

  def handle_event("send_instructions", %{"user" => %{"email" => email}}, socket) do
    if user = Accounts.get_user_by_email(email) do
      Accounts.deliver_user_confirmation_instructions(
        user,
        &url(~p"/users/confirm/#{&1}")
      )
    end

    info =
      "If your email is in our system and it has not been confirmed yet, you will receive an email with instructions shortly."

    {:noreply,
     socket
     |> put_flash(:info, info)
     |> redirect(to: ~p"/users/confirm/landing?reason=resend")}
  end
end
