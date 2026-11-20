defmodule Twilio.Applications do
  @moduledoc """
  API calls: `create`, `delete`, `list`, `retrieve`, `update`.
  """

  @create_operation %{
    id: "CreateApplication",
    method: :post,
    path: "/2010-04-01/Accounts/{AccountSid}/Applications.json",
    path_params: [],
    client_path_params: [{"AccountSid", :account_sid}],
    params: [
      {:api_version, "ApiVersion", :body},
      {:friendly_name, "FriendlyName", :body},
      {:message_status_callback, "MessageStatusCallback", :body},
      {:public_application_connect_enabled, "PublicApplicationConnectEnabled", :body},
      {:sms_fallback_method, "SmsFallbackMethod", :body},
      {:sms_fallback_url, "SmsFallbackUrl", :body},
      {:sms_method, "SmsMethod", :body},
      {:sms_status_callback, "SmsStatusCallback", :body},
      {:sms_url, "SmsUrl", :body},
      {:status_callback, "StatusCallback", :body},
      {:status_callback_method, "StatusCallbackMethod", :body},
      {:voice_caller_id_lookup, "VoiceCallerIdLookup", :body},
      {:voice_fallback_method, "VoiceFallbackMethod", :body},
      {:voice_fallback_url, "VoiceFallbackUrl", :body},
      {:voice_method, "VoiceMethod", :body},
      {:voice_url, "VoiceUrl", :body}
    ],
    body: :form,
    response: {:ref, Twilio.Schemas.Application}
  }

  @doc """
  Create a new application within your account

  `POST /2010-04-01/Accounts/{AccountSid}/Applications.json`

  `{AccountSid}` in the path is the `:account_sid` setting; pass `account_sid: "..."` as an option to use another.

  ## Parameters

    * `api_version` - The API version to use to start a new TwiML session. Can be: `2010-04-01` or `2008-08-01`. The default value is the account's default API version.
    * `friendly_name` - A descriptive string that you create to describe the new application. It can be up to 64 characters long.
    * `message_status_callback` - The URL we should call using a POST method to send message status information to your application.
    * `public_application_connect_enabled` - Whether to allow other Twilio accounts to dial this applicaton using Dial verb. Can be: `true` or `false`.
    * `sms_fallback_method` - The HTTP method we should use to call `sms_fallback_url`. Can be: `GET` or `POST`.
    * `sms_fallback_url` - The URL that we should call when an error occurs while retrieving or executing the TwiML from `sms_url`.
    * `sms_method` - The HTTP method we should use to call `sms_url`. Can be: `GET` or `POST`.
    * `sms_status_callback` - The URL we should call using a POST method to send status information about SMS messages sent by the application.
    * `sms_url` - The URL we should call when the phone number receives an incoming SMS message.
    * `status_callback` - The URL we should call using the `status_callback_method` to send status information to your application.
    * `status_callback_method` - The HTTP method we should use to call `status_callback`. Can be: `GET` or `POST`.
    * `voice_caller_id_lookup` - Whether we should look up the caller's caller-ID name from the CNAM database (additional charges apply). Can be: `true` or `false`.
    * `voice_fallback_method` - The HTTP method we should use to call `voice_fallback_url`. Can be: `GET` or `POST`.
    * `voice_fallback_url` - The URL that we should call when an error occurs retrieving or executing the TwiML requested by `url`.
    * `voice_method` - The HTTP method we should use to call `voice_url`. Can be: `GET` or `POST`.
    * `voice_url` - The URL we should call when the phone number assigned to this application receives a call.
  """
  @spec create(map() | keyword(), keyword()) ::
          {:ok, Twilio.Schemas.Application.t()} | {:error, Infusion.Runtime.Error.t()}
  def create(params \\ %{}, opts \\ []),
    do: Twilio.__request__(@create_operation, [], params, opts)

  @doc "Like `create/2`, but returns the result or raises `Infusion.Runtime.Error`."
  @spec create!(map() | keyword(), keyword()) :: Twilio.Schemas.Application.t()
  def create!(params \\ %{}, opts \\ []),
    do: Infusion.Runtime.Request.unwrap!(Twilio.__request__(@create_operation, [], params, opts))

  @delete_operation %{
    id: "DeleteApplication",
    method: :delete,
    path: "/2010-04-01/Accounts/{AccountSid}/Applications/{Sid}.json",
    path_params: ["Sid"],
    client_path_params: [{"AccountSid", :account_sid}],
    params: [],
    response: nil
  }

  @doc """
  Delete the application by the specified application sid

  `DELETE /2010-04-01/Accounts/{AccountSid}/Applications/{Sid}.json`

  ## Path parameters

    * `sid` (required) - The Twilio-provided string that uniquely identifies the Application resource to delete.

  `{AccountSid}` in the path is the `:account_sid` setting; pass `account_sid: "..."` as an option to use another.
  """
  @spec delete(String.t(), keyword()) :: {:ok, nil} | {:error, Infusion.Runtime.Error.t()}
  def delete(sid, opts \\ []), do: Twilio.__request__(@delete_operation, [sid], %{}, opts)

  @doc "Like `delete/2`, but returns the result or raises `Infusion.Runtime.Error`."
  @spec delete!(String.t(), keyword()) :: nil
  def delete!(sid, opts \\ []),
    do: Infusion.Runtime.Request.unwrap!(Twilio.__request__(@delete_operation, [sid], %{}, opts))

  @list_operation %{
    id: "ListApplication",
    method: :get,
    path: "/2010-04-01/Accounts/{AccountSid}/Applications.json",
    path_params: [],
    client_path_params: [{"AccountSid", :account_sid}],
    params: [
      {:friendly_name, "FriendlyName", :query},
      {:page_size, "PageSize", :query},
      {:page, "Page", :query},
      {:page_token, "PageToken", :query}
    ],
    response: {:ref, Twilio.Schemas.ApplicationsListResponse},
    paginate: %{
      from: ["next_page_uri"],
      id: "sid",
      items: ["applications"],
      style: :next_url,
      item: {:ref, Twilio.Schemas.Application}
    }
  }

  @doc """
  Retrieve a list of applications representing an application within the requesting account

  `GET /2010-04-01/Accounts/{AccountSid}/Applications.json`

  `{AccountSid}` in the path is the `:account_sid` setting; pass `account_sid: "..."` as an option to use another.

  ## Parameters

    * `friendly_name` - The string that identifies the Application resources to read.
    * `page_size` - How many resources to return in each list page. The default is 50, and the maximum is 1000.
    * `page` - The page index. This value is simply for client state.
    * `page_token` - The page token. This is provided by the API.

  To read every item across all pages, use `list_all`.
  """
  @spec list(map() | keyword(), keyword()) ::
          {:ok, Twilio.Schemas.ApplicationsListResponse.t()}
          | {:error, Infusion.Runtime.Error.t()}
  def list(params \\ %{}, opts \\ []), do: Twilio.__request__(@list_operation, [], params, opts)

  @doc "Like `list/2`, but returns the result or raises `Infusion.Runtime.Error`."
  @spec list!(map() | keyword(), keyword()) :: Twilio.Schemas.ApplicationsListResponse.t()
  def list!(params \\ %{}, opts \\ []),
    do: Infusion.Runtime.Request.unwrap!(Twilio.__request__(@list_operation, [], params, opts))

  @doc """
  Like `list/2`, but returns every item, from every page: a lazy stream of `Twilio.Schemas.Application.t()` that fetches pages as it is read.

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
  Watches this list and sends what changes: starts a process, linked to the caller, that polls it (with `ETag`s, so unchanged pages cost a `304`) and sends `{:infusion_watch, pid, %Infusion.Runtime.Watch.Event{}}` for every Twilio.Schemas.Application.t() created, updated, deleted, or that moved into view (`:entered`).

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

  @retrieve_operation %{
    id: "FetchApplication",
    method: :get,
    path: "/2010-04-01/Accounts/{AccountSid}/Applications/{Sid}.json",
    path_params: ["Sid"],
    client_path_params: [{"AccountSid", :account_sid}],
    params: [],
    response: {:ref, Twilio.Schemas.Application}
  }

  @doc """
  Fetch the application specified by the provided sid

  `GET /2010-04-01/Accounts/{AccountSid}/Applications/{Sid}.json`

  ## Path parameters

    * `sid` (required) - The Twilio-provided string that uniquely identifies the Application resource to fetch.

  `{AccountSid}` in the path is the `:account_sid` setting; pass `account_sid: "..."` as an option to use another.
  """
  @spec retrieve(String.t(), keyword()) ::
          {:ok, Twilio.Schemas.Application.t()} | {:error, Infusion.Runtime.Error.t()}
  def retrieve(sid, opts \\ []), do: Twilio.__request__(@retrieve_operation, [sid], %{}, opts)

  @doc "Like `retrieve/2`, but returns the result or raises `Infusion.Runtime.Error`."
  @spec retrieve!(String.t(), keyword()) :: Twilio.Schemas.Application.t()
  def retrieve!(sid, opts \\ []),
    do:
      Infusion.Runtime.Request.unwrap!(Twilio.__request__(@retrieve_operation, [sid], %{}, opts))

  @update_operation %{
    id: "UpdateApplication",
    method: :post,
    path: "/2010-04-01/Accounts/{AccountSid}/Applications/{Sid}.json",
    path_params: ["Sid"],
    client_path_params: [{"AccountSid", :account_sid}],
    params: [
      {:api_version, "ApiVersion", :body},
      {:friendly_name, "FriendlyName", :body},
      {:message_status_callback, "MessageStatusCallback", :body},
      {:public_application_connect_enabled, "PublicApplicationConnectEnabled", :body},
      {:sms_fallback_method, "SmsFallbackMethod", :body},
      {:sms_fallback_url, "SmsFallbackUrl", :body},
      {:sms_method, "SmsMethod", :body},
      {:sms_status_callback, "SmsStatusCallback", :body},
      {:sms_url, "SmsUrl", :body},
      {:status_callback, "StatusCallback", :body},
      {:status_callback_method, "StatusCallbackMethod", :body},
      {:voice_caller_id_lookup, "VoiceCallerIdLookup", :body},
      {:voice_fallback_method, "VoiceFallbackMethod", :body},
      {:voice_fallback_url, "VoiceFallbackUrl", :body},
      {:voice_method, "VoiceMethod", :body},
      {:voice_url, "VoiceUrl", :body}
    ],
    body: :form,
    response: {:ref, Twilio.Schemas.Application}
  }

  @doc """
  Updates the application's properties

  `POST /2010-04-01/Accounts/{AccountSid}/Applications/{Sid}.json`

  ## Path parameters

    * `sid` (required) - The Twilio-provided string that uniquely identifies the Application resource to update.

  `{AccountSid}` in the path is the `:account_sid` setting; pass `account_sid: "..."` as an option to use another.

  ## Parameters

    * `api_version` - The API version to use to start a new TwiML session. Can be: `2010-04-01` or `2008-08-01`. The default value is your account's default API version.
    * `friendly_name` - A descriptive string that you create to describe the resource. It can be up to 64 characters long.
    * `message_status_callback` - The URL we should call using a POST method to send message status information to your application.
    * `public_application_connect_enabled` - Whether to allow other Twilio accounts to dial this applicaton using Dial verb. Can be: `true` or `false`.
    * `sms_fallback_method` - The HTTP method we should use to call `sms_fallback_url`. Can be: `GET` or `POST`.
    * `sms_fallback_url` - The URL that we should call when an error occurs while retrieving or executing the TwiML from `sms_url`.
    * `sms_method` - The HTTP method we should use to call `sms_url`. Can be: `GET` or `POST`.
    * `sms_status_callback` - Same as message_status_callback: The URL we should call using a POST method to send status information about SMS messages sent by the application. Deprecated, included for backwards compatibility.
    * `sms_url` - The URL we should call when the phone number receives an incoming SMS message.
    * `status_callback` - The URL we should call using the `status_callback_method` to send status information to your application.
    * `status_callback_method` - The HTTP method we should use to call `status_callback`. Can be: `GET` or `POST`.
    * `voice_caller_id_lookup` - Whether we should look up the caller's caller-ID name from the CNAM database (additional charges apply). Can be: `true` or `false`.
    * `voice_fallback_method` - The HTTP method we should use to call `voice_fallback_url`. Can be: `GET` or `POST`.
    * `voice_fallback_url` - The URL that we should call when an error occurs retrieving or executing the TwiML requested by `url`.
    * `voice_method` - The HTTP method we should use to call `voice_url`. Can be: `GET` or `POST`.
    * `voice_url` - The URL we should call when the phone number assigned to this application receives a call.
  """
  @spec update(String.t(), map() | keyword(), keyword()) ::
          {:ok, Twilio.Schemas.Application.t()} | {:error, Infusion.Runtime.Error.t()}
  def update(sid, params \\ %{}, opts \\ []),
    do: Twilio.__request__(@update_operation, [sid], params, opts)

  @doc "Like `update/3`, but returns the result or raises `Infusion.Runtime.Error`."
  @spec update!(String.t(), map() | keyword(), keyword()) :: Twilio.Schemas.Application.t()
  def update!(sid, params \\ %{}, opts \\ []),
    do:
      Infusion.Runtime.Request.unwrap!(Twilio.__request__(@update_operation, [sid], params, opts))
end
