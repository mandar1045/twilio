defmodule Twilio.Sip.IpAccessControlLists.IpAddresses do
  @moduledoc """
  API calls: `create`, `delete`, `list`, `retrieve`, `update`.
  """

  @create_operation %{
    id: "CreateSipIpAddress",
    method: :post,
    path:
      "/2010-04-01/Accounts/{AccountSid}/SIP/IpAccessControlLists/{IpAccessControlListSid}/IpAddresses.json",
    path_params: ["IpAccessControlListSid"],
    client_path_params: [{"AccountSid", :account_sid}],
    params: [
      {:cidr_prefix_length, "CidrPrefixLength", :body},
      {:friendly_name, "FriendlyName", :body},
      {:ip_address, "IpAddress", :body}
    ],
    body: :form,
    response: {:ref, Twilio.Schemas.SipIpAddress}
  }

  @doc """
  Create a new IpAddress resource.

  `POST /2010-04-01/Accounts/{AccountSid}/SIP/IpAccessControlLists/{IpAccessControlListSid}/IpAddresses.json`

  ## Path parameters

    * `ip_access_control_list_sid` (required) - The IpAccessControlList Sid with which to associate the created IpAddress resource.

  `{AccountSid}` in the path is the `:account_sid` setting; pass `account_sid: "..."` as an option to use another.

  ## Parameters

    * `cidr_prefix_length` - An integer representing the length of the CIDR prefix to use with this IP address when accepting traffic. By default the entire IP address is used.
    * `friendly_name` (required) - A human readable descriptive text for this resource, up to 255 characters long.
    * `ip_address` (required) - An IP address in dotted decimal notation from which you want to accept traffic. Any SIP requests from this IP address will be allowed by Twilio. IPv4 only supported today.
  """
  @spec create(String.t(), map() | keyword(), keyword()) ::
          {:ok, Twilio.Schemas.SipIpAddress.t()} | {:error, Infusion.Runtime.Error.t()}
  def create(ip_access_control_list_sid, params \\ %{}, opts \\ []),
    do: Twilio.__request__(@create_operation, [ip_access_control_list_sid], params, opts)

  @doc "Like `create/3`, but returns the result or raises `Infusion.Runtime.Error`."
  @spec create!(String.t(), map() | keyword(), keyword()) :: Twilio.Schemas.SipIpAddress.t()
  def create!(ip_access_control_list_sid, params \\ %{}, opts \\ []),
    do:
      Infusion.Runtime.Request.unwrap!(
        Twilio.__request__(@create_operation, [ip_access_control_list_sid], params, opts)
      )

  @delete_operation %{
    id: "DeleteSipIpAddress",
    method: :delete,
    path:
      "/2010-04-01/Accounts/{AccountSid}/SIP/IpAccessControlLists/{IpAccessControlListSid}/IpAddresses/{Sid}.json",
    path_params: ["IpAccessControlListSid", "Sid"],
    client_path_params: [{"AccountSid", :account_sid}],
    params: [],
    response: nil
  }

  @doc """
  Delete an IpAddress resource.

  `DELETE /2010-04-01/Accounts/{AccountSid}/SIP/IpAccessControlLists/{IpAccessControlListSid}/IpAddresses/{Sid}.json`

  ## Path parameters

    * `ip_access_control_list_sid` (required) - The IpAccessControlList Sid that identifies the IpAddress resources to delete.
    * `sid` (required) - A 34 character string that uniquely identifies the resource to delete.

  `{AccountSid}` in the path is the `:account_sid` setting; pass `account_sid: "..."` as an option to use another.
  """
  @spec delete(String.t(), String.t(), keyword()) ::
          {:ok, nil} | {:error, Infusion.Runtime.Error.t()}
  def delete(ip_access_control_list_sid, sid, opts \\ []),
    do: Twilio.__request__(@delete_operation, [ip_access_control_list_sid, sid], %{}, opts)

  @doc "Like `delete/3`, but returns the result or raises `Infusion.Runtime.Error`."
  @spec delete!(String.t(), String.t(), keyword()) :: nil
  def delete!(ip_access_control_list_sid, sid, opts \\ []),
    do:
      Infusion.Runtime.Request.unwrap!(
        Twilio.__request__(@delete_operation, [ip_access_control_list_sid, sid], %{}, opts)
      )

  @list_operation %{
    id: "ListSipIpAddress",
    method: :get,
    path:
      "/2010-04-01/Accounts/{AccountSid}/SIP/IpAccessControlLists/{IpAccessControlListSid}/IpAddresses.json",
    path_params: ["IpAccessControlListSid"],
    client_path_params: [{"AccountSid", :account_sid}],
    params: [
      {:page_size, "PageSize", :query},
      {:page, "Page", :query},
      {:page_token, "PageToken", :query}
    ],
    response: {:ref, Twilio.Schemas.SipIpAccessControlListsIpAddressesListResponse},
    paginate: %{
      from: ["next_page_uri"],
      id: "sid",
      items: ["ip_addresses"],
      style: :next_url,
      item: {:ref, Twilio.Schemas.SipIpAddress}
    }
  }

  @doc """
  Read multiple IpAddress resources.

  `GET /2010-04-01/Accounts/{AccountSid}/SIP/IpAccessControlLists/{IpAccessControlListSid}/IpAddresses.json`

  ## Path parameters

    * `ip_access_control_list_sid` (required) - The IpAccessControlList Sid that identifies the IpAddress resources to read.

  `{AccountSid}` in the path is the `:account_sid` setting; pass `account_sid: "..."` as an option to use another.

  ## Parameters

    * `page_size` - How many resources to return in each list page. The default is 50, and the maximum is 1000.
    * `page` - The page index. This value is simply for client state.
    * `page_token` - The page token. This is provided by the API.

  To read every item across all pages, use `list_all`.
  """
  @spec list(String.t(), map() | keyword(), keyword()) ::
          {:ok, Twilio.Schemas.SipIpAccessControlListsIpAddressesListResponse.t()}
          | {:error, Infusion.Runtime.Error.t()}
  def list(ip_access_control_list_sid, params \\ %{}, opts \\ []),
    do: Twilio.__request__(@list_operation, [ip_access_control_list_sid], params, opts)

  @doc "Like `list/3`, but returns the result or raises `Infusion.Runtime.Error`."
  @spec list!(String.t(), map() | keyword(), keyword()) ::
          Twilio.Schemas.SipIpAccessControlListsIpAddressesListResponse.t()
  def list!(ip_access_control_list_sid, params \\ %{}, opts \\ []),
    do:
      Infusion.Runtime.Request.unwrap!(
        Twilio.__request__(@list_operation, [ip_access_control_list_sid], params, opts)
      )

  @doc """
  Like `list/3`, but returns every item, from every page: a lazy stream of `Twilio.Schemas.SipIpAddress.t()` that fetches pages as it is read.

  The first page is fetched right away, so its errors are returned; a later page that fails raises `Infusion.Runtime.Error`. Stopping early (`Enum.take/2`) fetches no more pages.
  """
  @spec list_all(String.t(), map() | keyword(), keyword()) ::
          {:ok, Enumerable.t()} | {:error, Infusion.Runtime.Error.t()}
  def list_all(ip_access_control_list_sid, params \\ %{}, opts \\ []),
    do: Twilio.__paginate__(@list_operation, [ip_access_control_list_sid], params, opts)

  @doc "Like `list_all/3`, but returns the stream or raises `Infusion.Runtime.Error`."
  @spec list_all!(String.t(), map() | keyword(), keyword()) :: Enumerable.t()
  def list_all!(ip_access_control_list_sid, params \\ %{}, opts \\ []),
    do:
      Infusion.Runtime.Request.unwrap!(
        Twilio.__paginate__(@list_operation, [ip_access_control_list_sid], params, opts)
      )

  @doc """
  Watches this list and sends what changes: starts a process, linked to the caller, that polls it (with `ETag`s, so unchanged pages cost a `304`) and sends `{:infusion_watch, pid, %Infusion.Runtime.Watch.Event{}}` for every Twilio.Schemas.SipIpAddress.t() created, updated, deleted, or that moved into view (`:entered`).

  Options: `every:` (milliseconds, default 30 seconds), `to:` (a pid, `{:pubsub, MyApp.PubSub, topic}` or a function), `pages:`, `initial:`, `ignore:`, plus any setting of `Infusion.Runtime.Config`. See `Infusion.Runtime.Watch`.
  """
  @spec list_watch(String.t(), map() | keyword(), keyword()) ::
          {:ok, pid()} | {:error, Infusion.Runtime.Error.t()}
  def list_watch(ip_access_control_list_sid, params \\ %{}, opts \\ []),
    do: Twilio.__watch__(@list_operation, [ip_access_control_list_sid], params, opts)

  @doc "Like `list_watch/3`, but returns the stream or raises `Infusion.Runtime.Error`."
  @spec list_watch!(String.t(), map() | keyword(), keyword()) :: pid()
  def list_watch!(ip_access_control_list_sid, params \\ %{}, opts \\ []),
    do:
      Infusion.Runtime.Request.unwrap!(
        Twilio.__watch__(@list_operation, [ip_access_control_list_sid], params, opts)
      )

  @retrieve_operation %{
    id: "FetchSipIpAddress",
    method: :get,
    path:
      "/2010-04-01/Accounts/{AccountSid}/SIP/IpAccessControlLists/{IpAccessControlListSid}/IpAddresses/{Sid}.json",
    path_params: ["IpAccessControlListSid", "Sid"],
    client_path_params: [{"AccountSid", :account_sid}],
    params: [],
    response: {:ref, Twilio.Schemas.SipIpAddress}
  }

  @doc """
  Read one IpAddress resource.

  `GET /2010-04-01/Accounts/{AccountSid}/SIP/IpAccessControlLists/{IpAccessControlListSid}/IpAddresses/{Sid}.json`

  ## Path parameters

    * `ip_access_control_list_sid` (required) - The IpAccessControlList Sid that identifies the IpAddress resources to fetch.
    * `sid` (required) - A 34 character string that uniquely identifies the IpAddress resource to fetch.

  `{AccountSid}` in the path is the `:account_sid` setting; pass `account_sid: "..."` as an option to use another.
  """
  @spec retrieve(String.t(), String.t(), keyword()) ::
          {:ok, Twilio.Schemas.SipIpAddress.t()} | {:error, Infusion.Runtime.Error.t()}
  def retrieve(ip_access_control_list_sid, sid, opts \\ []),
    do: Twilio.__request__(@retrieve_operation, [ip_access_control_list_sid, sid], %{}, opts)

  @doc "Like `retrieve/3`, but returns the result or raises `Infusion.Runtime.Error`."
  @spec retrieve!(String.t(), String.t(), keyword()) :: Twilio.Schemas.SipIpAddress.t()
  def retrieve!(ip_access_control_list_sid, sid, opts \\ []),
    do:
      Infusion.Runtime.Request.unwrap!(
        Twilio.__request__(@retrieve_operation, [ip_access_control_list_sid, sid], %{}, opts)
      )

  @update_operation %{
    id: "UpdateSipIpAddress",
    method: :post,
    path:
      "/2010-04-01/Accounts/{AccountSid}/SIP/IpAccessControlLists/{IpAccessControlListSid}/IpAddresses/{Sid}.json",
    path_params: ["IpAccessControlListSid", "Sid"],
    client_path_params: [{"AccountSid", :account_sid}],
    params: [
      {:cidr_prefix_length, "CidrPrefixLength", :body},
      {:friendly_name, "FriendlyName", :body},
      {:ip_address, "IpAddress", :body}
    ],
    body: :form,
    response: {:ref, Twilio.Schemas.SipIpAddress}
  }

  @doc """
  Update an IpAddress resource.

  `POST /2010-04-01/Accounts/{AccountSid}/SIP/IpAccessControlLists/{IpAccessControlListSid}/IpAddresses/{Sid}.json`

  ## Path parameters

    * `ip_access_control_list_sid` (required) - The IpAccessControlList Sid that identifies the IpAddress resources to update.
    * `sid` (required) - A 34 character string that identifies the IpAddress resource to update.

  `{AccountSid}` in the path is the `:account_sid` setting; pass `account_sid: "..."` as an option to use another.

  ## Parameters

    * `cidr_prefix_length` - An integer representing the length of the CIDR prefix to use with this IP address when accepting traffic. By default the entire IP address is used.
    * `friendly_name` - A human readable descriptive text for this resource, up to 255 characters long.
    * `ip_address` - An IP address in dotted decimal notation from which you want to accept traffic. Any SIP requests from this IP address will be allowed by Twilio. IPv4 only supported today.
  """
  @spec update(String.t(), String.t(), map() | keyword(), keyword()) ::
          {:ok, Twilio.Schemas.SipIpAddress.t()} | {:error, Infusion.Runtime.Error.t()}
  def update(ip_access_control_list_sid, sid, params \\ %{}, opts \\ []),
    do: Twilio.__request__(@update_operation, [ip_access_control_list_sid, sid], params, opts)

  @doc "Like `update/4`, but returns the result or raises `Infusion.Runtime.Error`."
  @spec update!(String.t(), String.t(), map() | keyword(), keyword()) ::
          Twilio.Schemas.SipIpAddress.t()
  def update!(ip_access_control_list_sid, sid, params \\ %{}, opts \\ []),
    do:
      Infusion.Runtime.Request.unwrap!(
        Twilio.__request__(@update_operation, [ip_access_control_list_sid, sid], params, opts)
      )
end
