defmodule Twilio.Schemas.SmsMessageEnumStatus do
  @moduledoc false

  @type t :: String.t()

  @doc false
  def __schema__(:type),
    do:
      {:enum,
       [
         "queued",
         "sending",
         "sent",
         "failed",
         "delivered",
         "undelivered",
         "receiving",
         "received",
         "accepted",
         "scheduled",
         "read",
         "partially_delivered",
         "canceled"
       ]}

  @doc "Decodes parsed JSON as this type."
  @spec decode(term) :: t | term
  def decode(json), do: Infusion.Runtime.Schema.decode_module(json, __MODULE__)
end
