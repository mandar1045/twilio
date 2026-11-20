defmodule Twilio.Schemas.Conference do
  @moduledoc """
  ## Fields

    * `account_sid` - The SID of the [Account](https://www.twilio.com/docs/iam/api/account) that created this Conference resource.
    * `api_version` - The API version used to create this conference.
    * `call_sid_ending_conference` - The call SID that caused the conference to end.
    * `date_created` - The date and time in UTC that this resource was created specified in [RFC 2822](https://www.ietf.org/rfc/rfc2822.txt) format.
    * `date_updated` - The date and time in UTC that this resource was last updated, specified in [RFC 2822](https://www.ietf.org/rfc/rfc2822.txt) format.
    * `friendly_name` - A string that you assigned to describe this conference room. Maximum length is 128 characters.
    * `reason_conference_ended`
    * `region` - A string that represents the Twilio Region where the conference audio was mixed. May be `us1`, `us2`, `ie1`, `de1`, `sg1`, `br1`, `au1`, and `jp1`. Basic conference audio will always be mixed in `us1`. Global Conference audio will be mixed nearest to the majority of participants.
    * `sid` - The unique, Twilio-provided string used to identify this Conference resource.
    * `status`
    * `subresource_uris` - A list of related resources identified by their URIs relative to `https://api.twilio.com`.
    * `uri` - The URI of this resource, relative to `https://api.twilio.com`.
  """

  @derive {Inspect, except: [:__extra__, :__present__]}
  defstruct [
    :account_sid,
    :api_version,
    :call_sid_ending_conference,
    :date_created,
    :date_updated,
    :friendly_name,
    :reason_conference_ended,
    :region,
    :sid,
    :status,
    :subresource_uris,
    :uri,
    __extra__: %{},
    __present__: []
  ]

  @type t :: %__MODULE__{
          account_sid: String.t() | nil,
          api_version: String.t() | nil,
          call_sid_ending_conference: String.t() | nil,
          date_created: String.t() | nil,
          date_updated: String.t() | nil,
          friendly_name: String.t() | nil,
          reason_conference_ended: Twilio.Schemas.ConferenceEnumReasonConferenceEnded.t() | nil,
          region: String.t() | nil,
          sid: String.t() | nil,
          status: Twilio.Schemas.ConferenceEnumStatus.t() | nil,
          subresource_uris: map() | nil,
          uri: String.t() | nil,
          __extra__: %{optional(String.t()) => term()},
          __present__: [atom()]
        }

  @doc false
  def __schema__(:fields) do
    [
      {:account_sid, "account_sid", :string},
      {:api_version, "api_version", :string},
      {:call_sid_ending_conference, "call_sid_ending_conference", :string},
      {:date_created, "date_created", :string},
      {:date_updated, "date_updated", :string},
      {:friendly_name, "friendly_name", :string},
      {:reason_conference_ended, "reason_conference_ended",
       {:ref, Twilio.Schemas.ConferenceEnumReasonConferenceEnded}},
      {:region, "region", :string},
      {:sid, "sid", :string},
      {:status, "status", {:ref, Twilio.Schemas.ConferenceEnumStatus}},
      {:subresource_uris, "subresource_uris", :any},
      {:uri, "uri", :string}
    ]
  end

  def __schema__(:required), do: []

  def __schema__(:nullable),
    do: [
      "account_sid",
      "api_version",
      "call_sid_ending_conference",
      "date_created",
      "date_updated",
      "friendly_name",
      "region",
      "sid",
      "subresource_uris",
      "uri"
    ]

  def __schema__(:additional), do: nil

  @doc "Decodes parsed JSON into this struct."
  @spec decode(term) :: t | term
  def decode(json), do: Infusion.Runtime.Schema.decode_module(json, __MODULE__)
end
