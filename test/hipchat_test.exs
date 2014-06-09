defmodule HipchatTest do
  use ExUnit.Case

  test "hipchat takes token in start" do
    assert Hipchat.start("12345")
  end

  test "hipchat.rooms.all returns all rooms" do
    assert is_list Hipchat.Rooms.all
  end

  test "hipchat.rooms.message sends message to specfic room" do
    resp = Hipchat.Rooms.message([room_id: "test", message: "foobar"])
    IO.inspect resp
    assert resp.status_code == 204
  end
end
