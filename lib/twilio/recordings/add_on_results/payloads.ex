defmodule Twilio.Recordings.AddOnResults.Payloads do
  @moduledoc """
  API calls: `delete`, `list`, `retrieve`.
  """

  @delete_operation %{
    id: "DeleteRecordingAddOnResultPayload",
    method: :delete,
    path:
      "/2010-04-01/Accounts/{AccountSid}/Recordings/{ReferenceSid}/AddOnResults/{AddOnResultSid}/Payloads/{Sid}.json",
    path_params: ["ReferenceSid", "AddOnResultSid", "Sid"],
    client_path_params: [{"AccountSid", :account_sid}],
    params: [],
    response: nil
  }

  @doc """
  Delete a payload from the result along with all associated Data

  `DELETE /2010-04-01/Accounts/{AccountSid}/Recordings/{ReferenceSid}/AddOnResults/{AddOnResultSid}/Payloads/{Sid}.json`

  ## Path parameters

    * `reference_sid` (required) - The SID of the recording to which the AddOnResult resource that contains the payloads to delete belongs.
    * `add_on_result_sid` (required) - The SID of the AddOnResult to which the payloads to delete belongs.
    * `sid` (required) - The Twilio-provided string that uniquely identifies the Recording AddOnResult Payload resource to delete.

  `{AccountSid}` in the path is the `:account_sid` setting; pass `account_sid: "..."` as an option to use another.
  """
  @spec delete(String.t(), String.t(), String.t(), keyword()) ::
          {:ok, nil} | {:error, Infusion.Runtime.Error.t()}
  def delete(reference_sid, add_on_result_sid, sid, opts \\ []),
    do: Twilio.__request__(@delete_operation, [reference_sid, add_on_result_sid, sid], %{}, opts)

  @doc "Like `delete/4`, but returns the result or raises `Infusion.Runtime.Error`."
  @spec delete!(String.t(), String.t(), String.t(), keyword()) :: nil
  def delete!(reference_sid, add_on_result_sid, sid, opts \\ []),
    do:
      Infusion.Runtime.Request.unwrap!(
        Twilio.__request__(@delete_operation, [reference_sid, add_on_result_sid, sid], %{}, opts)
      )

  @list_operation %{
    id: "ListRecordingAddOnResultPayload",
    method: :get,
    path:
      "/2010-04-01/Accounts/{AccountSid}/Recordings/{ReferenceSid}/AddOnResults/{AddOnResultSid}/Payloads.json",
    path_params: ["ReferenceSid", "AddOnResultSid"],
    client_path_params: [{"AccountSid", :account_sid}],
    params: [
      {:page_size, "PageSize", :query},
      {:page, "Page", :query},
      {:page_token, "PageToken", :query}
    ],
    response: {:ref, Twilio.Schemas.RecordingsAddOnResultsPayloadsListResponse},
    paginate: %{
      from: ["next_page_uri"],
      items: ["payloads"],
      style: :next_url,
      item: {:ref, Twilio.Schemas.RecordingAddOnResultPayload}
    }
  }

  @doc """
  Retrieve a list of payloads belonging to the AddOnResult

  `GET /2010-04-01/Accounts/{AccountSid}/Recordings/{ReferenceSid}/AddOnResults/{AddOnResultSid}/Payloads.json`

  ## Path parameters

    * `reference_sid` (required) - The SID of the recording to which the AddOnResult resource that contains the payloads to read belongs.
    * `add_on_result_sid` (required) - The SID of the AddOnResult to which the payloads to read belongs.

  `{AccountSid}` in the path is the `:account_sid` setting; pass `account_sid: "..."` as an option to use another.

  ## Parameters

    * `page_size` - How many resources to return in each list page. The default is 50, and the maximum is 1000.
    * `page` - The page index. This value is simply for client state.
    * `page_token` - The page token. This is provided by the API.

  To read every item across all pages, use `list_all`.
  """
  @spec list(String.t(), String.t(), map() | keyword(), keyword()) ::
          {:ok, Twilio.Schemas.RecordingsAddOnResultsPayloadsListResponse.t()}
          | {:error, Infusion.Runtime.Error.t()}
  def list(reference_sid, add_on_result_sid, params \\ %{}, opts \\ []),
    do: Twilio.__request__(@list_operation, [reference_sid, add_on_result_sid], params, opts)

  @doc "Like `list/4`, but returns the result or raises `Infusion.Runtime.Error`."
  @spec list!(String.t(), String.t(), map() | keyword(), keyword()) ::
          Twilio.Schemas.RecordingsAddOnResultsPayloadsListResponse.t()
  def list!(reference_sid, add_on_result_sid, params \\ %{}, opts \\ []),
    do:
      Infusion.Runtime.Request.unwrap!(
        Twilio.__request__(@list_operation, [reference_sid, add_on_result_sid], params, opts)
      )

  @doc """
  Like `list/4`, but returns every item, from every page: a lazy stream of `Twilio.Schemas.RecordingAddOnResultPayload.t()` that fetches pages as it is read.

  The first page is fetched right away, so its errors are returned; a later page that fails raises `Infusion.Runtime.Error`. Stopping early (`Enum.take/2`) fetches no more pages.
  """
  @spec list_all(String.t(), String.t(), map() | keyword(), keyword()) ::
          {:ok, Enumerable.t()} | {:error, Infusion.Runtime.Error.t()}
  def list_all(reference_sid, add_on_result_sid, params \\ %{}, opts \\ []),
    do: Twilio.__paginate__(@list_operation, [reference_sid, add_on_result_sid], params, opts)

  @doc "Like `list_all/4`, but returns the stream or raises `Infusion.Runtime.Error`."
  @spec list_all!(String.t(), String.t(), map() | keyword(), keyword()) :: Enumerable.t()
  def list_all!(reference_sid, add_on_result_sid, params \\ %{}, opts \\ []),
    do:
      Infusion.Runtime.Request.unwrap!(
        Twilio.__paginate__(@list_operation, [reference_sid, add_on_result_sid], params, opts)
      )

  @retrieve_operation %{
    id: "FetchRecordingAddOnResultPayload",
    method: :get,
    path:
      "/2010-04-01/Accounts/{AccountSid}/Recordings/{ReferenceSid}/AddOnResults/{AddOnResultSid}/Payloads/{Sid}.json",
    path_params: ["ReferenceSid", "AddOnResultSid", "Sid"],
    client_path_params: [{"AccountSid", :account_sid}],
    params: [],
    response: {:ref, Twilio.Schemas.RecordingAddOnResultPayload}
  }

  @doc """
  Fetch an instance of a result payload

  `GET /2010-04-01/Accounts/{AccountSid}/Recordings/{ReferenceSid}/AddOnResults/{AddOnResultSid}/Payloads/{Sid}.json`

  ## Path parameters

    * `reference_sid` (required) - The SID of the recording to which the AddOnResult resource that contains the payload to fetch belongs.
    * `add_on_result_sid` (required) - The SID of the AddOnResult to which the payload to fetch belongs.
    * `sid` (required) - The Twilio-provided string that uniquely identifies the Recording AddOnResult Payload resource to fetch.

  `{AccountSid}` in the path is the `:account_sid` setting; pass `account_sid: "..."` as an option to use another.
  """
  @spec retrieve(String.t(), String.t(), String.t(), keyword()) ::
          {:ok, Twilio.Schemas.RecordingAddOnResultPayload.t()}
          | {:error, Infusion.Runtime.Error.t()}
  def retrieve(reference_sid, add_on_result_sid, sid, opts \\ []),
    do:
      Twilio.__request__(@retrieve_operation, [reference_sid, add_on_result_sid, sid], %{}, opts)

  @doc "Like `retrieve/4`, but returns the result or raises `Infusion.Runtime.Error`."
  @spec retrieve!(String.t(), String.t(), String.t(), keyword()) ::
          Twilio.Schemas.RecordingAddOnResultPayload.t()
  def retrieve!(reference_sid, add_on_result_sid, sid, opts \\ []),
    do:
      Infusion.Runtime.Request.unwrap!(
        Twilio.__request__(
          @retrieve_operation,
          [reference_sid, add_on_result_sid, sid],
          %{},
          opts
        )
      )
end
