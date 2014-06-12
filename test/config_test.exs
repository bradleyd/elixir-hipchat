defmodule HipchatConfigTest do
  use ExUnit.Case

  def fixture_path do
    Path.expand("fixtures", __DIR__)
  end

  def fixture_path(extension) do
    Path.join fixture_path, extension
  end

  test "hipchat.config token is not empty" do
    token = Hipchat.Config.load(fixture_path("test_config.exs"))[:hipchat][:token]
    assert token == "1234"
  end

end
