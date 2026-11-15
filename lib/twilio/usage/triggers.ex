defmodule Twilio.Usage.Triggers do
  @moduledoc """
  API calls: `create`, `delete`, `list`, `retrieve`, `update`.
  """

  @create_operation %{
    id: "CreateUsageTrigger",
    method: :post,
    path: "/2010-04-01/Accounts/{AccountSid}/Usage/Triggers.json",
    path_params: [],
    client_path_params: [{"AccountSid", :account_sid}],
    params: [
      {:callback_method, "CallbackMethod", :body},
      {:callback_url, "CallbackUrl", :body},
      {:friendly_name, "FriendlyName", :body},
      {:recurring, "Recurring", :body},
      {:trigger_by, "TriggerBy", :body},
      {:trigger_value, "TriggerValue", :body},
      {:usage_category, "UsageCategory", :body}
    ],
    body: :form,
    response: {:ref, Twilio.Schemas.UsageTrigger}
  }

  @doc """
  Create a new UsageTrigger

  `POST /2010-04-01/Accounts/{AccountSid}/Usage/Triggers.json`

  `{AccountSid}` in the path is the `:account_sid` setting; pass `account_sid: "..."` as an option to use another.

  ## Parameters

    * `callback_method` - The HTTP method we should use to call `callback_url`. Can be: `GET` or `POST` and the default is `POST`.
    * `callback_url` (required) - The URL we should call using `callback_method` when the trigger fires.
    * `friendly_name` - A descriptive string that you create to describe the resource. It can be up to 64 characters long.
    * `recurring`
    * `trigger_by`
    * `trigger_value` (required) - The usage value at which the trigger should fire. For convenience, you can use an offset value such as `+30` to specify a trigger_value that is 30 units more than the current usage value. Be sure to urlencode a `+` as `%2B`.
    * `usage_category` (required) - The usage category that the trigger should watch. Use one of the supported [usage categories](https://www.twilio.com/docs/usage/api/usage-record#usage-categories) for this value.
  """
  @spec create(map() | keyword(), keyword()) ::
          {:ok, Twilio.Schemas.UsageTrigger.t()} | {:error, Infusion.Runtime.Error.t()}
  def create(params \\ %{}, opts \\ []),
    do: Twilio.__request__(@create_operation, [], params, opts)

  @doc "Like `create/2`, but returns the result or raises `Infusion.Runtime.Error`."
  @spec create!(map() | keyword(), keyword()) :: Twilio.Schemas.UsageTrigger.t()
  def create!(params \\ %{}, opts \\ []),
    do: Infusion.Runtime.Request.unwrap!(Twilio.__request__(@create_operation, [], params, opts))

  @delete_operation %{
    id: "DeleteUsageTrigger",
    method: :delete,
    path: "/2010-04-01/Accounts/{AccountSid}/Usage/Triggers/{Sid}.json",
    path_params: ["Sid"],
    client_path_params: [{"AccountSid", :account_sid}],
    params: [],
    response: nil
  }

  @doc """
  `DELETE /2010-04-01/Accounts/{AccountSid}/Usage/Triggers/{Sid}.json`

  ## Path parameters

    * `sid` (required) - The Twilio-provided string that uniquely identifies the UsageTrigger resource to delete.

  `{AccountSid}` in the path is the `:account_sid` setting; pass `account_sid: "..."` as an option to use another.
  """
  @spec delete(String.t(), keyword()) :: {:ok, nil} | {:error, Infusion.Runtime.Error.t()}
  def delete(sid, opts \\ []), do: Twilio.__request__(@delete_operation, [sid], %{}, opts)

  @doc "Like `delete/2`, but returns the result or raises `Infusion.Runtime.Error`."
  @spec delete!(String.t(), keyword()) :: nil
  def delete!(sid, opts \\ []),
    do: Infusion.Runtime.Request.unwrap!(Twilio.__request__(@delete_operation, [sid], %{}, opts))

  @list_operation %{
    id: "ListUsageTrigger",
    method: :get,
    path: "/2010-04-01/Accounts/{AccountSid}/Usage/Triggers.json",
    path_params: [],
    client_path_params: [{"AccountSid", :account_sid}],
    params: [
      {:recurring, "Recurring", :query},
      {:trigger_by, "TriggerBy", :query},
      {:usage_category, "UsageCategory", :query},
      {:page_size, "PageSize", :query},
      {:page, "Page", :query},
      {:page_token, "PageToken", :query}
    ],
    response: {:ref, Twilio.Schemas.UsageTriggersListResponse},
    paginate: %{
      from: ["next_page_uri"],
      items: ["usage_triggers"],
      style: :next_url,
      item: {:ref, Twilio.Schemas.UsageTrigger}
    }
  }

  @doc """
  Retrieve a list of usage-triggers belonging to the account used to make the request

  `GET /2010-04-01/Accounts/{AccountSid}/Usage/Triggers.json`

  `{AccountSid}` in the path is the `:account_sid` setting; pass `account_sid: "..."` as an option to use another.

  ## Parameters

    * `recurring` - The frequency of recurring UsageTriggers to read. Can be: `daily`, `monthly`, or `yearly` to read recurring UsageTriggers. An empty value or a value of `alltime` reads non-recurring UsageTriggers.
    * `trigger_by` - The trigger field of the UsageTriggers to read. Can be: `count`, `usage`, or `price` as described in the [UsageRecords documentation](https://www.twilio.com/docs/usage/api/usage-record#usage-count-price).
    * `usage_category` - The usage category of the UsageTriggers to read. Must be a supported [usage categories](https://www.twilio.com/docs/usage/api/usage-record#usage-categories).
    * `page_size` - How many resources to return in each list page. The default is 50, and the maximum is 1000.
    * `page` - The page index. This value is simply for client state.
    * `page_token` - The page token. This is provided by the API.

  To read every item across all pages, use `list_all`.
  """
  @spec list(map() | keyword(), keyword()) ::
          {:ok, Twilio.Schemas.UsageTriggersListResponse.t()}
          | {:error, Infusion.Runtime.Error.t()}
  def list(params \\ %{}, opts \\ []), do: Twilio.__request__(@list_operation, [], params, opts)

  @doc "Like `list/2`, but returns the result or raises `Infusion.Runtime.Error`."
  @spec list!(map() | keyword(), keyword()) :: Twilio.Schemas.UsageTriggersListResponse.t()
  def list!(params \\ %{}, opts \\ []),
    do: Infusion.Runtime.Request.unwrap!(Twilio.__request__(@list_operation, [], params, opts))

  @doc """
  Like `list/2`, but returns every item, from every page: a lazy stream of `Twilio.Schemas.UsageTrigger.t()` that fetches pages as it is read.

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
    id: "FetchUsageTrigger",
    method: :get,
    path: "/2010-04-01/Accounts/{AccountSid}/Usage/Triggers/{Sid}.json",
    path_params: ["Sid"],
    client_path_params: [{"AccountSid", :account_sid}],
    params: [],
    response: {:ref, Twilio.Schemas.UsageTrigger}
  }

  @doc """
  Fetch and instance of a usage-trigger

  `GET /2010-04-01/Accounts/{AccountSid}/Usage/Triggers/{Sid}.json`

  ## Path parameters

    * `sid` (required) - The Twilio-provided string that uniquely identifies the UsageTrigger resource to fetch.

  `{AccountSid}` in the path is the `:account_sid` setting; pass `account_sid: "..."` as an option to use another.
  """
  @spec retrieve(String.t(), keyword()) ::
          {:ok, Twilio.Schemas.UsageTrigger.t()} | {:error, Infusion.Runtime.Error.t()}
  def retrieve(sid, opts \\ []), do: Twilio.__request__(@retrieve_operation, [sid], %{}, opts)

  @doc "Like `retrieve/2`, but returns the result or raises `Infusion.Runtime.Error`."
  @spec retrieve!(String.t(), keyword()) :: Twilio.Schemas.UsageTrigger.t()
  def retrieve!(sid, opts \\ []),
    do:
      Infusion.Runtime.Request.unwrap!(Twilio.__request__(@retrieve_operation, [sid], %{}, opts))

  @update_operation %{
    id: "UpdateUsageTrigger",
    method: :post,
    path: "/2010-04-01/Accounts/{AccountSid}/Usage/Triggers/{Sid}.json",
    path_params: ["Sid"],
    client_path_params: [{"AccountSid", :account_sid}],
    params: [
      {:callback_method, "CallbackMethod", :body},
      {:callback_url, "CallbackUrl", :body},
      {:friendly_name, "FriendlyName", :body}
    ],
    body: :form,
    response: {:ref, Twilio.Schemas.UsageTrigger}
  }

  @doc """
  Update an instance of a usage trigger

  `POST /2010-04-01/Accounts/{AccountSid}/Usage/Triggers/{Sid}.json`

  ## Path parameters

    * `sid` (required) - The Twilio-provided string that uniquely identifies the UsageTrigger resource to update.

  `{AccountSid}` in the path is the `:account_sid` setting; pass `account_sid: "..."` as an option to use another.

  ## Parameters

    * `callback_method` - The HTTP method we should use to call `callback_url`. Can be: `GET` or `POST` and the default is `POST`.
    * `callback_url` - The URL we should call using `callback_method` when the trigger fires.
    * `friendly_name` - A descriptive string that you create to describe the resource. It can be up to 64 characters long.
  """
  @spec update(String.t(), map() | keyword(), keyword()) ::
          {:ok, Twilio.Schemas.UsageTrigger.t()} | {:error, Infusion.Runtime.Error.t()}
  def update(sid, params \\ %{}, opts \\ []),
    do: Twilio.__request__(@update_operation, [sid], params, opts)

  @doc "Like `update/3`, but returns the result or raises `Infusion.Runtime.Error`."
  @spec update!(String.t(), map() | keyword(), keyword()) :: Twilio.Schemas.UsageTrigger.t()
  def update!(sid, params \\ %{}, opts \\ []),
    do:
      Infusion.Runtime.Request.unwrap!(Twilio.__request__(@update_operation, [sid], params, opts))
end
