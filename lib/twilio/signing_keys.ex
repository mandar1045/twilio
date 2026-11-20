defmodule Twilio.SigningKeys do
  @moduledoc """
  API calls: `create`, `delete`, `list`, `retrieve`, `update`.
  """

  @create_operation %{
    id: "CreateNewSigningKey",
    method: :post,
    path: "/2010-04-01/Accounts/{AccountSid}/SigningKeys.json",
    path_params: [],
    client_path_params: [{"AccountSid", :account_sid}],
    params: [{:friendly_name, "FriendlyName", :body}],
    body: :form,
    response: {:ref, Twilio.Schemas.NewSigningKey}
  }

  @doc """
  Create a new Signing Key for the account making the request.

  `POST /2010-04-01/Accounts/{AccountSid}/SigningKeys.json`

  `{AccountSid}` in the path is the `:account_sid` setting; pass `account_sid: "..."` as an option to use another.

  ## Parameters

    * `friendly_name` - A descriptive string that you create to describe the resource. It can be up to 64 characters long.
  """
  @spec create(map() | keyword(), keyword()) ::
          {:ok, Twilio.Schemas.NewSigningKey.t()} | {:error, Infusion.Runtime.Error.t()}
  def create(params \\ %{}, opts \\ []),
    do: Twilio.__request__(@create_operation, [], params, opts)

  @doc "Like `create/2`, but returns the result or raises `Infusion.Runtime.Error`."
  @spec create!(map() | keyword(), keyword()) :: Twilio.Schemas.NewSigningKey.t()
  def create!(params \\ %{}, opts \\ []),
    do: Infusion.Runtime.Request.unwrap!(Twilio.__request__(@create_operation, [], params, opts))

  @delete_operation %{
    id: "DeleteSigningKey",
    method: :delete,
    path: "/2010-04-01/Accounts/{AccountSid}/SigningKeys/{Sid}.json",
    path_params: ["Sid"],
    client_path_params: [{"AccountSid", :account_sid}],
    params: [],
    response: nil
  }

  @doc """
  `DELETE /2010-04-01/Accounts/{AccountSid}/SigningKeys/{Sid}.json`

  ## Path parameters

    * `sid` (required)

  `{AccountSid}` in the path is the `:account_sid` setting; pass `account_sid: "..."` as an option to use another.
  """
  @spec delete(String.t(), keyword()) :: {:ok, nil} | {:error, Infusion.Runtime.Error.t()}
  def delete(sid, opts \\ []), do: Twilio.__request__(@delete_operation, [sid], %{}, opts)

  @doc "Like `delete/2`, but returns the result or raises `Infusion.Runtime.Error`."
  @spec delete!(String.t(), keyword()) :: nil
  def delete!(sid, opts \\ []),
    do: Infusion.Runtime.Request.unwrap!(Twilio.__request__(@delete_operation, [sid], %{}, opts))

  @list_operation %{
    id: "ListSigningKey",
    method: :get,
    path: "/2010-04-01/Accounts/{AccountSid}/SigningKeys.json",
    path_params: [],
    client_path_params: [{"AccountSid", :account_sid}],
    params: [
      {:page_size, "PageSize", :query},
      {:page, "Page", :query},
      {:page_token, "PageToken", :query}
    ],
    response: {:ref, Twilio.Schemas.SigningKeysListResponse},
    paginate: %{
      from: ["next_page_uri"],
      id: "sid",
      items: ["signing_keys"],
      style: :next_url,
      item: {:ref, Twilio.Schemas.SigningKey}
    }
  }

  @doc """
  `GET /2010-04-01/Accounts/{AccountSid}/SigningKeys.json`

  `{AccountSid}` in the path is the `:account_sid` setting; pass `account_sid: "..."` as an option to use another.

  ## Parameters

    * `page_size` - How many resources to return in each list page. The default is 50, and the maximum is 1000.
    * `page` - The page index. This value is simply for client state.
    * `page_token` - The page token. This is provided by the API.

  To read every item across all pages, use `list_all`.
  """
  @spec list(map() | keyword(), keyword()) ::
          {:ok, Twilio.Schemas.SigningKeysListResponse.t()} | {:error, Infusion.Runtime.Error.t()}
  def list(params \\ %{}, opts \\ []), do: Twilio.__request__(@list_operation, [], params, opts)

  @doc "Like `list/2`, but returns the result or raises `Infusion.Runtime.Error`."
  @spec list!(map() | keyword(), keyword()) :: Twilio.Schemas.SigningKeysListResponse.t()
  def list!(params \\ %{}, opts \\ []),
    do: Infusion.Runtime.Request.unwrap!(Twilio.__request__(@list_operation, [], params, opts))

  @doc """
  Like `list/2`, but returns every item, from every page: a lazy stream of `Twilio.Schemas.SigningKey.t()` that fetches pages as it is read.

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

  @doc """
  Watches this list and sends what changes: starts a process, linked to the caller, that polls it (with `ETag`s, so unchanged pages cost a `304`) and sends `{:infusion_watch, pid, %Infusion.Runtime.Watch.Event{}}` for every Twilio.Schemas.SigningKey.t() created, updated, deleted, or that moved into view (`:entered`).

  Options: `every:` (milliseconds, default 30 seconds), `to:` (a pid, `{:pubsub, MyApp.PubSub, topic}` or a function), `pages:`, `initial:`, `ignore:`, plus any setting of `Infusion.Runtime.Config`. See `Infusion.Runtime.Watch`.
  """
  @spec list_watch(map() | keyword(), keyword()) ::
          {:ok, pid()} | {:error, Infusion.Runtime.Error.t()}
  def list_watch(params \\ %{}, opts \\ []),
    do: Twilio.__watch__(@list_operation, [], params, opts)

  @doc "Like `list_watch/2`, but returns the stream or raises `Infusion.Runtime.Error`."
  @spec list_watch!(map() | keyword(), keyword()) :: pid()
  def list_watch!(params \\ %{}, opts \\ []),
    do: Infusion.Runtime.Request.unwrap!(Twilio.__watch__(@list_operation, [], params, opts))

  @retrieve_operation %{
    id: "FetchSigningKey",
    method: :get,
    path: "/2010-04-01/Accounts/{AccountSid}/SigningKeys/{Sid}.json",
    path_params: ["Sid"],
    client_path_params: [{"AccountSid", :account_sid}],
    params: [],
    response: {:ref, Twilio.Schemas.SigningKey}
  }

  @doc """
  `GET /2010-04-01/Accounts/{AccountSid}/SigningKeys/{Sid}.json`

  ## Path parameters

    * `sid` (required)

  `{AccountSid}` in the path is the `:account_sid` setting; pass `account_sid: "..."` as an option to use another.
  """
  @spec retrieve(String.t(), keyword()) ::
          {:ok, Twilio.Schemas.SigningKey.t()} | {:error, Infusion.Runtime.Error.t()}
  def retrieve(sid, opts \\ []), do: Twilio.__request__(@retrieve_operation, [sid], %{}, opts)

  @doc "Like `retrieve/2`, but returns the result or raises `Infusion.Runtime.Error`."
  @spec retrieve!(String.t(), keyword()) :: Twilio.Schemas.SigningKey.t()
  def retrieve!(sid, opts \\ []),
    do:
      Infusion.Runtime.Request.unwrap!(Twilio.__request__(@retrieve_operation, [sid], %{}, opts))

  @update_operation %{
    id: "UpdateSigningKey",
    method: :post,
    path: "/2010-04-01/Accounts/{AccountSid}/SigningKeys/{Sid}.json",
    path_params: ["Sid"],
    client_path_params: [{"AccountSid", :account_sid}],
    params: [{:friendly_name, "FriendlyName", :body}],
    body: :form,
    response: {:ref, Twilio.Schemas.SigningKey}
  }

  @doc """
  `POST /2010-04-01/Accounts/{AccountSid}/SigningKeys/{Sid}.json`

  ## Path parameters

    * `sid` (required)

  `{AccountSid}` in the path is the `:account_sid` setting; pass `account_sid: "..."` as an option to use another.

  ## Parameters

    * `friendly_name`
  """
  @spec update(String.t(), map() | keyword(), keyword()) ::
          {:ok, Twilio.Schemas.SigningKey.t()} | {:error, Infusion.Runtime.Error.t()}
  def update(sid, params \\ %{}, opts \\ []),
    do: Twilio.__request__(@update_operation, [sid], params, opts)

  @doc "Like `update/3`, but returns the result or raises `Infusion.Runtime.Error`."
  @spec update!(String.t(), map() | keyword(), keyword()) :: Twilio.Schemas.SigningKey.t()
  def update!(sid, params \\ %{}, opts \\ []),
    do:
      Infusion.Runtime.Request.unwrap!(Twilio.__request__(@update_operation, [sid], params, opts))
end
