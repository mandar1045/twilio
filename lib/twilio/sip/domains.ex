defmodule Twilio.Sip.Domains do
  @moduledoc """
  API calls: `create`, `delete`, `list`, `retrieve`, `update`.
  """

  @create_operation %{
    id: "CreateSipDomain",
    method: :post,
    path: "/2010-04-01/Accounts/{AccountSid}/SIP/Domains.json",
    path_params: [],
    client_path_params: [{"AccountSid", :account_sid}],
    params: [
      {:byoc_trunk_sid, "ByocTrunkSid", :body},
      {:domain_name, "DomainName", :body},
      {:emergency_caller_sid, "EmergencyCallerSid", :body},
      {:emergency_calling_enabled, "EmergencyCallingEnabled", :body},
      {:friendly_name, "FriendlyName", :body},
      {:secure, "Secure", :body},
      {:sip_registration, "SipRegistration", :body},
      {:voice_fallback_method, "VoiceFallbackMethod", :body},
      {:voice_fallback_url, "VoiceFallbackUrl", :body},
      {:voice_method, "VoiceMethod", :body},
      {:voice_status_callback_method, "VoiceStatusCallbackMethod", :body},
      {:voice_status_callback_url, "VoiceStatusCallbackUrl", :body},
      {:voice_url, "VoiceUrl", :body}
    ],
    body: :form,
    response: {:ref, Twilio.Schemas.SipDomain}
  }

  @doc """
  Create a new Domain

  `POST /2010-04-01/Accounts/{AccountSid}/SIP/Domains.json`

  `{AccountSid}` in the path is the `:account_sid` setting; pass `account_sid: "..."` as an option to use another.

  ## Parameters

    * `byoc_trunk_sid` - The SID of the BYOC Trunk(Bring Your Own Carrier) resource that the Sip Domain will be associated with.
    * `domain_name` (required) - The unique address you reserve on Twilio to which you route your SIP traffic. Domain names can contain letters, digits, and "-" and must end with `sip.twilio.com`.
    * `emergency_caller_sid` - Whether an emergency caller sid is configured for the domain. If present, this phone number will be used as the callback for the emergency call.
    * `emergency_calling_enabled` - Whether emergency calling is enabled for the domain. If enabled, allows emergency calls on the domain from phone numbers with validated addresses.
    * `friendly_name` - A descriptive string that you created to describe the resource. It can be up to 64 characters long.
    * `secure` - Whether secure SIP is enabled for the domain. If enabled, TLS will be enforced and SRTP will be negotiated on all incoming calls to this sip domain.
    * `sip_registration` - Whether to allow SIP Endpoints to register with the domain to receive calls. Can be `true` or `false`. `true` allows SIP Endpoints to register with the domain to receive calls, `false` does not.
    * `voice_fallback_method` - The HTTP method we should use to call `voice_fallback_url`. Can be: `GET` or `POST`.
    * `voice_fallback_url` - The URL that we should call when an error occurs while retrieving or executing the TwiML from `voice_url`.
    * `voice_method` - The HTTP method we should use to call `voice_url`. Can be: `GET` or `POST`.
    * `voice_status_callback_method` - The HTTP method we should use to call `voice_status_callback_url`. Can be: `GET` or `POST`.
    * `voice_status_callback_url` - The URL that we should call to pass status parameters (such as call ended) to your application.
    * `voice_url` - The URL we should when the domain receives a call.
  """
  @spec create(map() | keyword(), keyword()) ::
          {:ok, Twilio.Schemas.SipDomain.t()} | {:error, Infusion.Runtime.Error.t()}
  def create(params \\ %{}, opts \\ []),
    do: Twilio.__request__(@create_operation, [], params, opts)

  @doc "Like `create/2`, but returns the result or raises `Infusion.Runtime.Error`."
  @spec create!(map() | keyword(), keyword()) :: Twilio.Schemas.SipDomain.t()
  def create!(params \\ %{}, opts \\ []),
    do: Infusion.Runtime.Request.unwrap!(Twilio.__request__(@create_operation, [], params, opts))

  @delete_operation %{
    id: "DeleteSipDomain",
    method: :delete,
    path: "/2010-04-01/Accounts/{AccountSid}/SIP/Domains/{Sid}.json",
    path_params: ["Sid"],
    client_path_params: [{"AccountSid", :account_sid}],
    params: [],
    response: nil
  }

  @doc """
  Delete an instance of a Domain

  `DELETE /2010-04-01/Accounts/{AccountSid}/SIP/Domains/{Sid}.json`

  ## Path parameters

    * `sid` (required) - The Twilio-provided string that uniquely identifies the SipDomain resource to delete.

  `{AccountSid}` in the path is the `:account_sid` setting; pass `account_sid: "..."` as an option to use another.
  """
  @spec delete(String.t(), keyword()) :: {:ok, nil} | {:error, Infusion.Runtime.Error.t()}
  def delete(sid, opts \\ []), do: Twilio.__request__(@delete_operation, [sid], %{}, opts)

  @doc "Like `delete/2`, but returns the result or raises `Infusion.Runtime.Error`."
  @spec delete!(String.t(), keyword()) :: nil
  def delete!(sid, opts \\ []),
    do: Infusion.Runtime.Request.unwrap!(Twilio.__request__(@delete_operation, [sid], %{}, opts))

  @list_operation %{
    id: "ListSipDomain",
    method: :get,
    path: "/2010-04-01/Accounts/{AccountSid}/SIP/Domains.json",
    path_params: [],
    client_path_params: [{"AccountSid", :account_sid}],
    params: [
      {:page_size, "PageSize", :query},
      {:page, "Page", :query},
      {:page_token, "PageToken", :query}
    ],
    response: {:ref, Twilio.Schemas.SipDomainsListResponse},
    paginate: %{
      from: ["next_page_uri"],
      id: "sid",
      items: ["domains"],
      style: :next_url,
      item: {:ref, Twilio.Schemas.SipDomain}
    }
  }

  @doc """
  Retrieve a list of domains belonging to the account used to make the request

  `GET /2010-04-01/Accounts/{AccountSid}/SIP/Domains.json`

  `{AccountSid}` in the path is the `:account_sid` setting; pass `account_sid: "..."` as an option to use another.

  ## Parameters

    * `page_size` - How many resources to return in each list page. The default is 50, and the maximum is 1000.
    * `page` - The page index. This value is simply for client state.
    * `page_token` - The page token. This is provided by the API.

  To read every item across all pages, use `list_all`.
  """
  @spec list(map() | keyword(), keyword()) ::
          {:ok, Twilio.Schemas.SipDomainsListResponse.t()} | {:error, Infusion.Runtime.Error.t()}
  def list(params \\ %{}, opts \\ []), do: Twilio.__request__(@list_operation, [], params, opts)

  @doc "Like `list/2`, but returns the result or raises `Infusion.Runtime.Error`."
  @spec list!(map() | keyword(), keyword()) :: Twilio.Schemas.SipDomainsListResponse.t()
  def list!(params \\ %{}, opts \\ []),
    do: Infusion.Runtime.Request.unwrap!(Twilio.__request__(@list_operation, [], params, opts))

  @doc """
  Like `list/2`, but returns every item, from every page: a lazy stream of `Twilio.Schemas.SipDomain.t()` that fetches pages as it is read.

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
  Watches this list and sends what changes: starts a process, linked to the caller, that polls it (with `ETag`s, so unchanged pages cost a `304`) and sends `{:infusion_watch, pid, %Infusion.Runtime.Watch.Event{}}` for every Twilio.Schemas.SipDomain.t() created, updated, deleted, or that moved into view (`:entered`).

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
    id: "FetchSipDomain",
    method: :get,
    path: "/2010-04-01/Accounts/{AccountSid}/SIP/Domains/{Sid}.json",
    path_params: ["Sid"],
    client_path_params: [{"AccountSid", :account_sid}],
    params: [],
    response: {:ref, Twilio.Schemas.SipDomain}
  }

  @doc """
  Fetch an instance of a Domain

  `GET /2010-04-01/Accounts/{AccountSid}/SIP/Domains/{Sid}.json`

  ## Path parameters

    * `sid` (required) - The Twilio-provided string that uniquely identifies the SipDomain resource to fetch.

  `{AccountSid}` in the path is the `:account_sid` setting; pass `account_sid: "..."` as an option to use another.
  """
  @spec retrieve(String.t(), keyword()) ::
          {:ok, Twilio.Schemas.SipDomain.t()} | {:error, Infusion.Runtime.Error.t()}
  def retrieve(sid, opts \\ []), do: Twilio.__request__(@retrieve_operation, [sid], %{}, opts)

  @doc "Like `retrieve/2`, but returns the result or raises `Infusion.Runtime.Error`."
  @spec retrieve!(String.t(), keyword()) :: Twilio.Schemas.SipDomain.t()
  def retrieve!(sid, opts \\ []),
    do:
      Infusion.Runtime.Request.unwrap!(Twilio.__request__(@retrieve_operation, [sid], %{}, opts))

  @update_operation %{
    id: "UpdateSipDomain",
    method: :post,
    path: "/2010-04-01/Accounts/{AccountSid}/SIP/Domains/{Sid}.json",
    path_params: ["Sid"],
    client_path_params: [{"AccountSid", :account_sid}],
    params: [
      {:byoc_trunk_sid, "ByocTrunkSid", :body},
      {:domain_name, "DomainName", :body},
      {:emergency_caller_sid, "EmergencyCallerSid", :body},
      {:emergency_calling_enabled, "EmergencyCallingEnabled", :body},
      {:friendly_name, "FriendlyName", :body},
      {:secure, "Secure", :body},
      {:sip_registration, "SipRegistration", :body},
      {:voice_fallback_method, "VoiceFallbackMethod", :body},
      {:voice_fallback_url, "VoiceFallbackUrl", :body},
      {:voice_method, "VoiceMethod", :body},
      {:voice_status_callback_method, "VoiceStatusCallbackMethod", :body},
      {:voice_status_callback_url, "VoiceStatusCallbackUrl", :body},
      {:voice_url, "VoiceUrl", :body}
    ],
    body: :form,
    response: {:ref, Twilio.Schemas.SipDomain}
  }

  @doc """
  Update the attributes of a domain

  `POST /2010-04-01/Accounts/{AccountSid}/SIP/Domains/{Sid}.json`

  ## Path parameters

    * `sid` (required) - The Twilio-provided string that uniquely identifies the SipDomain resource to update.

  `{AccountSid}` in the path is the `:account_sid` setting; pass `account_sid: "..."` as an option to use another.

  ## Parameters

    * `byoc_trunk_sid` - The SID of the BYOC Trunk(Bring Your Own Carrier) resource that the Sip Domain will be associated with.
    * `domain_name` - The unique address you reserve on Twilio to which you route your SIP traffic. Domain names can contain letters, digits, and "-" and must end with `sip.twilio.com`.
    * `emergency_caller_sid` - Whether an emergency caller sid is configured for the domain. If present, this phone number will be used as the callback for the emergency call.
    * `emergency_calling_enabled` - Whether emergency calling is enabled for the domain. If enabled, allows emergency calls on the domain from phone numbers with validated addresses.
    * `friendly_name` - A descriptive string that you created to describe the resource. It can be up to 64 characters long.
    * `secure` - Whether secure SIP is enabled for the domain. If enabled, TLS will be enforced and SRTP will be negotiated on all incoming calls to this sip domain.
    * `sip_registration` - Whether to allow SIP Endpoints to register with the domain to receive calls. Can be `true` or `false`. `true` allows SIP Endpoints to register with the domain to receive calls, `false` does not.
    * `voice_fallback_method` - The HTTP method we should use to call `voice_fallback_url`. Can be: `GET` or `POST`.
    * `voice_fallback_url` - The URL that we should call when an error occurs while retrieving or executing the TwiML requested by `voice_url`.
    * `voice_method` - The HTTP method we should use to call `voice_url`
    * `voice_status_callback_method` - The HTTP method we should use to call `voice_status_callback_url`. Can be: `GET` or `POST`.
    * `voice_status_callback_url` - The URL that we should call to pass status parameters (such as call ended) to your application.
    * `voice_url` - The URL we should call when the domain receives a call.
  """
  @spec update(String.t(), map() | keyword(), keyword()) ::
          {:ok, Twilio.Schemas.SipDomain.t()} | {:error, Infusion.Runtime.Error.t()}
  def update(sid, params \\ %{}, opts \\ []),
    do: Twilio.__request__(@update_operation, [sid], params, opts)

  @doc "Like `update/3`, but returns the result or raises `Infusion.Runtime.Error`."
  @spec update!(String.t(), map() | keyword(), keyword()) :: Twilio.Schemas.SipDomain.t()
  def update!(sid, params \\ %{}, opts \\ []),
    do:
      Infusion.Runtime.Request.unwrap!(Twilio.__request__(@update_operation, [sid], params, opts))
end
