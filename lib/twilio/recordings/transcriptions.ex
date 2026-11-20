defmodule Twilio.Recordings.Transcriptions do
  @moduledoc """
  API calls: `delete`, `list`, `retrieve`.
  """

  @delete_operation %{
    id: "DeleteRecordingTranscription",
    method: :delete,
    path: "/2010-04-01/Accounts/{AccountSid}/Recordings/{RecordingSid}/Transcriptions/{Sid}.json",
    path_params: ["RecordingSid", "Sid"],
    client_path_params: [{"AccountSid", :account_sid}],
    params: [],
    response: nil
  }

  @doc """
  `DELETE /2010-04-01/Accounts/{AccountSid}/Recordings/{RecordingSid}/Transcriptions/{Sid}.json`

  ## Path parameters

    * `recording_sid` (required) - The SID of the [Recording](https://www.twilio.com/docs/voice/api/recording) that created the transcription to delete.
    * `sid` (required) - The Twilio-provided string that uniquely identifies the Transcription resource to delete.

  `{AccountSid}` in the path is the `:account_sid` setting; pass `account_sid: "..."` as an option to use another.
  """
  @spec delete(String.t(), String.t(), keyword()) ::
          {:ok, nil} | {:error, Infusion.Runtime.Error.t()}
  def delete(recording_sid, sid, opts \\ []),
    do: Twilio.__request__(@delete_operation, [recording_sid, sid], %{}, opts)

  @doc "Like `delete/3`, but returns the result or raises `Infusion.Runtime.Error`."
  @spec delete!(String.t(), String.t(), keyword()) :: nil
  def delete!(recording_sid, sid, opts \\ []),
    do:
      Infusion.Runtime.Request.unwrap!(
        Twilio.__request__(@delete_operation, [recording_sid, sid], %{}, opts)
      )

  @list_operation %{
    id: "ListRecordingTranscription",
    method: :get,
    path: "/2010-04-01/Accounts/{AccountSid}/Recordings/{RecordingSid}/Transcriptions.json",
    path_params: ["RecordingSid"],
    client_path_params: [{"AccountSid", :account_sid}],
    params: [
      {:page_size, "PageSize", :query},
      {:page, "Page", :query},
      {:page_token, "PageToken", :query}
    ],
    response: {:ref, Twilio.Schemas.RecordingsTranscriptionsListResponse},
    paginate: %{
      from: ["next_page_uri"],
      id: "sid",
      items: ["transcriptions"],
      style: :next_url,
      item: {:ref, Twilio.Schemas.RecordingTranscription}
    }
  }

  @doc """
  `GET /2010-04-01/Accounts/{AccountSid}/Recordings/{RecordingSid}/Transcriptions.json`

  ## Path parameters

    * `recording_sid` (required) - The SID of the [Recording](https://www.twilio.com/docs/voice/api/recording) that created the transcriptions to read.

  `{AccountSid}` in the path is the `:account_sid` setting; pass `account_sid: "..."` as an option to use another.

  ## Parameters

    * `page_size` - How many resources to return in each list page. The default is 50, and the maximum is 1000.
    * `page` - The page index. This value is simply for client state.
    * `page_token` - The page token. This is provided by the API.

  To read every item across all pages, use `list_all`.
  """
  @spec list(String.t(), map() | keyword(), keyword()) ::
          {:ok, Twilio.Schemas.RecordingsTranscriptionsListResponse.t()}
          | {:error, Infusion.Runtime.Error.t()}
  def list(recording_sid, params \\ %{}, opts \\ []),
    do: Twilio.__request__(@list_operation, [recording_sid], params, opts)

  @doc "Like `list/3`, but returns the result or raises `Infusion.Runtime.Error`."
  @spec list!(String.t(), map() | keyword(), keyword()) ::
          Twilio.Schemas.RecordingsTranscriptionsListResponse.t()
  def list!(recording_sid, params \\ %{}, opts \\ []),
    do:
      Infusion.Runtime.Request.unwrap!(
        Twilio.__request__(@list_operation, [recording_sid], params, opts)
      )

  @doc """
  Like `list/3`, but returns every item, from every page: a lazy stream of `Twilio.Schemas.RecordingTranscription.t()` that fetches pages as it is read.

  The first page is fetched right away, so its errors are returned; a later page that fails raises `Infusion.Runtime.Error`. Stopping early (`Enum.take/2`) fetches no more pages.
  """
  @spec list_all(String.t(), map() | keyword(), keyword()) ::
          {:ok, Enumerable.t()} | {:error, Infusion.Runtime.Error.t()}
  def list_all(recording_sid, params \\ %{}, opts \\ []),
    do: Twilio.__paginate__(@list_operation, [recording_sid], params, opts)

  @doc "Like `list_all/3`, but returns the stream or raises `Infusion.Runtime.Error`."
  @spec list_all!(String.t(), map() | keyword(), keyword()) :: Enumerable.t()
  def list_all!(recording_sid, params \\ %{}, opts \\ []),
    do:
      Infusion.Runtime.Request.unwrap!(
        Twilio.__paginate__(@list_operation, [recording_sid], params, opts)
      )

  @doc """
  Watches this list and sends what changes: starts a process, linked to the caller, that polls it (with `ETag`s, so unchanged pages cost a `304`) and sends `{:infusion_watch, pid, %Infusion.Runtime.Watch.Event{}}` for every Twilio.Schemas.RecordingTranscription.t() created, updated, deleted, or that moved into view (`:entered`).

  Options: `every:` (milliseconds, default 30 seconds), `to:` (a pid, `{:pubsub, MyApp.PubSub, topic}` or a function), `pages:`, `initial:`, `ignore:`, plus any setting of `Infusion.Runtime.Config`. See `Infusion.Runtime.Watch`.
  """
  @spec list_watch(String.t(), map() | keyword(), keyword()) ::
          {:ok, pid()} | {:error, Infusion.Runtime.Error.t()}
  def list_watch(recording_sid, params \\ %{}, opts \\ []),
    do: Twilio.__watch__(@list_operation, [recording_sid], params, opts)

  @doc "Like `list_watch/3`, but returns the stream or raises `Infusion.Runtime.Error`."
  @spec list_watch!(String.t(), map() | keyword(), keyword()) :: pid()
  def list_watch!(recording_sid, params \\ %{}, opts \\ []),
    do:
      Infusion.Runtime.Request.unwrap!(
        Twilio.__watch__(@list_operation, [recording_sid], params, opts)
      )

  @retrieve_operation %{
    id: "FetchRecordingTranscription",
    method: :get,
    path: "/2010-04-01/Accounts/{AccountSid}/Recordings/{RecordingSid}/Transcriptions/{Sid}.json",
    path_params: ["RecordingSid", "Sid"],
    client_path_params: [{"AccountSid", :account_sid}],
    params: [],
    response: {:ref, Twilio.Schemas.RecordingTranscription}
  }

  @doc """
  `GET /2010-04-01/Accounts/{AccountSid}/Recordings/{RecordingSid}/Transcriptions/{Sid}.json`

  ## Path parameters

    * `recording_sid` (required) - The SID of the [Recording](https://www.twilio.com/docs/voice/api/recording) that created the transcription to fetch.
    * `sid` (required) - The Twilio-provided string that uniquely identifies the Transcription resource to fetch.

  `{AccountSid}` in the path is the `:account_sid` setting; pass `account_sid: "..."` as an option to use another.
  """
  @spec retrieve(String.t(), String.t(), keyword()) ::
          {:ok, Twilio.Schemas.RecordingTranscription.t()} | {:error, Infusion.Runtime.Error.t()}
  def retrieve(recording_sid, sid, opts \\ []),
    do: Twilio.__request__(@retrieve_operation, [recording_sid, sid], %{}, opts)

  @doc "Like `retrieve/3`, but returns the result or raises `Infusion.Runtime.Error`."
  @spec retrieve!(String.t(), String.t(), keyword()) :: Twilio.Schemas.RecordingTranscription.t()
  def retrieve!(recording_sid, sid, opts \\ []),
    do:
      Infusion.Runtime.Request.unwrap!(
        Twilio.__request__(@retrieve_operation, [recording_sid, sid], %{}, opts)
      )
end
