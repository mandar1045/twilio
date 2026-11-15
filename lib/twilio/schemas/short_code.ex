defmodule Twilio.Schemas.ShortCode do
  @moduledoc """
  ## Fields

    * `account_sid` - The SID of the [Account](https://www.twilio.com/docs/iam/api/account) that created this ShortCode resource.
    * `api_version` - The API version used to start a new TwiML session when an SMS message is sent to this short code.
    * `date_created` - The date and time in GMT that this resource was created specified in [RFC 2822](https://www.ietf.org/rfc/rfc2822.txt) format.
    * `date_updated` - The date and time in GMT that this resource was last updated, specified in [RFC 2822](https://www.ietf.org/rfc/rfc2822.txt) format.
    * `friendly_name` - A string that you assigned to describe this resource. By default, the `FriendlyName` is the short code.
    * `short_code` - The short code. e.g., 894546.
    * `sid` - The unique string that that we created to identify this ShortCode resource.
    * `sms_fallback_method` - The HTTP method we use to call the `sms_fallback_url`. Can be: `GET` or `POST`.
    * `sms_fallback_url` - The URL that we call if an error occurs while retrieving or executing the TwiML from `sms_url`.
    * `sms_method` - The HTTP method we use to call the `sms_url`. Can be: `GET` or `POST`.
    * `sms_url` - The URL we call when receiving an incoming SMS message to this short code.
    * `uri` - The URI of this resource, relative to `https://api.twilio.com`.
  """

  @derive {Inspect, except: [:__extra__, :__present__]}
  defstruct [
    :account_sid,
    :api_version,
    :date_created,
    :date_updated,
    :friendly_name,
    :short_code,
    :sid,
    :sms_fallback_method,
    :sms_fallback_url,
    :sms_method,
    :sms_url,
    :uri,
    __extra__: %{},
    __present__: []
  ]

  @type t :: %__MODULE__{
          account_sid: String.t() | nil,
          api_version: String.t() | nil,
          date_created: String.t() | nil,
          date_updated: String.t() | nil,
          friendly_name: String.t() | nil,
          short_code: String.t() | nil,
          sid: String.t() | nil,
          sms_fallback_method: String.t() | nil,
          sms_fallback_url: String.t() | nil,
          sms_method: String.t() | nil,
          sms_url: String.t() | nil,
          uri: String.t() | nil,
          __extra__: %{optional(String.t()) => term()},
          __present__: [atom()]
        }

  @doc false
  def __schema__(:fields) do
    [
      {:account_sid, "account_sid", :string},
      {:api_version, "api_version", :string},
      {:date_created, "date_created", :string},
      {:date_updated, "date_updated", :string},
      {:friendly_name, "friendly_name", :string},
      {:short_code, "short_code", :string},
      {:sid, "sid", :string},
      {:sms_fallback_method, "sms_fallback_method", {:enum, ["GET", "POST"]}},
      {:sms_fallback_url, "sms_fallback_url", :string},
      {:sms_method, "sms_method", {:enum, ["GET", "POST"]}},
      {:sms_url, "sms_url", :string},
      {:uri, "uri", :string}
    ]
  end

  @doc "Decodes parsed JSON into this struct."
  @spec decode(term) :: t | term
  def decode(json), do: Infusion.Runtime.Schema.decode_module(json, __MODULE__)
end
