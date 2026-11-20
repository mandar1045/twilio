defmodule Twilio.Sip.Domains.Auth.Registrations.CredentialListMappings do
  @moduledoc """
  API calls: `create`, `delete`, `list`, `retrieve`.
  """

  @create_operation %{
    id: "CreateSipAuthRegistrationsCredentialListMapping",
    method: :post,
    path:
      "/2010-04-01/Accounts/{AccountSid}/SIP/Domains/{DomainSid}/Auth/Registrations/CredentialListMappings.json",
    path_params: ["DomainSid"],
    client_path_params: [{"AccountSid", :account_sid}],
    params: [{:credential_list_sid, "CredentialListSid", :body}],
    body: :form,
    response: {:ref, Twilio.Schemas.SipAuthRegistrationsCredentialListMapping}
  }

  @doc """
  Create a new credential list mapping resource

  `POST /2010-04-01/Accounts/{AccountSid}/SIP/Domains/{DomainSid}/Auth/Registrations/CredentialListMappings.json`

  ## Path parameters

    * `domain_sid` (required) - The SID of the SIP domain that will contain the new resource.

  `{AccountSid}` in the path is the `:account_sid` setting; pass `account_sid: "..."` as an option to use another.

  ## Parameters

    * `credential_list_sid` (required) - The SID of the CredentialList resource to map to the SIP domain.
  """
  @spec create(String.t(), map() | keyword(), keyword()) ::
          {:ok, Twilio.Schemas.SipAuthRegistrationsCredentialListMapping.t()}
          | {:error, Infusion.Runtime.Error.t()}
  def create(domain_sid, params \\ %{}, opts \\ []),
    do: Twilio.__request__(@create_operation, [domain_sid], params, opts)

  @doc "Like `create/3`, but returns the result or raises `Infusion.Runtime.Error`."
  @spec create!(String.t(), map() | keyword(), keyword()) ::
          Twilio.Schemas.SipAuthRegistrationsCredentialListMapping.t()
  def create!(domain_sid, params \\ %{}, opts \\ []),
    do:
      Infusion.Runtime.Request.unwrap!(
        Twilio.__request__(@create_operation, [domain_sid], params, opts)
      )

  @delete_operation %{
    id: "DeleteSipAuthRegistrationsCredentialListMapping",
    method: :delete,
    path:
      "/2010-04-01/Accounts/{AccountSid}/SIP/Domains/{DomainSid}/Auth/Registrations/CredentialListMappings/{Sid}.json",
    path_params: ["DomainSid", "Sid"],
    client_path_params: [{"AccountSid", :account_sid}],
    params: [],
    response: nil
  }

  @doc """
  Delete a credential list mapping from the requested domain

  `DELETE /2010-04-01/Accounts/{AccountSid}/SIP/Domains/{DomainSid}/Auth/Registrations/CredentialListMappings/{Sid}.json`

  ## Path parameters

    * `domain_sid` (required) - The SID of the SIP domain that contains the resources to delete.
    * `sid` (required) - The Twilio-provided string that uniquely identifies the CredentialListMapping resource to delete.

  `{AccountSid}` in the path is the `:account_sid` setting; pass `account_sid: "..."` as an option to use another.
  """
  @spec delete(String.t(), String.t(), keyword()) ::
          {:ok, nil} | {:error, Infusion.Runtime.Error.t()}
  def delete(domain_sid, sid, opts \\ []),
    do: Twilio.__request__(@delete_operation, [domain_sid, sid], %{}, opts)

  @doc "Like `delete/3`, but returns the result or raises `Infusion.Runtime.Error`."
  @spec delete!(String.t(), String.t(), keyword()) :: nil
  def delete!(domain_sid, sid, opts \\ []),
    do:
      Infusion.Runtime.Request.unwrap!(
        Twilio.__request__(@delete_operation, [domain_sid, sid], %{}, opts)
      )

  @list_operation %{
    id: "ListSipAuthRegistrationsCredentialListMapping",
    method: :get,
    path:
      "/2010-04-01/Accounts/{AccountSid}/SIP/Domains/{DomainSid}/Auth/Registrations/CredentialListMappings.json",
    path_params: ["DomainSid"],
    client_path_params: [{"AccountSid", :account_sid}],
    params: [
      {:page_size, "PageSize", :query},
      {:page, "Page", :query},
      {:page_token, "PageToken", :query}
    ],
    response:
      {:ref, Twilio.Schemas.SipDomainsAuthRegistrationsCredentialListMappingsListResponse},
    paginate: %{
      from: ["next_page_uri"],
      id: "sid",
      items: ["contents"],
      style: :next_url,
      item: {:ref, Twilio.Schemas.SipAuthRegistrationsCredentialListMapping}
    }
  }

  @doc """
  Retrieve a list of credential list mappings belonging to the domain used in the request

  `GET /2010-04-01/Accounts/{AccountSid}/SIP/Domains/{DomainSid}/Auth/Registrations/CredentialListMappings.json`

  ## Path parameters

    * `domain_sid` (required) - The SID of the SIP domain that contains the resources to read.

  `{AccountSid}` in the path is the `:account_sid` setting; pass `account_sid: "..."` as an option to use another.

  ## Parameters

    * `page_size` - How many resources to return in each list page. The default is 50, and the maximum is 1000.
    * `page` - The page index. This value is simply for client state.
    * `page_token` - The page token. This is provided by the API.

  To read every item across all pages, use `list_all`.
  """
  @spec list(String.t(), map() | keyword(), keyword()) ::
          {:ok, Twilio.Schemas.SipDomainsAuthRegistrationsCredentialListMappingsListResponse.t()}
          | {:error, Infusion.Runtime.Error.t()}
  def list(domain_sid, params \\ %{}, opts \\ []),
    do: Twilio.__request__(@list_operation, [domain_sid], params, opts)

  @doc "Like `list/3`, but returns the result or raises `Infusion.Runtime.Error`."
  @spec list!(String.t(), map() | keyword(), keyword()) ::
          Twilio.Schemas.SipDomainsAuthRegistrationsCredentialListMappingsListResponse.t()
  def list!(domain_sid, params \\ %{}, opts \\ []),
    do:
      Infusion.Runtime.Request.unwrap!(
        Twilio.__request__(@list_operation, [domain_sid], params, opts)
      )

  @doc """
  Like `list/3`, but returns every item, from every page: a lazy stream of `Twilio.Schemas.SipAuthRegistrationsCredentialListMapping.t()` that fetches pages as it is read.

  The first page is fetched right away, so its errors are returned; a later page that fails raises `Infusion.Runtime.Error`. Stopping early (`Enum.take/2`) fetches no more pages.
  """
  @spec list_all(String.t(), map() | keyword(), keyword()) ::
          {:ok, Enumerable.t()} | {:error, Infusion.Runtime.Error.t()}
  def list_all(domain_sid, params \\ %{}, opts \\ []),
    do: Twilio.__paginate__(@list_operation, [domain_sid], params, opts)

  @doc "Like `list_all/3`, but returns the stream or raises `Infusion.Runtime.Error`."
  @spec list_all!(String.t(), map() | keyword(), keyword()) :: Enumerable.t()
  def list_all!(domain_sid, params \\ %{}, opts \\ []),
    do:
      Infusion.Runtime.Request.unwrap!(
        Twilio.__paginate__(@list_operation, [domain_sid], params, opts)
      )

  @doc """
  Watches this list and sends what changes: starts a process, linked to the caller, that polls it (with `ETag`s, so unchanged pages cost a `304`) and sends `{:infusion_watch, pid, %Infusion.Runtime.Watch.Event{}}` for every Twilio.Schemas.SipAuthRegistrationsCredentialListMapping.t() created, updated, deleted, or that moved into view (`:entered`).

  Options: `every:` (milliseconds, default 30 seconds), `to:` (a pid, `{:pubsub, MyApp.PubSub, topic}` or a function), `pages:`, `initial:`, `ignore:`, plus any setting of `Infusion.Runtime.Config`. See `Infusion.Runtime.Watch`.
  """
  @spec list_watch(String.t(), map() | keyword(), keyword()) ::
          {:ok, pid()} | {:error, Infusion.Runtime.Error.t()}
  def list_watch(domain_sid, params \\ %{}, opts \\ []),
    do: Twilio.__watch__(@list_operation, [domain_sid], params, opts)

  @doc "Like `list_watch/3`, but returns the stream or raises `Infusion.Runtime.Error`."
  @spec list_watch!(String.t(), map() | keyword(), keyword()) :: pid()
  def list_watch!(domain_sid, params \\ %{}, opts \\ []),
    do:
      Infusion.Runtime.Request.unwrap!(
        Twilio.__watch__(@list_operation, [domain_sid], params, opts)
      )

  @retrieve_operation %{
    id: "FetchSipAuthRegistrationsCredentialListMapping",
    method: :get,
    path:
      "/2010-04-01/Accounts/{AccountSid}/SIP/Domains/{DomainSid}/Auth/Registrations/CredentialListMappings/{Sid}.json",
    path_params: ["DomainSid", "Sid"],
    client_path_params: [{"AccountSid", :account_sid}],
    params: [],
    response: {:ref, Twilio.Schemas.SipAuthRegistrationsCredentialListMapping}
  }

  @doc """
  Fetch a specific instance of a credential list mapping

  `GET /2010-04-01/Accounts/{AccountSid}/SIP/Domains/{DomainSid}/Auth/Registrations/CredentialListMappings/{Sid}.json`

  ## Path parameters

    * `domain_sid` (required) - The SID of the SIP domain that contains the resource to fetch.
    * `sid` (required) - The Twilio-provided string that uniquely identifies the CredentialListMapping resource to fetch.

  `{AccountSid}` in the path is the `:account_sid` setting; pass `account_sid: "..."` as an option to use another.
  """
  @spec retrieve(String.t(), String.t(), keyword()) ::
          {:ok, Twilio.Schemas.SipAuthRegistrationsCredentialListMapping.t()}
          | {:error, Infusion.Runtime.Error.t()}
  def retrieve(domain_sid, sid, opts \\ []),
    do: Twilio.__request__(@retrieve_operation, [domain_sid, sid], %{}, opts)

  @doc "Like `retrieve/3`, but returns the result or raises `Infusion.Runtime.Error`."
  @spec retrieve!(String.t(), String.t(), keyword()) ::
          Twilio.Schemas.SipAuthRegistrationsCredentialListMapping.t()
  def retrieve!(domain_sid, sid, opts \\ []),
    do:
      Infusion.Runtime.Request.unwrap!(
        Twilio.__request__(@retrieve_operation, [domain_sid, sid], %{}, opts)
      )
end
