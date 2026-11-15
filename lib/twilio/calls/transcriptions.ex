defmodule Twilio.Calls.Transcriptions do
  @moduledoc """
  API calls: `create`, `update`.
  """

  @create_operation %{
    id: "CreateRealtimeTranscription",
    method: :post,
    path: "/2010-04-01/Accounts/{AccountSid}/Calls/{CallSid}/Transcriptions.json",
    path_params: ["CallSid"],
    client_path_params: [{"AccountSid", :account_sid}],
    params: [
      {:conversation_configuration, "ConversationConfiguration", :body},
      {:conversation_id, "ConversationId", :body},
      {:enable_automatic_punctuation, "EnableAutomaticPunctuation", :body},
      {:enable_provider_data, "EnableProviderData", :body},
      {:hints, "Hints", :body},
      {:inbound_track_label, "InboundTrackLabel", :body},
      {:intelligence_service, "IntelligenceService", :body},
      {:language_code, "LanguageCode", :body},
      {:name, "Name", :body},
      {:outbound_track_label, "OutboundTrackLabel", :body},
      {:partial_results, "PartialResults", :body},
      {:profanity_filter, "ProfanityFilter", :body},
      {:speech_model, "SpeechModel", :body},
      {:status_callback_method, "StatusCallbackMethod", :body},
      {:status_callback_url, "StatusCallbackUrl", :body},
      {:track, "Track", :body},
      {:transcription_configuration_id, "TranscriptionConfigurationId", :body},
      {:transcription_engine, "TranscriptionEngine", :body}
    ],
    body: :form,
    response: {:ref, Twilio.Schemas.RealtimeTranscription}
  }

  @doc """
  Create a Transcription

  `POST /2010-04-01/Accounts/{AccountSid}/Calls/{CallSid}/Transcriptions.json`

  ## Path parameters

    * `call_sid` (required) - The SID of the [Call](https://www.twilio.com/docs/voice/api/call-resource) the Transcription resource is associated with.

  `{AccountSid}` in the path is the `:account_sid` setting; pass `account_sid: "..."` as an option to use another.

  ## Parameters

    * `conversation_configuration` - The ID of the Conversations Configuration for customizing conversation behavior in Intelligence Service
    * `conversation_id` - The ID of the Conversation for associating this Transcription with an existing Conversation in Intelligence Service
    * `enable_automatic_punctuation` - The provider will add punctuation to recognition result
    * `enable_provider_data` - Whether the callback includes raw provider data.
    * `hints` - A Phrase contains words and phrase "hints" so that the speech recognition engine is more likely to recognize them.
    * `inbound_track_label` - Friendly name given to the Inbound Track
    * `intelligence_service` - The SID or unique name of the [Intelligence Service](https://www.twilio.com/docs/conversational-intelligence/api/service-resource) for persisting transcripts and running post-call Language Operators
    * `language_code` - Language code used by the transcription engine, specified in [BCP-47](https://www.rfc-editor.org/rfc/bcp/bcp47.txt) format
    * `name` - The user-specified name of this Transcription, if one was given when the Transcription was created. This may be used to stop the Transcription.
    * `outbound_track_label` - Friendly name given to the Outbound Track
    * `partial_results` - Indicates if partial results are going to be sent to the customer
    * `profanity_filter` - indicates if the server will attempt to filter out profanities, replacing all but the initial character in each filtered word with asterisks
    * `speech_model` - Recognition model used by the transcription engine, among those supported by the provider
    * `status_callback_method` - The http method for the status_callback (one of GET, POST).
    * `status_callback_url` - Absolute URL of the status callback.
    * `track`
    * `transcription_configuration_id` - The ID of the RealTimeTranscription Configuration for configuring all the non-default behaviors in one go.
    * `transcription_engine` - Definition of the transcription engine to be used, among those supported by Twilio
  """
  @spec create(String.t(), map() | keyword(), keyword()) ::
          {:ok, Twilio.Schemas.RealtimeTranscription.t()} | {:error, Infusion.Runtime.Error.t()}
  def create(call_sid, params \\ %{}, opts \\ []),
    do: Twilio.__request__(@create_operation, [call_sid], params, opts)

  @doc "Like `create/3`, but returns the result or raises `Infusion.Runtime.Error`."
  @spec create!(String.t(), map() | keyword(), keyword()) ::
          Twilio.Schemas.RealtimeTranscription.t()
  def create!(call_sid, params \\ %{}, opts \\ []),
    do:
      Infusion.Runtime.Request.unwrap!(
        Twilio.__request__(@create_operation, [call_sid], params, opts)
      )

  @update_operation %{
    id: "UpdateRealtimeTranscription",
    method: :post,
    path: "/2010-04-01/Accounts/{AccountSid}/Calls/{CallSid}/Transcriptions/{Sid}.json",
    path_params: ["CallSid", "Sid"],
    client_path_params: [{"AccountSid", :account_sid}],
    params: [{:status, "Status", :body}],
    body: :form,
    response: {:ref, Twilio.Schemas.RealtimeTranscription}
  }

  @doc """
  Stop a Transcription using either the SID of the Transcription resource or the `name` used when creating the resource

  `POST /2010-04-01/Accounts/{AccountSid}/Calls/{CallSid}/Transcriptions/{Sid}.json`

  ## Path parameters

    * `call_sid` (required) - The SID of the [Call](https://www.twilio.com/docs/voice/api/call-resource) the Transcription resource is associated with.
    * `sid` (required) - The SID of the Transcription resource, or the `name` used when creating the resource

  `{AccountSid}` in the path is the `:account_sid` setting; pass `account_sid: "..."` as an option to use another.

  ## Parameters

    * `status` (required)
  """
  @spec update(String.t(), String.t(), map() | keyword(), keyword()) ::
          {:ok, Twilio.Schemas.RealtimeTranscription.t()} | {:error, Infusion.Runtime.Error.t()}
  def update(call_sid, sid, params \\ %{}, opts \\ []),
    do: Twilio.__request__(@update_operation, [call_sid, sid], params, opts)

  @doc "Like `update/4`, but returns the result or raises `Infusion.Runtime.Error`."
  @spec update!(String.t(), String.t(), map() | keyword(), keyword()) ::
          Twilio.Schemas.RealtimeTranscription.t()
  def update!(call_sid, sid, params \\ %{}, opts \\ []),
    do:
      Infusion.Runtime.Request.unwrap!(
        Twilio.__request__(@update_operation, [call_sid, sid], params, opts)
      )
end
