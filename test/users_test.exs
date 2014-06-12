defmodule HipchatUsersTest do
  use ExUnit.Case

  #setup do
    #{ :ok, [token: System.get_env("TOKEN")] }
  #end

  test "hipchat.rooms.all returns all rooms" do
    client = [token: System.get_env("TOKEN")]
    assert is_list Hipchat.Users.all(client)
  end

  test "hipchat.users.find returns a map of a user" do
    client = [token: System.get_env("TOKEN")]
    {code, user} = Hipchat.Users.find(client, "icantpossiblyexistonyouserver")
    assert code == 404
  end

  #test "hipchat.rooms.message sends message to specfic room" do
    #resp = Hipchat.Users.message([room_id: "test", message: "foobar"])
    #assert resp.status_code == 204
  #end
end
