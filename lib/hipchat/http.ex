defmodule Hipchat.HTTP do

  def get(url) do
    response = HTTPotion.get(url, set_headers)
    {_, body} =  parse_body(response.body)
    { response.status_code, body }
  end

  def post(url, payload) do
    response = HTTPotion.post(url, encode_payload(payload), set_headers, [])
    {_, body} =  parse_body(response.body)
    {response.status_code, body}
  end

  # @TODO add real token via :ets?
  def set_headers do
    HashDict.new
    |> authentication()
    |> HashDict.put(:"Accept", "application/json")
    |> HashDict.put(:"content-type", "application/json")
  end

  # @return HashDict
  defp authentication(hash, token) do
    HashDict.put(hash, :"Authorization", "Bearer " <> token)
  end

  defp parse_body(body) do
    case body do
      nil -> nil
      ""  -> {:ok, body}
      body -> body |> JSON.decode 
    end
  end

  def encode_payload(payload) do
    {:ok, json } = JSON.encode(payload)
    json
  end
end
