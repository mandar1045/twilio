defmodule Twilio.IncomingPhoneNumbers.AssignedAddOns.Extensions do
  @moduledoc """
  API calls: `list`, `retrieve`.
  """

  @list_operation %{
    id: "ListIncomingPhoneNumberAssignedAddOnExtension",
    method: :get,
    path:
      "/2010-04-01/Accounts/{AccountSid}/IncomingPhoneNumbers/{ResourceSid}/AssignedAddOns/{AssignedAddOnSid}/Extensions.json",
    path_params: ["ResourceSid", "AssignedAddOnSid"],
    client_path_params: [{"AccountSid", :account_sid}],
    params: [
      {:page_size, "PageSize", :query},
      {:page, "Page", :query},
      {:page_token, "PageToken", :query}
    ],
    response: {:ref, Twilio.Schemas.IncomingPhoneNumbersAssignedAddOnsExtensionsListResponse},
    paginate: %{
      from: ["next_page_uri"],
      items: ["extensions"],
      style: :next_url,
      item: {:ref, Twilio.Schemas.IncomingPhoneNumberAssignedAddOnExtension}
    }
  }

  @doc """
  Retrieve a list of Extensions for the Assigned Add-on.

  `GET /2010-04-01/Accounts/{AccountSid}/IncomingPhoneNumbers/{ResourceSid}/AssignedAddOns/{AssignedAddOnSid}/Extensions.json`

  ## Path parameters

    * `resource_sid` (required) - The SID of the Phone Number to which the Add-on is assigned.
    * `assigned_add_on_sid` (required) - The SID that uniquely identifies the assigned Add-on installation.

  `{AccountSid}` in the path is the `:account_sid` setting; pass `account_sid: "..."` as an option to use another.

  ## Parameters

    * `page_size` - How many resources to return in each list page. The default is 50, and the maximum is 1000.
    * `page` - The page index. This value is simply for client state.
    * `page_token` - The page token. This is provided by the API.

  To read every item across all pages, use `list_all`.
  """
  @spec list(String.t(), String.t(), map() | keyword(), keyword()) ::
          {:ok, Twilio.Schemas.IncomingPhoneNumbersAssignedAddOnsExtensionsListResponse.t()}
          | {:error, Infusion.Runtime.Error.t()}
  def list(resource_sid, assigned_add_on_sid, params \\ %{}, opts \\ []),
    do: Twilio.__request__(@list_operation, [resource_sid, assigned_add_on_sid], params, opts)

  @doc "Like `list/4`, but returns the result or raises `Infusion.Runtime.Error`."
  @spec list!(String.t(), String.t(), map() | keyword(), keyword()) ::
          Twilio.Schemas.IncomingPhoneNumbersAssignedAddOnsExtensionsListResponse.t()
  def list!(resource_sid, assigned_add_on_sid, params \\ %{}, opts \\ []),
    do:
      Infusion.Runtime.Request.unwrap!(
        Twilio.__request__(@list_operation, [resource_sid, assigned_add_on_sid], params, opts)
      )

  @doc """
  Like `list/4`, but returns every item, from every page: a lazy stream of `Twilio.Schemas.IncomingPhoneNumberAssignedAddOnExtension.t()` that fetches pages as it is read.

  The first page is fetched right away, so its errors are returned; a later page that fails raises `Infusion.Runtime.Error`. Stopping early (`Enum.take/2`) fetches no more pages.
  """
  @spec list_all(String.t(), String.t(), map() | keyword(), keyword()) ::
          {:ok, Enumerable.t()} | {:error, Infusion.Runtime.Error.t()}
  def list_all(resource_sid, assigned_add_on_sid, params \\ %{}, opts \\ []),
    do: Twilio.__paginate__(@list_operation, [resource_sid, assigned_add_on_sid], params, opts)

  @doc "Like `list_all/4`, but returns the stream or raises `Infusion.Runtime.Error`."
  @spec list_all!(String.t(), String.t(), map() | keyword(), keyword()) :: Enumerable.t()
  def list_all!(resource_sid, assigned_add_on_sid, params \\ %{}, opts \\ []),
    do:
      Infusion.Runtime.Request.unwrap!(
        Twilio.__paginate__(@list_operation, [resource_sid, assigned_add_on_sid], params, opts)
      )

  @retrieve_operation %{
    id: "FetchIncomingPhoneNumberAssignedAddOnExtension",
    method: :get,
    path:
      "/2010-04-01/Accounts/{AccountSid}/IncomingPhoneNumbers/{ResourceSid}/AssignedAddOns/{AssignedAddOnSid}/Extensions/{Sid}.json",
    path_params: ["ResourceSid", "AssignedAddOnSid", "Sid"],
    client_path_params: [{"AccountSid", :account_sid}],
    params: [],
    response: {:ref, Twilio.Schemas.IncomingPhoneNumberAssignedAddOnExtension}
  }

  @doc """
  Fetch an instance of an Extension for the Assigned Add-on.

  `GET /2010-04-01/Accounts/{AccountSid}/IncomingPhoneNumbers/{ResourceSid}/AssignedAddOns/{AssignedAddOnSid}/Extensions/{Sid}.json`

  ## Path parameters

    * `resource_sid` (required) - The SID of the Phone Number to which the Add-on is assigned.
    * `assigned_add_on_sid` (required) - The SID that uniquely identifies the assigned Add-on installation.
    * `sid` (required) - The Twilio-provided string that uniquely identifies the resource to fetch.

  `{AccountSid}` in the path is the `:account_sid` setting; pass `account_sid: "..."` as an option to use another.
  """
  @spec retrieve(String.t(), String.t(), String.t(), keyword()) ::
          {:ok, Twilio.Schemas.IncomingPhoneNumberAssignedAddOnExtension.t()}
          | {:error, Infusion.Runtime.Error.t()}
  def retrieve(resource_sid, assigned_add_on_sid, sid, opts \\ []),
    do:
      Twilio.__request__(@retrieve_operation, [resource_sid, assigned_add_on_sid, sid], %{}, opts)

  @doc "Like `retrieve/4`, but returns the result or raises `Infusion.Runtime.Error`."
  @spec retrieve!(String.t(), String.t(), String.t(), keyword()) ::
          Twilio.Schemas.IncomingPhoneNumberAssignedAddOnExtension.t()
  def retrieve!(resource_sid, assigned_add_on_sid, sid, opts \\ []),
    do:
      Infusion.Runtime.Request.unwrap!(
        Twilio.__request__(
          @retrieve_operation,
          [resource_sid, assigned_add_on_sid, sid],
          %{},
          opts
        )
      )
end
