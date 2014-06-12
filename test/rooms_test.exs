defmodule HipchatRoomsTest do
  use ExUnit.Case

  setup do
    { :ok, [token: System.get_env("TOKEN")] }
  end

  test "hipchat.rooms.all returns all rooms" do
    client = [token: System.get_env("TOKEN")]
    assert is_list Hipchat.Rooms.all(client)
  end

  # note this expects a room called test
  test "hipchat.rooms.message sends message to specfic room" do
    client = [token: System.get_env("TOKEN")]
    {code, body} = Hipchat.Rooms.message(client, [room_id: "test", message: "foobar"])
    assert code == 204
  end

  test "hipchat.rooms.find returns a room" do
    client = [token: System.get_env("TOKEN")]
    {code, body} = Hipchat.Rooms.find(client, "test")
    assert code
  end
end
