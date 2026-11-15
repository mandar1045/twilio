defmodule Twilio.Schemas.IncomingPhoneNumberMobileEnumEmergencyAddressStatus do
  @moduledoc """
  The status of address registration with emergency services. A registered emergency address will be used during handling of emergency calls from this number.
  """

  @type t :: String.t()

  @doc false
  def __schema__(:type),
    do:
      {:enum,
       [
         "registered",
         "unregistered",
         "pending-registration",
         "registration-failure",
         "pending-unregistration",
         "unregistration-failure"
       ]}

  @doc "Decodes parsed JSON as this type."
  @spec decode(term) :: t | term
  def decode(json), do: Infusion.Runtime.Schema.decode_module(json, __MODULE__)
end
