defmodule Twilio.Conferences.Recordings do
  @moduledoc """
  API calls: `delete`, `list`, `retrieve`, `update`.
  """

  @delete_operation %{
    id: "DeleteConferenceRecording",
    method: :delete,
    path: "/2010-04-01/Accounts/{AccountSid}/Conferences/{ConferenceSid}/Recordings/{Sid}.json",
    path_params: ["ConferenceSid", "Sid"],
    client_path_params: [{"AccountSid", :account_sid}],
    params: [],
    response: nil
  }

  @doc """
  Delete a recording from your account

  `DELETE /2010-04-01/Accounts/{AccountSid}/Conferences/{ConferenceSid}/Recordings/{Sid}.json`

  ## Path parameters

    * `conference_sid` (required) - The Conference SID that identifies the conference associated with the recording to delete.
    * `sid` (required) - The Twilio-provided string that uniquely identifies the Conference Recording resource to delete.

  `{AccountSid}` in the path is the `:account_sid` setting; pass `account_sid: "..."` as an option to use another.
  """
  @spec delete(String.t(), String.t(), keyword()) ::
          {:ok, nil} | {:error, Infusion.Runtime.Error.t()}
  def delete(conference_sid, sid, opts \\ []),
    do: Twilio.__request__(@delete_operation, [conference_sid, sid], %{}, opts)

  @doc "Like `delete/3`, but returns the result or raises `Infusion.Runtime.Error`."
  @spec delete!(String.t(), String.t(), keyword()) :: nil
  def delete!(conference_sid, sid, opts \\ []),
    do:
      Infusion.Runtime.Request.unwrap!(
        Twilio.__request__(@delete_operation, [conference_sid, sid], %{}, opts)
      )

  @list_operation %{
    id: "ListConferenceRecording",
    method: :get,
    path: "/2010-04-01/Accounts/{AccountSid}/Conferences/{ConferenceSid}/Recordings.json",
    path_params: ["ConferenceSid"],
    client_path_params: [{"AccountSid", :account_sid}],
    params: [
      {:date_created, "DateCreated", :query},
      {:date_created_query, "DateCreated<", :query},
      {:date_created_query_2, "DateCreated>", :query},
      {:page_size, "PageSize", :query},
      {:page, "Page", :query},
      {:page_token, "PageToken", :query}
    ],
    response: {:ref, Twilio.Schemas.ConferencesRecordingsListResponse},
    paginate: %{
      from: ["next_page_uri"],
      id: "sid",
      items: ["recordings"],
      style: :next_url,
      item: {:ref, Twilio.Schemas.ConferenceRecording}
    }
  }

  @doc """
  Retrieve a list of recordings belonging to the call used to make the request

  `GET /2010-04-01/Accounts/{AccountSid}/Conferences/{ConferenceSid}/Recordings.json`

  ## Path parameters

    * `conference_sid` (required) - The Conference SID that identifies the conference associated with the recording to read.

  `{AccountSid}` in the path is the `:account_sid` setting; pass `account_sid: "..."` as an option to use another.

  ## Parameters

    * `date_created` - The `date_created` value, specified as `YYYY-MM-DD`, of the resources to read. You can also specify inequality: `DateCreated<=YYYY-MM-DD` will return recordings generated at or before midnight on a given date, and `DateCreated>=YYYY-MM-DD` returns recordings generated at or after midnight on a date.
    * `date_created_query` - The `date_created` value, specified as `YYYY-MM-DD`, of the resources to read. You can also specify inequality: `DateCreated<=YYYY-MM-DD` will return recordings generated at or before midnight on a given date, and `DateCreated>=YYYY-MM-DD` returns recordings generated at or after midnight on a date.
    * `date_created_query_2` - The `date_created` value, specified as `YYYY-MM-DD`, of the resources to read. You can also specify inequality: `DateCreated<=YYYY-MM-DD` will return recordings generated at or before midnight on a given date, and `DateCreated>=YYYY-MM-DD` returns recordings generated at or after midnight on a date.
    * `page_size` - How many resources to return in each list page. The default is 50, and the maximum is 1000.
    * `page` - The page index. This value is simply for client state.
    * `page_token` - The page token. This is provided by the API.

  To read every item across all pages, use `list_all`.
  """
  @spec list(String.t(), map() | keyword(), keyword()) ::
          {:ok, Twilio.Schemas.ConferencesRecordingsListResponse.t()}
          | {:error, Infusion.Runtime.Error.t()}
  def list(conference_sid, params \\ %{}, opts \\ []),
    do: Twilio.__request__(@list_operation, [conference_sid], params, opts)

  @doc "Like `list/3`, but returns the result or raises `Infusion.Runtime.Error`."
  @spec list!(String.t(), map() | keyword(), keyword()) ::
          Twilio.Schemas.ConferencesRecordingsListResponse.t()
  def list!(conference_sid, params \\ %{}, opts \\ []),
    do:
      Infusion.Runtime.Request.unwrap!(
        Twilio.__request__(@list_operation, [conference_sid], params, opts)
      )

  @doc """
  Like `list/3`, but returns every item, from every page: a lazy stream of `Twilio.Schemas.ConferenceRecording.t()` that fetches pages as it is read.

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
  Watches this list and sends what changes: starts a process, linked to the caller, that polls it (with `ETag`s, so unchanged pages cost a `304`) and sends `{:infusion_watch, pid, %Infusion.Runtime.Watch.Event{}}` for every Twilio.Schemas.ConferenceRecording.t() created, updated, deleted, or that moved into view (`:entered`).

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
    id: "FetchConferenceRecording",
    method: :get,
    path: "/2010-04-01/Accounts/{AccountSid}/Conferences/{ConferenceSid}/Recordings/{Sid}.json",
    path_params: ["ConferenceSid", "Sid"],
    client_path_params: [{"AccountSid", :account_sid}],
    params: [],
    response: {:ref, Twilio.Schemas.ConferenceRecording}
  }

  @doc """
  Fetch an instance of a recording for a call

  `GET /2010-04-01/Accounts/{AccountSid}/Conferences/{ConferenceSid}/Recordings/{Sid}.json`

  ## Path parameters

    * `conference_sid` (required) - The Conference SID that identifies the conference associated with the recording to fetch.
    * `sid` (required) - The Twilio-provided string that uniquely identifies the Conference Recording resource to fetch.

  `{AccountSid}` in the path is the `:account_sid` setting; pass `account_sid: "..."` as an option to use another.
  """
  @spec retrieve(String.t(), String.t(), keyword()) ::
          {:ok, Twilio.Schemas.ConferenceRecording.t()} | {:error, Infusion.Runtime.Error.t()}
  def retrieve(conference_sid, sid, opts \\ []),
    do: Twilio.__request__(@retrieve_operation, [conference_sid, sid], %{}, opts)

  @doc "Like `retrieve/3`, but returns the result or raises `Infusion.Runtime.Error`."
  @spec retrieve!(String.t(), String.t(), keyword()) :: Twilio.Schemas.ConferenceRecording.t()
  def retrieve!(conference_sid, sid, opts \\ []),
    do:
      Infusion.Runtime.Request.unwrap!(
        Twilio.__request__(@retrieve_operation, [conference_sid, sid], %{}, opts)
      )

  @update_operation %{
    id: "UpdateConferenceRecording",
    method: :post,
    path: "/2010-04-01/Accounts/{AccountSid}/Conferences/{ConferenceSid}/Recordings/{Sid}.json",
    path_params: ["ConferenceSid", "Sid"],
    client_path_params: [{"AccountSid", :account_sid}],
    params: [{:pause_behavior, "PauseBehavior", :body}, {:status, "Status", :body}],
    body: :form,
    response: {:ref, Twilio.Schemas.ConferenceRecording}
  }

  @doc """
  Changes the status of the recording to paused, stopped, or in-progress. Note: To use `Twilio.CURRENT`, pass it as recording sid.

  `POST /2010-04-01/Accounts/{AccountSid}/Conferences/{ConferenceSid}/Recordings/{Sid}.json`

  ## Path parameters

    * `conference_sid` (required) - The Conference SID that identifies the conference associated with the recording to update.
    * `sid` (required) - The Twilio-provided string that uniquely identifies the Conference Recording resource to update. Use `Twilio.CURRENT` to reference the current active recording.

  `{AccountSid}` in the path is the `:account_sid` setting; pass `account_sid: "..."` as an option to use another.

  ## Parameters

    * `pause_behavior` - Whether to record during a pause. Can be: `skip` or `silence` and the default is `silence`. `skip` does not record during the pause period, while `silence` will replace the actual audio of the call with silence during the pause period. This parameter only applies when setting `status` is set to `paused`.
    * `status` (required)
  """
  @spec update(String.t(), String.t(), map() | keyword(), keyword()) ::
          {:ok, Twilio.Schemas.ConferenceRecording.t()} | {:error, Infusion.Runtime.Error.t()}
  def update(conference_sid, sid, params \\ %{}, opts \\ []),
    do: Twilio.__request__(@update_operation, [conference_sid, sid], params, opts)

  @doc "Like `update/4`, but returns the result or raises `Infusion.Runtime.Error`."
  @spec update!(String.t(), String.t(), map() | keyword(), keyword()) ::
          Twilio.Schemas.ConferenceRecording.t()
  def update!(conference_sid, sid, params \\ %{}, opts \\ []),
    do:
      Infusion.Runtime.Request.unwrap!(
        Twilio.__request__(@update_operation, [conference_sid, sid], params, opts)
      )
end
