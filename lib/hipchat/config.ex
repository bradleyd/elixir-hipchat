defmodule Hipchat.Config do
  @moduledoc """
  Sets up configuration
  """
  
  @doc """
  Load configuration from a mix config file
  """
  def load(path \\ "~/.hipchat") do
    Mix.Config.read!(path)
  end

  @doc """
  Wrapper that returns token for client
  """
  def configure(token) do
    token
  end
  
end
