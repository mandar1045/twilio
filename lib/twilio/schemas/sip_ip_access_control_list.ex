defmodule Twilio.Schemas.SipIpAccessControlList do
  @moduledoc """
  ## Fields

    * `account_sid` - The unique id of the [Account](https://www.twilio.com/docs/iam/api/account) that owns this resource.
    * `date_created` - The date that this resource was created, given as GMT in [RFC 2822](https://www.php.net/manual/en/class.datetime.php#datetime.constants.rfc2822) format.
    * `date_updated` - The date that this resource was last updated, given as GMT in [RFC 2822](https://www.php.net/manual/en/class.datetime.php#datetime.constants.rfc2822) format.
    * `friendly_name` - A human readable descriptive text, up to 255 characters long.
    * `sid` - A 34 character string that uniquely identifies this resource.
    * `subresource_uris` - A list of the IpAddress resources associated with this IP access control list resource.
    * `uri` - The URI for this resource, relative to `https://api.twilio.com`
  """

  @derive {Inspect, except: [:__extra__, :__present__]}
  defstruct [
    :account_sid,
    :date_created,
    :date_updated,
    :friendly_name,
    :sid,
    :subresource_uris,
    :uri,
    __extra__: %{},
    __present__: []
  ]

  @type t :: %__MODULE__{
          account_sid: String.t() | nil,
          date_created: String.t() | nil,
          date_updated: String.t() | nil,
          friendly_name: String.t() | nil,
          sid: String.t() | nil,
          subresource_uris: map() | nil,
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
      {:friendly_name, "friendly_name", :string},
      {:sid, "sid", :string},
      {:subresource_uris, "subresource_uris", :any},
      {:uri, "uri", :string}
    ]
  end

  @doc "Decodes parsed JSON into this struct."
  @spec decode(term) :: t | term
  def decode(json), do: Infusion.Runtime.Schema.decode_module(json, __MODULE__)
end
