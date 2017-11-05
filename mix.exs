defmodule OrderInvariantCompare.Mixfile do
  use Mix.Project

  def project do
    [
      app: :order_invariant_compare,
      version: "1.0.0",
      elixir: "~> 1.3",
      start_permanent: Mix.env == :prod,
      deps: deps()
    ]
  end

  def application do
    [
      extra_applications: [:logger]
    ]
  end

  defp deps do
    [
      { :quixir, "~> 0.9", only: :test }
    ]
  end
end
