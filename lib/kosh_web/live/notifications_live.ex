defmodule KoshWeb.NotificationsLive do
  use KoshWeb, :live_view
  alias Kosh.Notifications
  alias Kosh.Repo
  import Ecto.Query
  import Ecto.Changeset

  @per_page 20

  def mount(_params, _session, socket) do
    current_user = socket.assigns.current_user

    # Initial page is 1
    page = 1

    # Get paginated notifications for the current user using the context function
    {notifications, has_more} = Notifications.list_notifications(current_user.id, page, @per_page)

    # Get total unread count
    unread_count = Notifications.count_unread_notifications(current_user.id)

    socket =
      assign(socket,
        page_title: "Notifications",
        notifications: notifications,
        unread_count: unread_count,
        page: page,
        has_more: has_more,
        loading: false
      )

    {:ok, socket}
  end

  def handle_event("mark_as_read", %{"id" => id}, socket) do
    notification_id = String.to_integer(id)
    current_notification = Enum.find(socket.assigns.notifications, &(&1.id == notification_id))

    # Toggle the read status
    new_status = if current_notification.status == :unread, do: :read, else: :unread

    # Update in database
    case Kosh.Notifications.update_delivery_status(
           notification_id,
           socket.assigns.current_user.id,
           new_status
         ) do
      {:ok, _} ->
        # Update the UI
        {updated_notifications, unread_delta} =
          socket.assigns.notifications
          |> Enum.map_reduce(0, fn item, delta ->
            if item.id == notification_id do
              new_delta = if new_status == :read, do: -1, else: 1
              {%{item | status: new_status}, delta + new_delta}
            else
              {item, delta}
            end
          end)

        # Update unread count, ensuring it doesn't go below 0
        new_unread_count = max(0, socket.assigns.unread_count + unread_delta)

        {:noreply,
         socket
         |> assign(:notifications, updated_notifications)
         |> assign(:unread_count, new_unread_count)}

      {:error, _} ->
        {:noreply, put_flash(socket, :error, "Failed to update notification status")}
    end
  end

  def handle_event("mark_all_as_read", _, socket) do
    current_user = socket.assigns.current_user

    # Mark all as read in the database
    case Kosh.Notifications.mark_all_as_read(current_user.id) do
      {:ok, _} ->
        # Update all notifications to read in the UI
        updated_notifications =
          socket.assigns.notifications
          |> Enum.map(fn item -> %{item | status: :read} end)

        {:noreply,
         socket
         |> assign(:notifications, updated_notifications)
         |> assign(:unread_count, 0)
         |> put_flash(:info, "All notifications marked as read")}

      {:error, _} ->
        {:noreply, put_flash(socket, :error, "Failed to mark all notifications as read")}
    end
  end

  def handle_event("load_more", _, socket) do
    next_page = socket.assigns.page + 1

    # Show loading state
    socket = assign(socket, loading: true)

    # Get next page of notifications using the context function
    {new_notifications, has_more} =
      Notifications.list_notifications(socket.assigns.current_user.id, next_page, @per_page)

    # Append new notifications to existing ones
    updated_notifications = socket.assigns.notifications ++ new_notifications

    {:noreply,
     socket
     |> assign(:notifications, updated_notifications)
     |> assign(:page, next_page)
     |> assign(:has_more, has_more)
     |> assign(:loading, false)}
  end

  def render(assigns) do
    ~H"""
    <div class="max-w-2xl mx-auto p-4">
      <div class="flex flex-col sm:flex-row justify-between items-start sm:items-center mb-6 gap-4">
        <div class="flex items-center gap-4">
          <h1 class="text-2xl font-bold">Notifications</h1>
          <span class="bg-blue-100 text-blue-800 text-sm font-semibold px-2.5 py-0.5 rounded">
            <%= @unread_count %> unread
          </span>
        </div>
        <%= if @unread_count > 0 do %>
          <button
            phx-click="mark_all_as_read"
            class="inline-flex items-center px-3 py-1.5 border border-transparent text-sm font-medium rounded-md shadow-sm text-white bg-blue-600 hover:bg-blue-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-blue-500"
          >
            <svg class="-ml-1 mr-2 h-4 w-4" fill="none" viewBox="0 0 24 24" stroke="currentColor">
              <path
                stroke-linecap="round"
                stroke-linejoin="round"
                stroke-width="2"
                d="M5 13l4 4L19 7"
              />
            </svg>
            Mark all as read
          </button>
        <% end %>
      </div>

      <div class="space-y-4">
        <%= for item <- @notifications do %>
          <div
            class={[
              "p-4 rounded shadow cursor-pointer transition-colors duration-150",
              item.status == :unread && "bg-blue-50 hover:bg-blue-100 border-l-4 border-blue-500",
              item.status == :read && "bg-white hover:bg-gray-50"
            ]}
            phx-click="mark_as_read"
            phx-value-id={item.id}
          >
            <div class="flex justify-between items-start">
              <div>
                <h3 class="font-semibold text-lg flex items-center gap-2">
                  <%= item.notification.title %>
                  <%= if item.notification.action == :annotation_created do %>
                    <span class="text-xs bg-yellow-100 text-yellow-800 px-2 py-0.5 rounded-full">
                      Admin
                    </span>
                  <% end %>
                </h3>
                <p class="text-gray-600 mt-1"><%= item.notification.body %></p>
                <p class="text-sm text-gray-400 mt-2">
                  <%= Timex.Timezone.convert(item.inserted_at, "Asia/Kolkata")
                  |> Timex.format!("{Mshort} {D}, {YYYY} at {h12}:{m} {AM} IST")
                  |> String.replace("am", "AM")
                  |> String.replace("pm", "PM") %>
                </p>
              </div>
              <%= if item.status == :unread do %>
                <span class="ml-2 inline-flex items-center px-2.5 py-0.5 rounded-full text-xs font-medium bg-blue-100 text-blue-800">
                  New
                </span>
              <% end %>
            </div>
          </div>
        <% end %>

        <%= if Enum.empty?(@notifications) do %>
          <p class="text-gray-500 text-center py-8">No notifications yet.</p>
        <% end %>

        <%= if @has_more do %>
          <div class="mt-6 text-center">
            <button
              phx-click="load_more"
              phx-disable-with="Loading..."
              class={"inline-flex items-center px-4 py-2 border border-transparent text-sm font-medium rounded-md shadow-sm text-white bg-blue-600 hover:bg-blue-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-blue-500 #{if @loading, do: "opacity-50 cursor-not-allowed", else: ""}"}
              disabled={@loading}
            >
              <%= if @loading do %>
                <svg
                  class="animate-spin -ml-1 mr-2 h-4 w-4 text-white"
                  xmlns="http://www.w3.org/2000/svg"
                  fill="none"
                  viewBox="0 0 24 24"
                >
                  <circle
                    class="opacity-25"
                    cx="12"
                    cy="12"
                    r="10"
                    stroke="currentColor"
                    stroke-width="4"
                  >
                  </circle>
                  <path
                    class="opacity-75"
                    fill="currentColor"
                    d="M4 12a8 8 0 018-8V0C5.373 0 0 5.373 0 12h4zm2 5.291A7.962 7.962 0 014 12H0c0 3.042 1.135 5.824 3 7.938l3-2.647z"
                  >
                  </path>
                </svg>
                Loading...
              <% else %>
                Load More Notifications
              <% end %>
            </button>
          </div>
        <% end %>
      </div>
    </div>
    """
  end
end
