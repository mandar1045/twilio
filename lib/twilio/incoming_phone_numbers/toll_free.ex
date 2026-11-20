defmodule Twilio.IncomingPhoneNumbers.TollFree do
  @moduledoc """
  API calls: `create`, `list`.
  """

  @create_operation %{
    id: "CreateIncomingPhoneNumberTollFree",
    method: :post,
    path: "/2010-04-01/Accounts/{AccountSid}/IncomingPhoneNumbers/TollFree.json",
    path_params: [],
    client_path_params: [{"AccountSid", :account_sid}],
    params: [
      {:address_sid, "AddressSid", :body},
      {:api_version, "ApiVersion", :body},
      {:bundle_sid, "BundleSid", :body},
      {:emergency_address_sid, "EmergencyAddressSid", :body},
      {:emergency_status, "EmergencyStatus", :body},
      {:friendly_name, "FriendlyName", :body},
      {:identity_sid, "IdentitySid", :body},
      {:phone_number, "PhoneNumber", :body},
      {:sms_application_sid, "SmsApplicationSid", :body},
      {:sms_fallback_method, "SmsFallbackMethod", :body},
      {:sms_fallback_url, "SmsFallbackUrl", :body},
      {:sms_method, "SmsMethod", :body},
      {:sms_url, "SmsUrl", :body},
      {:status_callback, "StatusCallback", :body},
      {:status_callback_method, "StatusCallbackMethod", :body},
      {:trunk_sid, "TrunkSid", :body},
      {:voice_application_sid, "VoiceApplicationSid", :body},
      {:voice_caller_id_lookup, "VoiceCallerIdLookup", :body},
      {:voice_fallback_method, "VoiceFallbackMethod", :body},
      {:voice_fallback_url, "VoiceFallbackUrl", :body},
      {:voice_method, "VoiceMethod", :body},
      {:voice_receive_mode, "VoiceReceiveMode", :body},
      {:voice_url, "VoiceUrl", :body}
    ],
    body: :form,
    response: {:ref, Twilio.Schemas.IncomingPhoneNumberTollFree}
  }

  @doc """
  `POST /2010-04-01/Accounts/{AccountSid}/IncomingPhoneNumbers/TollFree.json`

  `{AccountSid}` in the path is the `:account_sid` setting; pass `account_sid: "..."` as an option to use another.

  ## Parameters

    * `address_sid` - The SID of the Address resource we should associate with the new phone number. Some regions require addresses to meet local regulations.
    * `api_version` - The API version to use for incoming calls made to the new phone number. The default is `2010-04-01`.
    * `bundle_sid` - The SID of the Bundle resource that you associate with the phone number. Some regions require a Bundle to meet local Regulations.
    * `emergency_address_sid` - The SID of the emergency address configuration to use for emergency calling from the new phone number.
    * `emergency_status`
    * `friendly_name` - A descriptive string that you created to describe the new phone number. It can be up to 64 characters long. By default, this is a formatted version of the phone number.
    * `identity_sid` - The SID of the Identity resource that we should associate with the new phone number. Some regions require an Identity to meet local regulations.
    * `phone_number` (required) - The phone number to purchase specified in [E.164](https://www.twilio.com/docs/glossary/what-e164) format. E.164 phone numbers consist of a + followed by the country code and subscriber number without punctuation characters. For example, +14155551234.
    * `sms_application_sid` - The SID of the application that should handle SMS messages sent to the new phone number. If an `sms_application_sid` is present, we ignore all `sms_*_url` values and use those of the application.
    * `sms_fallback_method` - The HTTP method that we should use to call `sms_fallback_url`. Can be: `GET` or `POST` and defaults to `POST`.
    * `sms_fallback_url` - The URL that we should call when an error occurs while requesting or executing the TwiML defined by `sms_url`.
    * `sms_method` - The HTTP method that we should use to call `sms_url`. Can be: `GET` or `POST` and defaults to `POST`.
    * `sms_url` - The URL we should call when the new phone number receives an incoming SMS message.
    * `status_callback` - The URL we should call using the `status_callback_method` to send status information to your application.
    * `status_callback_method` - The HTTP method we should use to call `status_callback`. Can be: `GET` or `POST` and defaults to `POST`.
    * `trunk_sid` - The SID of the Trunk we should use to handle calls to the new phone number. If a `trunk_sid` is present, we ignore all of the voice urls and voice applications and use only those set on the Trunk. Setting a `trunk_sid` will automatically delete your `voice_application_sid` and vice versa.
    * `voice_application_sid` - The SID of the application we should use to handle calls to the new phone number. If a `voice_application_sid` is present, we ignore all of the voice urls and use those set on the application. Setting a `voice_application_sid` will automatically delete your `trunk_sid` and vice versa.
    * `voice_caller_id_lookup` - Whether to lookup the caller's name from the CNAM database and post it to your app. Can be: `true` or `false` and defaults to `false`.
    * `voice_fallback_method` - The HTTP method that we should use to call `voice_fallback_url`. Can be: `GET` or `POST` and defaults to `POST`.
    * `voice_fallback_url` - The URL that we should call when an error occurs retrieving or executing the TwiML requested by `url`.
    * `voice_method` - The HTTP method that we should use to call `voice_url`. Can be: `GET` or `POST` and defaults to `POST`.
    * `voice_receive_mode`
    * `voice_url` - The URL that we should call to answer a call to the new phone number. The `voice_url` will not be called if a `voice_application_sid` or a `trunk_sid` is set.
  """
  @spec create(map() | keyword(), keyword()) ::
          {:ok, Twilio.Schemas.IncomingPhoneNumberTollFree.t()}
          | {:error, Infusion.Runtime.Error.t()}
  def create(params \\ %{}, opts \\ []),
    do: Twilio.__request__(@create_operation, [], params, opts)

  @doc "Like `create/2`, but returns the result or raises `Infusion.Runtime.Error`."
  @spec create!(map() | keyword(), keyword()) :: Twilio.Schemas.IncomingPhoneNumberTollFree.t()
  def create!(params \\ %{}, opts \\ []),
    do: Infusion.Runtime.Request.unwrap!(Twilio.__request__(@create_operation, [], params, opts))

  @list_operation %{
    id: "ListIncomingPhoneNumberTollFree",
    method: :get,
    path: "/2010-04-01/Accounts/{AccountSid}/IncomingPhoneNumbers/TollFree.json",
    path_params: [],
    client_path_params: [{"AccountSid", :account_sid}],
    params: [
      {:beta, "Beta", :query},
      {:friendly_name, "FriendlyName", :query},
      {:phone_number, "PhoneNumber", :query},
      {:origin, "Origin", :query},
      {:page_size, "PageSize", :query},
      {:page, "Page", :query},
      {:page_token, "PageToken", :query}
    ],
    response: {:ref, Twilio.Schemas.IncomingPhoneNumbersTollFreeListResponse},
    paginate: %{
      from: ["next_page_uri"],
      id: "sid",
      items: ["incoming_phone_numbers"],
      style: :next_url,
      item: {:ref, Twilio.Schemas.IncomingPhoneNumberTollFree}
    }
  }

  @doc """
  `GET /2010-04-01/Accounts/{AccountSid}/IncomingPhoneNumbers/TollFree.json`

  `{AccountSid}` in the path is the `:account_sid` setting; pass `account_sid: "..."` as an option to use another.

  ## Parameters

    * `beta` - Whether to include phone numbers new to the Twilio platform. Can be: `true` or `false` and the default is `true`.
    * `friendly_name` - A string that identifies the resources to read.
    * `phone_number` - The phone numbers of the IncomingPhoneNumber resources to read. You can specify partial numbers and use '*' as a wildcard for any digit.
    * `origin` - Whether to include phone numbers based on their origin. Can be: `twilio` or `hosted`. By default, phone numbers of all origin are included.
    * `page_size` - How many resources to return in each list page. The default is 50, and the maximum is 1000.
    * `page` - The page index. This value is simply for client state.
    * `page_token` - The page token. This is provided by the API.

  To read every item across all pages, use `list_all`.
  """
  @spec list(map() | keyword(), keyword()) ::
          {:ok, Twilio.Schemas.IncomingPhoneNumbersTollFreeListResponse.t()}
          | {:error, Infusion.Runtime.Error.t()}
  def list(params \\ %{}, opts \\ []), do: Twilio.__request__(@list_operation, [], params, opts)

  @doc "Like `list/2`, but returns the result or raises `Infusion.Runtime.Error`."
  @spec list!(map() | keyword(), keyword()) ::
          Twilio.Schemas.IncomingPhoneNumbersTollFreeListResponse.t()
  def list!(params \\ %{}, opts \\ []),
    do: Infusion.Runtime.Request.unwrap!(Twilio.__request__(@list_operation, [], params, opts))

  @doc """
  Like `list/2`, but returns every item, from every page: a lazy stream of `Twilio.Schemas.IncomingPhoneNumberTollFree.t()` that fetches pages as it is read.

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

  @doc """
  Watches this list and sends what changes: starts a process, linked to the caller, that polls it (with `ETag`s, so unchanged pages cost a `304`) and sends `{:infusion_watch, pid, %Infusion.Runtime.Watch.Event{}}` for every Twilio.Schemas.IncomingPhoneNumberTollFree.t() created, updated, deleted, or that moved into view (`:entered`).

  Options: `every:` (milliseconds, default 30 seconds), `to:` (a pid, `{:pubsub, MyApp.PubSub, topic}` or a function), `pages:`, `initial:`, `ignore:`, plus any setting of `Infusion.Runtime.Config`. See `Infusion.Runtime.Watch`.
  """
  @spec list_watch(map() | keyword(), keyword()) ::
          {:ok, pid()} | {:error, Infusion.Runtime.Error.t()}
  def list_watch(params \\ %{}, opts \\ []),
    do: Twilio.__watch__(@list_operation, [], params, opts)

  @doc "Like `list_watch/2`, but returns the stream or raises `Infusion.Runtime.Error`."
  @spec list_watch!(map() | keyword(), keyword()) :: pid()
  def list_watch!(params \\ %{}, opts \\ []),
    do: Infusion.Runtime.Request.unwrap!(Twilio.__watch__(@list_operation, [], params, opts))
end
