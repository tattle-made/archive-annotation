defmodule Kosh.NotificationsTest do
  use ExUnit.Case, async: false

  alias Kosh.Notifications
  alias Kosh.Accounts.User
  alias Kosh.Annotations.DescriptionAnnotation
  alias Kosh.Workers.AppNotificationWorker
  alias Kosh.Notifications.Notification

  # Store module pids to avoid duplicate mocking
  @mocked_modules [
    AppNotificationWorker,
    Oban,
    Kosh.Repo,
    Kosh.Accounts
  ]

  # Setup mocks before all tests
  setup_all do
    # Mock the AppNotificationWorker
    :meck.new(AppNotificationWorker, [:no_link, :passthrough])
    :meck.expect(AppNotificationWorker, :new, fn _args -> %Oban.Job{id: 123} end)

    # Mock Oban
    :meck.new(Oban, [:no_link, :passthrough])
    :meck.expect(Oban, :insert, fn _job -> {:ok, %{id: 123}} end)

    # Mock Kosh.Repo
    :meck.new(Kosh.Repo, [:no_link, :passthrough])
    :meck.expect(Kosh.Repo, :transaction, fn fun -> {:ok, fun.()} end)
    :meck.expect(Kosh.Repo, :insert!, fn changeset -> Ecto.Changeset.apply_changes(changeset) end)
    :meck.expect(Kosh.Repo, :get, fn _, _ -> nil end)
    :meck.expect(Kosh.Repo, :get_by, fn _, _ -> nil end)
    :meck.expect(Kosh.Repo, :all, fn _ -> [] end)
    :meck.expect(Kosh.Repo, :one, fn _ -> nil end)

    :meck.expect(Kosh.Repo, :update, fn changeset ->
      {:ok, Ecto.Changeset.apply_changes(changeset)}
    end)

    :meck.expect(Kosh.Repo, :update_all, fn _, _ -> {1, nil} end)
    :meck.expect(Kosh.Repo, :aggregate, fn _, :count, _ -> 0 end)

    # Mock Kosh.Accounts
    :meck.new(Kosh.Accounts, [:no_link, :passthrough])

    :meck.expect(Kosh.Accounts, :list_users_by_role, fn :admin ->
      [%Kosh.Accounts.User{id: 1, email: "admin@example.com"}]
    end)

    :meck.expect(Kosh.Accounts, :get_user!, fn _id ->
      %Kosh.Accounts.User{id: 2, email: "user@example.com"}
    end)

    # Set up test implementations for repo and accounts
    Application.put_env(:kosh, :repo, Kosh.Repo)
    Application.put_env(:kosh, :accounts, Kosh.Accounts)

    :ok
  end

  # Cleanup mocks after all tests
  setup_all do
    on_exit(fn ->
      :meck.unload(@mocked_modules)
      :ok
    end)

    :ok
  end

  setup do
    # Set up test implementations for repo and accounts
    Application.put_env(:kosh, :repo, Kosh.Repo)
    Application.put_env(:kosh, :accounts, Kosh.Accounts)

    {:ok, %{user: %User{id: 1, email: "test@example.com"}}}
  end

  describe "notify_admins_about_annotation/2" do
    test "enqueues notification for admins", %{user: user} do
      annotation = %DescriptionAnnotation{
        id: 1,
        description: "Test description",
        user_id: 2,
        file: %{id: 1, title: "Test File"}
      }

      assert {:ok, _job} = Kosh.Notifications.notify_admins_about_annotation(annotation, user.id)

      # Verify the worker was called with expected arguments
      # assert :meck.called(
      #   AppNotificationWorker,
      #   :new,
      #   :_
      # )
      # :meck.history(AppNotificationWorker) |> IO.inspect(label: "AppNotificationWorker calls")

      assert :meck.called(
               AppNotificationWorker,
               :new,
               [
                 %{
                   action: "annotation_created",
                   resource_type: :description_annotation,
                   resource_id: 1,
                   resource_data: %{description: "Test description"},
                   actor_id: 1,
                   recipient_ids: [1],
                   changes: %{status: "annotation_created"}
                 }
               ]
             )
    end
  end

  describe "notify_user_about_annotation_status/3" do
    test "enqueues approval notification", %{user: user} do
      annotation = %DescriptionAnnotation{
        id: 1,
        description: "Test description",
        user_id: 2,
        file: %{id: 1, title: "Test File"}
      }

      assert {:ok, _job} =
               Kosh.Notifications.notify_user_about_annotation_status(
                 annotation,
                 user.id,
                 :annotation_approved
               )

      # assert :meck.called(
      #          AppNotificationWorker,
      #          :new,
      #          :_
      #        )
      # :meck.history(AppNotificationWorker) |> IO.inspect(label: "AppNotificationWorker calls")
      assert :meck.called(
               AppNotificationWorker,
               :new,
               [
                 %{
                   action: "annotation_approved",
                   resource_type: :description_annotation,
                   resource_id: 1,
                   resource_data: %{description: "Test description"},
                   actor_id: 1,
                   recipient_ids: [2],
                   changes: %{status: "annotation_approved"}
                 }
               ]
             )
    end

    test "enqueues deletion notification", %{user: user} do
      annotation = %DescriptionAnnotation{
        id: 1,
        description: "Test description",
        user_id: 2,
        file: %{id: 1, title: "Test File"}
      }

      assert {:ok, _job} =
               Kosh.Notifications.notify_user_about_annotation_status(
                 annotation,
                 user.id,
                 :annotation_deleted
               )

      # assert :meck.called(
      #          AppNotificationWorker,
      #          :new,
      #          :_
      #        )
      assert :meck.called(
               AppNotificationWorker,
               :new,
               [
                 %{
                   action: "annotation_deleted",
                   resource_type: :description_annotation,
                   resource_id: 1,
                   resource_data: %{description: "Test description"},
                   actor_id: 1,
                   recipient_ids: [2],
                   changes: %{status: "annotation_deleted"}
                 }
               ]
             )
    end
  end
end
