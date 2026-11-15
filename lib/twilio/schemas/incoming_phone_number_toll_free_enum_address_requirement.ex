defmodule Twilio.Schemas.IncomingPhoneNumberTollFreeEnumAddressRequirement do
  @moduledoc """
  Whether the phone number requires an [Address](https://www.twilio.com/docs/usage/api/address) registered with Twilio. Can be: `none`, `any`, `local`, or `foreign`.
  """

  @type t :: String.t()

  @doc false
  def __schema__(:type), do: {:enum, ["none", "any", "local", "foreign"]}

  @doc "Decodes parsed JSON as this type."
  @spec decode(term) :: t | term
  def decode(json), do: Infusion.Runtime.Schema.decode_module(json, __MODULE__)
end
