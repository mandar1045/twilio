defmodule Twilio.ConnectApps do
  @moduledoc """
  API calls: `delete`, `list`, `retrieve`, `update`.
  """

  @delete_operation %{
    id: "DeleteConnectApp",
    method: :delete,
    path: "/2010-04-01/Accounts/{AccountSid}/ConnectApps/{Sid}.json",
    path_params: ["Sid"],
    client_path_params: [{"AccountSid", :account_sid}],
    params: [],
    response: nil
  }

  @doc """
  Delete an instance of a connect-app

  `DELETE /2010-04-01/Accounts/{AccountSid}/ConnectApps/{Sid}.json`

  ## Path parameters

    * `sid` (required) - The Twilio-provided string that uniquely identifies the ConnectApp resource to fetch.

  `{AccountSid}` in the path is the `:account_sid` setting; pass `account_sid: "..."` as an option to use another.
  """
  @spec delete(String.t(), keyword()) :: {:ok, nil} | {:error, Infusion.Runtime.Error.t()}
  def delete(sid, opts \\ []), do: Twilio.__request__(@delete_operation, [sid], %{}, opts)

  @doc "Like `delete/2`, but returns the result or raises `Infusion.Runtime.Error`."
  @spec delete!(String.t(), keyword()) :: nil
  def delete!(sid, opts \\ []),
    do: Infusion.Runtime.Request.unwrap!(Twilio.__request__(@delete_operation, [sid], %{}, opts))

  @list_operation %{
    id: "ListConnectApp",
    method: :get,
    path: "/2010-04-01/Accounts/{AccountSid}/ConnectApps.json",
    path_params: [],
    client_path_params: [{"AccountSid", :account_sid}],
    params: [
      {:page_size, "PageSize", :query},
      {:page, "Page", :query},
      {:page_token, "PageToken", :query}
    ],
    response: {:ref, Twilio.Schemas.ConnectAppsListResponse},
    paginate: %{
      from: ["next_page_uri"],
      items: ["connect_apps"],
      style: :next_url,
      item: {:ref, Twilio.Schemas.ConnectApp}
    }
  }

  @doc """
  Retrieve a list of connect-apps belonging to the account used to make the request

  `GET /2010-04-01/Accounts/{AccountSid}/ConnectApps.json`

  `{AccountSid}` in the path is the `:account_sid` setting; pass `account_sid: "..."` as an option to use another.

  ## Parameters

    * `page_size` - How many resources to return in each list page. The default is 50, and the maximum is 1000.
    * `page` - The page index. This value is simply for client state.
    * `page_token` - The page token. This is provided by the API.

  To read every item across all pages, use `list_all`.
  """
  @spec list(map() | keyword(), keyword()) ::
          {:ok, Twilio.Schemas.ConnectAppsListResponse.t()} | {:error, Infusion.Runtime.Error.t()}
  def list(params \\ %{}, opts \\ []), do: Twilio.__request__(@list_operation, [], params, opts)

  @doc "Like `list/2`, but returns the result or raises `Infusion.Runtime.Error`."
  @spec list!(map() | keyword(), keyword()) :: Twilio.Schemas.ConnectAppsListResponse.t()
  def list!(params \\ %{}, opts \\ []),
    do: Infusion.Runtime.Request.unwrap!(Twilio.__request__(@list_operation, [], params, opts))

  @doc """
  Like `list/2`, but returns every item, from every page: a lazy stream of `Twilio.Schemas.ConnectApp.t()` that fetches pages as it is read.

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
    id: "FetchConnectApp",
    method: :get,
    path: "/2010-04-01/Accounts/{AccountSid}/ConnectApps/{Sid}.json",
    path_params: ["Sid"],
    client_path_params: [{"AccountSid", :account_sid}],
    params: [],
    response: {:ref, Twilio.Schemas.ConnectApp}
  }

  @doc """
  Fetch an instance of a connect-app

  `GET /2010-04-01/Accounts/{AccountSid}/ConnectApps/{Sid}.json`

  ## Path parameters

    * `sid` (required) - The Twilio-provided string that uniquely identifies the ConnectApp resource to fetch.

  `{AccountSid}` in the path is the `:account_sid` setting; pass `account_sid: "..."` as an option to use another.
  """
  @spec retrieve(String.t(), keyword()) ::
          {:ok, Twilio.Schemas.ConnectApp.t()} | {:error, Infusion.Runtime.Error.t()}
  def retrieve(sid, opts \\ []), do: Twilio.__request__(@retrieve_operation, [sid], %{}, opts)

  @doc "Like `retrieve/2`, but returns the result or raises `Infusion.Runtime.Error`."
  @spec retrieve!(String.t(), keyword()) :: Twilio.Schemas.ConnectApp.t()
  def retrieve!(sid, opts \\ []),
    do:
      Infusion.Runtime.Request.unwrap!(Twilio.__request__(@retrieve_operation, [sid], %{}, opts))

  @update_operation %{
    id: "UpdateConnectApp",
    method: :post,
    path: "/2010-04-01/Accounts/{AccountSid}/ConnectApps/{Sid}.json",
    path_params: ["Sid"],
    client_path_params: [{"AccountSid", :account_sid}],
    params: [
      {:authorize_redirect_url, "AuthorizeRedirectUrl", :body},
      {:company_name, "CompanyName", :body},
      {:deauthorize_callback_method, "DeauthorizeCallbackMethod", :body},
      {:deauthorize_callback_url, "DeauthorizeCallbackUrl", :body},
      {:description, "Description", :body},
      {:friendly_name, "FriendlyName", :body},
      {:homepage_url, "HomepageUrl", :body},
      {:permissions, "Permissions", :body}
    ],
    body: :form,
    response: {:ref, Twilio.Schemas.ConnectApp}
  }

  @doc """
  Update a connect-app with the specified parameters

  `POST /2010-04-01/Accounts/{AccountSid}/ConnectApps/{Sid}.json`

  ## Path parameters

    * `sid` (required) - The Twilio-provided string that uniquely identifies the ConnectApp resource to update.

  `{AccountSid}` in the path is the `:account_sid` setting; pass `account_sid: "..."` as an option to use another.

  ## Parameters

    * `authorize_redirect_url` - The URL to redirect the user to after we authenticate the user and obtain authorization to access the Connect App.
    * `company_name` - The company name to set for the Connect App.
    * `deauthorize_callback_method` - The HTTP method to use when calling `deauthorize_callback_url`.
    * `deauthorize_callback_url` - The URL to call using the `deauthorize_callback_method` to de-authorize the Connect App.
    * `description` - A description of the Connect App.
    * `friendly_name` - A descriptive string that you create to describe the resource. It can be up to 64 characters long.
    * `homepage_url` - A public URL where users can obtain more information about this Connect App.
    * `permissions` - A comma-separated list of the permissions you will request from the users of this ConnectApp. Can include: `get-all` and `post-all`.
  """
  @spec update(String.t(), map() | keyword(), keyword()) ::
          {:ok, Twilio.Schemas.ConnectApp.t()} | {:error, Infusion.Runtime.Error.t()}
  def update(sid, params \\ %{}, opts \\ []),
    do: Twilio.__request__(@update_operation, [sid], params, opts)

  @doc "Like `update/3`, but returns the result or raises `Infusion.Runtime.Error`."
  @spec update!(String.t(), map() | keyword(), keyword()) :: Twilio.Schemas.ConnectApp.t()
  def update!(sid, params \\ %{}, opts \\ []),
    do:
      Infusion.Runtime.Request.unwrap!(Twilio.__request__(@update_operation, [sid], params, opts))
end
