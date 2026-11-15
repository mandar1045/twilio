defmodule Twilio.Schemas.AvailablePhoneNumberLocal do
  @moduledoc """
  ## Fields

    * `address_requirements` - The type of [Address](https://www.twilio.com/docs/usage/api/address) resource the phone number requires. Can be: `none`, `any`, `local`, or `foreign`. `none` means no address is required. `any` means an address is required, but it can be anywhere in the world. `local` means an address in the phone number's country is required. `foreign` means an address outside of the phone number's country is required.
    * `beta` - Whether the phone number is new to the Twilio platform. Can be: `true` or `false`.
    * `capabilities` - The set of Boolean properties that indicate whether a phone number can receive calls or messages. Capabilities are: `Voice`, `SMS`, and `MMS` and each capability can be: `true` or `false`.
    * `friendly_name` - A formatted version of the phone number.
    * `iso_country` - The [ISO country code](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2) of this phone number.
    * `lata` - The [LATA](https://en.wikipedia.org/wiki/Local_access_and_transport_area) of this phone number. Available for only phone numbers from the US and Canada.
    * `latitude` - The latitude of this phone number's location. Available for only phone numbers from the US and Canada.
    * `locality` - The locality or city of this phone number's location.
    * `longitude` - The longitude of this phone number's location. Available for only phone numbers from the US and Canada.
    * `phone_number` - The phone number in [E.164](https://www.twilio.com/docs/glossary/what-e164) format, which consists of a + followed by the country code and subscriber number.
    * `postal_code` - The postal or ZIP code of this phone number's location. Available for only phone numbers from the US and Canada.
    * `rate_center` - The [rate center](https://en.wikipedia.org/wiki/Telephone_exchange) of this phone number. Available for only phone numbers from the US and Canada.
    * `region` - The two-letter state or province abbreviation of this phone number's location. Available for only phone numbers from the US and Canada.
  """

  @derive {Inspect, except: [:__extra__, :__present__]}
  defstruct [
    :address_requirements,
    :beta,
    :capabilities,
    :friendly_name,
    :iso_country,
    :lata,
    :latitude,
    :locality,
    :longitude,
    :phone_number,
    :postal_code,
    :rate_center,
    :region,
    __extra__: %{},
    __present__: []
  ]

  @type t :: %__MODULE__{
          address_requirements: String.t() | nil,
          beta: boolean() | nil,
          capabilities: Twilio.Schemas.AvailablePhoneNumberLocal.Capabilities.t() | nil,
          friendly_name: String.t() | nil,
          iso_country: String.t() | nil,
          lata: String.t() | nil,
          latitude: number() | nil,
          locality: String.t() | nil,
          longitude: number() | nil,
          phone_number: String.t() | nil,
          postal_code: String.t() | nil,
          rate_center: String.t() | nil,
          region: String.t() | nil,
          __extra__: %{optional(String.t()) => term()},
          __present__: [atom()]
        }

  @doc false
  def __schema__(:fields) do
    [
      {:address_requirements, "address_requirements", :string},
      {:beta, "beta", :boolean},
      {:capabilities, "capabilities",
       {:ref, Twilio.Schemas.AvailablePhoneNumberLocal.Capabilities}},
      {:friendly_name, "friendly_name", :string},
      {:iso_country, "iso_country", :string},
      {:lata, "lata", :string},
      {:latitude, "latitude", :number},
      {:locality, "locality", :string},
      {:longitude, "longitude", :number},
      {:phone_number, "phone_number", :string},
      {:postal_code, "postal_code", :string},
      {:rate_center, "rate_center", :string},
      {:region, "region", :string}
    ]
  end

  @doc "Decodes parsed JSON into this struct."
  @spec decode(term) :: t | term
  def decode(json), do: Infusion.Runtime.Schema.decode_module(json, __MODULE__)
end
