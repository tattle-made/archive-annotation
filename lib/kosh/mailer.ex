defmodule Kosh.Mailer do
  use Swoosh.Mailer, otp_app: :kosh

  @doc """
  Converts a Swoosh.Email struct into a map for serialization.
  
  This is typically used to prepare email data for storage in Oban jobs.
  """
  @spec to_map(Swoosh.Email.t()) :: map()
  def to_map(%Swoosh.Email{} = email) do
    %{
      "to" => contact_to_map(email.to),
      "from" => contact_to_map(email.from),
      "subject" => email.subject,
      "text_body" => email.text_body
    }
  end

  @doc """
  Reconstructs a Swoosh.Email struct from a map.
  
  This is typically used to convert serialized email data back into a format
  that can be used to send emails via Swoosh.
  """
  @spec from_map(map()) :: Swoosh.Email.t()
  def from_map(args) do
    %{
      "to" => to,
      "from" => from,
      "subject" => subject,
      "text_body" => text_body
    } = args

    opts = [
      to: map_to_contact(to),
      from: map_to_contact(from),
      subject: subject,
      text_body: text_body
      # Add a text_html if needed.
    ]

    Swoosh.Email.new(opts)
  end

  defp contact_to_map(info) when is_list(info) do
    Enum.map(info, &contact_to_map/1)
  end

  defp contact_to_map({name, email}) do
    %{"name" => name, "email" => email}
  end

  defp map_to_contact(info) when is_list(info) do
    Enum.map(info, &map_to_contact/1)
  end

  defp map_to_contact(%{"name" => name, "email" => email}) do
    {name, email}
  end
end
