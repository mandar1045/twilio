defmodule Twilio.Sip.Domains.CredentialListMappings do
  @moduledoc """
  API calls: `create`, `delete`, `list`, `retrieve`.
  """

  @create_operation %{
    id: "CreateSipCredentialListMapping",
    method: :post,
    path: "/2010-04-01/Accounts/{AccountSid}/SIP/Domains/{DomainSid}/CredentialListMappings.json",
    path_params: ["DomainSid"],
    client_path_params: [{"AccountSid", :account_sid}],
    params: [{:credential_list_sid, "CredentialListSid", :body}],
    body: :form,
    response: {:ref, Twilio.Schemas.SipCredentialListMapping}
  }

  @doc """
  Create a CredentialListMapping resource for an account.

  `POST /2010-04-01/Accounts/{AccountSid}/SIP/Domains/{DomainSid}/CredentialListMappings.json`

  ## Path parameters

    * `domain_sid` (required) - A 34 character string that uniquely identifies the SIP Domain for which the CredentialList resource will be mapped.

  `{AccountSid}` in the path is the `:account_sid` setting; pass `account_sid: "..."` as an option to use another.

  ## Parameters

    * `credential_list_sid` (required) - A 34 character string that uniquely identifies the CredentialList resource to map to the SIP domain.
  """
  @spec create(String.t(), map() | keyword(), keyword()) ::
          {:ok, Twilio.Schemas.SipCredentialListMapping.t()}
          | {:error, Infusion.Runtime.Error.t()}
  def create(domain_sid, params \\ %{}, opts \\ []),
    do: Twilio.__request__(@create_operation, [domain_sid], params, opts)

  @doc "Like `create/3`, but returns the result or raises `Infusion.Runtime.Error`."
  @spec create!(String.t(), map() | keyword(), keyword()) ::
          Twilio.Schemas.SipCredentialListMapping.t()
  def create!(domain_sid, params \\ %{}, opts \\ []),
    do:
      Infusion.Runtime.Request.unwrap!(
        Twilio.__request__(@create_operation, [domain_sid], params, opts)
      )

  @delete_operation %{
    id: "DeleteSipCredentialListMapping",
    method: :delete,
    path:
      "/2010-04-01/Accounts/{AccountSid}/SIP/Domains/{DomainSid}/CredentialListMappings/{Sid}.json",
    path_params: ["DomainSid", "Sid"],
    client_path_params: [{"AccountSid", :account_sid}],
    params: [],
    response: nil
  }

  @doc """
  Delete a CredentialListMapping resource from an account.

  `DELETE /2010-04-01/Accounts/{AccountSid}/SIP/Domains/{DomainSid}/CredentialListMappings/{Sid}.json`

  ## Path parameters

    * `domain_sid` (required) - A 34 character string that uniquely identifies the SIP Domain that includes the resource to delete.
    * `sid` (required) - A 34 character string that uniquely identifies the resource to delete.

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
    id: "ListSipCredentialListMapping",
    method: :get,
    path: "/2010-04-01/Accounts/{AccountSid}/SIP/Domains/{DomainSid}/CredentialListMappings.json",
    path_params: ["DomainSid"],
    client_path_params: [{"AccountSid", :account_sid}],
    params: [
      {:page_size, "PageSize", :query},
      {:page, "Page", :query},
      {:page_token, "PageToken", :query}
    ],
    response: {:ref, Twilio.Schemas.SipDomainsCredentialListMappingsListResponse},
    paginate: %{
      from: ["next_page_uri"],
      items: ["credential_list_mappings"],
      style: :next_url,
      item: {:ref, Twilio.Schemas.SipCredentialListMapping}
    }
  }

  @doc """
  Read multiple CredentialListMapping resources from an account.

  `GET /2010-04-01/Accounts/{AccountSid}/SIP/Domains/{DomainSid}/CredentialListMappings.json`

  ## Path parameters

    * `domain_sid` (required) - A 34 character string that uniquely identifies the SIP Domain that includes the resource to read.

  `{AccountSid}` in the path is the `:account_sid` setting; pass `account_sid: "..."` as an option to use another.

  ## Parameters

    * `page_size` - How many resources to return in each list page. The default is 50, and the maximum is 1000.
    * `page` - The page index. This value is simply for client state.
    * `page_token` - The page token. This is provided by the API.

  To read every item across all pages, use `list_all`.
  """
  @spec list(String.t(), map() | keyword(), keyword()) ::
          {:ok, Twilio.Schemas.SipDomainsCredentialListMappingsListResponse.t()}
          | {:error, Infusion.Runtime.Error.t()}
  def list(domain_sid, params \\ %{}, opts \\ []),
    do: Twilio.__request__(@list_operation, [domain_sid], params, opts)

  @doc "Like `list/3`, but returns the result or raises `Infusion.Runtime.Error`."
  @spec list!(String.t(), map() | keyword(), keyword()) ::
          Twilio.Schemas.SipDomainsCredentialListMappingsListResponse.t()
  def list!(domain_sid, params \\ %{}, opts \\ []),
    do:
      Infusion.Runtime.Request.unwrap!(
        Twilio.__request__(@list_operation, [domain_sid], params, opts)
      )

  @doc """
  Like `list/3`, but returns every item, from every page: a lazy stream of `Twilio.Schemas.SipCredentialListMapping.t()` that fetches pages as it is read.

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

  @retrieve_operation %{
    id: "FetchSipCredentialListMapping",
    method: :get,
    path:
      "/2010-04-01/Accounts/{AccountSid}/SIP/Domains/{DomainSid}/CredentialListMappings/{Sid}.json",
    path_params: ["DomainSid", "Sid"],
    client_path_params: [{"AccountSid", :account_sid}],
    params: [],
    response: {:ref, Twilio.Schemas.SipCredentialListMapping}
  }

  @doc """
  Fetch a single CredentialListMapping resource from an account.

  `GET /2010-04-01/Accounts/{AccountSid}/SIP/Domains/{DomainSid}/CredentialListMappings/{Sid}.json`

  ## Path parameters

    * `domain_sid` (required) - A 34 character string that uniquely identifies the SIP Domain that includes the resource to fetch.
    * `sid` (required) - A 34 character string that uniquely identifies the resource to fetch.

  `{AccountSid}` in the path is the `:account_sid` setting; pass `account_sid: "..."` as an option to use another.
  """
  @spec retrieve(String.t(), String.t(), keyword()) ::
          {:ok, Twilio.Schemas.SipCredentialListMapping.t()}
          | {:error, Infusion.Runtime.Error.t()}
  def retrieve(domain_sid, sid, opts \\ []),
    do: Twilio.__request__(@retrieve_operation, [domain_sid, sid], %{}, opts)

  @doc "Like `retrieve/3`, but returns the result or raises `Infusion.Runtime.Error`."
  @spec retrieve!(String.t(), String.t(), keyword()) ::
          Twilio.Schemas.SipCredentialListMapping.t()
  def retrieve!(domain_sid, sid, opts \\ []),
    do:
      Infusion.Runtime.Request.unwrap!(
        Twilio.__request__(@retrieve_operation, [domain_sid, sid], %{}, opts)
      )
end
