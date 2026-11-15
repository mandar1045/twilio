defmodule Twilio.Schemas.Call do
  @moduledoc """
  ## Fields

    * `account_sid` - The SID of the [Account](https://www.twilio.com/docs/iam/api/account) that created this Call resource.
    * `answered_by` - Either `human` or `machine` if this call was initiated with answering machine detection. Empty otherwise.
    * `api_version` - The API version used to create the call.
    * `caller_name` - The caller's name if this call was an incoming call to a phone number with caller ID Lookup enabled. Otherwise, empty.
    * `date_created` - The date and time in UTC that this resource was created specified in [RFC 2822](https://www.ietf.org/rfc/rfc2822.txt) format.
    * `date_updated` - The date and time in UTC that this resource was last updated, specified in [RFC 2822](https://www.ietf.org/rfc/rfc2822.txt) format.
    * `direction` - A string describing the direction of the call. Can be: `inbound` for inbound calls, `outbound-api` for calls initiated via the REST API or `outbound-dial` for calls initiated by a `<Dial>` verb. Using [Elastic SIP Trunking](https://www.twilio.com/docs/sip-trunking), the values can be [`trunking-terminating`](https://www.twilio.com/docs/sip-trunking#termination) for outgoing calls from your communications infrastructure to the PSTN or [`trunking-originating`](https://www.twilio.com/docs/sip-trunking#origination) for incoming calls to your communications infrastructure from the PSTN.
    * `duration` - The length of the call in seconds. This value is empty for busy, failed, unanswered, or ongoing calls.
    * `end_time` - The time the call ended, given as UTC in [RFC 2822](https://www.php.net/manual/en/class.datetime.php#datetime.constants.rfc2822) format. Empty if the call did not complete successfully.
    * `forwarded_from` - The forwarding phone number if this call was an incoming call forwarded from another number (depends on carrier supporting forwarding). Otherwise, empty.
    * `from` - The phone number, SIP address, Client identifier or SIM SID that made this call. Phone numbers are in [E.164](https://www.twilio.com/docs/glossary/what-e164) format (e.g., +16175551212). SIP addresses are formatted as `name@company.com`. Client identifiers are formatted `client:name`. SIM SIDs are formatted as `sim:sid`.
    * `from_formatted` - The calling phone number, SIP address, or Client identifier formatted for display. Non-North American phone numbers are in [E.164](https://www.twilio.com/docs/glossary/what-e164) format (e.g., +442071838750).
    * `group_sid` - The Group SID associated with this call. If no Group is associated with the call, the field is empty.
    * `parent_call_sid` - The SID that identifies the call that created this leg.
    * `phone_number_sid` - If the call was inbound, this is the SID of the IncomingPhoneNumber resource that received the call. If the call was outbound, it is the SID of the OutgoingCallerId resource from which the call was placed.
    * `price` - The charge for this call, in the currency associated with the account. Populated after the call is completed. May not be immediately available. The price associated with a call only reflects the charge for connectivity. Charges for other call-related features such as Answering Machine Detection, Text-To-Speech, and SIP REFER are not included in this value.
    * `price_unit` - The currency in which `Price` is measured, in [ISO 4127](https://www.iso.org/iso/home/standards/currency_codes.htm) format (e.g., `USD`, `EUR`, `JPY`). Always capitalized for calls.
    * `queue_time` - The wait time in milliseconds before the call is placed.
    * `sid` - The unique string that we created to identify this Call resource.
    * `start_time` - The start time of the call, given as UTC in [RFC 2822](https://www.php.net/manual/en/class.datetime.php#datetime.constants.rfc2822) format. Empty if the call has not yet been dialed.
    * `status`
    * `stir_verstat` - The STIR/SHAKEN verification status of the call, for example `TN-Validation-Passed-A`. Empty if the incoming call had no STIR/SHAKEN information.
    * `subresource_uris` - A list of subresources available to this call, identified by their URIs relative to `https://api.twilio.com`.
    * `to` - The phone number, SIP address, Client identifier or SIM SID that received this call. Phone numbers are in [E.164](https://www.twilio.com/docs/glossary/what-e164) format (e.g., +16175551212). SIP addresses are formatted as `name@company.com`. Client identifiers are formatted `client:name`. SIM SIDs are formatted as `sim:sid`.
    * `to_formatted` - The phone number, SIP address or Client identifier that received this call. Formatted for display. Non-North American phone numbers are in [E.164](https://www.twilio.com/docs/glossary/what-e164) format (e.g., +442071838750).
    * `trunk_sid` - The unique identifier of the trunk resource that was used for this call. The field is empty if the call was not made using a SIP trunk or if the call is not terminated.
    * `uri` - The URI of this resource, relative to `https://api.twilio.com`.
  """

  @derive {Inspect, except: [:__extra__, :__present__]}
  defstruct [
    :account_sid,
    :answered_by,
    :api_version,
    :caller_name,
    :date_created,
    :date_updated,
    :direction,
    :duration,
    :end_time,
    :forwarded_from,
    :from,
    :from_formatted,
    :group_sid,
    :parent_call_sid,
    :phone_number_sid,
    :price,
    :price_unit,
    :queue_time,
    :sid,
    :start_time,
    :status,
    :stir_verstat,
    :subresource_uris,
    :to,
    :to_formatted,
    :trunk_sid,
    :uri,
    __extra__: %{},
    __present__: []
  ]

  @type t :: %__MODULE__{
          account_sid: String.t() | nil,
          answered_by: String.t() | nil,
          api_version: String.t() | nil,
          caller_name: String.t() | nil,
          date_created: String.t() | nil,
          date_updated: String.t() | nil,
          direction: String.t() | nil,
          duration: String.t() | nil,
          end_time: String.t() | nil,
          forwarded_from: String.t() | nil,
          from: String.t() | nil,
          from_formatted: String.t() | nil,
          group_sid: String.t() | nil,
          parent_call_sid: String.t() | nil,
          phone_number_sid: String.t() | nil,
          price: String.t() | nil,
          price_unit: String.t() | nil,
          queue_time: String.t() | nil,
          sid: String.t() | nil,
          start_time: String.t() | nil,
          status: Twilio.Schemas.CallEnumStatus.t() | nil,
          stir_verstat: String.t() | nil,
          subresource_uris: map() | nil,
          to: String.t() | nil,
          to_formatted: String.t() | nil,
          trunk_sid: String.t() | nil,
          uri: String.t() | nil,
          __extra__: %{optional(String.t()) => term()},
          __present__: [atom()]
        }

  @doc false
  def __schema__(:fields) do
    [
      {:account_sid, "account_sid", :string},
      {:answered_by, "answered_by", :string},
      {:api_version, "api_version", :string},
      {:caller_name, "caller_name", :string},
      {:date_created, "date_created", :string},
      {:date_updated, "date_updated", :string},
      {:direction, "direction", :string},
      {:duration, "duration", :string},
      {:end_time, "end_time", :string},
      {:forwarded_from, "forwarded_from", :string},
      {:from, "from", :string},
      {:from_formatted, "from_formatted", :string},
      {:group_sid, "group_sid", :string},
      {:parent_call_sid, "parent_call_sid", :string},
      {:phone_number_sid, "phone_number_sid", :string},
      {:price, "price", :string},
      {:price_unit, "price_unit", :string},
      {:queue_time, "queue_time", :string},
      {:sid, "sid", :string},
      {:start_time, "start_time", :string},
      {:status, "status", {:ref, Twilio.Schemas.CallEnumStatus}},
      {:stir_verstat, "stir_verstat", :string},
      {:subresource_uris, "subresource_uris", :any},
      {:to, "to", :string},
      {:to_formatted, "to_formatted", :string},
      {:trunk_sid, "trunk_sid", :string},
      {:uri, "uri", :string}
    ]
  end

  @doc "Decodes parsed JSON into this struct."
  @spec decode(term) :: t | term
  def decode(json), do: Infusion.Runtime.Schema.decode_module(json, __MODULE__)
end
