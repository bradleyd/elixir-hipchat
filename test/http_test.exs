defmodule HipchatHTTPTest do
  use ExUnit.Case

  test "hipchat.http gets url" do
    response = Hipchat.HTTP.get("http://httpbin.org/")
    assert response.status_code == 200
  end

  test "hipchat.http posts to url" do
    response = Hipchat.HTTP.post("http://httpbin.org/post", "foo")
    assert response.status_code == 200
  end

  test "hipcaht.http.set_headers" do
    header = Hipchat.HTTP.set_headers
    assert header[:"content-type"] == "application/json"
  end
end
