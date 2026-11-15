defmodule Twilio.Calls.Notifications do
  @moduledoc """
  API calls: `list`, `retrieve`.
  """

  @list_operation %{
    id: "ListCallNotification",
    method: :get,
    path: "/2010-04-01/Accounts/{AccountSid}/Calls/{CallSid}/Notifications.json",
    path_params: ["CallSid"],
    client_path_params: [{"AccountSid", :account_sid}],
    params: [
      {:log, "Log", :query},
      {:message_date, "MessageDate", :query},
      {:message_date_query, "MessageDate<", :query},
      {:message_date_query_2, "MessageDate>", :query},
      {:page_size, "PageSize", :query},
      {:page, "Page", :query},
      {:page_token, "PageToken", :query}
    ],
    response: {:ref, Twilio.Schemas.CallsNotificationsListResponse},
    paginate: %{
      from: ["next_page_uri"],
      items: ["notifications"],
      style: :next_url,
      item: {:ref, Twilio.Schemas.CallNotification}
    }
  }

  @doc """
  `GET /2010-04-01/Accounts/{AccountSid}/Calls/{CallSid}/Notifications.json`

  ## Path parameters

    * `call_sid` (required) - The [Call](https://www.twilio.com/docs/voice/api/call-resource) SID of the Call Notification resources to read.

  `{AccountSid}` in the path is the `:account_sid` setting; pass `account_sid: "..."` as an option to use another.

  ## Parameters

    * `log` - Only read notifications of the specified log level. Can be: `0` to read only ERROR notifications or `1` to read only WARNING notifications. By default, all notifications are read.
    * `message_date` - Only show notifications for the specified date, formatted as `YYYY-MM-DD`. You can also specify an inequality, such as `<=YYYY-MM-DD` for messages logged at or before midnight on a date, or `>=YYYY-MM-DD` for messages logged at or after midnight on a date.
    * `message_date_query` - Only show notifications for the specified date, formatted as `YYYY-MM-DD`. You can also specify an inequality, such as `<=YYYY-MM-DD` for messages logged at or before midnight on a date, or `>=YYYY-MM-DD` for messages logged at or after midnight on a date.
    * `message_date_query_2` - Only show notifications for the specified date, formatted as `YYYY-MM-DD`. You can also specify an inequality, such as `<=YYYY-MM-DD` for messages logged at or before midnight on a date, or `>=YYYY-MM-DD` for messages logged at or after midnight on a date.
    * `page_size` - How many resources to return in each list page. The default is 50, and the maximum is 1000.
    * `page` - The page index. This value is simply for client state.
    * `page_token` - The page token. This is provided by the API.

  To read every item across all pages, use `list_all`.
  """
  @spec list(String.t(), map() | keyword(), keyword()) ::
          {:ok, Twilio.Schemas.CallsNotificationsListResponse.t()}
          | {:error, Infusion.Runtime.Error.t()}
  def list(call_sid, params \\ %{}, opts \\ []),
    do: Twilio.__request__(@list_operation, [call_sid], params, opts)

  @doc "Like `list/3`, but returns the result or raises `Infusion.Runtime.Error`."
  @spec list!(String.t(), map() | keyword(), keyword()) ::
          Twilio.Schemas.CallsNotificationsListResponse.t()
  def list!(call_sid, params \\ %{}, opts \\ []),
    do:
      Infusion.Runtime.Request.unwrap!(
        Twilio.__request__(@list_operation, [call_sid], params, opts)
      )

  @doc """
  Like `list/3`, but returns every item, from every page: a lazy stream of `Twilio.Schemas.CallNotification.t()` that fetches pages as it is read.

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

  @retrieve_operation %{
    id: "FetchCallNotification",
    method: :get,
    path: "/2010-04-01/Accounts/{AccountSid}/Calls/{CallSid}/Notifications/{Sid}.json",
    path_params: ["CallSid", "Sid"],
    client_path_params: [{"AccountSid", :account_sid}],
    params: [],
    response: {:ref, Twilio.Schemas.CallNotificationInstance}
  }

  @doc """
  `GET /2010-04-01/Accounts/{AccountSid}/Calls/{CallSid}/Notifications/{Sid}.json`

  ## Path parameters

    * `call_sid` (required) - The [Call](https://www.twilio.com/docs/voice/api/call-resource) SID of the Call Notification resource to fetch.
    * `sid` (required) - The Twilio-provided string that uniquely identifies the Call Notification resource to fetch.

  `{AccountSid}` in the path is the `:account_sid` setting; pass `account_sid: "..."` as an option to use another.
  """
  @spec retrieve(String.t(), String.t(), keyword()) ::
          {:ok, Twilio.Schemas.CallNotificationInstance.t()}
          | {:error, Infusion.Runtime.Error.t()}
  def retrieve(call_sid, sid, opts \\ []),
    do: Twilio.__request__(@retrieve_operation, [call_sid, sid], %{}, opts)

  @doc "Like `retrieve/3`, but returns the result or raises `Infusion.Runtime.Error`."
  @spec retrieve!(String.t(), String.t(), keyword()) ::
          Twilio.Schemas.CallNotificationInstance.t()
  def retrieve!(call_sid, sid, opts \\ []),
    do:
      Infusion.Runtime.Request.unwrap!(
        Twilio.__request__(@retrieve_operation, [call_sid, sid], %{}, opts)
      )
end
