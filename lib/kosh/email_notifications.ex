defmodule Kosh.EmailNotifications do
  import Swoosh.Email
  alias Kosh.Annotations.SubjectsAnnotation
  alias Kosh.Annotations.DescriptionAnnotation
  alias Kosh.Accounts
  alias Kosh.Mailer
  alias KoshWeb.Endpoint
  alias Kosh.Accounts.User

  # runtime-resolved modules so tests can inject stubs
  defp repo, do: Application.get_env(:kosh, :repo, Kosh.Repo)
  defp accounts, do: Application.get_env(:kosh, :accounts, Kosh.Accounts)

  defp format_subjects(subjects, content_fn \\ & &1) do
    subjects
    |> Enum.map(fn sub -> "• #{content_fn.(sub)}" end)
    |> Enum.join("\n        ")
  end

  @doc false
  defp base_url do
    KoshWeb.Endpoint.url()
  end

  defp deliver(recipient, subject, body) do
    email =
      new()
      |> to(recipient)
      |> from({"Kosh", "admin@tattle.co.in"})
      |> subject(subject)
      |> text_body(body)

    with email_map <- Mailer.to_map(email),
         {:ok, _job} <- enqueue_worker(email_map) do
      {:ok, email}
    end
  end

  defp enqueue_worker(email) do
    %{email: email}
    |> Kosh.Workers.EmailNotificationWorker.new()
    |> Oban.insert()
  end

  @doc """
  Deliver Notification about Annotation creation
  """

  def deliver_admin_notifications(%User{} = actor, %DescriptionAnnotation{} = annotation) do
    annotation = repo().preload(annotation, file: :collection)

    with all_admins <- accounts().list_users_by_role(:admin) do
      Enum.each(all_admins, fn admin ->
        deliver(admin.email, "New Annotation on Anno-Milli", """
        Hi #{admin.email},

        A new description annotation has been added to Anno-Milli. Below are the details of the added annotation.

        Collection: #{annotation.file.collection.title}
        File: #{annotation.file.title}
        Created By: #{actor.email}
        Annotation ID: #{annotation.id}
        Annotation Content:
        #{annotation.description}

        Click here to redirect to the Anno-Milli's Admin Annotation Review Page: #{base_url()}/admin/all-annotations

        """)
      end)
    end
  end

  def deliver_admin_notifications(%User{} = actor, %SubjectsAnnotation{} = annotation) do
    annotation = repo().preload(annotation, [:subjects, file: :collection])

    with all_admins <- accounts().list_users_by_role(:admin) do
      Enum.each(all_admins, fn admin ->
        deliver(admin.email, "New Annotation on Anno-Milli", """
        Hi #{admin.email},

        A new Subjects Annotation has been added to Anno-Milli. Below are the details of the added annotation.

        Collection: #{annotation.file.collection.title}
        File: #{annotation.file.title}
        Created By: #{actor.email}
        Annotation ID: #{annotation.id}
        Annotation Content:
        #{format_subjects(annotation.new_subjects)}\n        #{format_subjects(annotation.subjects, & &1.content)}

        Click here to redirect to the Anno-Milli's Admin Annotation Review Page: #{base_url()}/admin/all-annotations

        """)
      end)
    end
  end

  def deliver_admin_notifications(
        %User{} = actor,
        %DescriptionAnnotation{} = desc_annotation,
        %SubjectsAnnotation{} = subj_annotation
      ) do
    desc_annotation = repo().preload(desc_annotation, file: :collection)
    subj_annotation = repo().preload(subj_annotation, [:subjects, file: :collection])

    with all_admins <- accounts().list_users_by_role(:admin) do
      Enum.each(all_admins, fn admin ->
        deliver(admin.email, "2 New Annotations on Anno-Milli", """
        Hi #{admin.email},

        A new Subject Annotation and a new Description Annotation have been added to Anno-Milli. Below are the details:

        Collection: #{desc_annotation.file.collection.title}
        File: #{desc_annotation.file.title}
        Created By: #{actor.email}
        Annotation Details:
        Description Annotation ID: #{desc_annotation.id}
        Description Annotation Content:
        #{desc_annotation.description}

        Subjects Annotation ID: #{subj_annotation.id}
        Subjects:
        #{format_subjects(subj_annotation.new_subjects)}\n        #{format_subjects(subj_annotation.subjects, & &1.content)}

        Click here to redirect to the Anno-Milli's Admin Annotation Review Page: #{base_url()}/admin/all-annotations

        """)
      end)
    end
  end

  @doc """
  Delivers the Annotation Rejection Email Notification to the user (annotation's creator)
  """
  def deliver_rejected_annotation_notification(
        %User{} = recipient,
        %DescriptionAnnotation{} = annotation
      ) do
    annotation = repo().preload(annotation, file: :collection)

    deliver(recipient.email, "Annotation Discarded - Anno-Milli", """
    Hello #{recipient.email},

    We're writing to inform you that your description annotation has been reviewed and discarded by our moderation team. Here are the details of the affected annotation:

    Collection: #{annotation.file.collection.title}
    File: #{annotation.file.title}
    Annotation ID: #{annotation.id}
    Annotation Content:
    #{annotation.description}

    Please note that this annotation is no longer visible on the platform.

    View your other annotation contributions: #{base_url()}/annotation/my-annotations

    Best regards,
    The Anno-Milli Team

    """)
  end

  def deliver_rejected_annotation_notification(
        %User{} = recipient,
        %SubjectsAnnotation{} = annotation
      ) do
    annotation = repo().preload(annotation, [:subjects, file: :collection])

    deliver(recipient.email, "Annotation Discarded - Anno-Milli", """
    Hello #{recipient.email},

    We're writing to inform you that your subjects annotation has been reviewed and discarded by our moderation team. Here are the details of the affected annotation:

    Collection: #{annotation.file.collection.title}
    File: #{annotation.file.title}
    Annotation ID: #{annotation.id}
    Annotation Content:
    #{format_subjects(annotation.new_subjects)}\n        #{format_subjects(annotation.subjects, & &1.content)}

    Please note that this annotation is no longer visible on the platform.

    View your other annotation contributions: #{base_url()}/annotation/my-annotations

    Best regards,
    The Anno-Milli Team

    """)
  end

  @doc """
  Delivers the Annotation Approval Email Notification to the user (annotation's creator)
  """
  def deliver_approved_annotation_notification(
        %User{} = recipient,
        %DescriptionAnnotation{} = annotation
      ) do
    annotation = repo().preload(annotation, file: :collection)

    deliver(recipient.email, "Annotation Approved - Anno-Milli", """
    Hello #{recipient.email},

    Your description annotation has been approved by the moderation team. Approved annotation details:

    Collection: #{annotation.file.collection.title}
    File: #{annotation.file.title}
    Annotation ID: #{annotation.id}
    Annotation:
    #{annotation.description}

    This annotation is now visible on the File display page.

    View your contribution: #{base_url()}/annotation/display?uri=#{annotation.file.uri}

    Best regards,
    The Anno-Milli Team
    """)
  end

  def deliver_approved_annotation_notification(
        %User{} = recipient,
        %SubjectsAnnotation{} = annotation
      ) do
    annotation = repo().preload(annotation, [:subjects, file: :collection])

    deliver(recipient.email, "Annotation Approved - Anno-Milli", """
    Hello #{recipient.email},

    Your subjects annotation has been approved by the moderation team. Approved annotation details:

    Collection: #{annotation.file.collection.title}
    File: #{annotation.file.title}
    Annotation ID: #{annotation.id}
    Annotation Content:
    #{format_subjects(annotation.new_subjects)}\n#{format_subjects(annotation.subjects, & &1.content)}

    This annotation is now visible on the File display page.

    View your contribution: #{base_url()}/annotation/display?uri=#{annotation.file.uri}

    Best regards,
    The Anno-Milli Team
    """)
  end
end
