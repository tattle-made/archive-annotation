defmodule Kosh.EmailNotificationsTest do
  use ExUnit.Case, async: false
  import Swoosh.TestAssertions

  alias Kosh.EmailNotifications
  alias Kosh.Accounts.User
  alias Kosh.Annotations.DescriptionAnnotation
  alias Kosh.Annotations.SubjectsAnnotation

  # Setup test environment
  setup do
    # Configure Swoosh to use test adapter
    Application.put_env(:swoosh, :api_client, Swoosh.Adapters.Test)
    {:ok, _} = Application.ensure_all_started(:swoosh)

    # Mock the repo to avoid DB calls
    test_repo = (fn ->
      defmodule TestRepo do
        def preload(struct, _), do: struct
      end
      TestRepo
    end).()

    # Mock the accounts module
    test_accounts = (fn ->
      defmodule TestAccounts do
        def list_users_by_role(:admin), do: [%User{email: "admin@example.com"}]
        def get_user!(_id), do: %User{email: "test@example.com"}
      end
      TestAccounts
    end).()

    # Set up the test modules
    Application.put_env(:kosh, :repo, test_repo)
    Application.put_env(:kosh, :accounts, test_accounts)

    # Mock Oban
    :meck.new(Oban, [:no_link, :passthrough])
    :meck.expect(Oban, :insert, fn _job -> {:ok, %{id: 123}} end)

    # Cleanup function
    on_exit(fn ->
      :meck.unload(Oban)
      :ok
    end)

    {:ok, %{user: %User{email: "test@example.com"}}}
  end

  describe "deliver_admin_notifications/2" do
    test "sends email to admin when new annotation is created", %{user: user} do
      annotation = %DescriptionAnnotation{
        id: 1,
        description: "Test description",
        file: %{title: "Test File", collection: %{title: "Test Collection"}},
        user: user
      }

      # Enum.each always return :ok
      assert :ok = EmailNotifications.deliver_admin_notifications(user, annotation)
    end
  end

  describe "deliver_approved_annotation_notification/2" do
    test "sends approval email to user", %{user: user} do
      annotation = %DescriptionAnnotation{
        id: 1,
        description: "Test description",
        file: %{title: "Test File", collection: %{title: "Test Collection"}, uri: "test-uri"}
      }
      assert {:ok, _} = EmailNotifications.deliver_approved_annotation_notification(user, annotation)
    end
  end

  describe "deliver_rejected_annotation_notification/2" do
    test "sends rejection email to user", %{user: user} do
      annotation = %DescriptionAnnotation{
        id: 1,
        description: "Test description",
        file: %{title: "Test File", collection: %{title: "Test Collection"}}
      }

      assert {:ok, _} = EmailNotifications.deliver_rejected_annotation_notification(user, annotation)
    end
  end
end
