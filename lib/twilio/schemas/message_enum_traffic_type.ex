defmodule Twilio.Schemas.MessageEnumTrafficType do
  @moduledoc false

  @type t :: String.t()

  @doc false
  def __schema__(:type), do: {:enum, ["free"]}

  @doc "Decodes parsed JSON as this type."
  @spec decode(term) :: t | term
  def decode(json), do: Infusion.Runtime.Schema.decode_module(json, __MODULE__)
end
