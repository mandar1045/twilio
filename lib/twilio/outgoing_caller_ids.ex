defmodule Twilio.OutgoingCallerIds do
  @moduledoc """
  API calls: `create`, `delete`, `list`, `retrieve`, `update`.
  """

  @create_operation %{
    id: "CreateValidationRequest",
    method: :post,
    path: "/2010-04-01/Accounts/{AccountSid}/OutgoingCallerIds.json",
    path_params: [],
    client_path_params: [{"AccountSid", :account_sid}],
    params: [
      {:call_delay, "CallDelay", :body},
      {:extension, "Extension", :body},
      {:friendly_name, "FriendlyName", :body},
      {:phone_number, "PhoneNumber", :body},
      {:status_callback, "StatusCallback", :body},
      {:status_callback_method, "StatusCallbackMethod", :body}
    ],
    body: :form,
    response: {:ref, Twilio.Schemas.ValidationRequest}
  }

  @doc """
  `POST /2010-04-01/Accounts/{AccountSid}/OutgoingCallerIds.json`

  `{AccountSid}` in the path is the `:account_sid` setting; pass `account_sid: "..."` as an option to use another.

  ## Parameters

    * `call_delay` - The number of seconds to delay before initiating the verification call. Can be an integer between `0` and `60`, inclusive. The default is `0`.
    * `extension` - The digits to dial after connecting the verification call.
    * `friendly_name` - A descriptive string that you create to describe the new caller ID resource. It can be up to 64 characters long. The default value is a formatted version of the phone number.
    * `phone_number` (required) - The phone number to verify in [E.164](https://www.twilio.com/docs/glossary/what-e164) format, which consists of a + followed by the country code and subscriber number.
    * `status_callback` - The URL we should call using the `status_callback_method` to send status information about the verification process to your application.
    * `status_callback_method` - The HTTP method we should use to call `status_callback`. Can be: `GET` or `POST`, and the default is `POST`.
  """
  @spec create(map() | keyword(), keyword()) ::
          {:ok, Twilio.Schemas.ValidationRequest.t()} | {:error, Infusion.Runtime.Error.t()}
  def create(params \\ %{}, opts \\ []),
    do: Twilio.__request__(@create_operation, [], params, opts)

  @doc "Like `create/2`, but returns the result or raises `Infusion.Runtime.Error`."
  @spec create!(map() | keyword(), keyword()) :: Twilio.Schemas.ValidationRequest.t()
  def create!(params \\ %{}, opts \\ []),
    do: Infusion.Runtime.Request.unwrap!(Twilio.__request__(@create_operation, [], params, opts))

  @delete_operation %{
    id: "DeleteOutgoingCallerId",
    method: :delete,
    path: "/2010-04-01/Accounts/{AccountSid}/OutgoingCallerIds/{Sid}.json",
    path_params: ["Sid"],
    client_path_params: [{"AccountSid", :account_sid}],
    params: [],
    response: nil
  }

  @doc """
  Delete the caller-id specified from the account

  `DELETE /2010-04-01/Accounts/{AccountSid}/OutgoingCallerIds/{Sid}.json`

  ## Path parameters

    * `sid` (required) - The Twilio-provided string that uniquely identifies the OutgoingCallerId resource to delete.

  `{AccountSid}` in the path is the `:account_sid` setting; pass `account_sid: "..."` as an option to use another.
  """
  @spec delete(String.t(), keyword()) :: {:ok, nil} | {:error, Infusion.Runtime.Error.t()}
  def delete(sid, opts \\ []), do: Twilio.__request__(@delete_operation, [sid], %{}, opts)

  @doc "Like `delete/2`, but returns the result or raises `Infusion.Runtime.Error`."
  @spec delete!(String.t(), keyword()) :: nil
  def delete!(sid, opts \\ []),
    do: Infusion.Runtime.Request.unwrap!(Twilio.__request__(@delete_operation, [sid], %{}, opts))

  @list_operation %{
    id: "ListOutgoingCallerId",
    method: :get,
    path: "/2010-04-01/Accounts/{AccountSid}/OutgoingCallerIds.json",
    path_params: [],
    client_path_params: [{"AccountSid", :account_sid}],
    params: [
      {:phone_number, "PhoneNumber", :query},
      {:friendly_name, "FriendlyName", :query},
      {:page_size, "PageSize", :query},
      {:page, "Page", :query},
      {:page_token, "PageToken", :query}
    ],
    response: {:ref, Twilio.Schemas.OutgoingCallerIdsListResponse},
    paginate: %{
      from: ["next_page_uri"],
      id: "sid",
      items: ["outgoing_caller_ids"],
      style: :next_url,
      item: {:ref, Twilio.Schemas.OutgoingCallerId}
    }
  }

  @doc """
  Retrieve a list of outgoing-caller-ids belonging to the account used to make the request

  `GET /2010-04-01/Accounts/{AccountSid}/OutgoingCallerIds.json`

  `{AccountSid}` in the path is the `:account_sid` setting; pass `account_sid: "..."` as an option to use another.

  ## Parameters

    * `phone_number` - The phone number of the OutgoingCallerId resources to read.
    * `friendly_name` - The string that identifies the OutgoingCallerId resources to read.
    * `page_size` - How many resources to return in each list page. The default is 50, and the maximum is 1000.
    * `page` - The page index. This value is simply for client state.
    * `page_token` - The page token. This is provided by the API.

  To read every item across all pages, use `list_all`.
  """
  @spec list(map() | keyword(), keyword()) ::
          {:ok, Twilio.Schemas.OutgoingCallerIdsListResponse.t()}
          | {:error, Infusion.Runtime.Error.t()}
  def list(params \\ %{}, opts \\ []), do: Twilio.__request__(@list_operation, [], params, opts)

  @doc "Like `list/2`, but returns the result or raises `Infusion.Runtime.Error`."
  @spec list!(map() | keyword(), keyword()) :: Twilio.Schemas.OutgoingCallerIdsListResponse.t()
  def list!(params \\ %{}, opts \\ []),
    do: Infusion.Runtime.Request.unwrap!(Twilio.__request__(@list_operation, [], params, opts))

  @doc """
  Like `list/2`, but returns every item, from every page: a lazy stream of `Twilio.Schemas.OutgoingCallerId.t()` that fetches pages as it is read.

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
  Watches this list and sends what changes: starts a process, linked to the caller, that polls it (with `ETag`s, so unchanged pages cost a `304`) and sends `{:infusion_watch, pid, %Infusion.Runtime.Watch.Event{}}` for every Twilio.Schemas.OutgoingCallerId.t() created, updated, deleted, or that moved into view (`:entered`).

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
    id: "FetchOutgoingCallerId",
    method: :get,
    path: "/2010-04-01/Accounts/{AccountSid}/OutgoingCallerIds/{Sid}.json",
    path_params: ["Sid"],
    client_path_params: [{"AccountSid", :account_sid}],
    params: [],
    response: {:ref, Twilio.Schemas.OutgoingCallerId}
  }

  @doc """
  Fetch an outgoing-caller-id belonging to the account used to make the request

  `GET /2010-04-01/Accounts/{AccountSid}/OutgoingCallerIds/{Sid}.json`

  ## Path parameters

    * `sid` (required) - The Twilio-provided string that uniquely identifies the OutgoingCallerId resource to fetch.

  `{AccountSid}` in the path is the `:account_sid` setting; pass `account_sid: "..."` as an option to use another.
  """
  @spec retrieve(String.t(), keyword()) ::
          {:ok, Twilio.Schemas.OutgoingCallerId.t()} | {:error, Infusion.Runtime.Error.t()}
  def retrieve(sid, opts \\ []), do: Twilio.__request__(@retrieve_operation, [sid], %{}, opts)

  @doc "Like `retrieve/2`, but returns the result or raises `Infusion.Runtime.Error`."
  @spec retrieve!(String.t(), keyword()) :: Twilio.Schemas.OutgoingCallerId.t()
  def retrieve!(sid, opts \\ []),
    do:
      Infusion.Runtime.Request.unwrap!(Twilio.__request__(@retrieve_operation, [sid], %{}, opts))

  @update_operation %{
    id: "UpdateOutgoingCallerId",
    method: :post,
    path: "/2010-04-01/Accounts/{AccountSid}/OutgoingCallerIds/{Sid}.json",
    path_params: ["Sid"],
    client_path_params: [{"AccountSid", :account_sid}],
    params: [{:friendly_name, "FriendlyName", :body}],
    body: :form,
    response: {:ref, Twilio.Schemas.OutgoingCallerId}
  }

  @doc """
  Updates the caller-id

  `POST /2010-04-01/Accounts/{AccountSid}/OutgoingCallerIds/{Sid}.json`

  ## Path parameters

    * `sid` (required) - The Twilio-provided string that uniquely identifies the OutgoingCallerId resource to update.

  `{AccountSid}` in the path is the `:account_sid` setting; pass `account_sid: "..."` as an option to use another.

  ## Parameters

    * `friendly_name` - A descriptive string that you create to describe the resource. It can be up to 64 characters long.
  """
  @spec update(String.t(), map() | keyword(), keyword()) ::
          {:ok, Twilio.Schemas.OutgoingCallerId.t()} | {:error, Infusion.Runtime.Error.t()}
  def update(sid, params \\ %{}, opts \\ []),
    do: Twilio.__request__(@update_operation, [sid], params, opts)

  @doc "Like `update/3`, but returns the result or raises `Infusion.Runtime.Error`."
  @spec update!(String.t(), map() | keyword(), keyword()) :: Twilio.Schemas.OutgoingCallerId.t()
  def update!(sid, params \\ %{}, opts \\ []),
    do:
      Infusion.Runtime.Request.unwrap!(Twilio.__request__(@update_operation, [sid], params, opts))
end
