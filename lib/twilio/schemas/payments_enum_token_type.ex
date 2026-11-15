defmodule Twilio.Schemas.PaymentsEnumTokenType do
  @moduledoc """
  Indicates whether the payment method should be tokenized as a `one-time`, `reusable`, or `payment-method` token. The default value is `reusable`. Do not enter a charge amount when tokenizing. If a charge amount is entered, the payment method will be charged and not tokenized.
  """

  @type t :: String.t()

  @doc false
  def __schema__(:type), do: {:enum, ["one-time", "reusable", "payment-method"]}

  @doc "Decodes parsed JSON as this type."
  @spec decode(term) :: t | term
  def decode(json), do: Infusion.Runtime.Schema.decode_module(json, __MODULE__)
end
