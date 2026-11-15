defmodule Twilio.Schemas.DependentPhoneNumberEnumEmergencyStatus do
  @moduledoc """
  Whether the phone number is enabled for emergency calling.
  """

  @type t :: String.t()

  @doc false
  def __schema__(:type), do: {:enum, ["Active", "Inactive"]}

  @doc "Decodes parsed JSON as this type."
  @spec decode(term) :: t | term
  def decode(json), do: Infusion.Runtime.Schema.decode_module(json, __MODULE__)
end
