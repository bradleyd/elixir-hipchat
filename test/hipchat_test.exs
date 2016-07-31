defmodule HipchatTest do
  use ExUnit.Case

  test "hipchat takes token in start" do
    assert Hipchat.configure("12345")
  end

  test "Hipchat.configure returns list of token" do
    token = Hipchat.configure([token: "1234"])
    assert token[:token] == "1234"
  end
  
end
