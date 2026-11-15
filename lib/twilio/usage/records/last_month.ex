defmodule Twilio.Usage.Records.LastMonth do
  @moduledoc """
  API calls: `list`.
  """

  @list_operation %{
    id: "ListUsageRecordLastMonth",
    method: :get,
    path: "/2010-04-01/Accounts/{AccountSid}/Usage/Records/LastMonth.json",
    path_params: [],
    client_path_params: [{"AccountSid", :account_sid}],
    params: [
      {:category, "Category", :query},
      {:start_date, "StartDate", :query},
      {:end_date, "EndDate", :query},
      {:include_subaccounts, "IncludeSubaccounts", :query},
      {:page_size, "PageSize", :query},
      {:page, "Page", :query},
      {:page_token, "PageToken", :query}
    ],
    response: {:ref, Twilio.Schemas.UsageRecordsLastMonthListResponse},
    paginate: %{
      from: ["next_page_uri"],
      items: ["usage_records"],
      style: :next_url,
      item: {:ref, Twilio.Schemas.UsageRecordLastMonth}
    }
  }

  @doc """
  `GET /2010-04-01/Accounts/{AccountSid}/Usage/Records/LastMonth.json`

  `{AccountSid}` in the path is the `:account_sid` setting; pass `account_sid: "..."` as an option to use another.

  ## Parameters

    * `category` - The [usage category](https://www.twilio.com/docs/usage/api/usage-record#usage-categories) of the UsageRecord resources to read. Only UsageRecord resources in the specified category are retrieved.
    * `start_date` - Only include usage that has occurred on or after this date. Specify the date in GMT and format as `YYYY-MM-DD`. You can also specify offsets from the current date, such as: `-30days`, which will set the start date to be 30 days before the current date.
    * `end_date` - Only include usage that occurred on or before this date. Specify the date in GMT and format as `YYYY-MM-DD`. You can also specify offsets from the current date, such as: `+30days`, which will set the end date to 30 days from the current date.
    * `include_subaccounts` - Whether to include usage from the master account and all its subaccounts. Can be: `true` (the default) to include usage from the master account and all subaccounts or `false` to retrieve usage from only the specified account.
    * `page_size` - How many resources to return in each list page. The default is 50, and the maximum is 1000.
    * `page` - The page index. This value is simply for client state.
    * `page_token` - The page token. This is provided by the API.

  To read every item across all pages, use `list_all`.
  """
  @spec list(map() | keyword(), keyword()) ::
          {:ok, Twilio.Schemas.UsageRecordsLastMonthListResponse.t()}
          | {:error, Infusion.Runtime.Error.t()}
  def list(params \\ %{}, opts \\ []), do: Twilio.__request__(@list_operation, [], params, opts)

  @doc "Like `list/2`, but returns the result or raises `Infusion.Runtime.Error`."
  @spec list!(map() | keyword(), keyword()) ::
          Twilio.Schemas.UsageRecordsLastMonthListResponse.t()
  def list!(params \\ %{}, opts \\ []),
    do: Infusion.Runtime.Request.unwrap!(Twilio.__request__(@list_operation, [], params, opts))

  @doc """
  Like `list/2`, but returns every item, from every page: a lazy stream of `Twilio.Schemas.UsageRecordLastMonth.t()` that fetches pages as it is read.

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
end
