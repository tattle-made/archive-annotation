defmodule Kosh.Workers.AppNotificationWorker do
  use Oban.Worker, queue: :notifications, max_attempts: 3

  alias Kosh.Repo
  alias Kosh.Notifications
  alias Kosh.Notifications.Notification
  alias Kosh.Accounts
  require Logger

  @impl Oban.Worker
  def perform(%Oban.Job{
        args: %{
          "action" => action,
          "resource_type" => resource_type,
          "resource_id" => resource_id,
          "resource_data"=> resource_data,
          "actor_id" => actor_id,
          "recipient_ids" => recipient_ids,
          "changes" => changes
        }
      }) do

    case Notifications.create_notification(%{
      action: String.to_atom(action),
      resource_type: String.to_atom(resource_type),
      resource_id: resource_id,
      resource_data: resource_data,
      actor_id: actor_id,
      recipient_ids: recipient_ids,
      changes: changes
    }) do
      {:ok, _notifications} -> :ok
      {:error, reason} ->
        Logger.error("Failed to create notification: #{inspect(reason)}")
        :error
    end
  end

end
