defmodule Twilio.Schemas.Address do
  @moduledoc """
  ## Fields

    * `account_sid` - The SID of the [Account](https://www.twilio.com/docs/iam/api/account) that is responsible for the Address resource.
    * `city` - The city in which the address is located.
    * `customer_name` - The name associated with the address.This property has a maximum length of 16 4-byte characters, or 21 3-byte characters.
    * `date_created` - The date and time in GMT that the resource was created specified in [RFC 2822](https://www.ietf.org/rfc/rfc2822.txt) format.
    * `date_updated` - The date and time in GMT that the resource was last updated specified in [RFC 2822](https://www.ietf.org/rfc/rfc2822.txt) format.
    * `emergency_enabled` - Whether emergency calling has been enabled on this number.
    * `friendly_name` - The string that you assigned to describe the resource.
    * `iso_country` - The ISO country code of the address.
    * `postal_code` - The postal code of the address.
    * `region` - The state or region of the address.
    * `sid` - The unique string that that we created to identify the Address resource.
    * `street` - The number and street address of the address.
    * `street_secondary` - The additional number and street address of the address.
    * `uri` - The URI of the resource, relative to `https://api.twilio.com`.
    * `validated` - Whether the address has been validated to comply with local regulation. In countries that require valid addresses, an invalid address will not be accepted. `true` indicates the Address has been validated. `false` indicate the country doesn't require validation or the Address is not valid.
    * `verified` - Whether the address has been verified to comply with regulation. In countries that require valid addresses, an invalid address will not be accepted. `true` indicates the Address has been verified. `false` indicate the country doesn't require verified or the Address is not valid.
  """

  @derive {Inspect, except: [:__extra__, :__present__]}
  defstruct [
    :account_sid,
    :city,
    :customer_name,
    :date_created,
    :date_updated,
    :emergency_enabled,
    :friendly_name,
    :iso_country,
    :postal_code,
    :region,
    :sid,
    :street,
    :street_secondary,
    :uri,
    :validated,
    :verified,
    __extra__: %{},
    __present__: []
  ]

  @type t :: %__MODULE__{
          account_sid: String.t() | nil,
          city: String.t() | nil,
          customer_name: String.t() | nil,
          date_created: String.t() | nil,
          date_updated: String.t() | nil,
          emergency_enabled: boolean() | nil,
          friendly_name: String.t() | nil,
          iso_country: String.t() | nil,
          postal_code: String.t() | nil,
          region: String.t() | nil,
          sid: String.t() | nil,
          street: String.t() | nil,
          street_secondary: String.t() | nil,
          uri: String.t() | nil,
          validated: boolean() | nil,
          verified: boolean() | nil,
          __extra__: %{optional(String.t()) => term()},
          __present__: [atom()]
        }

  @doc false
  def __schema__(:fields) do
    [
      {:account_sid, "account_sid", :string},
      {:city, "city", :string},
      {:customer_name, "customer_name", :string},
      {:date_created, "date_created", :string},
      {:date_updated, "date_updated", :string},
      {:emergency_enabled, "emergency_enabled", :boolean},
      {:friendly_name, "friendly_name", :string},
      {:iso_country, "iso_country", :string},
      {:postal_code, "postal_code", :string},
      {:region, "region", :string},
      {:sid, "sid", :string},
      {:street, "street", :string},
      {:street_secondary, "street_secondary", :string},
      {:uri, "uri", :string},
      {:validated, "validated", :boolean},
      {:verified, "verified", :boolean}
    ]
  end

  def __schema__(:required), do: []

  def __schema__(:nullable),
    do: [
      "account_sid",
      "city",
      "customer_name",
      "date_created",
      "date_updated",
      "emergency_enabled",
      "friendly_name",
      "iso_country",
      "postal_code",
      "region",
      "sid",
      "street",
      "street_secondary",
      "uri",
      "validated",
      "verified"
    ]

  def __schema__(:additional), do: nil

  @doc "Decodes parsed JSON into this struct."
  @spec decode(term) :: t | term
  def decode(json), do: Infusion.Runtime.Schema.decode_module(json, __MODULE__)
end
