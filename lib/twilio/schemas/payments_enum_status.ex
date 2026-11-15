defmodule Twilio.Schemas.PaymentsEnumStatus do
  @moduledoc """
  Indicates whether the current payment session should be cancelled or completed. When `cancel` the payment session is cancelled. When `complete`, Twilio sends the payment information to the selected Pay Connector for processing.
  """

  @type t :: String.t()

  @doc false
  def __schema__(:type), do: {:enum, ["complete", "cancel"]}

  @doc "Decodes parsed JSON as this type."
  @spec decode(term) :: t | term
  def decode(json), do: Infusion.Runtime.Schema.decode_module(json, __MODULE__)
end
