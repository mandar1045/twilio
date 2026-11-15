defmodule Twilio.Schemas.MessageEnumDirection do
  @moduledoc """
  The direction of the message. Can be: `inbound` for incoming messages, `outbound-api` for messages created by the REST API, `outbound-call` for messages created during a call, or `outbound-reply` for messages created in response to an incoming message.
  """

  @type t :: String.t()

  @doc false
  def __schema__(:type),
    do: {:enum, ["inbound", "outbound-api", "outbound-call", "outbound-reply"]}

  @doc "Decodes parsed JSON as this type."
  @spec decode(term) :: t | term
  def decode(json), do: Infusion.Runtime.Schema.decode_module(json, __MODULE__)
end
