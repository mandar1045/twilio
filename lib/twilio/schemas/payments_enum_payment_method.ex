defmodule Twilio.Schemas.PaymentsEnumPaymentMethod do
  @moduledoc """
  Type of payment being captured. One of `credit-card` or `ach-debit`. The default value is `credit-card`.
  """

  @type t :: String.t()

  @doc false
  def __schema__(:type), do: {:enum, ["credit-card", "ach-debit"]}

  @doc "Decodes parsed JSON as this type."
  @spec decode(term) :: t | term
  def decode(json), do: Infusion.Runtime.Schema.decode_module(json, __MODULE__)
end
