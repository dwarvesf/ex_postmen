defmodule ExPostmen.Mixfile do
  use Mix.Project

  def project do
    [
      app: :ex_postmen,
      version: "0.1.1",
      elixir: "~> 1.4",
      build_embedded: Mix.env == :prod,
      start_permanent: Mix.env == :prod,
      description: description(),
      package: package(),
      deps: deps(),
      name: "ExPostmen",
      source_url: "https://github.com/dwarvesf/ex_postmen",
    ]
  end

  # Configuration for the OTP application
  #
  # Type "mix help compile.app" for more information
  def application do
    # Specify extra applications you'll use from Erlang/Elixir
    [extra_applications: [:logger, :httpoison]]
  end

  defp description() do
    "Elixir SDK for Postmen API https://postmen.com"
  end

  # Dependencies can be Hex packages:
  #
  #   {:my_dep, "~> 0.3.0"}
  #
  # Or git/path repositories:
  #
  #   {:my_dep, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"}
  #
  # Type "mix help deps" for more examples and options
  defp deps do
    [
      {:ex_doc, ">= 0.0.0", only: :dev},
      {:httpoison, "~> 0.11.1"},
      {:poison, "~> 3.1"},
    ]
  end

  defp package() do
    [
      # This option is only needed when you don't want to use the OTP application name
      name: "ex_postmen",
      # These are the default files included in the package
      files: ["lib", "mix.exs", "README*", "LICENSE*"],
      maintainers: ["Hieu Phan", "Minh Tran Huu", "Quang Le"],
      licenses: ["MIT"],
      links: %{"GitHub" => "https://github.com/dwarvesf/ex_postmen"}
    ]
  end
end
