defmodule Twilio.Schemas.MessageEnumAddressRetention do
  @moduledoc """
  Determines if the address can be stored or obfuscated based on privacy settings
  """

  @type t :: String.t()

  @doc false
  def __schema__(:type), do: {:enum, ["retain", "obfuscate"]}

  @doc "Decodes parsed JSON as this type."
  @spec decode(term) :: t | term
  def decode(json), do: Infusion.Runtime.Schema.decode_module(json, __MODULE__)
end
