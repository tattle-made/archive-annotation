defmodule KoshWeb.UserLoginLive do
  use KoshWeb, :live_view

  def render(assigns) do
    ~H"""
    <div class="mt-10 w-full">
      <h1 class="!text-primary-purple font-bold">
        LOGIN
      </h1>

      <.simple_form
        for={@form}
        id="login_form"
        action={~p"/users/log_in"}
        phx-update="ignore"
        class="w-full"
      >
        <div class="flex justify-between !w-full lg:!w-[75%] xl:!w-[60%]">
          <div class="flex w-auto">
            <.input field={@form[:email]} type="email" label="Email" required
            class="!mr-5 !w-80 h-12 focus:!border-primary-purple" label_class="!text-primary-purple !font-bold !text-body-md-18" />
            <.input field={@form[:password]} type="password" label="Password" required label_class="!text-primary-purple !font-bold !text-body-md-18 " class=" !w-80 h-12 focus:!border-primary-purple" />
          </div>
          <%!-- <:actions> --%>
            <button type="submit" phx-disable-with="Logging in..." class="btn-secondary-purple  font-bold text-white h-12 px-12 py-3 mt-8">
              Login
            </button>
          <%!-- </:actions> --%>
        </div>
        <div class="flex justify-between !w-full lg:!w-[75%] xl:!w-[60%]">
        <span class="text-secondary-purple text-caption-14">By using this system, you agree to comply with the Milli’s security requirements</span>
        <.link href={~p"/users/reset_password"} class="text-sm font-semibold text-secondary-purple underline">
            Forgot your password?
          </.link>
        </div>

        <:actions>
          <.input field={@form[:remember_me]} type="checkbox" label="Keep me logged in" label_class="!text-primary-purple !text-caption-14" class="!text-primary-purple" />

        </:actions>
      </.simple_form>
      <p class="text-secondary-purple font-semibold text-body-lg-24 mt-10">Not a user? <.link navigate= {~p"/users/register"} class="underline">Register to Annotate.</.link></p>
    </div>
    """
  end

  def mount(_params, _session, socket) do
    email = Phoenix.Flash.get(socket.assigns.flash, :email)
    form = to_form(%{"email" => email}, as: "user")
    {:ok, assign(socket, form: form), temporary_assigns: [form: form]}
  end
end
