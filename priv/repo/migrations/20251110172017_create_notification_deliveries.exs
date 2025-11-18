defmodule Kosh.Repo.Migrations.CreateNotificationDeliveries do
  use Ecto.Migration

  def change do
    # Create status enum type
    execute """
    CREATE TYPE notification_status AS ENUM ('unread', 'read', 'deleted')
    """, """
    DROP TYPE notification_status
    """

    create table(:notification_deliveries) do
      # References
      add :notification_id, references(:notifications, on_delete: :delete_all), null: false
      add :recipient_id, references(:users, on_delete: :delete_all), null: false

      # Status and timestamps
      add :status, :notification_status, null: false, default: "unread"
      add :read_at, :utc_datetime

      timestamps(type: :utc_datetime)
    end

    # Add indexes for better query performance
    create index(:notification_deliveries, [:notification_id])
    create index(:notification_deliveries, [:recipient_id])
    create index(:notification_deliveries, [:status])
    create index(:notification_deliveries, [:read_at])

    # Ensure one delivery per (notification, recipient) pair
    create unique_index(:notification_deliveries, [:notification_id, :recipient_id],
             name: :notification_deliveries_notification_recipient_index)
  end

  # Cleanup function in case of rollback
  def down do
    drop table(:notification_deliveries)
    execute "DROP TYPE notification_status"
  end
end
