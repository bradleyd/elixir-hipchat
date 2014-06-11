defmodule Hipchat.Config do
  
  def load(path \\ "~/.hipchat") do
    Mix.Config.read!(path)[:hipchat]
  end

  def configure(token) do
    token
  end
  
end
