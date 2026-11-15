defmodule Twilio.AvailablePhoneNumbers.Local do
  @moduledoc """
  API calls: `list`.
  """

  @list_operation %{
    id: "ListAvailablePhoneNumberLocal",
    method: :get,
    path: "/2010-04-01/Accounts/{AccountSid}/AvailablePhoneNumbers/{CountryCode}/Local.json",
    path_params: ["CountryCode"],
    client_path_params: [{"AccountSid", :account_sid}],
    params: [
      {:area_code, "AreaCode", :query},
      {:contains, "Contains", :query},
      {:sms_enabled, "SmsEnabled", :query},
      {:mms_enabled, "MmsEnabled", :query},
      {:voice_enabled, "VoiceEnabled", :query},
      {:exclude_all_address_required, "ExcludeAllAddressRequired", :query},
      {:exclude_local_address_required, "ExcludeLocalAddressRequired", :query},
      {:exclude_foreign_address_required, "ExcludeForeignAddressRequired", :query},
      {:beta, "Beta", :query},
      {:near_number, "NearNumber", :query},
      {:near_lat_long, "NearLatLong", :query},
      {:distance, "Distance", :query},
      {:in_postal_code, "InPostalCode", :query},
      {:in_region, "InRegion", :query},
      {:in_rate_center, "InRateCenter", :query},
      {:in_lata, "InLata", :query},
      {:in_locality, "InLocality", :query},
      {:fax_enabled, "FaxEnabled", :query},
      {:page_size, "PageSize", :query},
      {:page, "Page", :query},
      {:page_token, "PageToken", :query}
    ],
    response: {:ref, Twilio.Schemas.AvailablePhoneNumbersLocalListResponse},
    paginate: %{
      from: ["next_page_uri"],
      items: ["available_phone_numbers"],
      style: :next_url,
      item: {:ref, Twilio.Schemas.AvailablePhoneNumberLocal}
    }
  }

  @doc """
  `GET /2010-04-01/Accounts/{AccountSid}/AvailablePhoneNumbers/{CountryCode}/Local.json`

  ## Path parameters

    * `country_code` (required) - The [ISO-3166-1](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2) country code of the country from which to read phone numbers.

  `{AccountSid}` in the path is the `:account_sid` setting; pass `account_sid: "..."` as an option to use another.

  ## Parameters

    * `area_code` - The area code of the phone numbers to read. Applies to only phone numbers in the US and Canada.
    * `contains` - Matching pattern to identify phone numbers. This pattern can be between 2 and 16 characters long and allows all digits (0-9) and all non-diacritic latin alphabet letters (a-z, A-Z). It accepts four meta-characters: `*`, `%`, `+`, `$`. The `*` and `%` meta-characters can appear multiple times in the pattern. To match wildcards at the beginning or end of the pattern, use `*` to match any single character or `%` to match a sequence of characters. If you use the wildcard patterns, it must include at least two non-meta-characters, and wildcards cannot be used between non-meta-characters. To match the beginning of a pattern, start the pattern with `+`. To match the end of the pattern, append the pattern with `$`. These meta-characters can't be adjacent to each other.
    * `sms_enabled` - Whether the phone numbers can receive text messages. Can be: `true` or `false`.
    * `mms_enabled` - Whether the phone numbers can receive MMS messages. Can be: `true` or `false`.
    * `voice_enabled` - Whether the phone numbers can receive calls. Can be: `true` or `false`.
    * `exclude_all_address_required` - Whether to exclude phone numbers that require an [Address](https://www.twilio.com/docs/usage/api/address). Can be: `true` or `false` and the default is `false`.
    * `exclude_local_address_required` - Whether to exclude phone numbers that require a local [Address](https://www.twilio.com/docs/usage/api/address). Can be: `true` or `false` and the default is `false`.
    * `exclude_foreign_address_required` - Whether to exclude phone numbers that require a foreign [Address](https://www.twilio.com/docs/usage/api/address). Can be: `true` or `false` and the default is `false`.
    * `beta` - Whether to read phone numbers that are new to the Twilio platform. Can be: `true` or `false` and the default is `true`.
    * `near_number` - Given a phone number, find a geographically close number within `distance` miles. Distance defaults to 25 miles. Applies to only phone numbers in the US and Canada.
    * `near_lat_long` - Given a latitude/longitude pair `lat,long` find geographically close numbers within `distance` miles. Applies to only phone numbers in the US and Canada.
    * `distance` - The search radius, in miles, for a `near_` query. Can be up to `500` and the default is `25`. Applies to only phone numbers in the US and Canada.
    * `in_postal_code` - Limit results to a particular postal code. Given a phone number, search within the same postal code as that number. Applies to only phone numbers in the US and Canada.
    * `in_region` - Limit results to a particular region, state, or province. Given a phone number, search within the same region as that number. Applies to only phone numbers in the US and Canada.
    * `in_rate_center` - Limit results to a specific rate center, or given a phone number search within the same rate center as that number. Requires `in_lata` to be set as well. Applies to only phone numbers in the US and Canada.
    * `in_lata` - Limit results to a specific local access and transport area ([LATA](https://en.wikipedia.org/wiki/Local_access_and_transport_area)). Given a phone number, search within the same [LATA](https://en.wikipedia.org/wiki/Local_access_and_transport_area) as that number. Applies to only phone numbers in the US and Canada.
    * `in_locality` - Limit results to a particular locality or city. Given a phone number, search within the same Locality as that number.
    * `fax_enabled` - Whether the phone numbers can receive faxes. Can be: `true` or `false`.
    * `page_size` - How many resources to return in each list page. The default is 50, and the maximum is 1000.
    * `page` - The page index. This value is simply for client state.
    * `page_token` - The page token. This is provided by the API.

  To read every item across all pages, use `list_all`.
  """
  @spec list(String.t(), map() | keyword(), keyword()) ::
          {:ok, Twilio.Schemas.AvailablePhoneNumbersLocalListResponse.t()}
          | {:error, Infusion.Runtime.Error.t()}
  def list(country_code, params \\ %{}, opts \\ []),
    do: Twilio.__request__(@list_operation, [country_code], params, opts)

  @doc "Like `list/3`, but returns the result or raises `Infusion.Runtime.Error`."
  @spec list!(String.t(), map() | keyword(), keyword()) ::
          Twilio.Schemas.AvailablePhoneNumbersLocalListResponse.t()
  def list!(country_code, params \\ %{}, opts \\ []),
    do:
      Infusion.Runtime.Request.unwrap!(
        Twilio.__request__(@list_operation, [country_code], params, opts)
      )

  @doc """
  Like `list/3`, but returns every item, from every page: a lazy stream of `Twilio.Schemas.AvailablePhoneNumberLocal.t()` that fetches pages as it is read.

  The first page is fetched right away, so its errors are returned; a later page that fails raises `Infusion.Runtime.Error`. Stopping early (`Enum.take/2`) fetches no more pages.
  """
  @spec list_all(String.t(), map() | keyword(), keyword()) ::
          {:ok, Enumerable.t()} | {:error, Infusion.Runtime.Error.t()}
  def list_all(country_code, params \\ %{}, opts \\ []),
    do: Twilio.__paginate__(@list_operation, [country_code], params, opts)

  @doc "Like `list_all/3`, but returns the stream or raises `Infusion.Runtime.Error`."
  @spec list_all!(String.t(), map() | keyword(), keyword()) :: Enumerable.t()
  def list_all!(country_code, params \\ %{}, opts \\ []),
    do:
      Infusion.Runtime.Request.unwrap!(
        Twilio.__paginate__(@list_operation, [country_code], params, opts)
      )
end
