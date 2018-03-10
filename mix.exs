defmodule ExGhost.MixProject do
  use Mix.Project

  def project do
    [
      app: :ex_ghost,
      version: "0.1.0",
      elixir: "~> 1.6",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:inets, :ssl, :crypto, :logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:apex, "~> 1.2"},
      {:poison, "~> 3.1"}
    ]
  end
end
