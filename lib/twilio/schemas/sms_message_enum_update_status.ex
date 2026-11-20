defmodule Twilio.Schemas.SmsMessageEnumUpdateStatus do
  @moduledoc """
  One of `"canceled"`.
  """

  @type t :: String.t()

  @doc false
  def __schema__(:type), do: {:enum, ["canceled"]}

  @doc "Decodes parsed JSON as this type."
  @spec decode(term) :: t | term
  def decode(json), do: Infusion.Runtime.Schema.decode_module(json, __MODULE__)
end
