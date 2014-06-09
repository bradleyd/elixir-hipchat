defmodule Hipchat.Rooms do
  alias Hipchat.HTTP
  
  def all do
    rooms_url = "https://api.hipchat.com/v2/room"
    {:ok, rooms} = HTTP.get(rooms_url)
  end

  def message(options) do
    room = options[:room_id]
    message = options[:message]
    room_notification_url = "https://api.hipchat.com/v2/room/#{room}/notification"
    {:ok, payload} = JSON.encode(options)
    HTTP.post(room_notification_url, payload)
  end
end
