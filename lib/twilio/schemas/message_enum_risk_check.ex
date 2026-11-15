defmodule Twilio.Schemas.MessageEnumRiskCheck do
  @moduledoc """
  Include this parameter with a value of `disable` to skip any kind of risk check on the respective message request.
  """

  @type t :: String.t()

  @doc false
  def __schema__(:type), do: {:enum, ["enable", "disable"]}

  @doc "Decodes parsed JSON as this type."
  @spec decode(term) :: t | term
  def decode(json), do: Infusion.Runtime.Schema.decode_module(json, __MODULE__)
end
