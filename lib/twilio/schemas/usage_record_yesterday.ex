defmodule Twilio.Schemas.UsageRecordYesterday do
  @moduledoc """
  ## Fields

    * `account_sid` - The SID of the [Account](https://www.twilio.com/docs/iam/api/account) that accrued the usage.
    * `api_version` - The API version used to create the resource.
    * `as_of` - Usage records up to date as of this timestamp, formatted as YYYY-MM-DDTHH:MM:SS+00:00. All timestamps are in GMT
    * `category` - The category of usage. For more information, see [Usage Categories](https://www.twilio.com/docs/usage/api/usage-record#usage-categories).
    * `count` - The number of usage events, such as the number of calls.
    * `count_unit` - The units in which `count` is measured, such as `calls` for calls or `messages` for SMS.
    * `description` - A plain-language description of the usage category.
    * `end_date` - The last date for which usage is included in the UsageRecord. The date is specified in GMT and formatted as `YYYY-MM-DD`.
    * `price` - The total price of the usage in the currency specified in `price_unit` and associated with the account.
    * `price_unit` - The currency in which `price` is measured, in [ISO 4127](https://www.iso.org/iso/home/standards/currency_codes.htm) format, such as `usd`, `eur`, and `jpy`.
    * `start_date` - The first date for which usage is included in this UsageRecord. The date is specified in GMT and formatted as `YYYY-MM-DD`.
    * `subresource_uris` - A list of related resources identified by their URIs. For more information, see [List Subresources](https://www.twilio.com/docs/usage/api/usage-record#list-subresources).
    * `uri` - The URI of the resource, relative to `https://api.twilio.com`.
    * `usage` - The amount used to bill usage and measured in units described in `usage_unit`.
    * `usage_unit` - The units in which `usage` is measured, such as `minutes` for calls or `messages` for SMS.
  """

  @derive {Inspect, except: [:__extra__, :__present__]}
  defstruct [
    :account_sid,
    :api_version,
    :as_of,
    :category,
    :count,
    :count_unit,
    :description,
    :end_date,
    :price,
    :price_unit,
    :start_date,
    :subresource_uris,
    :uri,
    :usage,
    :usage_unit,
    __extra__: %{},
    __present__: []
  ]

  @type t :: %__MODULE__{
          account_sid: String.t() | nil,
          api_version: String.t() | nil,
          as_of: String.t() | nil,
          category: String.t() | nil,
          count: String.t() | nil,
          count_unit: String.t() | nil,
          description: String.t() | nil,
          end_date: String.t() | nil,
          price: number() | nil,
          price_unit: String.t() | nil,
          start_date: String.t() | nil,
          subresource_uris: map() | nil,
          uri: String.t() | nil,
          usage: String.t() | nil,
          usage_unit: String.t() | nil,
          __extra__: %{optional(String.t()) => term()},
          __present__: [atom()]
        }

  @doc false
  def __schema__(:fields) do
    [
      {:account_sid, "account_sid", :string},
      {:api_version, "api_version", :string},
      {:as_of, "as_of", :string},
      {:category, "category", :string},
      {:count, "count", :string},
      {:count_unit, "count_unit", :string},
      {:description, "description", :string},
      {:end_date, "end_date", :string},
      {:price, "price", :number},
      {:price_unit, "price_unit", :string},
      {:start_date, "start_date", :string},
      {:subresource_uris, "subresource_uris", :any},
      {:uri, "uri", :string},
      {:usage, "usage", :string},
      {:usage_unit, "usage_unit", :string}
    ]
  end

  @doc "Decodes parsed JSON into this struct."
  @spec decode(term) :: t | term
  def decode(json), do: Infusion.Runtime.Schema.decode_module(json, __MODULE__)
end
