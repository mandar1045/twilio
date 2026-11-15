defmodule Twilio.Queues do
  @moduledoc """
  API calls: `create`, `delete`, `list`, `retrieve`, `update`.
  """

  @create_operation %{
    id: "CreateQueue",
    method: :post,
    path: "/2010-04-01/Accounts/{AccountSid}/Queues.json",
    path_params: [],
    client_path_params: [{"AccountSid", :account_sid}],
    params: [{:friendly_name, "FriendlyName", :body}, {:max_size, "MaxSize", :body}],
    body: :form,
    response: {:ref, Twilio.Schemas.Queue}
  }

  @doc """
  Create a queue

  `POST /2010-04-01/Accounts/{AccountSid}/Queues.json`

  `{AccountSid}` in the path is the `:account_sid` setting; pass `account_sid: "..."` as an option to use another.

  ## Parameters

    * `friendly_name` (required) - A descriptive string that you created to describe this resource. It can be up to 64 characters long.
    * `max_size` - The maximum number of calls allowed to be in the queue. The default is 1000. The maximum is 5000.
  """
  @spec create(map() | keyword(), keyword()) ::
          {:ok, Twilio.Schemas.Queue.t()} | {:error, Infusion.Runtime.Error.t()}
  def create(params \\ %{}, opts \\ []),
    do: Twilio.__request__(@create_operation, [], params, opts)

  @doc "Like `create/2`, but returns the result or raises `Infusion.Runtime.Error`."
  @spec create!(map() | keyword(), keyword()) :: Twilio.Schemas.Queue.t()
  def create!(params \\ %{}, opts \\ []),
    do: Infusion.Runtime.Request.unwrap!(Twilio.__request__(@create_operation, [], params, opts))

  @delete_operation %{
    id: "DeleteQueue",
    method: :delete,
    path: "/2010-04-01/Accounts/{AccountSid}/Queues/{Sid}.json",
    path_params: ["Sid"],
    client_path_params: [{"AccountSid", :account_sid}],
    params: [],
    response: nil
  }

  @doc """
  Remove an empty queue

  `DELETE /2010-04-01/Accounts/{AccountSid}/Queues/{Sid}.json`

  ## Path parameters

    * `sid` (required) - The Twilio-provided string that uniquely identifies the Queue resource to delete

  `{AccountSid}` in the path is the `:account_sid` setting; pass `account_sid: "..."` as an option to use another.
  """
  @spec delete(String.t(), keyword()) :: {:ok, nil} | {:error, Infusion.Runtime.Error.t()}
  def delete(sid, opts \\ []), do: Twilio.__request__(@delete_operation, [sid], %{}, opts)

  @doc "Like `delete/2`, but returns the result or raises `Infusion.Runtime.Error`."
  @spec delete!(String.t(), keyword()) :: nil
  def delete!(sid, opts \\ []),
    do: Infusion.Runtime.Request.unwrap!(Twilio.__request__(@delete_operation, [sid], %{}, opts))

  @list_operation %{
    id: "ListQueue",
    method: :get,
    path: "/2010-04-01/Accounts/{AccountSid}/Queues.json",
    path_params: [],
    client_path_params: [{"AccountSid", :account_sid}],
    params: [
      {:page_size, "PageSize", :query},
      {:page, "Page", :query},
      {:page_token, "PageToken", :query}
    ],
    response: {:ref, Twilio.Schemas.QueuesListResponse},
    paginate: %{
      from: ["next_page_uri"],
      items: ["queues"],
      style: :next_url,
      item: {:ref, Twilio.Schemas.Queue}
    }
  }

  @doc """
  Retrieve a list of queues belonging to the account used to make the request

  `GET /2010-04-01/Accounts/{AccountSid}/Queues.json`

  `{AccountSid}` in the path is the `:account_sid` setting; pass `account_sid: "..."` as an option to use another.

  ## Parameters

    * `page_size` - How many resources to return in each list page. The default is 50, and the maximum is 1000.
    * `page` - The page index. This value is simply for client state.
    * `page_token` - The page token. This is provided by the API.

  To read every item across all pages, use `list_all`.
  """
  @spec list(map() | keyword(), keyword()) ::
          {:ok, Twilio.Schemas.QueuesListResponse.t()} | {:error, Infusion.Runtime.Error.t()}
  def list(params \\ %{}, opts \\ []), do: Twilio.__request__(@list_operation, [], params, opts)

  @doc "Like `list/2`, but returns the result or raises `Infusion.Runtime.Error`."
  @spec list!(map() | keyword(), keyword()) :: Twilio.Schemas.QueuesListResponse.t()
  def list!(params \\ %{}, opts \\ []),
    do: Infusion.Runtime.Request.unwrap!(Twilio.__request__(@list_operation, [], params, opts))

  @doc """
  Like `list/2`, but returns every item, from every page: a lazy stream of `Twilio.Schemas.Queue.t()` that fetches pages as it is read.

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

  @retrieve_operation %{
    id: "FetchQueue",
    method: :get,
    path: "/2010-04-01/Accounts/{AccountSid}/Queues/{Sid}.json",
    path_params: ["Sid"],
    client_path_params: [{"AccountSid", :account_sid}],
    params: [],
    response: {:ref, Twilio.Schemas.Queue}
  }

  @doc """
  Fetch an instance of a queue identified by the QueueSid

  `GET /2010-04-01/Accounts/{AccountSid}/Queues/{Sid}.json`

  ## Path parameters

    * `sid` (required) - The Twilio-provided string that uniquely identifies the Queue resource to fetch

  `{AccountSid}` in the path is the `:account_sid` setting; pass `account_sid: "..."` as an option to use another.
  """
  @spec retrieve(String.t(), keyword()) ::
          {:ok, Twilio.Schemas.Queue.t()} | {:error, Infusion.Runtime.Error.t()}
  def retrieve(sid, opts \\ []), do: Twilio.__request__(@retrieve_operation, [sid], %{}, opts)

  @doc "Like `retrieve/2`, but returns the result or raises `Infusion.Runtime.Error`."
  @spec retrieve!(String.t(), keyword()) :: Twilio.Schemas.Queue.t()
  def retrieve!(sid, opts \\ []),
    do:
      Infusion.Runtime.Request.unwrap!(Twilio.__request__(@retrieve_operation, [sid], %{}, opts))

  @update_operation %{
    id: "UpdateQueue",
    method: :post,
    path: "/2010-04-01/Accounts/{AccountSid}/Queues/{Sid}.json",
    path_params: ["Sid"],
    client_path_params: [{"AccountSid", :account_sid}],
    params: [{:friendly_name, "FriendlyName", :body}, {:max_size, "MaxSize", :body}],
    body: :form,
    response: {:ref, Twilio.Schemas.Queue}
  }

  @doc """
  Update the queue with the new parameters

  `POST /2010-04-01/Accounts/{AccountSid}/Queues/{Sid}.json`

  ## Path parameters

    * `sid` (required) - The Twilio-provided string that uniquely identifies the Queue resource to update

  `{AccountSid}` in the path is the `:account_sid` setting; pass `account_sid: "..."` as an option to use another.

  ## Parameters

    * `friendly_name` - A descriptive string that you created to describe this resource. It can be up to 64 characters long.
    * `max_size` - The maximum number of calls allowed to be in the queue. The default is 1000. The maximum is 5000.
  """
  @spec update(String.t(), map() | keyword(), keyword()) ::
          {:ok, Twilio.Schemas.Queue.t()} | {:error, Infusion.Runtime.Error.t()}
  def update(sid, params \\ %{}, opts \\ []),
    do: Twilio.__request__(@update_operation, [sid], params, opts)

  @doc "Like `update/3`, but returns the result or raises `Infusion.Runtime.Error`."
  @spec update!(String.t(), map() | keyword(), keyword()) :: Twilio.Schemas.Queue.t()
  def update!(sid, params \\ %{}, opts \\ []),
    do:
      Infusion.Runtime.Request.unwrap!(Twilio.__request__(@update_operation, [sid], params, opts))
end
