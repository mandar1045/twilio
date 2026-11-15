defmodule Twilio.Schemas.StreamEnumTrack do
  @moduledoc """
  The tracks to be included in the Stream. Possible values are `inbound_track`, `outbound_track`, `both_tracks`. Default value is `inbound_track`.
  """

  @type t :: String.t()

  @doc false
  def __schema__(:type), do: {:enum, ["inbound_track", "outbound_track", "both_tracks"]}

  @doc "Decodes parsed JSON as this type."
  @spec decode(term) :: t | term
  def decode(json), do: Infusion.Runtime.Schema.decode_module(json, __MODULE__)
end
