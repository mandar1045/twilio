defmodule Twilio.Schemas.SiprecEnumStatus do
  @moduledoc """
  The status - one of `stopped`, `in-progress`
  """

  @type t :: String.t()

  @doc false
  def __schema__(:type), do: {:enum, ["in-progress", "stopped"]}

  @doc "Decodes parsed JSON as this type."
  @spec decode(term) :: t | term
  def decode(json), do: Infusion.Runtime.Schema.decode_module(json, __MODULE__)
end
