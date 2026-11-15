defmodule Twilio.Schemas.SipCredentialListMapping do
  @moduledoc """
  ## Fields

    * `account_sid` - The unique id of the Account that is responsible for this resource.
    * `date_created` - The date that this resource was created, given as GMT in [RFC 2822](https://www.php.net/manual/en/class.datetime.php#datetime.constants.rfc2822) format.
    * `date_updated` - The date that this resource was last updated, given as GMT in [RFC 2822](https://www.php.net/manual/en/class.datetime.php#datetime.constants.rfc2822) format.
    * `domain_sid` - The unique string that is created to identify the SipDomain resource.
    * `friendly_name` - A human readable descriptive text for this resource, up to 64 characters long.
    * `sid` - A 34 character string that uniquely identifies this resource.
    * `uri` - The URI for this resource, relative to `https://api.twilio.com`
  """

  @derive {Inspect, except: [:__extra__, :__present__]}
  defstruct [
    :account_sid,
    :date_created,
    :date_updated,
    :domain_sid,
    :friendly_name,
    :sid,
    :uri,
    __extra__: %{},
    __present__: []
  ]

  @type t :: %__MODULE__{
          account_sid: String.t() | nil,
          date_created: String.t() | nil,
          date_updated: String.t() | nil,
          domain_sid: String.t() | nil,
          friendly_name: String.t() | nil,
          sid: String.t() | nil,
          uri: String.t() | nil,
          __extra__: %{optional(String.t()) => term()},
          __present__: [atom()]
        }

  @doc false
  def __schema__(:fields) do
    [
      {:account_sid, "account_sid", :string},
      {:date_created, "date_created", :string},
      {:date_updated, "date_updated", :string},
      {:domain_sid, "domain_sid", :string},
      {:friendly_name, "friendly_name", :string},
      {:sid, "sid", :string},
      {:uri, "uri", :string}
    ]
  end

  @doc "Decodes parsed JSON into this struct."
  @spec decode(term) :: t | term
  def decode(json), do: Infusion.Runtime.Schema.decode_module(json, __MODULE__)
end
