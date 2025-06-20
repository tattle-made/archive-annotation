defmodule KoshWeb.NavComponent do
  use KoshWeb, :live_component
  # use KoshWeb, :live_view

  def mount(_params, _session, socket) do
    # uri = get_connect_info(socket, :uri)
    # path = uri && uri.path
    # {:ok, assign(socket, :current_path, path)}
    {:ok, socket}
  end

  def update(new_assigns, socket) do
    socket = assign(socket, new_assigns)
    # IO.inspect(socket, label: "socket from update")

    {:ok, socket}
  end

  def render(assigns) do
    ~H"""
    <div>
      <% nav_items = [
        {"About", ~p"/about"},
        {"Ethics-Law", ~p"/ethics-law"},
        {"Milli Sessions", ~p"/milli-sessions"},
        {"Annotation Tool", ~p"/"},
        {"Support", ~p"/support"},
        {"Contact", ~p"/contact"},
        {"Join Us", ~p"/join-us"}
      ] %>
      <% nav_items_account_loggedin = [
        {"MY ACCOUNT", ~p"/users/settings"},
        {"MY ANNOTATIONS", ~p"/annotation/my-annotations"}
      ] %>
      <% nav_items_account_loggedout = [
        {"LOGIN", ~p"/users/log_in"},
        {"REGISTER", ~p"/users/register"}
      ] %>
      <nav
        x-data="{ open: false }"
        class="relative z-10 bg-[#E6E9F5] px-4 py-4 sm:px-6 xl:px-32 xl:py-12 flex items-center justify-between"
      >
        <!-- Logo -->
        <.link navigate={~p"/"}>
          <div class="flex-shrink-0">
            <img src={~p"/images/logo.svg"} alt="App Logo" />
          </div>
        </.link>
        <!-- Hamburger button (visible < lg) -->
        <button
          @click="open = !open"
          class="lg:hidden inline-flex items-center justify-center p-2 rounded-md text-primary-purple hover:bg-gray-200 focus:outline-none focus:ring-2 focus:ring-inset focus:ring-primary-purple"
          aria-label="Toggle menu"
        >
          <svg
            x-show="!open"
            xmlns="http://www.w3.org/2000/svg"
            class="h-6 w-6"
            fill="none"
            viewBox="0 0 24 24"
            stroke="currentColor"
          >
            <path
              stroke-linecap="round"
              stroke-linejoin="round"
              stroke-width="2"
              d="M4 6h16M4 12h16M4 18h16"
            />
          </svg>
          <svg
            x-show="open"
            xmlns="http://www.w3.org/2000/svg"
            class="h-6 w-6"
            fill="none"
            viewBox="0 0 24 24"
            stroke="currentColor"
          >
            <path
              stroke-linecap="round"
              stroke-linejoin="round"
              stroke-width="2"
              d="M6 18L18 6M6 6l12 12"
            />
          </svg>
        </button>
        <!-- Desktop menu (>= md) -->
        <div class="hidden lg:flex flex-col lg:gap-6  space-x-12">
          <!-- Auth Links -->
          <ul class="flex items-center space-x-3 lg:justify-end">
            <%= if @current_user do %>
              <%= for {{label, path}, idx} <- nav_items_account_loggedin |> Enum.with_index() do %>
                <li class="flex items-center">
                  <%= if idx > 0 do %>
                    <span class={"px-3 text-primary-purple " <> (if @current_path == path, do: "font-regular", else: "font-bold")}>
                      |
                    </span>
                  <% end %>
                  <.link
                    navigate={path}
                    class={"text-primary-purple " <> (if @current_path == path, do: "font-regular", else: "font-bold")}
                  >
                    <%= label %>
                  </.link>
                </li>
              <% end %>
              <li class="flex items-center">
                <span class="px-3 text-primary-purple font-bold">|</span>
                <.link
                  href={~p"/users/log_out"}
                  method="delete"
                  class="text-primary-purple font-bold text-body-sm-16"
                >
                  LOGOUT
                </.link>
              </li>
            <% else %>
              <%= for {{label, path}, idx} <- nav_items_account_loggedout |> Enum.with_index() do %>
                <li class="flex items-center">
                  <%= if idx > 0 do %>
                    <span class="px-3 text-primary-purple font-bold">|</span>
                  <% end %>
                  <.link
                    navigate={path}
                    class={"text-primary-purple text-body-sm-16  " <>
                         (if @current_path == path, do: "font-regular", else: "font-bold")}
                  >
                    <%= label %>
                  </.link>
                </li>
              <% end %>
            <% end %>
          </ul>
          <!-- App Links -->
          <ul class="flex lg:space-x-4 xl:space-x-6">
            <%= for {label, path} <- nav_items do %>
              <li>
                <.link
                  navigate={path}
                  class={
                      "text-primary-purple font-semibold text-body-sm-16 p-3 " <>
                      (
                        if (label == "Annotation Tool" and
                            (@current_path == "/" or String.starts_with?(@current_path, "/annotation"))) or
                           (@current_path == path and label != "Annotation Tool"),
                          do: "border-b-4 border-primary-purple",
                          else: ""
                        )
                    }
                >
                  <%= label %>
                </.link>
              </li>
            <% end %>
            <%= if @current_user.role == :admin do %>
              <li>
                <.link
                  navigate={~p"/admin"}
                  class={
                      "text-primary-purple font-semibold text-body-sm-16 p-3 " <>
                      (
                        if (@current_path == "/admin" or String.starts_with?(@current_path, "/admin")),
                          do: "border-b-4 border-primary-purple",
                          else: ""
                        )
                    }
                >
                  Admin
                </.link>
              </li>
            <% end %>
          </ul>
        </div>
        <!-- Mobile menu (visible <= md) -->
        <div
          x-show="open"
          x-transition
          @click="open = false"
          class="lg:hidden absolute top-full left-0 w-full bg-[#E6E9F5] shadow-lg"
        >
          <div class="px-4 py-5 space-y-3">
            <!-- Auth Links -->
            <ul class="flex flex-col space-y-2">
              <%= if @current_user do %>
                <%= for {{label, path}, _} <- nav_items_account_loggedin do %>
                  <li>
                    <.link navigate={path} class="block text-primary-purple font-bold text-body-sm-16">
                      <%= label %>
                    </.link>
                  </li>
                <% end %>
                <li>
                  <.link
                    href={~p"/users/log_out"}
                    method="delete"
                    class="block text-primary-purple font-bold text-body-sm-16"
                  >
                    LOGOUT
                  </.link>
                </li>
              <% else %>
                <%= for {label, path} <- nav_items_account_loggedout do %>
                  <li>
                    <.link navigate={path} class="block text-primary-purple font-bold text-body-sm-16">
                      <%= label %>
                    </.link>
                  </li>
                <% end %>
              <% end %>
            </ul>

            <hr class="border-gray-300" />
            <!-- App Links -->
            <ul class="flex flex-col space-y-2">
              <%= for {label, path} <- nav_items do %>
                <li>
                  <.link
                    navigate={path}
                    class="block text-primary-purple font-semibold text-body-sm-16 py-2"
                  >
                    <%= label %>
                  </.link>
                </li>
              <% end %>
            </ul>
          </div>
        </div>
      </nav>
    </div>
    """
  end
end
