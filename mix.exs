defmodule Sakugadaily.MixProject do
  use Mix.Project

  def project do
    [
      app: :sakugadaily,
      version: "0.1.0",
      elixir: "~> 1.8",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      mod: {Sakugadaily.Application, []},
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      # {:dep_from_hexpm, "~> 0.3.0"},
      # {:dep_from_git, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"},
      {:floki, "~> 0.21.0"},
      {:neuron, "~> 1.2.0"},
      {:httpoison, "~> 1.5"},
      {:credo, "~> 1.1", only: [:dev, :test], runtime: false}
    ]
  end
end
