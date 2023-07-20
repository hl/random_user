defmodule RandomUser.MixProject do
  use Mix.Project

  def project do
    [
      app: :random_user,
      version: "0.1.0",
      elixir: "~> 1.15",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger],
      mod: {RandomUser.Application, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:tesla, "~> 1.7"},
      {:finch, "~> 0.14.0"},
      {:jason, ">= 1.0.0"},
      {:dialyxir, "~> 1.3", runtime: false, only: [:dev]},
      {:credo, "~> 1.7", runtime: false, only: [:dev]},
      {:mox, "~> 1.0", only: [:test]}
    ]
  end
end
