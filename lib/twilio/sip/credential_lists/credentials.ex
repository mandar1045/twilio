defmodule Twilio.Sip.CredentialLists.Credentials do
  @moduledoc """
  API calls: `create`, `delete`, `list`, `retrieve`, `update`.
  """

  @create_operation %{
    id: "CreateSipCredential",
    method: :post,
    path:
      "/2010-04-01/Accounts/{AccountSid}/SIP/CredentialLists/{CredentialListSid}/Credentials.json",
    path_params: ["CredentialListSid"],
    client_path_params: [{"AccountSid", :account_sid}],
    params: [{:password, "Password", :body}, {:username, "Username", :body}],
    body: :form,
    response: {:ref, Twilio.Schemas.SipCredential}
  }

  @doc """
  Create a new credential resource.

  `POST /2010-04-01/Accounts/{AccountSid}/SIP/CredentialLists/{CredentialListSid}/Credentials.json`

  ## Path parameters

    * `credential_list_sid` (required) - The unique id that identifies the credential list to include the created credential.

  `{AccountSid}` in the path is the `:account_sid` setting; pass `account_sid: "..."` as an option to use another.

  ## Parameters

    * `password` (required) - The password that the username will use when authenticating SIP requests. The password must be a minimum of 12 characters, contain at least 1 digit, and have mixed case. (eg `IWasAtSignal2018`)
    * `username` (required) - The username that will be passed when authenticating SIP requests. The username should be sent in response to Twilio's challenge of the initial INVITE. It can be up to 32 characters long.
  """
  @spec create(String.t(), map() | keyword(), keyword()) ::
          {:ok, Twilio.Schemas.SipCredential.t()} | {:error, Infusion.Runtime.Error.t()}
  def create(credential_list_sid, params \\ %{}, opts \\ []),
    do: Twilio.__request__(@create_operation, [credential_list_sid], params, opts)

  @doc "Like `create/3`, but returns the result or raises `Infusion.Runtime.Error`."
  @spec create!(String.t(), map() | keyword(), keyword()) :: Twilio.Schemas.SipCredential.t()
  def create!(credential_list_sid, params \\ %{}, opts \\ []),
    do:
      Infusion.Runtime.Request.unwrap!(
        Twilio.__request__(@create_operation, [credential_list_sid], params, opts)
      )

  @delete_operation %{
    id: "DeleteSipCredential",
    method: :delete,
    path:
      "/2010-04-01/Accounts/{AccountSid}/SIP/CredentialLists/{CredentialListSid}/Credentials/{Sid}.json",
    path_params: ["CredentialListSid", "Sid"],
    client_path_params: [{"AccountSid", :account_sid}],
    params: [],
    response: nil
  }

  @doc """
  Delete a credential resource.

  `DELETE /2010-04-01/Accounts/{AccountSid}/SIP/CredentialLists/{CredentialListSid}/Credentials/{Sid}.json`

  ## Path parameters

    * `credential_list_sid` (required) - The unique id that identifies the credential list that contains the desired credentials.
    * `sid` (required) - The unique id that identifies the resource to delete.

  `{AccountSid}` in the path is the `:account_sid` setting; pass `account_sid: "..."` as an option to use another.
  """
  @spec delete(String.t(), String.t(), keyword()) ::
          {:ok, nil} | {:error, Infusion.Runtime.Error.t()}
  def delete(credential_list_sid, sid, opts \\ []),
    do: Twilio.__request__(@delete_operation, [credential_list_sid, sid], %{}, opts)

  @doc "Like `delete/3`, but returns the result or raises `Infusion.Runtime.Error`."
  @spec delete!(String.t(), String.t(), keyword()) :: nil
  def delete!(credential_list_sid, sid, opts \\ []),
    do:
      Infusion.Runtime.Request.unwrap!(
        Twilio.__request__(@delete_operation, [credential_list_sid, sid], %{}, opts)
      )

  @list_operation %{
    id: "ListSipCredential",
    method: :get,
    path:
      "/2010-04-01/Accounts/{AccountSid}/SIP/CredentialLists/{CredentialListSid}/Credentials.json",
    path_params: ["CredentialListSid"],
    client_path_params: [{"AccountSid", :account_sid}],
    params: [
      {:page_size, "PageSize", :query},
      {:page, "Page", :query},
      {:page_token, "PageToken", :query}
    ],
    response: {:ref, Twilio.Schemas.SipCredentialListsCredentialsListResponse},
    paginate: %{
      from: ["next_page_uri"],
      id: "sid",
      items: ["credentials"],
      style: :next_url,
      item: {:ref, Twilio.Schemas.SipCredential}
    }
  }

  @doc """
  Retrieve a list of credentials.

  `GET /2010-04-01/Accounts/{AccountSid}/SIP/CredentialLists/{CredentialListSid}/Credentials.json`

  ## Path parameters

    * `credential_list_sid` (required) - The unique id that identifies the credential list that contains the desired credentials.

  `{AccountSid}` in the path is the `:account_sid` setting; pass `account_sid: "..."` as an option to use another.

  ## Parameters

    * `page_size` - How many resources to return in each list page. The default is 50, and the maximum is 1000.
    * `page` - The page index. This value is simply for client state.
    * `page_token` - The page token. This is provided by the API.

  To read every item across all pages, use `list_all`.
  """
  @spec list(String.t(), map() | keyword(), keyword()) ::
          {:ok, Twilio.Schemas.SipCredentialListsCredentialsListResponse.t()}
          | {:error, Infusion.Runtime.Error.t()}
  def list(credential_list_sid, params \\ %{}, opts \\ []),
    do: Twilio.__request__(@list_operation, [credential_list_sid], params, opts)

  @doc "Like `list/3`, but returns the result or raises `Infusion.Runtime.Error`."
  @spec list!(String.t(), map() | keyword(), keyword()) ::
          Twilio.Schemas.SipCredentialListsCredentialsListResponse.t()
  def list!(credential_list_sid, params \\ %{}, opts \\ []),
    do:
      Infusion.Runtime.Request.unwrap!(
        Twilio.__request__(@list_operation, [credential_list_sid], params, opts)
      )

  @doc """
  Like `list/3`, but returns every item, from every page: a lazy stream of `Twilio.Schemas.SipCredential.t()` that fetches pages as it is read.

  The first page is fetched right away, so its errors are returned; a later page that fails raises `Infusion.Runtime.Error`. Stopping early (`Enum.take/2`) fetches no more pages.
  """
  @spec list_all(String.t(), map() | keyword(), keyword()) ::
          {:ok, Enumerable.t()} | {:error, Infusion.Runtime.Error.t()}
  def list_all(credential_list_sid, params \\ %{}, opts \\ []),
    do: Twilio.__paginate__(@list_operation, [credential_list_sid], params, opts)

  @doc "Like `list_all/3`, but returns the stream or raises `Infusion.Runtime.Error`."
  @spec list_all!(String.t(), map() | keyword(), keyword()) :: Enumerable.t()
  def list_all!(credential_list_sid, params \\ %{}, opts \\ []),
    do:
      Infusion.Runtime.Request.unwrap!(
        Twilio.__paginate__(@list_operation, [credential_list_sid], params, opts)
      )

  @doc """
  Watches this list and sends what changes: starts a process, linked to the caller, that polls it (with `ETag`s, so unchanged pages cost a `304`) and sends `{:infusion_watch, pid, %Infusion.Runtime.Watch.Event{}}` for every Twilio.Schemas.SipCredential.t() created, updated, deleted, or that moved into view (`:entered`).

  Options: `every:` (milliseconds, default 30 seconds), `to:` (a pid, `{:pubsub, MyApp.PubSub, topic}` or a function), `pages:`, `initial:`, `ignore:`, plus any setting of `Infusion.Runtime.Config`. See `Infusion.Runtime.Watch`.
  """
  @spec list_watch(String.t(), map() | keyword(), keyword()) ::
          {:ok, pid()} | {:error, Infusion.Runtime.Error.t()}
  def list_watch(credential_list_sid, params \\ %{}, opts \\ []),
    do: Twilio.__watch__(@list_operation, [credential_list_sid], params, opts)

  @doc "Like `list_watch/3`, but returns the stream or raises `Infusion.Runtime.Error`."
  @spec list_watch!(String.t(), map() | keyword(), keyword()) :: pid()
  def list_watch!(credential_list_sid, params \\ %{}, opts \\ []),
    do:
      Infusion.Runtime.Request.unwrap!(
        Twilio.__watch__(@list_operation, [credential_list_sid], params, opts)
      )

  @retrieve_operation %{
    id: "FetchSipCredential",
    method: :get,
    path:
      "/2010-04-01/Accounts/{AccountSid}/SIP/CredentialLists/{CredentialListSid}/Credentials/{Sid}.json",
    path_params: ["CredentialListSid", "Sid"],
    client_path_params: [{"AccountSid", :account_sid}],
    params: [],
    response: {:ref, Twilio.Schemas.SipCredential}
  }

  @doc """
  Fetch a single credential.

  `GET /2010-04-01/Accounts/{AccountSid}/SIP/CredentialLists/{CredentialListSid}/Credentials/{Sid}.json`

  ## Path parameters

    * `credential_list_sid` (required) - The unique id that identifies the credential list that contains the desired credential.
    * `sid` (required) - The unique id that identifies the resource to fetch.

  `{AccountSid}` in the path is the `:account_sid` setting; pass `account_sid: "..."` as an option to use another.
  """
  @spec retrieve(String.t(), String.t(), keyword()) ::
          {:ok, Twilio.Schemas.SipCredential.t()} | {:error, Infusion.Runtime.Error.t()}
  def retrieve(credential_list_sid, sid, opts \\ []),
    do: Twilio.__request__(@retrieve_operation, [credential_list_sid, sid], %{}, opts)

  @doc "Like `retrieve/3`, but returns the result or raises `Infusion.Runtime.Error`."
  @spec retrieve!(String.t(), String.t(), keyword()) :: Twilio.Schemas.SipCredential.t()
  def retrieve!(credential_list_sid, sid, opts \\ []),
    do:
      Infusion.Runtime.Request.unwrap!(
        Twilio.__request__(@retrieve_operation, [credential_list_sid, sid], %{}, opts)
      )

  @update_operation %{
    id: "UpdateSipCredential",
    method: :post,
    path:
      "/2010-04-01/Accounts/{AccountSid}/SIP/CredentialLists/{CredentialListSid}/Credentials/{Sid}.json",
    path_params: ["CredentialListSid", "Sid"],
    client_path_params: [{"AccountSid", :account_sid}],
    params: [{:password, "Password", :body}],
    body: :form,
    response: {:ref, Twilio.Schemas.SipCredential}
  }

  @doc """
  Update a credential resource.

  `POST /2010-04-01/Accounts/{AccountSid}/SIP/CredentialLists/{CredentialListSid}/Credentials/{Sid}.json`

  ## Path parameters

    * `credential_list_sid` (required) - The unique id that identifies the credential list that includes this credential.
    * `sid` (required) - The unique id that identifies the resource to update.

  `{AccountSid}` in the path is the `:account_sid` setting; pass `account_sid: "..."` as an option to use another.

  ## Parameters

    * `password` - The password that the username will use when authenticating SIP requests. The password must be a minimum of 12 characters, contain at least 1 digit, and have mixed case. (eg `IWasAtSignal2018`)
  """
  @spec update(String.t(), String.t(), map() | keyword(), keyword()) ::
          {:ok, Twilio.Schemas.SipCredential.t()} | {:error, Infusion.Runtime.Error.t()}
  def update(credential_list_sid, sid, params \\ %{}, opts \\ []),
    do: Twilio.__request__(@update_operation, [credential_list_sid, sid], params, opts)

  @doc "Like `update/4`, but returns the result or raises `Infusion.Runtime.Error`."
  @spec update!(String.t(), String.t(), map() | keyword(), keyword()) ::
          Twilio.Schemas.SipCredential.t()
  def update!(credential_list_sid, sid, params \\ %{}, opts \\ []),
    do:
      Infusion.Runtime.Request.unwrap!(
        Twilio.__request__(@update_operation, [credential_list_sid, sid], params, opts)
      )
end
