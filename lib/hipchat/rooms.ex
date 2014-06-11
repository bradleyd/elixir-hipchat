defmodule Hipchat.Rooms do
  alias Hipchat.HTTP
  
  def all(client) do
    rooms_url = "https://api.hipchat.com/v2/room"
    {code, rooms} = HTTP.get(client, rooms_url)
    Enum.map rooms["items"], fn (k) -> k["name"] end
  end

  def message(client, options) when is_list(options) do
    room = options[:room_id]
    room_notification_url = "https://api.hipchat.com/v2/room/#{room}/notification"
    {code, body} = HTTP.post(client, room_notification_url, Keyword.delete(options, :room_id))
  end
end
