defmodule Twilio.Schemas.PaymentsEnumCapture do
  @moduledoc """
  The piece of payment information that you wish the caller to enter. Must be one of `payment-card-number`, `expiration-date`, `security-code`, `postal-code`, `bank-routing-number`, `bank-account-number`, or their `-matcher` variants for input confirmation when `RequireMatchingInputs` is enabled.
  """

  @type t :: String.t()

  @doc false
  def __schema__(:type),
    do:
      {:enum,
       [
         "payment-card-number",
         "expiration-date",
         "security-code",
         "postal-code",
         "bank-routing-number",
         "bank-account-number",
         "payment-card-number-matcher",
         "expiration-date-matcher",
         "security-code-matcher",
         "postal-code-matcher"
       ]}

  @doc "Decodes parsed JSON as this type."
  @spec decode(term) :: t | term
  def decode(json), do: Infusion.Runtime.Schema.decode_module(json, __MODULE__)
end
