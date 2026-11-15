defmodule Twilio.Recordings.AddOnResults do
  @moduledoc """
  API calls: `delete`, `list`, `retrieve`.
  """

  @delete_operation %{
    id: "DeleteRecordingAddOnResult",
    method: :delete,
    path: "/2010-04-01/Accounts/{AccountSid}/Recordings/{ReferenceSid}/AddOnResults/{Sid}.json",
    path_params: ["ReferenceSid", "Sid"],
    client_path_params: [{"AccountSid", :account_sid}],
    params: [],
    response: nil
  }

  @doc """
  Delete a result and purge all associated Payloads

  `DELETE /2010-04-01/Accounts/{AccountSid}/Recordings/{ReferenceSid}/AddOnResults/{Sid}.json`

  ## Path parameters

    * `reference_sid` (required) - The SID of the recording to which the result to delete belongs.
    * `sid` (required) - The Twilio-provided string that uniquely identifies the Recording AddOnResult resource to delete.

  `{AccountSid}` in the path is the `:account_sid` setting; pass `account_sid: "..."` as an option to use another.
  """
  @spec delete(String.t(), String.t(), keyword()) ::
          {:ok, nil} | {:error, Infusion.Runtime.Error.t()}
  def delete(reference_sid, sid, opts \\ []),
    do: Twilio.__request__(@delete_operation, [reference_sid, sid], %{}, opts)

  @doc "Like `delete/3`, but returns the result or raises `Infusion.Runtime.Error`."
  @spec delete!(String.t(), String.t(), keyword()) :: nil
  def delete!(reference_sid, sid, opts \\ []),
    do:
      Infusion.Runtime.Request.unwrap!(
        Twilio.__request__(@delete_operation, [reference_sid, sid], %{}, opts)
      )

  @list_operation %{
    id: "ListRecordingAddOnResult",
    method: :get,
    path: "/2010-04-01/Accounts/{AccountSid}/Recordings/{ReferenceSid}/AddOnResults.json",
    path_params: ["ReferenceSid"],
    client_path_params: [{"AccountSid", :account_sid}],
    params: [
      {:page_size, "PageSize", :query},
      {:page, "Page", :query},
      {:page_token, "PageToken", :query}
    ],
    response: {:ref, Twilio.Schemas.RecordingsAddOnResultsListResponse},
    paginate: %{
      from: ["next_page_uri"],
      items: ["add_on_results"],
      style: :next_url,
      item: {:ref, Twilio.Schemas.RecordingAddOnResult}
    }
  }

  @doc """
  Retrieve a list of results belonging to the recording

  `GET /2010-04-01/Accounts/{AccountSid}/Recordings/{ReferenceSid}/AddOnResults.json`

  ## Path parameters

    * `reference_sid` (required) - The SID of the recording to which the result to read belongs.

  `{AccountSid}` in the path is the `:account_sid` setting; pass `account_sid: "..."` as an option to use another.

  ## Parameters

    * `page_size` - How many resources to return in each list page. The default is 50, and the maximum is 1000.
    * `page` - The page index. This value is simply for client state.
    * `page_token` - The page token. This is provided by the API.

  To read every item across all pages, use `list_all`.
  """
  @spec list(String.t(), map() | keyword(), keyword()) ::
          {:ok, Twilio.Schemas.RecordingsAddOnResultsListResponse.t()}
          | {:error, Infusion.Runtime.Error.t()}
  def list(reference_sid, params \\ %{}, opts \\ []),
    do: Twilio.__request__(@list_operation, [reference_sid], params, opts)

  @doc "Like `list/3`, but returns the result or raises `Infusion.Runtime.Error`."
  @spec list!(String.t(), map() | keyword(), keyword()) ::
          Twilio.Schemas.RecordingsAddOnResultsListResponse.t()
  def list!(reference_sid, params \\ %{}, opts \\ []),
    do:
      Infusion.Runtime.Request.unwrap!(
        Twilio.__request__(@list_operation, [reference_sid], params, opts)
      )

  @doc """
  Like `list/3`, but returns every item, from every page: a lazy stream of `Twilio.Schemas.RecordingAddOnResult.t()` that fetches pages as it is read.

  The first page is fetched right away, so its errors are returned; a later page that fails raises `Infusion.Runtime.Error`. Stopping early (`Enum.take/2`) fetches no more pages.
  """
  @spec list_all(String.t(), map() | keyword(), keyword()) ::
          {:ok, Enumerable.t()} | {:error, Infusion.Runtime.Error.t()}
  def list_all(reference_sid, params \\ %{}, opts \\ []),
    do: Twilio.__paginate__(@list_operation, [reference_sid], params, opts)

  @doc "Like `list_all/3`, but returns the stream or raises `Infusion.Runtime.Error`."
  @spec list_all!(String.t(), map() | keyword(), keyword()) :: Enumerable.t()
  def list_all!(reference_sid, params \\ %{}, opts \\ []),
    do:
      Infusion.Runtime.Request.unwrap!(
        Twilio.__paginate__(@list_operation, [reference_sid], params, opts)
      )

  @retrieve_operation %{
    id: "FetchRecordingAddOnResult",
    method: :get,
    path: "/2010-04-01/Accounts/{AccountSid}/Recordings/{ReferenceSid}/AddOnResults/{Sid}.json",
    path_params: ["ReferenceSid", "Sid"],
    client_path_params: [{"AccountSid", :account_sid}],
    params: [],
    response: {:ref, Twilio.Schemas.RecordingAddOnResult}
  }

  @doc """
  Fetch an instance of an AddOnResult

  `GET /2010-04-01/Accounts/{AccountSid}/Recordings/{ReferenceSid}/AddOnResults/{Sid}.json`

  ## Path parameters

    * `reference_sid` (required) - The SID of the recording to which the result to fetch belongs.
    * `sid` (required) - The Twilio-provided string that uniquely identifies the Recording AddOnResult resource to fetch.

  `{AccountSid}` in the path is the `:account_sid` setting; pass `account_sid: "..."` as an option to use another.
  """
  @spec retrieve(String.t(), String.t(), keyword()) ::
          {:ok, Twilio.Schemas.RecordingAddOnResult.t()} | {:error, Infusion.Runtime.Error.t()}
  def retrieve(reference_sid, sid, opts \\ []),
    do: Twilio.__request__(@retrieve_operation, [reference_sid, sid], %{}, opts)

  @doc "Like `retrieve/3`, but returns the result or raises `Infusion.Runtime.Error`."
  @spec retrieve!(String.t(), String.t(), keyword()) :: Twilio.Schemas.RecordingAddOnResult.t()
  def retrieve!(reference_sid, sid, opts \\ []),
    do:
      Infusion.Runtime.Request.unwrap!(
        Twilio.__request__(@retrieve_operation, [reference_sid, sid], %{}, opts)
      )
end
