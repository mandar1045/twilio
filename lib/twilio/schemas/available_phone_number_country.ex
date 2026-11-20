defmodule Twilio.Schemas.AvailablePhoneNumberCountry do
  @moduledoc """
  ## Fields

    * `beta` - Whether all phone numbers available in the country are new to the Twilio platform. `true` if they are and `false` if all numbers are not in the Twilio Phone Number Beta program.
    * `country` - The name of the country.
    * `country_code` - The [ISO-3166-1](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2) country code of the country.
    * `subresource_uris` - A list of related AvailablePhoneNumber resources identified by their URIs relative to `https://api.twilio.com`.
    * `uri` - The URI of the Country resource, relative to `https://api.twilio.com`.
  """

  @derive {Inspect, except: [:__extra__, :__present__]}
  defstruct [
    :beta,
    :country,
    :country_code,
    :subresource_uris,
    :uri,
    __extra__: %{},
    __present__: []
  ]

  @type t :: %__MODULE__{
          beta: boolean() | nil,
          country: String.t() | nil,
          country_code: String.t() | nil,
          subresource_uris: map() | nil,
          uri: String.t() | nil,
          __extra__: %{optional(String.t()) => term()},
          __present__: [atom()]
        }

  @doc false
  def __schema__(:fields) do
    [
      {:beta, "beta", :boolean},
      {:country, "country", :string},
      {:country_code, "country_code", :string},
      {:subresource_uris, "subresource_uris", :any},
      {:uri, "uri", :string}
    ]
  end

  def __schema__(:required), do: []
  def __schema__(:nullable), do: ["beta", "country", "country_code", "subresource_uris", "uri"]
  def __schema__(:additional), do: nil

  @doc "Decodes parsed JSON into this struct."
  @spec decode(term) :: t | term
  def decode(json), do: Infusion.Runtime.Schema.decode_module(json, __MODULE__)
end
