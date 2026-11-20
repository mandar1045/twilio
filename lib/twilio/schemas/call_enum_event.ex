defmodule Twilio.Schemas.CallEnumEvent do
  @moduledoc """
  One of `"initiated"`, `"ringing"`, `"answered"`, `"completed"`.
  """

  @type t :: String.t()

  @doc false
  def __schema__(:type), do: {:enum, ["initiated", "ringing", "answered", "completed"]}

  @doc "Decodes parsed JSON as this type."
  @spec decode(term) :: t | term
  def decode(json), do: Infusion.Runtime.Schema.decode_module(json, __MODULE__)
end
