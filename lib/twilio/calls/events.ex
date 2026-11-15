defmodule Twilio.Calls.Events do
  @moduledoc """
  API calls: `list`.
  """

  @list_operation %{
    id: "ListCallEvent",
    method: :get,
    path: "/2010-04-01/Accounts/{AccountSid}/Calls/{CallSid}/Events.json",
    path_params: ["CallSid"],
    client_path_params: [{"AccountSid", :account_sid}],
    params: [
      {:page_size, "PageSize", :query},
      {:page, "Page", :query},
      {:page_token, "PageToken", :query}
    ],
    response: {:ref, Twilio.Schemas.CallsEventsListResponse},
    paginate: %{
      from: ["next_page_uri"],
      items: ["events"],
      style: :next_url,
      item: {:ref, Twilio.Schemas.CallEvent}
    }
  }

  @doc """
  Retrieve a list of all events for a call.

  `GET /2010-04-01/Accounts/{AccountSid}/Calls/{CallSid}/Events.json`

  ## Path parameters

    * `call_sid` (required) - The unique SID identifier of the Call.

  `{AccountSid}` in the path is the `:account_sid` setting; pass `account_sid: "..."` as an option to use another.

  ## Parameters

    * `page_size` - How many resources to return in each list page. The default is 50, and the maximum is 1000.
    * `page` - The page index. This value is simply for client state.
    * `page_token` - The page token. This is provided by the API.

  To read every item across all pages, use `list_all`.
  """
  @spec list(String.t(), map() | keyword(), keyword()) ::
          {:ok, Twilio.Schemas.CallsEventsListResponse.t()} | {:error, Infusion.Runtime.Error.t()}
  def list(call_sid, params \\ %{}, opts \\ []),
    do: Twilio.__request__(@list_operation, [call_sid], params, opts)

  @doc "Like `list/3`, but returns the result or raises `Infusion.Runtime.Error`."
  @spec list!(String.t(), map() | keyword(), keyword()) ::
          Twilio.Schemas.CallsEventsListResponse.t()
  def list!(call_sid, params \\ %{}, opts \\ []),
    do:
      Infusion.Runtime.Request.unwrap!(
        Twilio.__request__(@list_operation, [call_sid], params, opts)
      )

  @doc """
  Like `list/3`, but returns every item, from every page: a lazy stream of `Twilio.Schemas.CallEvent.t()` that fetches pages as it is read.

  The first page is fetched right away, so its errors are returned; a later page that fails raises `Infusion.Runtime.Error`. Stopping early (`Enum.take/2`) fetches no more pages.
  """
  @spec list_all(String.t(), map() | keyword(), keyword()) ::
          {:ok, Enumerable.t()} | {:error, Infusion.Runtime.Error.t()}
  def list_all(call_sid, params \\ %{}, opts \\ []),
    do: Twilio.__paginate__(@list_operation, [call_sid], params, opts)

  @doc "Like `list_all/3`, but returns the stream or raises `Infusion.Runtime.Error`."
  @spec list_all!(String.t(), map() | keyword(), keyword()) :: Enumerable.t()
  def list_all!(call_sid, params \\ %{}, opts \\ []),
    do:
      Infusion.Runtime.Request.unwrap!(
        Twilio.__paginate__(@list_operation, [call_sid], params, opts)
      )
end
