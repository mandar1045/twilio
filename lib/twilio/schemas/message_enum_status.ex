defmodule Twilio.Schemas.MessageEnumStatus do
  @moduledoc """
  The status of the Message. Possible values: `accepted`, `scheduled`, `canceled`, `queued`, `sending`, `sent`, `failed`, `delivered`, `undelivered`, `receiving`, `received`, or `read` (WhatsApp only). For more information, See [detailed descriptions](https://www.twilio.com/docs/sms/api/message-resource#message-status-values).
  """

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
