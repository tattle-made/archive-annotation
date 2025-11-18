defmodule Kosh.Notifications.Notification do
  @moduledoc """
  Schema for notifications. Each notification represents a single event
  that needs to be delivered to one or more recipients.
  """
  use Ecto.Schema
  import Ecto.Changeset
  alias Kosh.Notifications.Delivery
  alias Kosh.Accounts.User

  @actions [:annotation_created, :annotation_approved, :annotation_deleted]
  @resource_types [:description_annotation, :subjects_annotation]

  schema "notifications" do
    # Who performed the action (user who created the annotation or admin who approved/deleted)
    belongs_to :actor, User, foreign_key: :actor_id

    field :body, :string

    field :title, :string

    # What action was taken
    field :action, Ecto.Enum, values: @actions

    # What resource this notification is about
    field :resource_type, Ecto.Enum, values: @resource_types

    # ID of the resource
    field :resource_id, :integer

    # Additional data about the event (e.g., the annotation details)
    field :changes, :map, default: %{}

    # Tracks when the notification was read by each recipient
    has_many :deliveries, Delivery, on_delete: :delete_all

    timestamps(type: :utc_datetime)
  end

  @required_fields ~w(action resource_type resource_id body title)a
  @optional_fields ~w(actor_id changes)a

  @doc """
  Creates a changeset for a notification.
  """
  def changeset(notification, attrs) do
    notification
    |> cast(attrs, @required_fields ++ @optional_fields)
    |> validate_required(@required_fields)
    |> foreign_key_constraint(:actor_id)
  end
end
