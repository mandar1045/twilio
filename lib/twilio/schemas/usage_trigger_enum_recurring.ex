defmodule Twilio.Schemas.UsageTriggerEnumRecurring do
  @moduledoc """
  The frequency of a recurring UsageTrigger.  Can be: `daily`, `monthly`, or `yearly` for recurring triggers or empty for non-recurring triggers. A trigger will only fire once during each period. Recurring times are in GMT.
  """

  @type t :: String.t()

  @doc false
  def __schema__(:type), do: {:enum, ["daily", "monthly", "yearly", "alltime"]}

  @doc "Decodes parsed JSON as this type."
  @spec decode(term) :: t | term
  def decode(json), do: Infusion.Runtime.Schema.decode_module(json, __MODULE__)
end
