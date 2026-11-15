defmodule Twilio.Accounts do
  @moduledoc """
  API calls: `create`, `list`, `retrieve`, `update`.
  """

  @create_operation %{
    id: "CreateAccount",
    method: :post,
    path: "/2010-04-01/Accounts.json",
    path_params: [],
    params: [{:friendly_name, "FriendlyName", :body}],
    body: :form,
    response: {:ref, Twilio.Schemas.Account}
  }

  @doc """
  Create a new Twilio Subaccount from the account making the request

  `POST /2010-04-01/Accounts.json`

  ## Parameters

    * `friendly_name` - A human readable description of the account to create, defaults to `SubAccount Created at {YYYY-MM-DD HH:MM meridian}`
  """
  @spec create(map() | keyword(), keyword()) ::
          {:ok, Twilio.Schemas.Account.t()} | {:error, Infusion.Runtime.Error.t()}
  def create(params \\ %{}, opts \\ []),
    do: Twilio.__request__(@create_operation, [], params, opts)

  @doc "Like `create/2`, but returns the result or raises `Infusion.Runtime.Error`."
  @spec create!(map() | keyword(), keyword()) :: Twilio.Schemas.Account.t()
  def create!(params \\ %{}, opts \\ []),
    do: Infusion.Runtime.Request.unwrap!(Twilio.__request__(@create_operation, [], params, opts))

  @list_operation %{
    id: "ListAccount",
    method: :get,
    path: "/2010-04-01/Accounts.json",
    path_params: [],
    params: [
      {:friendly_name, "FriendlyName", :query},
      {:status, "Status", :query},
      {:page_size, "PageSize", :query},
      {:page, "Page", :query},
      {:page_token, "PageToken", :query}
    ],
    response: {:ref, Twilio.Schemas.AccountsListResponse},
    paginate: %{
      from: ["next_page_uri"],
      items: ["accounts"],
      style: :next_url,
      item: {:ref, Twilio.Schemas.Account}
    }
  }

  @doc """
  Retrieves a collection of Accounts belonging to the account used to make the request

  `GET /2010-04-01/Accounts.json`

  ## Parameters

    * `friendly_name` - Only return the Account resources with friendly names that exactly match this name.
    * `status` - Only return Account resources with the given status. Can be `closed`, `suspended` or `active`.
    * `page_size` - How many resources to return in each list page. The default is 50, and the maximum is 1000.
    * `page` - The page index. This value is simply for client state.
    * `page_token` - The page token. This is provided by the API.

  To read every item across all pages, use `list_all`.
  """
  @spec list(map() | keyword(), keyword()) ::
          {:ok, Twilio.Schemas.AccountsListResponse.t()} | {:error, Infusion.Runtime.Error.t()}
  def list(params \\ %{}, opts \\ []), do: Twilio.__request__(@list_operation, [], params, opts)

  @doc "Like `list/2`, but returns the result or raises `Infusion.Runtime.Error`."
  @spec list!(map() | keyword(), keyword()) :: Twilio.Schemas.AccountsListResponse.t()
  def list!(params \\ %{}, opts \\ []),
    do: Infusion.Runtime.Request.unwrap!(Twilio.__request__(@list_operation, [], params, opts))

  @doc """
  Like `list/2`, but returns every item, from every page: a lazy stream of `Twilio.Schemas.Account.t()` that fetches pages as it is read.

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
    id: "FetchAccount",
    method: :get,
    path: "/2010-04-01/Accounts/{Sid}.json",
    path_params: ["Sid"],
    params: [],
    response: {:ref, Twilio.Schemas.Account}
  }

  @doc """
  Fetch the account specified by the provided Account Sid

  `GET /2010-04-01/Accounts/{Sid}.json`

  ## Path parameters

    * `sid` (required) - The Account Sid that uniquely identifies the account to fetch
  """
  @spec retrieve(String.t(), keyword()) ::
          {:ok, Twilio.Schemas.Account.t()} | {:error, Infusion.Runtime.Error.t()}
  def retrieve(sid, opts \\ []), do: Twilio.__request__(@retrieve_operation, [sid], %{}, opts)

  @doc "Like `retrieve/2`, but returns the result or raises `Infusion.Runtime.Error`."
  @spec retrieve!(String.t(), keyword()) :: Twilio.Schemas.Account.t()
  def retrieve!(sid, opts \\ []),
    do:
      Infusion.Runtime.Request.unwrap!(Twilio.__request__(@retrieve_operation, [sid], %{}, opts))

  @update_operation %{
    id: "UpdateAccount",
    method: :post,
    path: "/2010-04-01/Accounts/{Sid}.json",
    path_params: ["Sid"],
    params: [{:friendly_name, "FriendlyName", :body}, {:status, "Status", :body}],
    body: :form,
    response: {:ref, Twilio.Schemas.Account}
  }

  @doc """
  Modify the properties of a given Account

  `POST /2010-04-01/Accounts/{Sid}.json`

  ## Path parameters

    * `sid` (required) - The Account Sid that uniquely identifies the account to update

  ## Parameters

    * `friendly_name` - Update the human-readable description of this Account
    * `status`
  """
  @spec update(String.t(), map() | keyword(), keyword()) ::
          {:ok, Twilio.Schemas.Account.t()} | {:error, Infusion.Runtime.Error.t()}
  def update(sid, params \\ %{}, opts \\ []),
    do: Twilio.__request__(@update_operation, [sid], params, opts)

  @doc "Like `update/3`, but returns the result or raises `Infusion.Runtime.Error`."
  @spec update!(String.t(), map() | keyword(), keyword()) :: Twilio.Schemas.Account.t()
  def update!(sid, params \\ %{}, opts \\ []),
    do:
      Infusion.Runtime.Request.unwrap!(Twilio.__request__(@update_operation, [sid], params, opts))
end
