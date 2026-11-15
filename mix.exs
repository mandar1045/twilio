defmodule Twilio.MixProject do
  use Mix.Project

  def project do
    [
      app: :twilio,
      version: "0.2.0",
      elixir: "~> 1.18",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      description:
        "Twilio's REST API (messages, calls, phone numbers, recordings, ...) for Elixir: typed structs, retries, pagination. Generated from Twilio's OpenAPI spec.",
      package: [
        licenses: ["Apache-2.0"],
        links: %{
          "GitHub" => "https://github.com/mandar1045/twilio",
          "Infusion" => "https://github.com/mandar1045/infusion",
          "Twilio API" => "https://www.twilio.com/docs/usage/api"
        }
      ],
      docs: [main: "readme", extras: ["README.md", "CHANGELOG.md"]]
    ]
  end

  def application do
    [extra_applications: [:logger]]
  end

  defp deps do
    [
      {:infusion_runtime, "~> 0.1.1"},
      {:infusion, "~> 0.5.0", only: :dev, runtime: false},
      {:plug, "~> 1.14", only: :test},
      {:ex_doc, "~> 0.34", only: :dev, runtime: false}
    ]
  end
end
