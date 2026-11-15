defmodule Twilio.Schemas.MessageEnumContentRetention do
  @moduledoc """
  Determines if the message content can be stored or redacted based on privacy settings
  """

  @type t :: String.t()

  @doc false
  def __schema__(:type), do: {:enum, ["retain", "discard"]}

  @doc "Decodes parsed JSON as this type."
  @spec decode(term) :: t | term
  def decode(json), do: Infusion.Runtime.Schema.decode_module(json, __MODULE__)
end
