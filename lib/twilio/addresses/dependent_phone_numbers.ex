defmodule Twilio.Addresses.DependentPhoneNumbers do
  @moduledoc """
  API calls: `list`.
  """

  @list_operation %{
    id: "ListDependentPhoneNumber",
    method: :get,
    path: "/2010-04-01/Accounts/{AccountSid}/Addresses/{AddressSid}/DependentPhoneNumbers.json",
    path_params: ["AddressSid"],
    client_path_params: [{"AccountSid", :account_sid}],
    params: [
      {:page_size, "PageSize", :query},
      {:page, "Page", :query},
      {:page_token, "PageToken", :query}
    ],
    response: {:ref, Twilio.Schemas.AddressesDependentPhoneNumbersListResponse},
    paginate: %{
      from: ["next_page_uri"],
      items: ["dependent_phone_numbers"],
      style: :next_url,
      item: {:ref, Twilio.Schemas.DependentPhoneNumber}
    }
  }

  @doc """
  `GET /2010-04-01/Accounts/{AccountSid}/Addresses/{AddressSid}/DependentPhoneNumbers.json`

  ## Path parameters

    * `address_sid` (required) - The SID of the Address resource associated with the phone number.

  `{AccountSid}` in the path is the `:account_sid` setting; pass `account_sid: "..."` as an option to use another.

  ## Parameters

    * `page_size` - How many resources to return in each list page. The default is 50, and the maximum is 1000.
    * `page` - The page index. This value is simply for client state.
    * `page_token` - The page token. This is provided by the API.

  To read every item across all pages, use `list_all`.
  """
  @spec list(String.t(), map() | keyword(), keyword()) ::
          {:ok, Twilio.Schemas.AddressesDependentPhoneNumbersListResponse.t()}
          | {:error, Infusion.Runtime.Error.t()}
  def list(address_sid, params \\ %{}, opts \\ []),
    do: Twilio.__request__(@list_operation, [address_sid], params, opts)

  @doc "Like `list/3`, but returns the result or raises `Infusion.Runtime.Error`."
  @spec list!(String.t(), map() | keyword(), keyword()) ::
          Twilio.Schemas.AddressesDependentPhoneNumbersListResponse.t()
  def list!(address_sid, params \\ %{}, opts \\ []),
    do:
      Infusion.Runtime.Request.unwrap!(
        Twilio.__request__(@list_operation, [address_sid], params, opts)
      )

  @doc """
  Like `list/3`, but returns every item, from every page: a lazy stream of `Twilio.Schemas.DependentPhoneNumber.t()` that fetches pages as it is read.

  The first page is fetched right away, so its errors are returned; a later page that fails raises `Infusion.Runtime.Error`. Stopping early (`Enum.take/2`) fetches no more pages.
  """
  @spec list_all(String.t(), map() | keyword(), keyword()) ::
          {:ok, Enumerable.t()} | {:error, Infusion.Runtime.Error.t()}
  def list_all(address_sid, params \\ %{}, opts \\ []),
    do: Twilio.__paginate__(@list_operation, [address_sid], params, opts)

  @doc "Like `list_all/3`, but returns the stream or raises `Infusion.Runtime.Error`."
  @spec list_all!(String.t(), map() | keyword(), keyword()) :: Enumerable.t()
  def list_all!(address_sid, params \\ %{}, opts \\ []),
    do:
      Infusion.Runtime.Request.unwrap!(
        Twilio.__paginate__(@list_operation, [address_sid], params, opts)
      )
end
