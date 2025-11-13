defmodule Kosh.Workers.EmailNotificationWorker do
  require Logger
  use Oban.Worker, queue: :notification_mailer, max_attempts: 5

  alias Kosh.Mailer

  @impl Oban.Worker
  def perform(%Oban.Job{id: job_id, args: %{"email" => email_args}}) do
    case Mailer.from_map(email_args) do
      %Swoosh.Email{} = email ->
        case Mailer.deliver(email) do
          {:ok, _metadata} -> :ok
          error -> 
            Logger.error("Failed to send email for job #{job_id}: #{inspect(error)}")
            {:error, :delivery_failed}
        end
      error ->
        Logger.error("Failed to create email for job #{job_id}: #{inspect(error)}")
        {:error, :invalid_email}
    end
  end
end
