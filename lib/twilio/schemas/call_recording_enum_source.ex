defmodule Twilio.Schemas.CallRecordingEnumSource do
  @moduledoc """
  How the recording was created. Can be: `DialVerb`, `Conference`, `OutboundAPI`, `Trunking`, `RecordVerb`, `StartCallRecordingAPI`, and `StartConferenceRecordingAPI`.
  """

  @type t :: String.t()

  @doc false
  def __schema__(:type),
    do:
      {:enum,
       [
         "DialVerb",
         "Conference",
         "OutboundAPI",
         "Trunking",
         "RecordVerb",
         "StartCallRecordingAPI",
         "StartConferenceRecordingAPI"
       ]}

  @doc "Decodes parsed JSON as this type."
  @spec decode(term) :: t | term
  def decode(json), do: Infusion.Runtime.Schema.decode_module(json, __MODULE__)
end
