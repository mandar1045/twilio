defmodule Twilio.Schemas.Application do
  @moduledoc """
  ## Fields

    * `account_sid` - The SID of the [Account](https://www.twilio.com/docs/iam/api/account) that created the Application resource.
    * `api_version` - The API version used to start a new TwiML session.
    * `date_created` - The date and time in GMT that the resource was created specified in [RFC 2822](https://www.ietf.org/rfc/rfc2822.txt) format.
    * `date_updated` - The date and time in GMT that the resource was last updated specified in [RFC 2822](https://www.ietf.org/rfc/rfc2822.txt) format.
    * `friendly_name` - The string that you assigned to describe the resource.
    * `message_status_callback` - The URL we call using a POST method to send message status information to your application.
    * `public_application_connect_enabled` - Whether to allow other Twilio accounts to dial this applicaton using Dial verb. Can be: `true` or `false`.
    * `sid` - The unique string that that we created to identify the Application resource.
    * `sms_fallback_method` - The HTTP method we use to call `sms_fallback_url`. Can be: `GET` or `POST`.
    * `sms_fallback_url` - The URL that we call when an error occurs while retrieving or executing the TwiML from `sms_url`.
    * `sms_method` - The HTTP method we use to call `sms_url`. Can be: `GET` or `POST`.
    * `sms_status_callback` - The URL we call using a POST method to send status information to your application about SMS messages that refer to the application.
    * `sms_url` - The URL we call when the phone number receives an incoming SMS message.
    * `status_callback` - The URL we call using the `status_callback_method` to send status information to your application.
    * `status_callback_method` - The HTTP method we use to call `status_callback`. Can be: `GET` or `POST`.
    * `uri` - The URI of the resource, relative to `https://api.twilio.com`.
    * `voice_caller_id_lookup` - Whether we look up the caller's caller-ID name from the CNAM database (additional charges apply). Can be: `true` or `false`.
    * `voice_fallback_method` - The HTTP method we use to call `voice_fallback_url`. Can be: `GET` or `POST`.
    * `voice_fallback_url` - The URL that we call when an error occurs retrieving or executing the TwiML requested by `url`.
    * `voice_method` - The HTTP method we use to call `voice_url`. Can be: `GET` or `POST`.
    * `voice_url` - The URL we call when the phone number assigned to this application receives a call.
  """

  @derive {Inspect, except: [:__extra__, :__present__]}
  defstruct [
    :account_sid,
    :api_version,
    :date_created,
    :date_updated,
    :friendly_name,
    :message_status_callback,
    :public_application_connect_enabled,
    :sid,
    :sms_fallback_method,
    :sms_fallback_url,
    :sms_method,
    :sms_status_callback,
    :sms_url,
    :status_callback,
    :status_callback_method,
    :uri,
    :voice_caller_id_lookup,
    :voice_fallback_method,
    :voice_fallback_url,
    :voice_method,
    :voice_url,
    __extra__: %{},
    __present__: []
  ]

  @type t :: %__MODULE__{
          account_sid: String.t() | nil,
          api_version: String.t() | nil,
          date_created: String.t() | nil,
          date_updated: String.t() | nil,
          friendly_name: String.t() | nil,
          message_status_callback: String.t() | nil,
          public_application_connect_enabled: boolean() | nil,
          sid: String.t() | nil,
          sms_fallback_method: String.t() | nil,
          sms_fallback_url: String.t() | nil,
          sms_method: String.t() | nil,
          sms_status_callback: String.t() | nil,
          sms_url: String.t() | nil,
          status_callback: String.t() | nil,
          status_callback_method: String.t() | nil,
          uri: String.t() | nil,
          voice_caller_id_lookup: boolean() | nil,
          voice_fallback_method: String.t() | nil,
          voice_fallback_url: String.t() | nil,
          voice_method: String.t() | nil,
          voice_url: String.t() | nil,
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
      {:message_status_callback, "message_status_callback", :string},
      {:public_application_connect_enabled, "public_application_connect_enabled", :boolean},
      {:sid, "sid", :string},
      {:sms_fallback_method, "sms_fallback_method", {:enum, ["GET", "POST"]}},
      {:sms_fallback_url, "sms_fallback_url", :string},
      {:sms_method, "sms_method", {:enum, ["GET", "POST"]}},
      {:sms_status_callback, "sms_status_callback", :string},
      {:sms_url, "sms_url", :string},
      {:status_callback, "status_callback", :string},
      {:status_callback_method, "status_callback_method", {:enum, ["GET", "POST"]}},
      {:uri, "uri", :string},
      {:voice_caller_id_lookup, "voice_caller_id_lookup", :boolean},
      {:voice_fallback_method, "voice_fallback_method", {:enum, ["GET", "POST"]}},
      {:voice_fallback_url, "voice_fallback_url", :string},
      {:voice_method, "voice_method", {:enum, ["GET", "POST"]}},
      {:voice_url, "voice_url", :string}
    ]
  end

  @doc "Decodes parsed JSON into this struct."
  @spec decode(term) :: t | term
  def decode(json), do: Infusion.Runtime.Schema.decode_module(json, __MODULE__)
end
