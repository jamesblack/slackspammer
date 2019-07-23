defmodule ElixirReminders.MixProject do
  use Mix.Project

  def project do
    [
      app: :elixir_reminders,
      version: "0.1.0",
      elixir: "~> 1.9",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger, :slack],
      mod: {Reminders.Application, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:slack, "~> 0.19.0"}
    ]
  end
end
