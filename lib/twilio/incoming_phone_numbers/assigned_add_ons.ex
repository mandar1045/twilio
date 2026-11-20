defmodule Twilio.IncomingPhoneNumbers.AssignedAddOns do
  @moduledoc """
  API calls: `create`, `delete`, `list`, `retrieve`.
  """

  @create_operation %{
    id: "CreateIncomingPhoneNumberAssignedAddOn",
    method: :post,
    path:
      "/2010-04-01/Accounts/{AccountSid}/IncomingPhoneNumbers/{ResourceSid}/AssignedAddOns.json",
    path_params: ["ResourceSid"],
    client_path_params: [{"AccountSid", :account_sid}],
    params: [{:installed_add_on_sid, "InstalledAddOnSid", :body}],
    body: :form,
    response: {:ref, Twilio.Schemas.IncomingPhoneNumberAssignedAddOn}
  }

  @doc """
  Assign an Add-on installation to the Number specified.

  `POST /2010-04-01/Accounts/{AccountSid}/IncomingPhoneNumbers/{ResourceSid}/AssignedAddOns.json`

  ## Path parameters

    * `resource_sid` (required) - The SID of the Phone Number to assign the Add-on.

  `{AccountSid}` in the path is the `:account_sid` setting; pass `account_sid: "..."` as an option to use another.

  ## Parameters

    * `installed_add_on_sid` (required) - The SID that identifies the Add-on installation.
  """
  @spec create(String.t(), map() | keyword(), keyword()) ::
          {:ok, Twilio.Schemas.IncomingPhoneNumberAssignedAddOn.t()}
          | {:error, Infusion.Runtime.Error.t()}
  def create(resource_sid, params \\ %{}, opts \\ []),
    do: Twilio.__request__(@create_operation, [resource_sid], params, opts)

  @doc "Like `create/3`, but returns the result or raises `Infusion.Runtime.Error`."
  @spec create!(String.t(), map() | keyword(), keyword()) ::
          Twilio.Schemas.IncomingPhoneNumberAssignedAddOn.t()
  def create!(resource_sid, params \\ %{}, opts \\ []),
    do:
      Infusion.Runtime.Request.unwrap!(
        Twilio.__request__(@create_operation, [resource_sid], params, opts)
      )

  @delete_operation %{
    id: "DeleteIncomingPhoneNumberAssignedAddOn",
    method: :delete,
    path:
      "/2010-04-01/Accounts/{AccountSid}/IncomingPhoneNumbers/{ResourceSid}/AssignedAddOns/{Sid}.json",
    path_params: ["ResourceSid", "Sid"],
    client_path_params: [{"AccountSid", :account_sid}],
    params: [],
    response: nil
  }

  @doc """
  Remove the assignment of an Add-on installation from the Number specified.

  `DELETE /2010-04-01/Accounts/{AccountSid}/IncomingPhoneNumbers/{ResourceSid}/AssignedAddOns/{Sid}.json`

  ## Path parameters

    * `resource_sid` (required) - The SID of the Phone Number to which the Add-on is assigned.
    * `sid` (required) - The Twilio-provided string that uniquely identifies the resource to delete.

  `{AccountSid}` in the path is the `:account_sid` setting; pass `account_sid: "..."` as an option to use another.
  """
  @spec delete(String.t(), String.t(), keyword()) ::
          {:ok, nil} | {:error, Infusion.Runtime.Error.t()}
  def delete(resource_sid, sid, opts \\ []),
    do: Twilio.__request__(@delete_operation, [resource_sid, sid], %{}, opts)

  @doc "Like `delete/3`, but returns the result or raises `Infusion.Runtime.Error`."
  @spec delete!(String.t(), String.t(), keyword()) :: nil
  def delete!(resource_sid, sid, opts \\ []),
    do:
      Infusion.Runtime.Request.unwrap!(
        Twilio.__request__(@delete_operation, [resource_sid, sid], %{}, opts)
      )

  @list_operation %{
    id: "ListIncomingPhoneNumberAssignedAddOn",
    method: :get,
    path:
      "/2010-04-01/Accounts/{AccountSid}/IncomingPhoneNumbers/{ResourceSid}/AssignedAddOns.json",
    path_params: ["ResourceSid"],
    client_path_params: [{"AccountSid", :account_sid}],
    params: [
      {:page_size, "PageSize", :query},
      {:page, "Page", :query},
      {:page_token, "PageToken", :query}
    ],
    response: {:ref, Twilio.Schemas.IncomingPhoneNumbersAssignedAddOnsListResponse},
    paginate: %{
      from: ["next_page_uri"],
      id: "sid",
      items: ["assigned_add_ons"],
      style: :next_url,
      item: {:ref, Twilio.Schemas.IncomingPhoneNumberAssignedAddOn}
    }
  }

  @doc """
  Retrieve a list of Add-on installations currently assigned to this Number.

  `GET /2010-04-01/Accounts/{AccountSid}/IncomingPhoneNumbers/{ResourceSid}/AssignedAddOns.json`

  ## Path parameters

    * `resource_sid` (required) - The SID of the Phone Number to which the Add-on is assigned.

  `{AccountSid}` in the path is the `:account_sid` setting; pass `account_sid: "..."` as an option to use another.

  ## Parameters

    * `page_size` - How many resources to return in each list page. The default is 50, and the maximum is 1000.
    * `page` - The page index. This value is simply for client state.
    * `page_token` - The page token. This is provided by the API.

  To read every item across all pages, use `list_all`.
  """
  @spec list(String.t(), map() | keyword(), keyword()) ::
          {:ok, Twilio.Schemas.IncomingPhoneNumbersAssignedAddOnsListResponse.t()}
          | {:error, Infusion.Runtime.Error.t()}
  def list(resource_sid, params \\ %{}, opts \\ []),
    do: Twilio.__request__(@list_operation, [resource_sid], params, opts)

  @doc "Like `list/3`, but returns the result or raises `Infusion.Runtime.Error`."
  @spec list!(String.t(), map() | keyword(), keyword()) ::
          Twilio.Schemas.IncomingPhoneNumbersAssignedAddOnsListResponse.t()
  def list!(resource_sid, params \\ %{}, opts \\ []),
    do:
      Infusion.Runtime.Request.unwrap!(
        Twilio.__request__(@list_operation, [resource_sid], params, opts)
      )

  @doc """
  Like `list/3`, but returns every item, from every page: a lazy stream of `Twilio.Schemas.IncomingPhoneNumberAssignedAddOn.t()` that fetches pages as it is read.

  The first page is fetched right away, so its errors are returned; a later page that fails raises `Infusion.Runtime.Error`. Stopping early (`Enum.take/2`) fetches no more pages.
  """
  @spec list_all(String.t(), map() | keyword(), keyword()) ::
          {:ok, Enumerable.t()} | {:error, Infusion.Runtime.Error.t()}
  def list_all(resource_sid, params \\ %{}, opts \\ []),
    do: Twilio.__paginate__(@list_operation, [resource_sid], params, opts)

  @doc "Like `list_all/3`, but returns the stream or raises `Infusion.Runtime.Error`."
  @spec list_all!(String.t(), map() | keyword(), keyword()) :: Enumerable.t()
  def list_all!(resource_sid, params \\ %{}, opts \\ []),
    do:
      Infusion.Runtime.Request.unwrap!(
        Twilio.__paginate__(@list_operation, [resource_sid], params, opts)
      )

  @doc """
  Watches this list and sends what changes: starts a process, linked to the caller, that polls it (with `ETag`s, so unchanged pages cost a `304`) and sends `{:infusion_watch, pid, %Infusion.Runtime.Watch.Event{}}` for every Twilio.Schemas.IncomingPhoneNumberAssignedAddOn.t() created, updated, deleted, or that moved into view (`:entered`).

  Options: `every:` (milliseconds, default 30 seconds), `to:` (a pid, `{:pubsub, MyApp.PubSub, topic}` or a function), `pages:`, `initial:`, `ignore:`, plus any setting of `Infusion.Runtime.Config`. See `Infusion.Runtime.Watch`.
  """
  @spec list_watch(String.t(), map() | keyword(), keyword()) ::
          {:ok, pid()} | {:error, Infusion.Runtime.Error.t()}
  def list_watch(resource_sid, params \\ %{}, opts \\ []),
    do: Twilio.__watch__(@list_operation, [resource_sid], params, opts)

  @doc "Like `list_watch/3`, but returns the stream or raises `Infusion.Runtime.Error`."
  @spec list_watch!(String.t(), map() | keyword(), keyword()) :: pid()
  def list_watch!(resource_sid, params \\ %{}, opts \\ []),
    do:
      Infusion.Runtime.Request.unwrap!(
        Twilio.__watch__(@list_operation, [resource_sid], params, opts)
      )

  @retrieve_operation %{
    id: "FetchIncomingPhoneNumberAssignedAddOn",
    method: :get,
    path:
      "/2010-04-01/Accounts/{AccountSid}/IncomingPhoneNumbers/{ResourceSid}/AssignedAddOns/{Sid}.json",
    path_params: ["ResourceSid", "Sid"],
    client_path_params: [{"AccountSid", :account_sid}],
    params: [],
    response: {:ref, Twilio.Schemas.IncomingPhoneNumberAssignedAddOn}
  }

  @doc """
  Fetch an instance of an Add-on installation currently assigned to this Number.

  `GET /2010-04-01/Accounts/{AccountSid}/IncomingPhoneNumbers/{ResourceSid}/AssignedAddOns/{Sid}.json`

  ## Path parameters

    * `resource_sid` (required) - The SID of the Phone Number to which the Add-on is assigned.
    * `sid` (required) - The Twilio-provided string that uniquely identifies the resource to fetch.

  `{AccountSid}` in the path is the `:account_sid` setting; pass `account_sid: "..."` as an option to use another.
  """
  @spec retrieve(String.t(), String.t(), keyword()) ::
          {:ok, Twilio.Schemas.IncomingPhoneNumberAssignedAddOn.t()}
          | {:error, Infusion.Runtime.Error.t()}
  def retrieve(resource_sid, sid, opts \\ []),
    do: Twilio.__request__(@retrieve_operation, [resource_sid, sid], %{}, opts)

  @doc "Like `retrieve/3`, but returns the result or raises `Infusion.Runtime.Error`."
  @spec retrieve!(String.t(), String.t(), keyword()) ::
          Twilio.Schemas.IncomingPhoneNumberAssignedAddOn.t()
  def retrieve!(resource_sid, sid, opts \\ []),
    do:
      Infusion.Runtime.Request.unwrap!(
        Twilio.__request__(@retrieve_operation, [resource_sid, sid], %{}, opts)
      )
end
