defmodule Twilio.Addresses do
  @moduledoc """
  API calls: `create`, `delete`, `list`, `retrieve`, `update`.
  """

  @create_operation %{
    id: "CreateAddress",
    method: :post,
    path: "/2010-04-01/Accounts/{AccountSid}/Addresses.json",
    path_params: [],
    client_path_params: [{"AccountSid", :account_sid}],
    params: [
      {:auto_correct_address, "AutoCorrectAddress", :body},
      {:city, "City", :body},
      {:customer_name, "CustomerName", :body},
      {:emergency_enabled, "EmergencyEnabled", :body},
      {:friendly_name, "FriendlyName", :body},
      {:iso_country, "IsoCountry", :body},
      {:postal_code, "PostalCode", :body},
      {:region, "Region", :body},
      {:street, "Street", :body},
      {:street_secondary, "StreetSecondary", :body}
    ],
    body: :form,
    response: {:ref, Twilio.Schemas.Address}
  }

  @doc """
  `POST /2010-04-01/Accounts/{AccountSid}/Addresses.json`

  `{AccountSid}` in the path is the `:account_sid` setting; pass `account_sid: "..."` as an option to use another.

  ## Parameters

    * `auto_correct_address` - Whether we should automatically correct the address. Can be: `true` or `false` and the default is `true`. If empty or `true`, we will correct the address you provide if necessary. If `false`, we won't alter the address you provide.
    * `city` (required) - The city of the new address.
    * `customer_name` (required) - The name to associate with the new address.
    * `emergency_enabled` - Whether to enable emergency calling on the new address. Can be: `true` or `false`.
    * `friendly_name` - A descriptive string that you create to describe the new address. It can be up to 64 characters long for Regulatory Compliance addresses and 32 characters long for Emergency addresses.
    * `iso_country` (required) - The ISO country code of the new address.
    * `postal_code` (required) - The postal code of the new address.
    * `region` (required) - The state or region of the new address.
    * `street` (required) - The number and street address of the new address.
    * `street_secondary` - The additional number and street address of the address.
  """
  @spec create(map() | keyword(), keyword()) ::
          {:ok, Twilio.Schemas.Address.t()} | {:error, Infusion.Runtime.Error.t()}
  def create(params \\ %{}, opts \\ []),
    do: Twilio.__request__(@create_operation, [], params, opts)

  @doc "Like `create/2`, but returns the result or raises `Infusion.Runtime.Error`."
  @spec create!(map() | keyword(), keyword()) :: Twilio.Schemas.Address.t()
  def create!(params \\ %{}, opts \\ []),
    do: Infusion.Runtime.Request.unwrap!(Twilio.__request__(@create_operation, [], params, opts))

  @delete_operation %{
    id: "DeleteAddress",
    method: :delete,
    path: "/2010-04-01/Accounts/{AccountSid}/Addresses/{Sid}.json",
    path_params: ["Sid"],
    client_path_params: [{"AccountSid", :account_sid}],
    params: [],
    response: nil
  }

  @doc """
  `DELETE /2010-04-01/Accounts/{AccountSid}/Addresses/{Sid}.json`

  ## Path parameters

    * `sid` (required) - The Twilio-provided string that uniquely identifies the Address resource to delete.

  `{AccountSid}` in the path is the `:account_sid` setting; pass `account_sid: "..."` as an option to use another.
  """
  @spec delete(String.t(), keyword()) :: {:ok, nil} | {:error, Infusion.Runtime.Error.t()}
  def delete(sid, opts \\ []), do: Twilio.__request__(@delete_operation, [sid], %{}, opts)

  @doc "Like `delete/2`, but returns the result or raises `Infusion.Runtime.Error`."
  @spec delete!(String.t(), keyword()) :: nil
  def delete!(sid, opts \\ []),
    do: Infusion.Runtime.Request.unwrap!(Twilio.__request__(@delete_operation, [sid], %{}, opts))

  @list_operation %{
    id: "ListAddress",
    method: :get,
    path: "/2010-04-01/Accounts/{AccountSid}/Addresses.json",
    path_params: [],
    client_path_params: [{"AccountSid", :account_sid}],
    params: [
      {:customer_name, "CustomerName", :query},
      {:friendly_name, "FriendlyName", :query},
      {:emergency_enabled, "EmergencyEnabled", :query},
      {:iso_country, "IsoCountry", :query},
      {:page_size, "PageSize", :query},
      {:page, "Page", :query},
      {:page_token, "PageToken", :query}
    ],
    response: {:ref, Twilio.Schemas.AddressesListResponse},
    paginate: %{
      from: ["next_page_uri"],
      items: ["addresses"],
      style: :next_url,
      item: {:ref, Twilio.Schemas.Address}
    }
  }

  @doc """
  `GET /2010-04-01/Accounts/{AccountSid}/Addresses.json`

  `{AccountSid}` in the path is the `:account_sid` setting; pass `account_sid: "..."` as an option to use another.

  ## Parameters

    * `customer_name` - The `customer_name` of the Address resources to read.
    * `friendly_name` - The string that identifies the Address resources to read.
    * `emergency_enabled` - Whether the address can be associated to a number for emergency calling.
    * `iso_country` - The ISO country code of the Address resources to read.
    * `page_size` - How many resources to return in each list page. The default is 50, and the maximum is 1000.
    * `page` - The page index. This value is simply for client state.
    * `page_token` - The page token. This is provided by the API.

  To read every item across all pages, use `list_all`.
  """
  @spec list(map() | keyword(), keyword()) ::
          {:ok, Twilio.Schemas.AddressesListResponse.t()} | {:error, Infusion.Runtime.Error.t()}
  def list(params \\ %{}, opts \\ []), do: Twilio.__request__(@list_operation, [], params, opts)

  @doc "Like `list/2`, but returns the result or raises `Infusion.Runtime.Error`."
  @spec list!(map() | keyword(), keyword()) :: Twilio.Schemas.AddressesListResponse.t()
  def list!(params \\ %{}, opts \\ []),
    do: Infusion.Runtime.Request.unwrap!(Twilio.__request__(@list_operation, [], params, opts))

  @doc """
  Like `list/2`, but returns every item, from every page: a lazy stream of `Twilio.Schemas.Address.t()` that fetches pages as it is read.

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
    id: "FetchAddress",
    method: :get,
    path: "/2010-04-01/Accounts/{AccountSid}/Addresses/{Sid}.json",
    path_params: ["Sid"],
    client_path_params: [{"AccountSid", :account_sid}],
    params: [],
    response: {:ref, Twilio.Schemas.Address}
  }

  @doc """
  `GET /2010-04-01/Accounts/{AccountSid}/Addresses/{Sid}.json`

  ## Path parameters

    * `sid` (required) - The Twilio-provided string that uniquely identifies the Address resource to fetch.

  `{AccountSid}` in the path is the `:account_sid` setting; pass `account_sid: "..."` as an option to use another.
  """
  @spec retrieve(String.t(), keyword()) ::
          {:ok, Twilio.Schemas.Address.t()} | {:error, Infusion.Runtime.Error.t()}
  def retrieve(sid, opts \\ []), do: Twilio.__request__(@retrieve_operation, [sid], %{}, opts)

  @doc "Like `retrieve/2`, but returns the result or raises `Infusion.Runtime.Error`."
  @spec retrieve!(String.t(), keyword()) :: Twilio.Schemas.Address.t()
  def retrieve!(sid, opts \\ []),
    do:
      Infusion.Runtime.Request.unwrap!(Twilio.__request__(@retrieve_operation, [sid], %{}, opts))

  @update_operation %{
    id: "UpdateAddress",
    method: :post,
    path: "/2010-04-01/Accounts/{AccountSid}/Addresses/{Sid}.json",
    path_params: ["Sid"],
    client_path_params: [{"AccountSid", :account_sid}],
    params: [
      {:auto_correct_address, "AutoCorrectAddress", :body},
      {:city, "City", :body},
      {:customer_name, "CustomerName", :body},
      {:emergency_enabled, "EmergencyEnabled", :body},
      {:friendly_name, "FriendlyName", :body},
      {:postal_code, "PostalCode", :body},
      {:region, "Region", :body},
      {:street, "Street", :body},
      {:street_secondary, "StreetSecondary", :body}
    ],
    body: :form,
    response: {:ref, Twilio.Schemas.Address}
  }

  @doc """
  `POST /2010-04-01/Accounts/{AccountSid}/Addresses/{Sid}.json`

  ## Path parameters

    * `sid` (required) - The Twilio-provided string that uniquely identifies the Address resource to update.

  `{AccountSid}` in the path is the `:account_sid` setting; pass `account_sid: "..."` as an option to use another.

  ## Parameters

    * `auto_correct_address` - Whether we should automatically correct the address. Can be: `true` or `false` and the default is `true`. If empty or `true`, we will correct the address you provide if necessary. If `false`, we won't alter the address you provide.
    * `city` - The city of the address.
    * `customer_name` - The name to associate with the address.
    * `emergency_enabled` - Whether to enable emergency calling on the address. Can be: `true` or `false`.
    * `friendly_name` - A descriptive string that you create to describe the new address. It can be up to 64 characters long for Regulatory Compliance addresses and 32 characters long for Emergency addresses.
    * `postal_code` - The postal code of the address.
    * `region` - The state or region of the address.
    * `street` - The number and street address of the address.
    * `street_secondary` - The additional number and street address of the address.
  """
  @spec update(String.t(), map() | keyword(), keyword()) ::
          {:ok, Twilio.Schemas.Address.t()} | {:error, Infusion.Runtime.Error.t()}
  def update(sid, params \\ %{}, opts \\ []),
    do: Twilio.__request__(@update_operation, [sid], params, opts)

  @doc "Like `update/3`, but returns the result or raises `Infusion.Runtime.Error`."
  @spec update!(String.t(), map() | keyword(), keyword()) :: Twilio.Schemas.Address.t()
  def update!(sid, params \\ %{}, opts \\ []),
    do:
      Infusion.Runtime.Request.unwrap!(Twilio.__request__(@update_operation, [sid], params, opts))
end
