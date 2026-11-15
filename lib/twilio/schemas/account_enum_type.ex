defmodule Twilio.Schemas.AccountEnumType do
  @moduledoc """
  The type of this account. Either `Trial` or `Full` if it's been upgraded
  """

  @type t :: String.t()

  @doc false
  def __schema__(:type), do: {:enum, ["Trial", "Full"]}

  @doc "Decodes parsed JSON as this type."
  @spec decode(term) :: t | term
  def decode(json), do: Infusion.Runtime.Schema.decode_module(json, __MODULE__)
end
