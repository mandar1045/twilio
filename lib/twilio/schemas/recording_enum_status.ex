defmodule Twilio.Schemas.RecordingEnumStatus do
  @moduledoc """
  The status of the recording. Can be: `processing`, `completed`, `absent` or `deleted`. For information about more detailed statuses on in-progress recordings, check out how to [Update a Recording Resource](https://www.twilio.com/docs/voice/api/recording#update-a-recording-resource).
  """

  @type t :: String.t()

  @doc false
  def __schema__(:type),
    do:
      {:enum,
       ["in-progress", "paused", "stopped", "processing", "completed", "absent", "deleted"]}

  @doc "Decodes parsed JSON as this type."
  @spec decode(term) :: t | term
  def decode(json), do: Infusion.Runtime.Schema.decode_module(json, __MODULE__)
end
