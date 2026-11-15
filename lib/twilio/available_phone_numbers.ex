defmodule Twilio.AvailablePhoneNumbers do
  @moduledoc """
  API calls: `list`, `retrieve`.
  """

  @list_operation %{
    id: "ListAvailablePhoneNumberCountry",
    method: :get,
    path: "/2010-04-01/Accounts/{AccountSid}/AvailablePhoneNumbers.json",
    path_params: [],
    client_path_params: [{"AccountSid", :account_sid}],
    params: [
      {:page_size, "PageSize", :query},
      {:page, "Page", :query},
      {:page_token, "PageToken", :query}
    ],
    response: {:ref, Twilio.Schemas.AvailablePhoneNumbersListResponse}
  }

  @doc """
  `GET /2010-04-01/Accounts/{AccountSid}/AvailablePhoneNumbers.json`

  `{AccountSid}` in the path is the `:account_sid` setting; pass `account_sid: "..."` as an option to use another.

  ## Parameters

    * `page_size` - How many resources to return in each list page. The default is 50, and the maximum is 1000.
    * `page` - The page index. This value is simply for client state.
    * `page_token` - The page token. This is provided by the API.
  """
  @spec list(map() | keyword(), keyword()) ::
          {:ok, Twilio.Schemas.AvailablePhoneNumbersListResponse.t()}
          | {:error, Infusion.Runtime.Error.t()}
  def list(params \\ %{}, opts \\ []), do: Twilio.__request__(@list_operation, [], params, opts)

  @doc "Like `list/2`, but returns the result or raises `Infusion.Runtime.Error`."
  @spec list!(map() | keyword(), keyword()) ::
          Twilio.Schemas.AvailablePhoneNumbersListResponse.t()
  def list!(params \\ %{}, opts \\ []),
    do: Infusion.Runtime.Request.unwrap!(Twilio.__request__(@list_operation, [], params, opts))

  @retrieve_operation %{
    id: "FetchAvailablePhoneNumberCountry",
    method: :get,
    path: "/2010-04-01/Accounts/{AccountSid}/AvailablePhoneNumbers/{CountryCode}.json",
    path_params: ["CountryCode"],
    client_path_params: [{"AccountSid", :account_sid}],
    params: [],
    response: {:ref, Twilio.Schemas.AvailablePhoneNumberCountry}
  }

  @doc """
  `GET /2010-04-01/Accounts/{AccountSid}/AvailablePhoneNumbers/{CountryCode}.json`

  ## Path parameters

    * `country_code` (required) - The [ISO-3166-1](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2) country code of the country to fetch available phone number information about.

  `{AccountSid}` in the path is the `:account_sid` setting; pass `account_sid: "..."` as an option to use another.
  """
  @spec retrieve(String.t(), keyword()) ::
          {:ok, Twilio.Schemas.AvailablePhoneNumberCountry.t()}
          | {:error, Infusion.Runtime.Error.t()}
  def retrieve(country_code, opts \\ []),
    do: Twilio.__request__(@retrieve_operation, [country_code], %{}, opts)

  @doc "Like `retrieve/2`, but returns the result or raises `Infusion.Runtime.Error`."
  @spec retrieve!(String.t(), keyword()) :: Twilio.Schemas.AvailablePhoneNumberCountry.t()
  def retrieve!(country_code, opts \\ []),
    do:
      Infusion.Runtime.Request.unwrap!(
        Twilio.__request__(@retrieve_operation, [country_code], %{}, opts)
      )
end
