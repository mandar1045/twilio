defmodule Twilio.Queues.Members do
  @moduledoc """
  API calls: `list`, `retrieve`, `update`.
  """

  @list_operation %{
    id: "ListMember",
    method: :get,
    path: "/2010-04-01/Accounts/{AccountSid}/Queues/{QueueSid}/Members.json",
    path_params: ["QueueSid"],
    client_path_params: [{"AccountSid", :account_sid}],
    params: [
      {:page_size, "PageSize", :query},
      {:page, "Page", :query},
      {:page_token, "PageToken", :query}
    ],
    response: {:ref, Twilio.Schemas.QueuesMembersListResponse},
    paginate: %{
      from: ["next_page_uri"],
      items: ["queue_members"],
      style: :next_url,
      item: {:ref, Twilio.Schemas.Member}
    }
  }

  @doc """
  Retrieve the members of the queue

  `GET /2010-04-01/Accounts/{AccountSid}/Queues/{QueueSid}/Members.json`

  ## Path parameters

    * `queue_sid` (required) - The SID of the Queue in which to find the members

  `{AccountSid}` in the path is the `:account_sid` setting; pass `account_sid: "..."` as an option to use another.

  ## Parameters

    * `page_size` - How many resources to return in each list page. The default is 50, and the maximum is 1000.
    * `page` - The page index. This value is simply for client state.
    * `page_token` - The page token. This is provided by the API.

  To read every item across all pages, use `list_all`.
  """
  @spec list(String.t(), map() | keyword(), keyword()) ::
          {:ok, Twilio.Schemas.QueuesMembersListResponse.t()}
          | {:error, Infusion.Runtime.Error.t()}
  def list(queue_sid, params \\ %{}, opts \\ []),
    do: Twilio.__request__(@list_operation, [queue_sid], params, opts)

  @doc "Like `list/3`, but returns the result or raises `Infusion.Runtime.Error`."
  @spec list!(String.t(), map() | keyword(), keyword()) ::
          Twilio.Schemas.QueuesMembersListResponse.t()
  def list!(queue_sid, params \\ %{}, opts \\ []),
    do:
      Infusion.Runtime.Request.unwrap!(
        Twilio.__request__(@list_operation, [queue_sid], params, opts)
      )

  @doc """
  Like `list/3`, but returns every item, from every page: a lazy stream of `Twilio.Schemas.Member.t()` that fetches pages as it is read.

  The first page is fetched right away, so its errors are returned; a later page that fails raises `Infusion.Runtime.Error`. Stopping early (`Enum.take/2`) fetches no more pages.
  """
  @spec list_all(String.t(), map() | keyword(), keyword()) ::
          {:ok, Enumerable.t()} | {:error, Infusion.Runtime.Error.t()}
  def list_all(queue_sid, params \\ %{}, opts \\ []),
    do: Twilio.__paginate__(@list_operation, [queue_sid], params, opts)

  @doc "Like `list_all/3`, but returns the stream or raises `Infusion.Runtime.Error`."
  @spec list_all!(String.t(), map() | keyword(), keyword()) :: Enumerable.t()
  def list_all!(queue_sid, params \\ %{}, opts \\ []),
    do:
      Infusion.Runtime.Request.unwrap!(
        Twilio.__paginate__(@list_operation, [queue_sid], params, opts)
      )

  @retrieve_operation %{
    id: "FetchMember",
    method: :get,
    path: "/2010-04-01/Accounts/{AccountSid}/Queues/{QueueSid}/Members/{CallSid}.json",
    path_params: ["QueueSid", "CallSid"],
    client_path_params: [{"AccountSid", :account_sid}],
    params: [],
    response: {:ref, Twilio.Schemas.Member}
  }

  @doc """
  Fetch a specific member from the queue

  `GET /2010-04-01/Accounts/{AccountSid}/Queues/{QueueSid}/Members/{CallSid}.json`

  ## Path parameters

    * `queue_sid` (required) - The SID of the Queue in which to find the members to fetch.
    * `call_sid` (required) - The [Call](https://www.twilio.com/docs/voice/api/call-resource) SID of the resource(s) to fetch.

  `{AccountSid}` in the path is the `:account_sid` setting; pass `account_sid: "..."` as an option to use another.
  """
  @spec retrieve(String.t(), String.t(), keyword()) ::
          {:ok, Twilio.Schemas.Member.t()} | {:error, Infusion.Runtime.Error.t()}
  def retrieve(queue_sid, call_sid, opts \\ []),
    do: Twilio.__request__(@retrieve_operation, [queue_sid, call_sid], %{}, opts)

  @doc "Like `retrieve/3`, but returns the result or raises `Infusion.Runtime.Error`."
  @spec retrieve!(String.t(), String.t(), keyword()) :: Twilio.Schemas.Member.t()
  def retrieve!(queue_sid, call_sid, opts \\ []),
    do:
      Infusion.Runtime.Request.unwrap!(
        Twilio.__request__(@retrieve_operation, [queue_sid, call_sid], %{}, opts)
      )

  @update_operation %{
    id: "UpdateMember",
    method: :post,
    path: "/2010-04-01/Accounts/{AccountSid}/Queues/{QueueSid}/Members/{CallSid}.json",
    path_params: ["QueueSid", "CallSid"],
    client_path_params: [{"AccountSid", :account_sid}],
    params: [{:method, "Method", :body}, {:url, "Url", :body}],
    body: :form,
    response: {:ref, Twilio.Schemas.Member}
  }

  @doc """
  Dequeue a member from a queue and have the member's call begin executing the TwiML document at that URL

  `POST /2010-04-01/Accounts/{AccountSid}/Queues/{QueueSid}/Members/{CallSid}.json`

  ## Path parameters

    * `queue_sid` (required) - The SID of the Queue in which to find the members to update.
    * `call_sid` (required) - The [Call](https://www.twilio.com/docs/voice/api/call-resource) SID of the resource(s) to update.

  `{AccountSid}` in the path is the `:account_sid` setting; pass `account_sid: "..."` as an option to use another.

  ## Parameters

    * `method` - How to pass the update request data. Can be `GET` or `POST` and the default is `POST`. `POST` sends the data as encoded form data and `GET` sends the data as query parameters.
    * `url` (required) - The absolute URL of the Queue resource.
  """
  @spec update(String.t(), String.t(), map() | keyword(), keyword()) ::
          {:ok, Twilio.Schemas.Member.t()} | {:error, Infusion.Runtime.Error.t()}
  def update(queue_sid, call_sid, params \\ %{}, opts \\ []),
    do: Twilio.__request__(@update_operation, [queue_sid, call_sid], params, opts)

  @doc "Like `update/4`, but returns the result or raises `Infusion.Runtime.Error`."
  @spec update!(String.t(), String.t(), map() | keyword(), keyword()) :: Twilio.Schemas.Member.t()
  def update!(queue_sid, call_sid, params \\ %{}, opts \\ []),
    do:
      Infusion.Runtime.Request.unwrap!(
        Twilio.__request__(@update_operation, [queue_sid, call_sid], params, opts)
      )
end
