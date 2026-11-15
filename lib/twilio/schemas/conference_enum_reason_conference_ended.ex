defmodule Twilio.Schemas.ConferenceEnumReasonConferenceEnded do
  @moduledoc """
  The reason why a conference ended. When a conference is in progress, will be `null`. When conference is completed, can be: `conference-ended-via-api`, `participant-with-end-conference-on-exit-left`, `participant-with-end-conference-on-exit-kicked`, `last-participant-kicked`, or `last-participant-left`.
  """

  @type t :: String.t()

  @doc false
  def __schema__(:type),
    do:
      {:enum,
       [
         "conference-ended-via-api",
         "participant-with-end-conference-on-exit-left",
         "participant-with-end-conference-on-exit-kicked",
         "last-participant-kicked",
         "last-participant-left"
       ]}

  @doc "Decodes parsed JSON as this type."
  @spec decode(term) :: t | term
  def decode(json), do: Infusion.Runtime.Schema.decode_module(json, __MODULE__)
end
