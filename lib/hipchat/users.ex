defmodule Hipchat.Users do
  @moduledoc """
  Interacts with the user API on hipchat
  """

  alias Hipchat.HTTP
  
  @doc """
  Returns all users (defaults to 100)
  """
  def all(client) do
    users_url = "https://api.hipchat.com/v2/user"
    {_code, users} = HTTP.get(client, users_url)
    Enum.map users["items"], fn (k) -> %{name: k["name"], id: k["id"]} end
  end

  @doc """
  Send a message to a user privately
  """
  def message(client, options) when is_list(options) do
    user = options[:user_id]
    user_notification_url = "https://api.hipchat.com/v2/user/#{user}/message"
    HTTP.post(client, user_notification_url, Keyword.delete(options, :user_id))
  end

  @doc """
  Finds a user and returns code and body
  """
  def find(client, user_id) do
   user_url = "https://api.hipchat.com/v2/user/#{user_id}"
   {code, body} = HTTP.get(client, user_url)
   {code, body}
  end
end
