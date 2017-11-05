defmodule OrderInvariantCompare.Mixfile do
  use Mix.Project

  def project do
    [
      app: :order_invariant_compare,
      version: "1.0.0",
      elixir: "~> 1.3",
      build_embedded: Mix.env == :prod,
      start_permanent: Mix.env == :prod,
      description: description(),
      package: package(),
      deps: deps(),
      name: "OrderInvariantCompare",
      source_url: "https://github.com/mbramson/order_invariant_compare"
    ]
  end

  def application do
    [
      extra_applications: [:logger]
    ]
  end

  defp deps do
    [
      {:ex_doc, "~> 0.18", only: :dev},
      { :quixir, "~> 0.9", only: :test }
    ]
  end

  defp description() do
    """
    OrderInvariantCompare provides functionality for order invariant equality
    comparison.
    """
  end

  defp package() do
    [
      files: ["lib", "mix.exs", "README.md", "LICENSE.md"],
      maintainers: ["Mathew Bramson"],
      licenses: ["MIT"],
      links: %{"GitHub" => "https://github.com/mbramson/order_invariant_compare"}
    ]
  end
end
