defmodule Twilio.Schemas.AccountEnumStatus do
  @moduledoc """
  The status of this account. Usually `active`, but can be `suspended` or `closed`.
  """

  @type t :: String.t()

  @doc false
  def __schema__(:type), do: {:enum, ["active", "suspended", "closed"]}

  @doc "Decodes parsed JSON as this type."
  @spec decode(term) :: t | term
  def decode(json), do: Infusion.Runtime.Schema.decode_module(json, __MODULE__)
end
