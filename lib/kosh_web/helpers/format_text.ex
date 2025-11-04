defmodule KoshWeb.Helpers.FormatText do

  @doc """
  Extracts username from the email. Discards the part after "@".
  Ex- For an input "user1@gmail.com", the out put will be "user1".
  """
  @spec format_user_email(String.t()) :: String.t()
  def format_user_email(email) do
    String.split(email, "@") |> Enum.at(0)
  end
end
