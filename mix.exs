defmodule Temple.MixProject do
  use Mix.Project

  def project do
    [
      app: :temple,
      name: "Temple",
      description: "An HTML DSL for Elixir and Phoenix",
      version: "0.6.0-rc.0",
      package: package(),
      elixirc_paths: elixirc_paths(Mix.env()),
      elixir: "~> 1.7",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      source_url: "https://github.com/mhanberg/temple",
      docs: [
        main: "Temple",
        extras: ["README.md"]
      ]
    ]
  end

  # Specifies which paths to compile per environment.
  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_), do: ["lib"]

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  defp package do
    [
      maintainers: ["Mitchell Hanberg"],
      licenses: ["MIT"],
      links: %{github: "https://github.com/mhanberg/temple"},
      exclude_patterns: ["temple.update_mdn_docs.ex"],
      files: ~w(lib priv CHANGELOG.md LICENSE mix.exs README.md .formatter.exs)
    ]
  end

  defp deps do
    [
      {:ex_doc, "~> 0.22.0", only: :dev, runtime: false},
      {:phoenix, ">= 0.0.0", optional: true},
      {:phoenix_html, ">= 0.0.0", only: :test},
      {:phoenix_live_view, ">= 0.0.0", only: :test}
    ]
  end
end
