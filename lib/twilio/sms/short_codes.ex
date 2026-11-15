defmodule Twilio.Sms.ShortCodes do
  @moduledoc """
  API calls: `list`, `retrieve`, `update`.
  """

  @list_operation %{
    id: "ListShortCode",
    method: :get,
    path: "/2010-04-01/Accounts/{AccountSid}/SMS/ShortCodes.json",
    path_params: [],
    client_path_params: [{"AccountSid", :account_sid}],
    params: [
      {:friendly_name, "FriendlyName", :query},
      {:short_code, "ShortCode", :query},
      {:page_size, "PageSize", :query},
      {:page, "Page", :query},
      {:page_token, "PageToken", :query}
    ],
    response: {:ref, Twilio.Schemas.SmsShortCodesListResponse},
    paginate: %{
      from: ["next_page_uri"],
      items: ["short_codes"],
      style: :next_url,
      item: {:ref, Twilio.Schemas.ShortCode}
    }
  }

  @doc """
  Retrieve a list of short-codes belonging to the account used to make the request

  `GET /2010-04-01/Accounts/{AccountSid}/SMS/ShortCodes.json`

  `{AccountSid}` in the path is the `:account_sid` setting; pass `account_sid: "..."` as an option to use another.

  ## Parameters

    * `friendly_name` - The string that identifies the ShortCode resources to read.
    * `short_code` - Only show the ShortCode resources that match this pattern. You can specify partial numbers and use '*' as a wildcard for any digit.
    * `page_size` - How many resources to return in each list page. The default is 50, and the maximum is 1000.
    * `page` - The page index. This value is simply for client state.
    * `page_token` - The page token. This is provided by the API.

  To read every item across all pages, use `list_all`.
  """
  @spec list(map() | keyword(), keyword()) ::
          {:ok, Twilio.Schemas.SmsShortCodesListResponse.t()}
          | {:error, Infusion.Runtime.Error.t()}
  def list(params \\ %{}, opts \\ []), do: Twilio.__request__(@list_operation, [], params, opts)

  @doc "Like `list/2`, but returns the result or raises `Infusion.Runtime.Error`."
  @spec list!(map() | keyword(), keyword()) :: Twilio.Schemas.SmsShortCodesListResponse.t()
  def list!(params \\ %{}, opts \\ []),
    do: Infusion.Runtime.Request.unwrap!(Twilio.__request__(@list_operation, [], params, opts))

  @doc """
  Like `list/2`, but returns every item, from every page: a lazy stream of `Twilio.Schemas.ShortCode.t()` that fetches pages as it is read.

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
    id: "FetchShortCode",
    method: :get,
    path: "/2010-04-01/Accounts/{AccountSid}/SMS/ShortCodes/{Sid}.json",
    path_params: ["Sid"],
    client_path_params: [{"AccountSid", :account_sid}],
    params: [],
    response: {:ref, Twilio.Schemas.ShortCode}
  }

  @doc """
  Fetch an instance of a short code

  `GET /2010-04-01/Accounts/{AccountSid}/SMS/ShortCodes/{Sid}.json`

  ## Path parameters

    * `sid` (required) - The Twilio-provided string that uniquely identifies the ShortCode resource to fetch

  `{AccountSid}` in the path is the `:account_sid` setting; pass `account_sid: "..."` as an option to use another.
  """
  @spec retrieve(String.t(), keyword()) ::
          {:ok, Twilio.Schemas.ShortCode.t()} | {:error, Infusion.Runtime.Error.t()}
  def retrieve(sid, opts \\ []), do: Twilio.__request__(@retrieve_operation, [sid], %{}, opts)

  @doc "Like `retrieve/2`, but returns the result or raises `Infusion.Runtime.Error`."
  @spec retrieve!(String.t(), keyword()) :: Twilio.Schemas.ShortCode.t()
  def retrieve!(sid, opts \\ []),
    do:
      Infusion.Runtime.Request.unwrap!(Twilio.__request__(@retrieve_operation, [sid], %{}, opts))

  @update_operation %{
    id: "UpdateShortCode",
    method: :post,
    path: "/2010-04-01/Accounts/{AccountSid}/SMS/ShortCodes/{Sid}.json",
    path_params: ["Sid"],
    client_path_params: [{"AccountSid", :account_sid}],
    params: [
      {:api_version, "ApiVersion", :body},
      {:friendly_name, "FriendlyName", :body},
      {:sms_fallback_method, "SmsFallbackMethod", :body},
      {:sms_fallback_url, "SmsFallbackUrl", :body},
      {:sms_method, "SmsMethod", :body},
      {:sms_url, "SmsUrl", :body}
    ],
    body: :form,
    response: {:ref, Twilio.Schemas.ShortCode}
  }

  @doc """
  Update a short code with the following parameters

  `POST /2010-04-01/Accounts/{AccountSid}/SMS/ShortCodes/{Sid}.json`

  ## Path parameters

    * `sid` (required) - The Twilio-provided string that uniquely identifies the ShortCode resource to update

  `{AccountSid}` in the path is the `:account_sid` setting; pass `account_sid: "..."` as an option to use another.

  ## Parameters

    * `api_version` - The API version to use to start a new TwiML session. Can be: `2010-04-01` or `2008-08-01`.
    * `friendly_name` - A descriptive string that you created to describe this resource. It can be up to 64 characters long. By default, the `FriendlyName` is the short code.
    * `sms_fallback_method` - The HTTP method that we should use to call the `sms_fallback_url`. Can be: `GET` or `POST`.
    * `sms_fallback_url` - The URL that we should call if an error occurs while retrieving or executing the TwiML from `sms_url`.
    * `sms_method` - The HTTP method we should use when calling the `sms_url`. Can be: `GET` or `POST`.
    * `sms_url` - The URL we should call when receiving an incoming SMS message to this short code.
  """
  @spec update(String.t(), map() | keyword(), keyword()) ::
          {:ok, Twilio.Schemas.ShortCode.t()} | {:error, Infusion.Runtime.Error.t()}
  def update(sid, params \\ %{}, opts \\ []),
    do: Twilio.__request__(@update_operation, [sid], params, opts)

  @doc "Like `update/3`, but returns the result or raises `Infusion.Runtime.Error`."
  @spec update!(String.t(), map() | keyword(), keyword()) :: Twilio.Schemas.ShortCode.t()
  def update!(sid, params \\ %{}, opts \\ []),
    do:
      Infusion.Runtime.Request.unwrap!(Twilio.__request__(@update_operation, [sid], params, opts))
end
