defmodule Twilio.Schemas.CallEnumUpdateStatus do
  @moduledoc false

  @type t :: String.t()

  @doc false
  def __schema__(:type), do: {:enum, ["canceled", "completed"]}

  @doc "Decodes parsed JSON as this type."
  @spec decode(term) :: t | term
  def decode(json), do: Infusion.Runtime.Schema.decode_module(json, __MODULE__)
end
