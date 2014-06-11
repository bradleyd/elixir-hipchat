defmodule HipchatTest do
  use ExUnit.Case

  test "hipchat takes token in start" do
    assert Hipchat.start("12345")
  end

  test "Hipchat.configure returns list of token" do
    token = Hipchat.configure([token: "1234"])
    assert token[:token] == "1234"
  end
  
  test "hipchat.rooms.all returns all rooms" do
    client = [token: System.get_env("TOKEN")]
    assert is_list Hipchat.Rooms.all(client)
  end

  test "hipchat.rooms.message sends message to specfic room" do
    resp = Hipchat.Rooms.message([room_id: "test", message: "foobar"])
    assert resp.status_code == 204
  end
end
