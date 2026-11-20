defmodule Twilio.Schemas.SiprecEnumUpdateStatus do
  @moduledoc """
  One of `"stopped"`.
  """

  @type t :: String.t()

  @doc false
  def __schema__(:type), do: {:enum, ["stopped"]}

  @doc "Decodes parsed JSON as this type."
  @spec decode(term) :: t | term
  def decode(json), do: Infusion.Runtime.Schema.decode_module(json, __MODULE__)
end
