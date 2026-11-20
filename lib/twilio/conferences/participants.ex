defmodule Twilio.Conferences.Participants do
  @moduledoc """
  API calls: `create`, `delete`, `list`, `retrieve`, `update`.
  """

  @create_operation %{
    id: "CreateParticipant",
    method: :post,
    path: "/2010-04-01/Accounts/{AccountSid}/Conferences/{ConferenceSid}/Participants.json",
    path_params: ["ConferenceSid"],
    client_path_params: [{"AccountSid", :account_sid}],
    params: [
      {:amd_status_callback, "AmdStatusCallback", :body},
      {:amd_status_callback_method, "AmdStatusCallbackMethod", :body},
      {:beep, "Beep", :body},
      {:byoc, "Byoc", :body},
      {:call_reason, "CallReason", :body},
      {:call_sid_to_coach, "CallSidToCoach", :body},
      {:call_token, "CallToken", :body},
      {:caller_display_name, "CallerDisplayName", :body},
      {:caller_id, "CallerId", :body},
      {:client_notification_url, "ClientNotificationUrl", :body},
      {:coaching, "Coaching", :body},
      {:conference_record, "ConferenceRecord", :body},
      {:conference_recording_status_callback, "ConferenceRecordingStatusCallback", :body},
      {:conference_recording_status_callback_event, "ConferenceRecordingStatusCallbackEvent",
       :body},
      {:conference_recording_status_callback_method, "ConferenceRecordingStatusCallbackMethod",
       :body},
      {:conference_status_callback, "ConferenceStatusCallback", :body},
      {:conference_status_callback_event, "ConferenceStatusCallbackEvent", :body},
      {:conference_status_callback_method, "ConferenceStatusCallbackMethod", :body},
      {:conference_trim, "ConferenceTrim", :body},
      {:early_media, "EarlyMedia", :body},
      {:emergency_address, "EmergencyAddress", :body},
      {:emergency_caller_location, "EmergencyCallerLocation", :body},
      {:emergency_caller_position, "EmergencyCallerPosition", :body},
      {:emergency_city, "EmergencyCity", :body},
      {:emergency_country, "EmergencyCountry", :body},
      {:emergency_name, "EmergencyName", :body},
      {:emergency_state, "EmergencyState", :body},
      {:emergency_zip_code, "EmergencyZipCode", :body},
      {:end_conference_on_exit, "EndConferenceOnExit", :body},
      {:from, "From", :body},
      {:jitter_buffer_size, "JitterBufferSize", :body},
      {:label, "Label", :body},
      {:machine_detection, "MachineDetection", :body},
      {:machine_detection_silence_timeout, "MachineDetectionSilenceTimeout", :body},
      {:machine_detection_speech_end_threshold, "MachineDetectionSpeechEndThreshold", :body},
      {:machine_detection_speech_threshold, "MachineDetectionSpeechThreshold", :body},
      {:machine_detection_timeout, "MachineDetectionTimeout", :body},
      {:max_participants, "MaxParticipants", :body},
      {:muted, "Muted", :body},
      {:passports, "Passports", :body},
      {:record, "Record", :body},
      {:recording_channels, "RecordingChannels", :body},
      {:recording_configuration_id, "RecordingConfigurationId", :body},
      {:recording_status_callback, "RecordingStatusCallback", :body},
      {:recording_status_callback_event, "RecordingStatusCallbackEvent", :body},
      {:recording_status_callback_method, "RecordingStatusCallbackMethod", :body},
      {:recording_track, "RecordingTrack", :body},
      {:region, "Region", :body},
      {:sip_auth_password, "SipAuthPassword", :body},
      {:sip_auth_username, "SipAuthUsername", :body},
      {:start_conference_on_enter, "StartConferenceOnEnter", :body},
      {:status_callback, "StatusCallback", :body},
      {:status_callback_event, "StatusCallbackEvent", :body},
      {:status_callback_method, "StatusCallbackMethod", :body},
      {:time_limit, "TimeLimit", :body},
      {:timeout, "Timeout", :body},
      {:to, "To", :body},
      {:trim, "Trim", :body},
      {:wait_method, "WaitMethod", :body},
      {:wait_url, "WaitUrl", :body}
    ],
    body: :form,
    response: {:ref, Twilio.Schemas.Participant}
  }

  @doc """
  `POST /2010-04-01/Accounts/{AccountSid}/Conferences/{ConferenceSid}/Participants.json`

  ## Path parameters

    * `conference_sid` (required) - The SID of the participant's conference.

  `{AccountSid}` in the path is the `:account_sid` setting; pass `account_sid: "..."` as an option to use another.

  ## Parameters

    * `amd_status_callback` - The URL that we should call using the `amd_status_callback_method` to notify customer application whether the call was answered by human, machine or fax.
    * `amd_status_callback_method` - The HTTP method we should use when calling the `amd_status_callback` URL. Can be: `GET` or `POST` and the default is `POST`.
    * `beep` - Whether to play a notification beep to the conference when the participant joins. Can be: `true`, `false`, `onEnter`, or `onExit`. The default value is `true`.
    * `byoc` - The SID of a BYOC (Bring Your Own Carrier) trunk to route this call with. Note that `byoc` is only meaningful when `to` is a phone number; it will otherwise be ignored. (Beta)
    * `call_reason` - The Reason for the outgoing call. Use it to specify the purpose of the call that is presented on the called party's phone. (Branded Calls Beta)
    * `call_sid_to_coach` - The SID of the participant who is being `coached`. The participant being coached is the only participant who can hear the participant who is `coaching`.
    * `call_token` - A token string needed to invoke a forwarded call. A call_token is generated when an incoming call is received on a Twilio number. Pass an incoming call's call_token value to a forwarded call via the call_token parameter when creating a new call. A forwarded call should bear the same CallerID of the original incoming call.
    * `caller_display_name` - The name that populates the display name in the From header. Must be between 2 and 255 characters. Only applicable for calls to sip address.
    * `caller_id` - The phone number, Client identifier, or username portion of SIP address that made this call. Phone numbers are in [E.164](https://www.twilio.com/docs/glossary/what-e164) format (e.g., +16175551212). Client identifiers are formatted `client:name`. If using a phone number, it must be a Twilio number or a Verified [outgoing caller id](https://www.twilio.com/docs/voice/api/outgoing-caller-ids) for your account. If the `to` parameter is a phone number, `callerId` must also be a phone number. If `to` is sip address, this value of `callerId` should be a username portion to be used to populate the From header that is passed to the SIP endpoint.
    * `client_notification_url` - The URL that we should use to deliver `push call notification`.
    * `coaching` - Whether the participant is coaching another call. Can be: `true` or `false`. If not present, defaults to `false` unless `call_sid_to_coach` is defined. If `true`, `call_sid_to_coach` must be defined.
    * `conference_record` - Whether to record the conference the participant is joining. Can be: `true`, `false`, `record-from-start`, and `do-not-record`. The default value is `false`.
    * `conference_recording_status_callback` - The URL we should call using the `conference_recording_status_callback_method` when the conference recording is available.
    * `conference_recording_status_callback_event` - The conference recording state changes that generate a call to `conference_recording_status_callback`. Can be: `in-progress`, `completed`, `failed`, and `absent`. Separate multiple values with a space, ex: `'in-progress completed failed'`
    * `conference_recording_status_callback_method` - The HTTP method we should use to call `conference_recording_status_callback`. Can be: `GET` or `POST` and defaults to `POST`.
    * `conference_status_callback` - The URL we should call using the `conference_status_callback_method` when the conference events in `conference_status_callback_event` occur. Only the value set by the first participant to join the conference is used. Subsequent `conference_status_callback` values are ignored.
    * `conference_status_callback_event` - The conference state changes that should generate a call to `conference_status_callback`. Can be: `start`, `end`, `join`, `leave`, `mute`, `hold`, `modify`, `speaker`, and `announcement`. Separate multiple values with a space. Defaults to `start end`.
    * `conference_status_callback_method` - The HTTP method we should use to call `conference_status_callback`. Can be: `GET` or `POST` and defaults to `POST`.
    * `conference_trim` - Whether to trim leading and trailing silence from the conference recording. Can be: `trim-silence` or `do-not-trim` and defaults to `trim-silence`.
    * `early_media` - Whether to allow an agent to hear the state of the outbound call, including ringing or disconnect messages. Can be: `true` or `false` and defaults to `true`.
    * `emergency_address` - The emergency caller's street address including street number and street name. Note: If the value exceeds 60 characters, only the first 60 characters will be used.
    * `emergency_caller_location` - The emergency caller's physical location description within a building or facility. Note: If the value exceeds 20 characters, only the first 20 characters will be used.
    * `emergency_caller_position` - The emergency caller's GPS coordinates in decimal degrees format. Format: "latitude longitude" (space-separated) - Latitude: decimal degrees, range -90.0 to +90.0 (negative for South, positive for North) - Longitude: decimal degrees, range -180.0 to +180.0 (negative for West, positive for East) - Precision: up to 6 decimal places recommended for meter-level accuracy Note: If the value exceeds 150 characters, only the first 150 characters will be used.
    * `emergency_city` - The emergency caller's city or municipality name. Should be the official city name as recognized by local authorities. Used in combination with state and country for emergency call routing. Note: If the value exceeds 20 characters, only the first 20 characters will be used.
    * `emergency_country` - The emergency caller's country. Currently supported US and CA only. Note: If the value exceeds 20 characters, only the first 20 characters will be used.
    * `emergency_name` - The emergency caller's organization or entity name. Note: If the value exceeds 20 characters, only the first 20 characters will be used.
    * `emergency_state` - The emergency caller's state or province. Note: If the value exceeds 20 characters, only the first 20 characters will be used.
    * `emergency_zip_code` - The emergency caller's postal code or ZIP code. Note: If the value exceeds 20 characters, only the first 20 characters will be used.
    * `end_conference_on_exit` - Whether to end the conference when the participant leaves. Can be: `true` or `false` and defaults to `false`.
    * `from` (required) - The phone number, Client identifier, or username portion of SIP address that made this call. Phone numbers are in [E.164](https://www.twilio.com/docs/glossary/what-e164) format (e.g., +16175551212). Client identifiers are formatted `client:name`. If using a phone number, it must be a Twilio number or a Verified [outgoing caller id](https://www.twilio.com/docs/voice/api/outgoing-caller-ids) for your account. If the `to` parameter is a phone number, `from` must also be a phone number. If `to` is sip address, this value of `from` should be a username portion to be used to populate the P-Asserted-Identity header that is passed to the SIP endpoint.
    * `jitter_buffer_size` - Jitter buffer size for the connecting participant. Twilio will use this setting to apply Jitter Buffer before participant's audio is mixed into the conference. Can be: `off`, `small`, `medium`, and `large`. Default to `large`.
    * `label` - A label for this participant. If one is supplied, it may subsequently be used to fetch, update or delete the participant.
    * `machine_detection` - Whether to detect if a human, answering machine, or fax has picked up the call. Can be: `Enable` or `DetectMessageEnd`. Use `Enable` if you would like us to return `AnsweredBy` as soon as the called party is identified. Use `DetectMessageEnd`, if you would like to leave a message on an answering machine. For more information, see [Answering Machine Detection](https://www.twilio.com/docs/voice/answering-machine-detection).
    * `machine_detection_silence_timeout` - The number of milliseconds of initial silence after which an `unknown` AnsweredBy result will be returned. Possible Values: 2000-10000. Default: 5000.
    * `machine_detection_speech_end_threshold` - The number of milliseconds of silence after speech activity at which point the speech activity is considered complete. Possible Values: 500-5000. Default: 1200.
    * `machine_detection_speech_threshold` - The number of milliseconds that is used as the measuring stick for the length of the speech activity, where durations lower than this value will be interpreted as a human and longer than this value as a machine. Possible Values: 1000-6000. Default: 2400.
    * `machine_detection_timeout` - The number of seconds that we should attempt to detect an answering machine before timing out and sending a voice request with `AnsweredBy` of `unknown`. The default timeout is 30 seconds.
    * `max_participants` - The maximum number of participants in the conference. Can be a positive integer from `2` to `250`. The default value is `250`.
    * `muted` - Whether the agent is muted in the conference. Can be `true` or `false` and the default is `false`.
    * `passports` - The STIR/SHAKEN passport for this call, provided as a base64 encoded string. Multiple passports (at max 5) are comma separated and provided as base64 encoded string
    * `record` - Whether to record the participant and their conferences, including the time between conferences. Can be `true` or `false` and the default is `false`.
    * `recording_channels` - The recording channels for the final recording. Can be: `mono` or `dual` and the default is `mono`.
    * `recording_configuration_id` - The identifier of the configuration to be used when creating and processing the recording
    * `recording_status_callback` - The URL that we should call using the `recording_status_callback_method` when the recording status changes.
    * `recording_status_callback_event` - The recording state changes that should generate a call to `recording_status_callback`. Can be: `started`, `in-progress`, `paused`, `resumed`, `stopped`, `completed`, `failed`, and `absent`. Separate multiple values with a space, ex: `'in-progress completed failed'`.
    * `recording_status_callback_method` - The HTTP method we should use when we call `recording_status_callback`. Can be: `GET` or `POST` and defaults to `POST`.
    * `recording_track` - The audio track to record for the call. Can be: `inbound`, `outbound` or `both`. The default is `both`. `inbound` records the audio that is received by Twilio. `outbound` records the audio that is sent from Twilio. `both` records the audio that is received and sent by Twilio.
    * `region` - The [region](https://support.twilio.com/hc/en-us/articles/223132167-How-global-low-latency-routing-and-region-selection-work-for-conferences-and-Client-calls) where we should mix the recorded audio. Can be:`us1`, `us2`, `ie1`, `de1`, `sg1`, `br1`, `au1`, or `jp1`.
    * `sip_auth_password` - The SIP password for authentication.
    * `sip_auth_username` - The SIP username used for authentication.
    * `start_conference_on_enter` - Whether to start the conference when the participant joins, if it has not already started. Can be: `true` or `false` and the default is `true`. If `false` and the conference has not started, the participant is muted and hears background music until another participant starts the conference.
    * `status_callback` - The URL we should call using the `status_callback_method` to send status information to your application.
    * `status_callback_event` - The conference state changes that should generate a call to `status_callback`. Can be: `initiated`, `ringing`, `answered`, and `completed`. Separate multiple values with a space. The default value is `completed`.
    * `status_callback_method` - The HTTP method we should use to call `status_callback`. Can be: `GET` and `POST` and defaults to `POST`.
    * `time_limit` - The maximum duration of the call in seconds. Constraints depend on account and configuration.
    * `timeout` - The number of seconds that we should allow the phone to ring before assuming there is no answer. Can be an integer between `5` and `600`, inclusive. The default value is `60`. We always add a 5-second timeout buffer to outgoing calls, so value of 10 would result in an actual timeout that was closer to 15 seconds.
    * `to` (required) - The phone number, SIP address, Client, TwiML App identifier that received this call. Phone numbers are in [E.164](https://www.twilio.com/docs/glossary/what-e164) format (e.g., +16175551212). SIP addresses are formatted as `sip:name@company.com`. Client identifiers are formatted `client:name`. TwiML App identifiers are formatted `app:<APP_SID>`. [Custom parameters](https://www.twilio.com/docs/voice/api/conference-participant-resource#custom-parameters) may also be specified.
    * `trim` - Whether to trim any leading and trailing silence from the participant recording. Can be: `trim-silence` or `do-not-trim` and the default is `trim-silence`.
    * `wait_method` - The HTTP method we should use to call `wait_url`. Can be `GET` or `POST` and the default is `POST`. When using a static audio file, this should be `GET` so that we can cache the file.
    * `wait_url` - The URL that Twilio calls using the `wait_method` before the conference has started. The URL may return an MP3 file, a WAV file, or a TwiML document. The default value is the URL of our standard hold music. If you do not want anything to play while waiting for the conference to start, specify an empty string by setting `wait_url` to `''`. For more details on the allowable verbs within the `waitUrl`, see the `waitUrl` attribute in the [<Conference> TwiML instruction](https://www.twilio.com/docs/voice/twiml/conference#attributes-waiturl).
  """
  @spec create(String.t(), map() | keyword(), keyword()) ::
          {:ok, Twilio.Schemas.Participant.t()} | {:error, Infusion.Runtime.Error.t()}
  def create(conference_sid, params \\ %{}, opts \\ []),
    do: Twilio.__request__(@create_operation, [conference_sid], params, opts)

  @doc "Like `create/3`, but returns the result or raises `Infusion.Runtime.Error`."
  @spec create!(String.t(), map() | keyword(), keyword()) :: Twilio.Schemas.Participant.t()
  def create!(conference_sid, params \\ %{}, opts \\ []),
    do:
      Infusion.Runtime.Request.unwrap!(
        Twilio.__request__(@create_operation, [conference_sid], params, opts)
      )

  @delete_operation %{
    id: "DeleteParticipant",
    method: :delete,
    path:
      "/2010-04-01/Accounts/{AccountSid}/Conferences/{ConferenceSid}/Participants/{CallSid}.json",
    path_params: ["ConferenceSid", "CallSid"],
    client_path_params: [{"AccountSid", :account_sid}],
    params: [],
    response: nil
  }

  @doc """
  Kick a participant from a given conference

  `DELETE /2010-04-01/Accounts/{AccountSid}/Conferences/{ConferenceSid}/Participants/{CallSid}.json`

  ## Path parameters

    * `conference_sid` (required) - The SID of the conference with the participants to delete.
    * `call_sid` (required) - The [Call](https://www.twilio.com/docs/voice/api/call-resource) SID or label of the participant to delete. Non URL safe characters in a label must be percent encoded, for example, a space character is represented as %20.

  `{AccountSid}` in the path is the `:account_sid` setting; pass `account_sid: "..."` as an option to use another.
  """
  @spec delete(String.t(), String.t(), keyword()) ::
          {:ok, nil} | {:error, Infusion.Runtime.Error.t()}
  def delete(conference_sid, call_sid, opts \\ []),
    do: Twilio.__request__(@delete_operation, [conference_sid, call_sid], %{}, opts)

  @doc "Like `delete/3`, but returns the result or raises `Infusion.Runtime.Error`."
  @spec delete!(String.t(), String.t(), keyword()) :: nil
  def delete!(conference_sid, call_sid, opts \\ []),
    do:
      Infusion.Runtime.Request.unwrap!(
        Twilio.__request__(@delete_operation, [conference_sid, call_sid], %{}, opts)
      )

  @list_operation %{
    id: "ListParticipant",
    method: :get,
    path: "/2010-04-01/Accounts/{AccountSid}/Conferences/{ConferenceSid}/Participants.json",
    path_params: ["ConferenceSid"],
    client_path_params: [{"AccountSid", :account_sid}],
    params: [
      {:muted, "Muted", :query},
      {:hold, "Hold", :query},
      {:coaching, "Coaching", :query},
      {:page_size, "PageSize", :query},
      {:page, "Page", :query},
      {:page_token, "PageToken", :query}
    ],
    response: {:ref, Twilio.Schemas.ConferencesParticipantsListResponse},
    paginate: %{
      from: ["next_page_uri"],
      items: ["participants"],
      style: :next_url,
      item: {:ref, Twilio.Schemas.Participant}
    }
  }

  @doc """
  Retrieve a list of participants belonging to the account used to make the request

  `GET /2010-04-01/Accounts/{AccountSid}/Conferences/{ConferenceSid}/Participants.json`

  ## Path parameters

    * `conference_sid` (required) - The SID of the conference with the participants to read.

  `{AccountSid}` in the path is the `:account_sid` setting; pass `account_sid: "..."` as an option to use another.

  ## Parameters

    * `muted` - Whether to return only participants that are muted. Can be: `true` or `false`.
    * `hold` - Whether to return only participants that are on hold. Can be: `true` or `false`.
    * `coaching` - Whether to return only participants who are coaching another call. Can be: `true` or `false`.
    * `page_size` - How many resources to return in each list page. The default is 50, and the maximum is 1000.
    * `page` - The page index. This value is simply for client state.
    * `page_token` - The page token. This is provided by the API.

  To read every item across all pages, use `list_all`.
  """
  @spec list(String.t(), map() | keyword(), keyword()) ::
          {:ok, Twilio.Schemas.ConferencesParticipantsListResponse.t()}
          | {:error, Infusion.Runtime.Error.t()}
  def list(conference_sid, params \\ %{}, opts \\ []),
    do: Twilio.__request__(@list_operation, [conference_sid], params, opts)

  @doc "Like `list/3`, but returns the result or raises `Infusion.Runtime.Error`."
  @spec list!(String.t(), map() | keyword(), keyword()) ::
          Twilio.Schemas.ConferencesParticipantsListResponse.t()
  def list!(conference_sid, params \\ %{}, opts \\ []),
    do:
      Infusion.Runtime.Request.unwrap!(
        Twilio.__request__(@list_operation, [conference_sid], params, opts)
      )

  @doc """
  Like `list/3`, but returns every item, from every page: a lazy stream of `Twilio.Schemas.Participant.t()` that fetches pages as it is read.

  The first page is fetched right away, so its errors are returned; a later page that fails raises `Infusion.Runtime.Error`. Stopping early (`Enum.take/2`) fetches no more pages.
  """
  @spec list_all(String.t(), map() | keyword(), keyword()) ::
          {:ok, Enumerable.t()} | {:error, Infusion.Runtime.Error.t()}
  def list_all(conference_sid, params \\ %{}, opts \\ []),
    do: Twilio.__paginate__(@list_operation, [conference_sid], params, opts)

  @doc "Like `list_all/3`, but returns the stream or raises `Infusion.Runtime.Error`."
  @spec list_all!(String.t(), map() | keyword(), keyword()) :: Enumerable.t()
  def list_all!(conference_sid, params \\ %{}, opts \\ []),
    do:
      Infusion.Runtime.Request.unwrap!(
        Twilio.__paginate__(@list_operation, [conference_sid], params, opts)
      )

  @doc """
  Watches this list and sends what changes: starts a process, linked to the caller, that polls it (with `ETag`s, so unchanged pages cost a `304`) and sends `{:infusion_watch, pid, %Infusion.Runtime.Watch.Event{}}` for every Twilio.Schemas.Participant.t() created, updated, deleted, or that moved into view (`:entered`).

  Options: `every:` (milliseconds, default 30 seconds), `to:` (a pid, `{:pubsub, MyApp.PubSub, topic}` or a function), `pages:`, `initial:`, `ignore:`, plus any setting of `Infusion.Runtime.Config`. See `Infusion.Runtime.Watch`.
  """
  @spec list_watch(String.t(), map() | keyword(), keyword()) ::
          {:ok, pid()} | {:error, Infusion.Runtime.Error.t()}
  def list_watch(conference_sid, params \\ %{}, opts \\ []),
    do: Twilio.__watch__(@list_operation, [conference_sid], params, opts)

  @doc "Like `list_watch/3`, but returns the stream or raises `Infusion.Runtime.Error`."
  @spec list_watch!(String.t(), map() | keyword(), keyword()) :: pid()
  def list_watch!(conference_sid, params \\ %{}, opts \\ []),
    do:
      Infusion.Runtime.Request.unwrap!(
        Twilio.__watch__(@list_operation, [conference_sid], params, opts)
      )

  @retrieve_operation %{
    id: "FetchParticipant",
    method: :get,
    path:
      "/2010-04-01/Accounts/{AccountSid}/Conferences/{ConferenceSid}/Participants/{CallSid}.json",
    path_params: ["ConferenceSid", "CallSid"],
    client_path_params: [{"AccountSid", :account_sid}],
    params: [],
    response: {:ref, Twilio.Schemas.Participant}
  }

  @doc """
  Fetch an instance of a participant

  `GET /2010-04-01/Accounts/{AccountSid}/Conferences/{ConferenceSid}/Participants/{CallSid}.json`

  ## Path parameters

    * `conference_sid` (required) - The SID of the conference with the participant to fetch.
    * `call_sid` (required) - The [Call](https://www.twilio.com/docs/voice/api/call-resource) SID or label of the participant to fetch. Non URL safe characters in a label must be percent encoded, for example, a space character is represented as %20.

  `{AccountSid}` in the path is the `:account_sid` setting; pass `account_sid: "..."` as an option to use another.
  """
  @spec retrieve(String.t(), String.t(), keyword()) ::
          {:ok, Twilio.Schemas.Participant.t()} | {:error, Infusion.Runtime.Error.t()}
  def retrieve(conference_sid, call_sid, opts \\ []),
    do: Twilio.__request__(@retrieve_operation, [conference_sid, call_sid], %{}, opts)

  @doc "Like `retrieve/3`, but returns the result or raises `Infusion.Runtime.Error`."
  @spec retrieve!(String.t(), String.t(), keyword()) :: Twilio.Schemas.Participant.t()
  def retrieve!(conference_sid, call_sid, opts \\ []),
    do:
      Infusion.Runtime.Request.unwrap!(
        Twilio.__request__(@retrieve_operation, [conference_sid, call_sid], %{}, opts)
      )

  @update_operation %{
    id: "UpdateParticipant",
    method: :post,
    path:
      "/2010-04-01/Accounts/{AccountSid}/Conferences/{ConferenceSid}/Participants/{CallSid}.json",
    path_params: ["ConferenceSid", "CallSid"],
    client_path_params: [{"AccountSid", :account_sid}],
    params: [
      {:announce_method, "AnnounceMethod", :body},
      {:announce_url, "AnnounceUrl", :body},
      {:beep_on_exit, "BeepOnExit", :body},
      {:call_sid_to_coach, "CallSidToCoach", :body},
      {:coaching, "Coaching", :body},
      {:end_conference_on_exit, "EndConferenceOnExit", :body},
      {:hold, "Hold", :body},
      {:hold_method, "HoldMethod", :body},
      {:hold_url, "HoldUrl", :body},
      {:muted, "Muted", :body},
      {:wait_method, "WaitMethod", :body},
      {:wait_url, "WaitUrl", :body}
    ],
    body: :form,
    response: {:ref, Twilio.Schemas.Participant}
  }

  @doc """
  Update the properties of the participant

  `POST /2010-04-01/Accounts/{AccountSid}/Conferences/{ConferenceSid}/Participants/{CallSid}.json`

  ## Path parameters

    * `conference_sid` (required) - The SID of the conference with the participant to update.
    * `call_sid` (required) - The [Call](https://www.twilio.com/docs/voice/api/call-resource) SID or label of the participant to update. Non URL safe characters in a label must be percent encoded, for example, a space character is represented as %20.

  `{AccountSid}` in the path is the `:account_sid` setting; pass `account_sid: "..."` as an option to use another.

  ## Parameters

    * `announce_method` - The HTTP method we should use to call `announce_url`. Can be: `GET` or `POST` and defaults to `POST`.
    * `announce_url` - The URL we call using the `announce_method` for an announcement to the participant. The URL may return an MP3 file, a WAV file, or a TwiML document that contains `<Play>`, `<Say>`, `<Pause>`, or `<Redirect>` verbs.
    * `beep_on_exit` - Whether to play a notification beep to the conference when the participant exits. Can be: `true` or `false`.
    * `call_sid_to_coach` - The SID of the participant who is being `coached`. The participant being coached is the only participant who can hear the participant who is `coaching`.
    * `coaching` - Whether the participant is coaching another call. Can be: `true` or `false`. If not present, defaults to `false` unless `call_sid_to_coach` is defined. If `true`, `call_sid_to_coach` must be defined.
    * `end_conference_on_exit` - Whether to end the conference when the participant leaves. Can be: `true` or `false` and defaults to `false`.
    * `hold` - Whether the participant should be on hold. Can be: `true` or `false`. `true` puts the participant on hold, and `false` lets them rejoin the conference.
    * `hold_method` - The HTTP method we should use to call `hold_url`. Can be: `GET` or `POST` and the default is `GET`.
    * `hold_url` - The URL we call using the `hold_method` for music that plays when the participant is on hold. The URL may return an MP3 file, a WAV file, or a TwiML document that contains `<Play>`, `<Say>`, `<Pause>`, or `<Redirect>` verbs.
    * `muted` - Whether the participant should be muted. Can be `true` or `false`. `true` will mute the participant, and `false` will un-mute them. Anything value other than `true` or `false` is interpreted as `false`.
    * `wait_method` - The HTTP method we should use to call `wait_url`. Can be `GET` or `POST` and the default is `POST`. When using a static audio file, this should be `GET` so that we can cache the file.
    * `wait_url` - The URL that Twilio calls using the `wait_method` before the conference has started. The URL may return an MP3 file, a WAV file, or a TwiML document. The default value is the URL of our standard hold music. If you do not want anything to play while waiting for the conference to start, specify an empty string by setting `wait_url` to `''`. For more details on the allowable verbs within the `waitUrl`, see the `waitUrl` attribute in the [<Conference> TwiML instruction](https://www.twilio.com/docs/voice/twiml/conference#attributes-waiturl).
  """
  @spec update(String.t(), String.t(), map() | keyword(), keyword()) ::
          {:ok, Twilio.Schemas.Participant.t()} | {:error, Infusion.Runtime.Error.t()}
  def update(conference_sid, call_sid, params \\ %{}, opts \\ []),
    do: Twilio.__request__(@update_operation, [conference_sid, call_sid], params, opts)

  @doc "Like `update/4`, but returns the result or raises `Infusion.Runtime.Error`."
  @spec update!(String.t(), String.t(), map() | keyword(), keyword()) ::
          Twilio.Schemas.Participant.t()
  def update!(conference_sid, call_sid, params \\ %{}, opts \\ []),
    do:
      Infusion.Runtime.Request.unwrap!(
        Twilio.__request__(@update_operation, [conference_sid, call_sid], params, opts)
      )
end
