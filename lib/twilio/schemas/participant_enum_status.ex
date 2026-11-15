defmodule Twilio.Schemas.ParticipantEnumStatus do
  @moduledoc """
  The status of the participant's call in a session. Can be: `queued`, `connecting`, `ringing`, `connected`, `complete`, or `failed`.
  """

  @type t :: String.t()

  @doc false
  def __schema__(:type),
    do: {:enum, ["queued", "connecting", "ringing", "connected", "complete", "failed"]}

  @doc "Decodes parsed JSON as this type."
  @spec decode(term) :: t | term
  def decode(json), do: Infusion.Runtime.Schema.decode_module(json, __MODULE__)
end
