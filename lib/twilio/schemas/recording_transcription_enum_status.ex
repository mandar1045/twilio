defmodule Twilio.Schemas.RecordingTranscriptionEnumStatus do
  @moduledoc """
  The status of the transcription. Can be: `in-progress`, `completed`, `failed`.
  """

  @type t :: String.t()

  @doc false
  def __schema__(:type), do: {:enum, ["in-progress", "completed", "failed"]}

  @doc "Decodes parsed JSON as this type."
  @spec decode(term) :: t | term
  def decode(json), do: Infusion.Runtime.Schema.decode_module(json, __MODULE__)
end
