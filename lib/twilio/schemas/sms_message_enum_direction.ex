defmodule Twilio.Schemas.SmsMessageEnumDirection do
  @moduledoc false

  @type t :: String.t()

  @doc false
  def __schema__(:type),
    do: {:enum, ["inbound", "outbound-api", "outbound-call", "outbound-reply"]}

  @doc "Decodes parsed JSON as this type."
  @spec decode(term) :: t | term
  def decode(json), do: Infusion.Runtime.Schema.decode_module(json, __MODULE__)
end
