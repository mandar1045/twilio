defmodule Twilio.Schemas.ConferenceEnumStatus do
  @moduledoc """
  The status of this conference. Can be: `init`, `in-progress`, or `completed`.
  """

  @type t :: String.t()

  @doc false
  def __schema__(:type), do: {:enum, ["init", "in-progress", "completed"]}

  @doc "Decodes parsed JSON as this type."
  @spec decode(term) :: t | term
  def decode(json), do: Infusion.Runtime.Schema.decode_module(json, __MODULE__)
end
