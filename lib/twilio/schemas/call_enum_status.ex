defmodule Twilio.Schemas.CallEnumStatus do
  @moduledoc """
  The status of this call. Can be: `queued`, `ringing`, `in-progress`, `canceled`, `completed`, `failed`, `busy` or `no-answer`. See [Call Status Values](https://www.twilio.com/docs/voice/api/call-resource#call-status-values) below for more information.
  """

  @type t :: String.t()

  @doc false
  def __schema__(:type),
    do:
      {:enum,
       [
         "queued",
         "ringing",
         "in-progress",
         "completed",
         "busy",
         "failed",
         "no-answer",
         "canceled"
       ]}

  @doc "Decodes parsed JSON as this type."
  @spec decode(term) :: t | term
  def decode(json), do: Infusion.Runtime.Schema.decode_module(json, __MODULE__)
end
