defmodule KoshWeb.UserRegistrationLive do
  use KoshWeb, :live_view

  alias Kosh.Accounts
  alias Kosh.Accounts.User

  def render(assigns) do
    ~H"""
    <div class="mt-10">
      <h1 class="!text-primary-purple font-bold">
        REGISTER
      </h1>

      <p class="text-secondary-purple text-body-md-18 xl:text-body-lg-24 !w-full lg:!w-[75%] xl:!w-[60%]">
        Sign up for an account to track, add, and review your annotations. Simply provide a username, email, and strong password. After registering, you'll receive a confirmation email. We’ll use this email to notify you about account activity, updates, and occasionally request feedback.<br /><br />Learn more about registration in the FAQ.
      </p>
      <%!-- Followinf attributes removed because we are not directly logging in the user --%>
      <%!-- action={~p"/users/log_in?_action=registered"} --%>
      <%!-- method="post" --%>
      <.simple_form
        for={@form}
        id="registration_form"
        phx-submit="save"
        phx-change="validate"
        phx-trigger-action={@trigger_submit}
      >
        <.error :if={@check_errors}>
          Oops, something went wrong! Please check the errors below.
        </.error>

        <div class="flex flex-col  md:flex-row space-y-4 md:space-y-0 md:justify-between w-full lg:w-[75%] xl:w-[60%]">
          <div class="flex flex-col  md:flex-row space-y-2 md:space-y-0 w-full">
            <.input
              container_class="w-full md:!w-[40%] lg:!w-80 md:!mr-5"
              field={@form[:email]}
              type="email"
              label="Email"
              required
              class=" !w-full h-12  focus:!border-primary-purple"
              label_class="!text-primary-purple !font-bold !text-body-md-18"
            />
            <.input
              container_class="w-full md:!w-[40%] lg:!w-80  lg:!mr-5"
              field={@form[:password]}
              type="password"
              label="Password"
              required
              label_class="!text-primary-purple !font-bold !text-body-md-18 "
              class="!w-full h-12 focus:!border-primary-purple"
            />
          </div>
          <button
            type="submit"
            phx-disable-with="Creating Account..."
            class="btn-secondary-purple  font-bold text-white h-12 px-12 py-3 md:!mt-9"
          >
            Register
          </button>
        </div>
      </.simple_form>
      <p class="text-secondary-purple font-semibold text-body-md-18 lg:text-body-lg-24 mt-10">
        Already a user? <.link navigate={~p"/users/log_in"} class="underline">Login.</.link>
      </p>
    </div>
    """
  end

  def mount(_params, _session, socket) do
    changeset = Accounts.change_user_registration(%User{})

    socket =
      socket
      |> assign(trigger_submit: false, check_errors: false)
      |> assign_form(changeset)

    {:ok, socket, temporary_assigns: [form: nil]}
  end

  def handle_event("save", %{"user" => user_params}, socket) do
    case Accounts.register_user(user_params) do
      {:ok, user} ->
        {:ok, _} =
          Accounts.deliver_user_confirmation_instructions(
            user,
            &url(~p"/users/confirm/#{&1}")
          )

        # changeset = Accounts.change_user_registration(user)
        # {:noreply, socket |> assign(trigger_submit: true) |> assign_form(changeset)}
        {:noreply, socket |> redirect(to: ~p"/users/confirm/landing")}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, socket |> assign(check_errors: true) |> assign_form(changeset)}
    end
  end

  def handle_event("validate", %{"user" => user_params}, socket) do
    changeset = Accounts.change_user_registration(%User{}, user_params)
    {:noreply, assign_form(socket, Map.put(changeset, :action, :validate))}
  end

  defp assign_form(socket, %Ecto.Changeset{} = changeset) do
    form = to_form(changeset, as: "user")

    if changeset.valid? do
      assign(socket, form: form, check_errors: false)
    else
      assign(socket, form: form)
    end
  end
end
