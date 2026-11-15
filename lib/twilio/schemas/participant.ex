defmodule Twilio.Schemas.Participant do
  @moduledoc """
  ## Fields

    * `account_sid` - The SID of the [Account](https://www.twilio.com/docs/iam/api/account) that created the Participant resource.
    * `call_sid` - The SID of the [Call](https://www.twilio.com/docs/voice/api/call-resource) the Participant resource is associated with.
    * `call_sid_to_coach` - The SID of the participant who is being `coached`. The participant being coached is the only participant who can hear the participant who is `coaching`.
    * `coaching` - Whether the participant is coaching another call. Can be: `true` or `false`. If not present, defaults to `false` unless `call_sid_to_coach` is defined. If `true`, `call_sid_to_coach` must be defined.
    * `conference_sid` - The SID of the conference the participant is in.
    * `date_created` - The date and time in GMT that the resource was created specified in [RFC 2822](https://www.ietf.org/rfc/rfc2822.txt) format.
    * `date_updated` - The date and time in GMT that the resource was last updated specified in [RFC 2822](https://www.ietf.org/rfc/rfc2822.txt) format.
    * `end_conference_on_exit` - Whether the conference ends when the participant leaves. Can be: `true` or `false` and the default is `false`. If `true`, the conference ends and all other participants drop out when the participant leaves.
    * `hold` - Whether the participant is on hold. Can be `true` or `false`.
    * `label` - The user-specified label of this participant, if one was given when the participant was created. This may be used to fetch, update or delete the participant.
    * `muted` - Whether the participant is muted. Can be `true` or `false`.
    * `queue_time` - The wait time in milliseconds before participant's call is placed. Only available in the response to a create participant request.
    * `start_conference_on_enter` - Whether the conference starts when the participant joins the conference, if it has not already started. Can be: `true` or `false` and the default is `true`. If `false` and the conference has not started, the participant is muted and hears background music until another participant starts the conference.
    * `status`
    * `uri` - The URI of the resource, relative to `https://api.twilio.com`.
  """

  @derive {Inspect, except: [:__extra__, :__present__]}
  defstruct [
    :account_sid,
    :call_sid,
    :call_sid_to_coach,
    :coaching,
    :conference_sid,
    :date_created,
    :date_updated,
    :end_conference_on_exit,
    :hold,
    :label,
    :muted,
    :queue_time,
    :start_conference_on_enter,
    :status,
    :uri,
    __extra__: %{},
    __present__: []
  ]

  @type t :: %__MODULE__{
          account_sid: String.t() | nil,
          call_sid: String.t() | nil,
          call_sid_to_coach: String.t() | nil,
          coaching: boolean() | nil,
          conference_sid: String.t() | nil,
          date_created: String.t() | nil,
          date_updated: String.t() | nil,
          end_conference_on_exit: boolean() | nil,
          hold: boolean() | nil,
          label: String.t() | nil,
          muted: boolean() | nil,
          queue_time: String.t() | nil,
          start_conference_on_enter: boolean() | nil,
          status: Twilio.Schemas.ParticipantEnumStatus.t() | nil,
          uri: String.t() | nil,
          __extra__: %{optional(String.t()) => term()},
          __present__: [atom()]
        }

  @doc false
  def __schema__(:fields) do
    [
      {:account_sid, "account_sid", :string},
      {:call_sid, "call_sid", :string},
      {:call_sid_to_coach, "call_sid_to_coach", :string},
      {:coaching, "coaching", :boolean},
      {:conference_sid, "conference_sid", :string},
      {:date_created, "date_created", :string},
      {:date_updated, "date_updated", :string},
      {:end_conference_on_exit, "end_conference_on_exit", :boolean},
      {:hold, "hold", :boolean},
      {:label, "label", :string},
      {:muted, "muted", :boolean},
      {:queue_time, "queue_time", :string},
      {:start_conference_on_enter, "start_conference_on_enter", :boolean},
      {:status, "status", {:ref, Twilio.Schemas.ParticipantEnumStatus}},
      {:uri, "uri", :string}
    ]
  end

  @doc "Decodes parsed JSON into this struct."
  @spec decode(term) :: t | term
  def decode(json), do: Infusion.Runtime.Schema.decode_module(json, __MODULE__)
end
