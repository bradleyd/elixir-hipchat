defmodule Hipchat.HTTP do
  @moduledoc """
  Wrapper for all HTTP calls
  """

  @doc """
  Performs GET request
  """
  def get(client, url) do
    IO.inspect set_headers(client)
    response = HTTPotion.get(url, set_headers(client))
    {_, body} =  parse_body(response.body)
    { response.status_code, body }
  end

  @doc """
  Performs POST request
  """
  def post(client, url, payload) do
    response = HTTPotion.post(url, encode_payload(payload), set_headers(client), [])
    {_, body} =  parse_body(response.body)
    {response.status_code, body}
  end

  @doc """
  Builds headers
  """
  def set_headers(client) do
    HashDict.new
    |> authentication(client[:token])
    |> HashDict.put(:"Accept", "application/json")
    |> HashDict.put(:"content-type", "application/json")
  end

  defp authentication(hash, token) do
    HashDict.put(hash, :"Authorization", "Bearer " <> token)
  end

  @doc """
  Encode the key value payload to JSON
  """
  def encode_payload(payload) do
    {:ok, json } = JSON.encode(payload)
    json
  end

  defp parse_body(body) do
    case body do
      nil -> nil
      ""  -> {:ok, body}
      body -> body |> JSON.decode 
    end
  end
end
