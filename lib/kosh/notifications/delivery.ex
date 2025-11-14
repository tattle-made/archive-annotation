defmodule Kosh.Notifications.Delivery do
  @moduledoc """
  Schema for notification deliveries. Tracks the delivery status of a notification
  to a specific recipient.
  """
  use Ecto.Schema
  import Ecto.Changeset
  alias Kosh.Notifications.Notification
  alias Kosh.Accounts.User

  @statuses [:unread, :read, :deleted]

  schema "notification_deliveries" do
    # The notification being delivered
    belongs_to :notification, Notification

    # Who should receive this notification
    belongs_to :recipient, User, foreign_key: :recipient_id

    # Delivery status
    field :status, Ecto.Enum, values: @statuses, default: :unread

    # When the recipient viewed the notification
    field :read_at, :utc_datetime

    timestamps(type: :utc_datetime)
  end

  @required_fields ~w(notification_id recipient_id status)a
  @optional_fields ~w(read_at)a

  @doc """
  Creates a changeset for a delivery.
  """
  def changeset(delivery, attrs) do
    delivery
    |> cast(attrs, @required_fields ++ @optional_fields)
    |> validate_required(@required_fields)
    |> foreign_key_constraint(:notification_id)
    |> foreign_key_constraint(:recipient_id)
    |> unique_constraint([:notification_id, :recipient_id],
      name: :notification_deliveries_notification_id_recipient_id_index
    )
  end

  @doc """
  Marks a delivery as read.
  """
  def mark_as_read(delivery) do
    now = NaiveDateTime.utc_now()
    changeset(delivery, %{status: :read, read_at: now})
  end

  @doc """
  Marks a delivery as unread.
  """
  def mark_as_unread(delivery) do
    changeset(delivery, %{status: :unread, read_at: nil})
  end

  @doc """
  Marks a delivery as deleted (soft delete).
  """
  def mark_as_deleted(delivery) do
    changeset(delivery, %{status: :deleted})
  end

  @doc """
  Creates delivery changesets for multiple recipients.
  """
  def create_deliveries(notification_id, recipient_ids) when is_list(recipient_ids) do
    now = NaiveDateTime.utc_now()

    recipient_ids
    |> Enum.uniq()
    |> Enum.map(fn recipient_id ->
      %{
        notification_id: notification_id,
        recipient_id: recipient_id,
        status: :unread,
        inserted_at: now,
        updated_at: now
      }
    end)
  end
end
