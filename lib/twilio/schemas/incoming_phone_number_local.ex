defmodule Twilio.Schemas.IncomingPhoneNumberLocal do
  @moduledoc """
  ## Fields

    * `account_sid` - The SID of the [Account](https://www.twilio.com/docs/iam/api/account) that created the resource.
    * `address_requirements`
    * `address_sid` - The SID of the Address resource associated with the phone number.
    * `api_version` - The API version used to start a new TwiML session.
    * `beta` - Whether the phone number is new to the Twilio platform. Can be: `true` or `false`.
    * `bundle_sid` - The SID of the Bundle resource that you associate with the phone number. Some regions require a Bundle to meet local Regulations.
    * `capabilities` - The set of Boolean properties that indicate whether a phone number can receive calls or messages. Capabilities are `Voice`, `SMS`, and `MMS` and each capability can be: `true` or `false`.
    * `date_created` - The date and time in GMT that the resource was created specified in [RFC 2822](https://www.ietf.org/rfc/rfc2822.txt) format.
    * `date_updated` - The date and time in GMT that the resource was last updated specified in [RFC 2822](https://www.ietf.org/rfc/rfc2822.txt) format.
    * `emergency_address_sid` - The SID of the emergency address configuration that we use for emergency calling from this phone number.
    * `emergency_address_status`
    * `emergency_status`
    * `friendly_name` - The string that you assigned to describe the resource.
    * `identity_sid` - The SID of the Identity resource that we associate with the phone number. Some regions require an Identity to meet local regulations.
    * `origin` - The phone number's origin. `twilio` identifies Twilio-owned phone numbers and `hosted` identifies hosted phone numbers.
    * `phone_number` - The phone number in [E.164](https://www.twilio.com/docs/glossary/what-e164) format, which consists of a + followed by the country code and subscriber number.
    * `sid` - The unique string that that we created to identify the resource.
    * `sms_application_sid` - The SID of the application that handles SMS messages sent to the phone number. If an `sms_application_sid` is present, we ignore all `sms_*_url` values and use those of the application.
    * `sms_fallback_method` - The HTTP method we use to call `sms_fallback_url`. Can be: `GET` or `POST`.
    * `sms_fallback_url` - The URL that we call when an error occurs while retrieving or executing the TwiML from `sms_url`.
    * `sms_method` - The HTTP method we use to call `sms_url`. Can be: `GET` or `POST`.
    * `sms_url` - The URL we call when the phone number receives an incoming SMS message.
    * `status`
    * `status_callback` - The URL we call using the `status_callback_method` to send status information to your application.
    * `status_callback_method` - The HTTP method we use to call `status_callback`. Can be: `GET` or `POST`.
    * `trunk_sid` - The SID of the Trunk that handles calls to the phone number. If a `trunk_sid` is present, we ignore all of the voice urls and voice applications and use those set on the Trunk. Setting a `trunk_sid` will automatically delete your `voice_application_sid` and vice versa.
    * `uri` - The URI of the resource, relative to `https://api.twilio.com`.
    * `voice_application_sid` - The SID of the application that handles calls to the phone number. If a `voice_application_sid` is present, we ignore all of the voice urls and use those set on the application. Setting a `voice_application_sid` will automatically delete your `trunk_sid` and vice versa.
    * `voice_caller_id_lookup` - Whether we look up the caller's caller-ID name from the CNAM database ($0.01 per look up). Can be: `true` or `false`.
    * `voice_fallback_method` - The HTTP method we use to call `voice_fallback_url`. Can be: `GET` or `POST`.
    * `voice_fallback_url` - The URL that we call when an error occurs retrieving or executing the TwiML requested by `url`.
    * `voice_method` - The HTTP method we use to call `voice_url`. Can be: `GET` or `POST`.
    * `voice_receive_mode`
    * `voice_url` - The URL we call when this phone number receives a call. The `voice_url` will not be used if a `voice_application_sid` or a `trunk_sid` is set.
  """

  @derive {Inspect, except: [:__extra__, :__present__]}
  defstruct [
    :account_sid,
    :address_requirements,
    :address_sid,
    :api_version,
    :beta,
    :bundle_sid,
    :capabilities,
    :date_created,
    :date_updated,
    :emergency_address_sid,
    :emergency_address_status,
    :emergency_status,
    :friendly_name,
    :identity_sid,
    :origin,
    :phone_number,
    :sid,
    :sms_application_sid,
    :sms_fallback_method,
    :sms_fallback_url,
    :sms_method,
    :sms_url,
    :status,
    :status_callback,
    :status_callback_method,
    :trunk_sid,
    :uri,
    :voice_application_sid,
    :voice_caller_id_lookup,
    :voice_fallback_method,
    :voice_fallback_url,
    :voice_method,
    :voice_receive_mode,
    :voice_url,
    __extra__: %{},
    __present__: []
  ]

  @type t :: %__MODULE__{
          account_sid: String.t() | nil,
          address_requirements:
            Twilio.Schemas.IncomingPhoneNumberLocalEnumAddressRequirement.t() | nil,
          address_sid: String.t() | nil,
          api_version: String.t() | nil,
          beta: boolean() | nil,
          bundle_sid: String.t() | nil,
          capabilities: Twilio.Schemas.IncomingPhoneNumberLocal.Capabilities.t() | nil,
          date_created: String.t() | nil,
          date_updated: String.t() | nil,
          emergency_address_sid: String.t() | nil,
          emergency_address_status:
            Twilio.Schemas.IncomingPhoneNumberLocalEnumEmergencyAddressStatus.t() | nil,
          emergency_status: Twilio.Schemas.IncomingPhoneNumberLocalEnumEmergencyStatus.t() | nil,
          friendly_name: String.t() | nil,
          identity_sid: String.t() | nil,
          origin: String.t() | nil,
          phone_number: String.t() | nil,
          sid: String.t() | nil,
          sms_application_sid: String.t() | nil,
          sms_fallback_method: String.t() | nil,
          sms_fallback_url: String.t() | nil,
          sms_method: String.t() | nil,
          sms_url: String.t() | nil,
          status: String.t() | nil,
          status_callback: String.t() | nil,
          status_callback_method: String.t() | nil,
          trunk_sid: String.t() | nil,
          uri: String.t() | nil,
          voice_application_sid: String.t() | nil,
          voice_caller_id_lookup: boolean() | nil,
          voice_fallback_method: String.t() | nil,
          voice_fallback_url: String.t() | nil,
          voice_method: String.t() | nil,
          voice_receive_mode:
            Twilio.Schemas.IncomingPhoneNumberLocalEnumVoiceReceiveMode.t() | nil,
          voice_url: String.t() | nil,
          __extra__: %{optional(String.t()) => term()},
          __present__: [atom()]
        }

  @doc false
  def __schema__(:fields) do
    [
      {:account_sid, "account_sid", :string},
      {:address_requirements, "address_requirements",
       {:ref, Twilio.Schemas.IncomingPhoneNumberLocalEnumAddressRequirement}},
      {:address_sid, "address_sid", :string},
      {:api_version, "api_version", :string},
      {:beta, "beta", :boolean},
      {:bundle_sid, "bundle_sid", :string},
      {:capabilities, "capabilities",
       {:ref, Twilio.Schemas.IncomingPhoneNumberLocal.Capabilities}},
      {:date_created, "date_created", :string},
      {:date_updated, "date_updated", :string},
      {:emergency_address_sid, "emergency_address_sid", :string},
      {:emergency_address_status, "emergency_address_status",
       {:ref, Twilio.Schemas.IncomingPhoneNumberLocalEnumEmergencyAddressStatus}},
      {:emergency_status, "emergency_status",
       {:ref, Twilio.Schemas.IncomingPhoneNumberLocalEnumEmergencyStatus}},
      {:friendly_name, "friendly_name", :string},
      {:identity_sid, "identity_sid", :string},
      {:origin, "origin", :string},
      {:phone_number, "phone_number", :string},
      {:sid, "sid", :string},
      {:sms_application_sid, "sms_application_sid", :string},
      {:sms_fallback_method, "sms_fallback_method", {:enum, ["GET", "POST"]}},
      {:sms_fallback_url, "sms_fallback_url", :string},
      {:sms_method, "sms_method", {:enum, ["GET", "POST"]}},
      {:sms_url, "sms_url", :string},
      {:status, "status", :string},
      {:status_callback, "status_callback", :string},
      {:status_callback_method, "status_callback_method", {:enum, ["GET", "POST"]}},
      {:trunk_sid, "trunk_sid", :string},
      {:uri, "uri", :string},
      {:voice_application_sid, "voice_application_sid", :string},
      {:voice_caller_id_lookup, "voice_caller_id_lookup", :boolean},
      {:voice_fallback_method, "voice_fallback_method", {:enum, ["GET", "POST"]}},
      {:voice_fallback_url, "voice_fallback_url", :string},
      {:voice_method, "voice_method", {:enum, ["GET", "POST"]}},
      {:voice_receive_mode, "voice_receive_mode",
       {:ref, Twilio.Schemas.IncomingPhoneNumberLocalEnumVoiceReceiveMode}},
      {:voice_url, "voice_url", :string}
    ]
  end

  @doc "Decodes parsed JSON into this struct."
  @spec decode(term) :: t | term
  def decode(json), do: Infusion.Runtime.Schema.decode_module(json, __MODULE__)
end
