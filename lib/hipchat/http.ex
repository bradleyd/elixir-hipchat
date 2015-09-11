defmodule Hipchat.HTTP do
  @moduledoc """
  Wrapper for all HTTP calls
  """

  @doc """
  Performs GET request
  """
  def get(client, url) do
    IO.inspect set_headers(client)
    response = HTTPotion.get(url, [headers: set_headers(client)])
    {_, body} =  parse_body(response.body)
    { response.status_code, body }
  end

  @doc """
  Performs POST request
  """
  def post(client, url, payload) do
    response = HTTPotion.post(url, [body: encode_payload(payload), headers: set_headers(client)])
    {_, body} =  parse_body(response.body)
    {response.status_code, body}
  end

  @doc """
  Builds headers
  """
  def set_headers(client) do
    ["Authorization": "Bearer " <> to_string(Dict.get(client, :token)),
     "Accept": "application/json",
     "content-type": "application/json"]
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
