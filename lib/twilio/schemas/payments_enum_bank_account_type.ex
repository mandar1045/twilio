defmodule Twilio.Schemas.PaymentsEnumBankAccountType do
  @moduledoc """
  Type of bank account if payment source is ACH. One of `consumer-checking`, `consumer-savings`, or `commercial-checking`. The default value is `consumer-checking`.
  """

  @type t :: String.t()

  @doc false
  def __schema__(:type),
    do: {:enum, ["consumer-checking", "consumer-savings", "commercial-checking"]}

  @doc "Decodes parsed JSON as this type."
  @spec decode(term) :: t | term
  def decode(json), do: Infusion.Runtime.Schema.decode_module(json, __MODULE__)
end
