defmodule Twilio.Schemas.UsageTriggerEnumTriggerField do
  @moduledoc """
  The field in the [UsageRecord](https://www.twilio.com/docs/usage/api/usage-record) resource that fires the trigger.  Can be: `count`, `usage`, or `price`, as described in the [UsageRecords documentation](https://www.twilio.com/docs/usage/api/usage-record#usage-count-price).
  """

  @type t :: String.t()

  @doc false
  def __schema__(:type), do: {:enum, ["count", "usage", "price"]}

  @doc "Decodes parsed JSON as this type."
  @spec decode(term) :: t | term
  def decode(json), do: Infusion.Runtime.Schema.decode_module(json, __MODULE__)
end
