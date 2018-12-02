defmodule LaunchEditor.MixProject do
  use Mix.Project

  def project do
    [
      app: :launcheditor,
      version: "0.1.0",
      elixir: "~> 1.4",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      docs: docs(),
      description: description(),
      package: package(),
      name: "LaunchEditor",
      source_url: "https://github.com/nerdslabs/launcheditor"
    ]
  end

  defp docs do
    [
      extras: ["README.md"],
      main: "readme"
    ]
  end

  def application do
    []
  end

  defp deps do
    [
      {:ex_doc, "~> 0.12", only: [:dev, :test, :docs]},
      {:plug, "~> 1.0"}
    ]
  end

  defp description() do
    "Open file in current working editor from Elixir."
  end

  defp package() do
    [
      name: "launcheditor",
      files: ["lib", "mix.exs", "README*", "LICENSE*", ".formatter.exs"],
      licenses: ["MIT"],
      links: %{"GitHub" => "https://github.com/nerdslabs/launcheditor"}
    ]
  end
end
