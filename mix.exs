defmodule Hipchat.Mixfile do
  use Mix.Project

  def project do
    [app: :hipchat,
     version: "0.1.1",
     elixir: "~> 1.0",
     deps: deps]
  end

  # Configuration for the OTP application
  #
  # Type `mix help compile.app` for more information
  def application do
    [applications: [:httpotion]]
  end

  # Dependencies can be hex.pm packages:
  #
  #   {:mydep, "~> 0.3.0"}
  #
  # Or git/path repositories:
  #
  #   {:mydep, git: "https://github.com/elixir-lang/mydep.git", tag: "0.1"}
  #
  # Type `mix help deps` for more examples and options
  defp deps do
    [ 
      {:ibrowse, github: "cmullaparthi/ibrowse", tag: "v4.1.0"},
      {:httpotion, "~> 1.0.0"},
      {:json, "~> 0.3.0"}
    ]
  end
end
