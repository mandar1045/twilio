defmodule Twilio.Schemas.SiprecEnumTrack do
  @moduledoc """
  One of `inbound_track`, `outbound_track`, `both_tracks`.
  """

  @type t :: String.t()

  @doc false
  def __schema__(:type), do: {:enum, ["inbound_track", "outbound_track", "both_tracks"]}

  @doc "Decodes parsed JSON as this type."
  @spec decode(term) :: t | term
  def decode(json), do: Infusion.Runtime.Schema.decode_module(json, __MODULE__)
end
