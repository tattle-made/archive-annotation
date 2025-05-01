defmodule KoshWeb.AccessTokenController do

  use KoshWeb, :controller


  def say_hi(conn,_) do
    conn
    |> json(%{message: "This is to test the authentication of the access token. Hi!!"})
  end
end
