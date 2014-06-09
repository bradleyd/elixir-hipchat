defmodule Hipchat do
  @moduledoc """
    Provides interface for the Hipchat API.
  """
  
  @doc """
    Provides configuration setting.
  """
  defdelegate configure(token), to: Hipchat.Config

  def start(token) do
    {:ok, true}  
  end
end
