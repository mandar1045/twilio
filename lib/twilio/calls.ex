defmodule Twilio.Calls do
  @moduledoc """
  API calls: `create`, `delete`, `list`, `retrieve`, `update`.
  """

  @create_operation %{
    id: "CreateCall",
    method: :post,
    path: "/2010-04-01/Accounts/{AccountSid}/Calls.json",
    path_params: [],
    client_path_params: [{"AccountSid", :account_sid}],
    params: [
      {:application_sid, "ApplicationSid", :body},
      {:async_amd, "AsyncAmd", :body},
      {:async_amd_status_callback, "AsyncAmdStatusCallback", :body},
      {:async_amd_status_callback_method, "AsyncAmdStatusCallbackMethod", :body},
      {:byoc, "Byoc", :body},
      {:call_reason, "CallReason", :body},
      {:call_token, "CallToken", :body},
      {:caller_id, "CallerId", :body},
      {:client_notification_url, "ClientNotificationUrl", :body},
      {:fallback_method, "FallbackMethod", :body},
      {:fallback_url, "FallbackUrl", :body},
      {:from, "From", :body},
      {:machine_detection, "MachineDetection", :body},
      {:machine_detection_silence_timeout, "MachineDetectionSilenceTimeout", :body},
      {:machine_detection_speech_end_threshold, "MachineDetectionSpeechEndThreshold", :body},
      {:machine_detection_speech_threshold, "MachineDetectionSpeechThreshold", :body},
      {:machine_detection_timeout, "MachineDetectionTimeout", :body},
      {:method, "Method", :body},
      {:passports, "Passports", :body},
      {:record, "Record", :body},
      {:recording_channels, "RecordingChannels", :body},
      {:recording_configuration_id, "RecordingConfigurationId", :body},
      {:recording_status_callback, "RecordingStatusCallback", :body},
      {:recording_status_callback_event, "RecordingStatusCallbackEvent", :body},
      {:recording_status_callback_method, "RecordingStatusCallbackMethod", :body},
      {:recording_track, "RecordingTrack", :body},
      {:send_digits, "SendDigits", :body},
      {:sip_auth_password, "SipAuthPassword", :body},
      {:sip_auth_username, "SipAuthUsername", :body},
      {:status_callback, "StatusCallback", :body},
      {:status_callback_event, "StatusCallbackEvent", :body},
      {:status_callback_method, "StatusCallbackMethod", :body},
      {:time_limit, "TimeLimit", :body},
      {:timeout, "Timeout", :body},
      {:to, "To", :body},
      {:trim, "Trim", :body},
      {:twiml, "Twiml", :body},
      {:url, "Url", :body}
    ],
    body: :form,
    response: {:ref, Twilio.Schemas.Call}
  }

  @doc """
  Create a new outgoing call to phones, SIP-enabled endpoints or Twilio Client connections

  `POST /2010-04-01/Accounts/{AccountSid}/Calls.json`

  `{AccountSid}` in the path is the `:account_sid` setting; pass `account_sid: "..."` as an option to use another.

  ## Parameters

    * `application_sid` - The SID of the Application resource that will handle the call, if the call will be handled by an application.
    * `async_amd` - Select whether to perform answering machine detection in the background. Default, blocks the execution of the call until Answering Machine Detection is completed. Can be: `true` or `false`.
    * `async_amd_status_callback` - The URL that we should call using the `async_amd_status_callback_method` to notify customer application whether the call was answered by human, machine or fax.
    * `async_amd_status_callback_method` - The HTTP method we should use when calling the `async_amd_status_callback` URL. Can be: `GET` or `POST` and the default is `POST`.
    * `byoc` - The SID of a BYOC (Bring Your Own Carrier) trunk to route this call with. Note that `byoc` is only meaningful when `to` is a phone number; it will otherwise be ignored. (Beta)
    * `call_reason` - The Reason for the outgoing call. Use it to specify the purpose of the call that is presented on the called party's phone. (Branded Calls Beta)
    * `call_token` - A token string needed to invoke a forwarded call. A call_token is generated when an incoming call is received on a Twilio number. Pass an incoming call's call_token value to a forwarded call via the call_token parameter when creating a new call. A forwarded call should bear the same CallerID of the original incoming call.
    * `caller_id` - The phone number, SIP address, or Client identifier that made this call. Phone numbers are in [E.164 format](https://wwnw.twilio.com/docs/glossary/what-e164) (e.g., +16175551212). SIP addresses are formatted as `name@company.com`.
    * `client_notification_url` - The URL that we should use to deliver `push call notification`.
    * `fallback_method` - The HTTP method that we should use to request the `fallback_url`. Can be: `GET` or `POST` and the default is `POST`. If an `application_sid` parameter is present, this parameter is ignored.
    * `fallback_url` - The URL that we call using the `fallback_method` if an error occurs when requesting or executing the TwiML at `url`. If an `application_sid` parameter is present, this parameter is ignored.
    * `from` (required) - The phone number or client identifier to use as the caller id. If using a phone number, it must be a Twilio number or a Verified [outgoing caller id](https://www.twilio.com/docs/voice/api/outgoing-caller-ids) for your account. If the `to` parameter is a phone number, `From` must also be a phone number.
    * `machine_detection` - Whether to detect if a human, answering machine, or fax has picked up the call. Can be: `Enable` or `DetectMessageEnd`. Use `Enable` if you would like us to return `AnsweredBy` as soon as the called party is identified. Use `DetectMessageEnd`, if you would like to leave a message on an answering machine. If `send_digits` is provided, this parameter is ignored. For more information, see [Answering Machine Detection](https://www.twilio.com/docs/voice/answering-machine-detection).
    * `machine_detection_silence_timeout` - The number of milliseconds of initial silence after which an `unknown` AnsweredBy result will be returned. Possible Values: 2000-10000. Default: 5000.
    * `machine_detection_speech_end_threshold` - The number of milliseconds of silence after speech activity at which point the speech activity is considered complete. Possible Values: 500-5000. Default: 1200.
    * `machine_detection_speech_threshold` - The number of milliseconds that is used as the measuring stick for the length of the speech activity, where durations lower than this value will be interpreted as a human and longer than this value as a machine. Possible Values: 1000-6000. Default: 2400.
    * `machine_detection_timeout` - The number of seconds that we should attempt to detect an answering machine before timing out and sending a voice request with `AnsweredBy` of `unknown`. The default timeout is 30 seconds.
    * `method` - The HTTP method we should use when calling the `url` parameter's value. Can be: `GET` or `POST` and the default is `POST`. If an `application_sid` parameter is present, this parameter is ignored.
    * `passports` - The STIR/SHAKEN passport for this call, provided as a base64 encoded string. Multiple passports (at max 5) are comma separated and provided as base64 encoded string
    * `record` - Whether to record the call. Can be `true` to record the phone call, or `false` to not. The default is `false`. The `recording_url` is sent to the `status_callback` URL.
    * `recording_channels` - The number of channels in the final recording. Can be: `mono` or `dual`. The default is `mono`. `mono` records both legs of the call in a single channel of the recording file. `dual` records each leg to a separate channel of the recording file. The first channel of a dual-channel recording contains the parent call and the second channel contains the child call.
    * `recording_configuration_id` - The identifier of the configuration to be used when creating and processing the recording
    * `recording_status_callback` - The URL that we call when the recording is available to be accessed.
    * `recording_status_callback_event` - The recording status events that will trigger calls to the URL specified in `recording_status_callback`. Can be: `in-progress`, `completed` and `absent`. Defaults to `completed`. Separate multiple values with a space.
    * `recording_status_callback_method` - The HTTP method we should use when calling the `recording_status_callback` URL. Can be: `GET` or `POST` and the default is `POST`.
    * `recording_track` - The audio track to record for the call. Can be: `inbound`, `outbound` or `both`. The default is `both`. `inbound` records the audio that is received by Twilio. `outbound` records the audio that is generated from Twilio. `both` records the audio that is received and generated by Twilio.
    * `send_digits` - The string of keys to dial after connecting to the number, with a maximum length of 32 digits. Valid digits in the string include any digit (`0`-`9`), '`A`', '`B`', '`C`', '`D`', '`#`', and '`*`'. You can also use '`w`' to insert a half-second pause and '`W`' to insert a one-second pause. For example, to pause for one second after connecting and then dial extension 1234 followed by the # key, set this parameter to `W1234#`. Be sure to URL-encode this string because the '`#`' character has special meaning in a URL. If both `SendDigits` and `MachineDetection` parameters are provided, then `MachineDetection` will be ignored.
    * `sip_auth_password` - The password required to authenticate the user account specified in `sip_auth_username`.
    * `sip_auth_username` - The username used to authenticate the caller making a SIP call.
    * `status_callback` - The URL we should call using the `status_callback_method` to send status information to your application. If no `status_callback_event` is specified, we will send the `completed` status. If an `application_sid` parameter is present, this parameter is ignored. URLs must contain a valid hostname (underscores are not permitted).
    * `status_callback_event` - The call progress events that we will send to the `status_callback` URL. Can be: `initiated`, `ringing`, `answered`, and `completed`. If no event is specified, we send the `completed` status. If you want to receive multiple events, specify each one in a separate `status_callback_event` parameter. See the code sample for [monitoring call progress](https://www.twilio.com/docs/voice/api/call-resource?code-sample=code-create-a-call-resource-and-specify-a-statuscallbackevent&code-sdk-version=json). If an `application_sid` is present, this parameter is ignored.
    * `status_callback_method` - The HTTP method we should use when calling the `status_callback` URL. Can be: `GET` or `POST` and the default is `POST`. If an `application_sid` parameter is present, this parameter is ignored.
    * `time_limit` - The maximum duration of the call in seconds. Constraints depend on account and configuration.
    * `timeout` - The integer number of seconds that we should allow the phone to ring before assuming there is no answer. The default is `60` seconds and the maximum is `600` seconds. For some call flows, we will add a 5-second buffer to the timeout value you provide. For this reason, a timeout value of 10 seconds could result in an actual timeout closer to 15 seconds. You can set this to a short time, such as `15` seconds, to hang up before reaching an answering machine or voicemail.
    * `to` (required) - The phone number, SIP address, or client identifier to call.
    * `trim` - Whether to trim any leading and trailing silence from the recording. Can be: `trim-silence` or `do-not-trim` and the default is `trim-silence`.
    * `twiml` - TwiML instructions for the call Twilio will use without fetching Twiml from url parameter. If both `twiml` and `url` are provided then `twiml` parameter will be ignored. Max 4000 characters.
    * `url` - The absolute URL that returns the TwiML instructions for the call. We will call this URL using the `method` when the call connects. For more information, see the [Url Parameter](https://www.twilio.com/docs/voice/make-calls#specify-a-url-parameter) section in [Making Calls](https://www.twilio.com/docs/voice/make-calls).
  """
  @spec create(map() | keyword(), keyword()) ::
          {:ok, Twilio.Schemas.Call.t()} | {:error, Infusion.Runtime.Error.t()}
  def create(params \\ %{}, opts \\ []),
    do: Twilio.__request__(@create_operation, [], params, opts)

  @doc "Like `create/2`, but returns the result or raises `Infusion.Runtime.Error`."
  @spec create!(map() | keyword(), keyword()) :: Twilio.Schemas.Call.t()
  def create!(params \\ %{}, opts \\ []),
    do: Infusion.Runtime.Request.unwrap!(Twilio.__request__(@create_operation, [], params, opts))

  @delete_operation %{
    id: "DeleteCall",
    method: :delete,
    path: "/2010-04-01/Accounts/{AccountSid}/Calls/{Sid}.json",
    path_params: ["Sid"],
    client_path_params: [{"AccountSid", :account_sid}],
    params: [],
    response: nil
  }

  @doc """
  Delete a Call record from your account. Once the record is deleted, it will no longer appear in the API and Account Portal logs.

  `DELETE /2010-04-01/Accounts/{AccountSid}/Calls/{Sid}.json`

  ## Path parameters

    * `sid` (required) - The Twilio-provided Call SID that uniquely identifies the Call resource to delete

  `{AccountSid}` in the path is the `:account_sid` setting; pass `account_sid: "..."` as an option to use another.
  """
  @spec delete(String.t(), keyword()) :: {:ok, nil} | {:error, Infusion.Runtime.Error.t()}
  def delete(sid, opts \\ []), do: Twilio.__request__(@delete_operation, [sid], %{}, opts)

  @doc "Like `delete/2`, but returns the result or raises `Infusion.Runtime.Error`."
  @spec delete!(String.t(), keyword()) :: nil
  def delete!(sid, opts \\ []),
    do: Infusion.Runtime.Request.unwrap!(Twilio.__request__(@delete_operation, [sid], %{}, opts))

  @list_operation %{
    id: "ListCall",
    method: :get,
    path: "/2010-04-01/Accounts/{AccountSid}/Calls.json",
    path_params: [],
    client_path_params: [{"AccountSid", :account_sid}],
    params: [
      {:to, "To", :query},
      {:from, "From", :query},
      {:parent_call_sid, "ParentCallSid", :query},
      {:status, "Status", :query},
      {:start_time, "StartTime", :query},
      {:start_time_query, "StartTime<", :query},
      {:start_time_query_2, "StartTime>", :query},
      {:end_time, "EndTime", :query},
      {:end_time_query, "EndTime<", :query},
      {:end_time_query_2, "EndTime>", :query},
      {:page_size, "PageSize", :query},
      {:page, "Page", :query},
      {:page_token, "PageToken", :query}
    ],
    response: {:ref, Twilio.Schemas.CallsListResponse},
    paginate: %{
      from: ["next_page_uri"],
      id: "sid",
      items: ["calls"],
      style: :next_url,
      item: {:ref, Twilio.Schemas.Call}
    }
  }

  @doc """
  Retrieves a collection of calls made to and from your account

  `GET /2010-04-01/Accounts/{AccountSid}/Calls.json`

  `{AccountSid}` in the path is the `:account_sid` setting; pass `account_sid: "..."` as an option to use another.

  ## Parameters

    * `to` - Only show calls made to this phone number, SIP address, Client identifier or SIM SID.
    * `from` - Only include calls from this phone number, SIP address, Client identifier or SIM SID.
    * `parent_call_sid` - Only include calls spawned by calls with this SID.
    * `status` - The status of the calls to include. Can be: `queued`, `ringing`, `in-progress`, `canceled`, `completed`, `failed`, `busy`, or `no-answer`.
    * `start_time` - Only include calls that started on this date. Specify a date as `YYYY-MM-DD` in UTC, for example: `2009-07-06`, to read only calls that started on this date.
    * `start_time_query` - Only include calls that started before this date. Specify a date as `YYYY-MM-DD` in UTC, for example: `2009-07-06`, to read only calls that started before this date.
    * `start_time_query_2` - Only include calls that started on or after this date. Specify a date as `YYYY-MM-DD` in UTC, for example: `2009-07-06`, to read only calls that started on or after this date.
    * `end_time` - Only include calls that ended on this date. Specify a date as `YYYY-MM-DD` in UTC, for example: `2009-07-06`, to read only calls that ended on this date.
    * `end_time_query` - Only include calls that ended before this date. Specify a date as `YYYY-MM-DD` in UTC, for example: `2009-07-06`, to read only calls that ended before this date.
    * `end_time_query_2` - Only include calls that ended on or after this date. Specify a date as `YYYY-MM-DD` in UTC, for example: `2009-07-06`, to read only calls that ended on or after this date.
    * `page_size` - How many resources to return in each list page. The default is 50, and the maximum is 1000.
    * `page` - The page index. This value is simply for client state.
    * `page_token` - The page token. This is provided by the API.

  To read every item across all pages, use `list_all`.
  """
  @spec list(map() | keyword(), keyword()) ::
          {:ok, Twilio.Schemas.CallsListResponse.t()} | {:error, Infusion.Runtime.Error.t()}
  def list(params \\ %{}, opts \\ []), do: Twilio.__request__(@list_operation, [], params, opts)

  @doc "Like `list/2`, but returns the result or raises `Infusion.Runtime.Error`."
  @spec list!(map() | keyword(), keyword()) :: Twilio.Schemas.CallsListResponse.t()
  def list!(params \\ %{}, opts \\ []),
    do: Infusion.Runtime.Request.unwrap!(Twilio.__request__(@list_operation, [], params, opts))

  @doc """
  Like `list/2`, but returns every item, from every page: a lazy stream of `Twilio.Schemas.Call.t()` that fetches pages as it is read.

  The first page is fetched right away, so its errors are returned; a later page that fails raises `Infusion.Runtime.Error`. Stopping early (`Enum.take/2`) fetches no more pages.
  """
  @spec list_all(map() | keyword(), keyword()) ::
          {:ok, Enumerable.t()} | {:error, Infusion.Runtime.Error.t()}
  def list_all(params \\ %{}, opts \\ []),
    do: Twilio.__paginate__(@list_operation, [], params, opts)

  @doc "Like `list_all/2`, but returns the stream or raises `Infusion.Runtime.Error`."
  @spec list_all!(map() | keyword(), keyword()) :: Enumerable.t()
  def list_all!(params \\ %{}, opts \\ []),
    do: Infusion.Runtime.Request.unwrap!(Twilio.__paginate__(@list_operation, [], params, opts))

  @doc """
  Watches this list and sends what changes: starts a process, linked to the caller, that polls it (with `ETag`s, so unchanged pages cost a `304`) and sends `{:infusion_watch, pid, %Infusion.Runtime.Watch.Event{}}` for every Twilio.Schemas.Call.t() created, updated, deleted, or that moved into view (`:entered`).

  Options: `every:` (milliseconds, default 30 seconds), `to:` (a pid, `{:pubsub, MyApp.PubSub, topic}` or a function), `pages:`, `initial:`, `ignore:`, plus any setting of `Infusion.Runtime.Config`. See `Infusion.Runtime.Watch`.
  """
  @spec list_watch(map() | keyword(), keyword()) ::
          {:ok, pid()} | {:error, Infusion.Runtime.Error.t()}
  def list_watch(params \\ %{}, opts \\ []),
    do: Twilio.__watch__(@list_operation, [], params, opts)

  @doc "Like `list_watch/2`, but returns the stream or raises `Infusion.Runtime.Error`."
  @spec list_watch!(map() | keyword(), keyword()) :: pid()
  def list_watch!(params \\ %{}, opts \\ []),
    do: Infusion.Runtime.Request.unwrap!(Twilio.__watch__(@list_operation, [], params, opts))

  @retrieve_operation %{
    id: "FetchCall",
    method: :get,
    path: "/2010-04-01/Accounts/{AccountSid}/Calls/{Sid}.json",
    path_params: ["Sid"],
    client_path_params: [{"AccountSid", :account_sid}],
    params: [],
    response: {:ref, Twilio.Schemas.Call}
  }

  @doc """
  Fetch the call specified by the provided Call SID

  `GET /2010-04-01/Accounts/{AccountSid}/Calls/{Sid}.json`

  ## Path parameters

    * `sid` (required) - The SID of the Call resource to fetch.

  `{AccountSid}` in the path is the `:account_sid` setting; pass `account_sid: "..."` as an option to use another.
  """
  @spec retrieve(String.t(), keyword()) ::
          {:ok, Twilio.Schemas.Call.t()} | {:error, Infusion.Runtime.Error.t()}
  def retrieve(sid, opts \\ []), do: Twilio.__request__(@retrieve_operation, [sid], %{}, opts)

  @doc "Like `retrieve/2`, but returns the result or raises `Infusion.Runtime.Error`."
  @spec retrieve!(String.t(), keyword()) :: Twilio.Schemas.Call.t()
  def retrieve!(sid, opts \\ []),
    do:
      Infusion.Runtime.Request.unwrap!(Twilio.__request__(@retrieve_operation, [sid], %{}, opts))

  @update_operation %{
    id: "UpdateCall",
    method: :post,
    path: "/2010-04-01/Accounts/{AccountSid}/Calls/{Sid}.json",
    path_params: ["Sid"],
    client_path_params: [{"AccountSid", :account_sid}],
    params: [
      {:fallback_method, "FallbackMethod", :body},
      {:fallback_url, "FallbackUrl", :body},
      {:method, "Method", :body},
      {:status, "Status", :body},
      {:status_callback, "StatusCallback", :body},
      {:status_callback_method, "StatusCallbackMethod", :body},
      {:time_limit, "TimeLimit", :body},
      {:twiml, "Twiml", :body},
      {:url, "Url", :body}
    ],
    body: :form,
    response: {:ref, Twilio.Schemas.Call}
  }

  @doc """
  Initiates a call redirect or terminates a call

  `POST /2010-04-01/Accounts/{AccountSid}/Calls/{Sid}.json`

  ## Path parameters

    * `sid` (required) - The Twilio-provided string that uniquely identifies the Call resource to update

  `{AccountSid}` in the path is the `:account_sid` setting; pass `account_sid: "..."` as an option to use another.

  ## Parameters

    * `fallback_method` - The HTTP method that we should use to request the `fallback_url`. Can be: `GET` or `POST` and the default is `POST`. If an `application_sid` parameter is present, this parameter is ignored.
    * `fallback_url` - The URL that we call using the `fallback_method` if an error occurs when requesting or executing the TwiML at `url`. If an `application_sid` parameter is present, this parameter is ignored.
    * `method` - The HTTP method we should use when calling the `url`. Can be: `GET` or `POST` and the default is `POST`. If an `application_sid` parameter is present, this parameter is ignored.
    * `status`
    * `status_callback` - The URL we should call using the `status_callback_method` to send status information to your application. If no `status_callback_event` is specified, we will send the `completed` status. If an `application_sid` parameter is present, this parameter is ignored. URLs must contain a valid hostname (underscores are not permitted).
    * `status_callback_method` - The HTTP method we should use when requesting the `status_callback` URL. Can be: `GET` or `POST` and the default is `POST`. If an `application_sid` parameter is present, this parameter is ignored.
    * `time_limit` - The maximum duration of the call in seconds. Constraints depend on account and configuration.
    * `twiml` - TwiML instructions for the call Twilio will use without fetching Twiml from url. Twiml and url parameters are mutually exclusive
    * `url` - The absolute URL that returns the TwiML instructions for the call. We will call this URL using the `method` when the call connects. For more information, see the [Url Parameter](https://www.twilio.com/docs/voice/make-calls#specify-a-url-parameter) section in [Making Calls](https://www.twilio.com/docs/voice/make-calls).
  """
  @spec update(String.t(), map() | keyword(), keyword()) ::
          {:ok, Twilio.Schemas.Call.t()} | {:error, Infusion.Runtime.Error.t()}
  def update(sid, params \\ %{}, opts \\ []),
    do: Twilio.__request__(@update_operation, [sid], params, opts)

  @doc "Like `update/3`, but returns the result or raises `Infusion.Runtime.Error`."
  @spec update!(String.t(), map() | keyword(), keyword()) :: Twilio.Schemas.Call.t()
  def update!(sid, params \\ %{}, opts \\ []),
    do:
      Infusion.Runtime.Request.unwrap!(Twilio.__request__(@update_operation, [sid], params, opts))
end
