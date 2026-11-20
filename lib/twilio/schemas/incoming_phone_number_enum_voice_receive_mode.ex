defmodule Twilio.Schemas.IncomingPhoneNumberEnumVoiceReceiveMode do
  @moduledoc """
  One of `"voice"`, `"fax"`.
  """

  @type t :: String.t()

  @doc false
  def __schema__(:type), do: {:enum, ["voice", "fax"]}

  @doc "Decodes parsed JSON as this type."
  @spec decode(term) :: t | term
  def decode(json), do: Infusion.Runtime.Schema.decode_module(json, __MODULE__)
end
