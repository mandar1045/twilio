defmodule Twilio.Schemas.RecordingAddOnResultEnumStatus do
  @moduledoc """
  The status of the result. Can be: `canceled`, `completed`, `deleted`, `failed`, `in-progress`, `init`, `processing`, `queued`.
  """

  @type t :: String.t()

  @doc false
  def __schema__(:type),
    do:
      {:enum,
       [
         "canceled",
         "completed",
         "deleted",
         "failed",
         "in-progress",
         "init",
         "processing",
         "queued"
       ]}

  @doc "Decodes parsed JSON as this type."
  @spec decode(term) :: t | term
  def decode(json), do: Infusion.Runtime.Schema.decode_module(json, __MODULE__)
end
