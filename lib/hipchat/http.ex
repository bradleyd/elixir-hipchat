defmodule Hipchat.HTTP do
  def get(url) do
    response = HTTPotion.get(url, set_headers)
    JSON.decode response.body
  end

  def post(url, payload) do
    HTTPotion.post(url, payload, set_headers, [])
  end

  # @TODO add real token via :ets?
  def set_headers do
    hash = HashDict.new
    |> authentication("1234")
    |> HashDict.put(:"Accept", "application/json")
    |> HashDict.put(:"content-type", "application/json")
  end

  # @return HashDict
  defp authentication(hash, token) do
    HashDict.put(hash, :"Authorization", "Bearer " <> token)
  end

  defp parse_body(body) do
    
  end
end
