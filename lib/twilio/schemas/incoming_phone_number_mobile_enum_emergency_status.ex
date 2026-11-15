defmodule Twilio.Schemas.IncomingPhoneNumberMobileEnumEmergencyStatus do
  @moduledoc """
  The parameter displays if emergency calling is enabled for this number. Active numbers may place emergency calls by dialing valid emergency numbers for the country.
  """

  @type t :: String.t()

  @doc false
  def __schema__(:type), do: {:enum, ["Active", "Inactive"]}

  @doc "Decodes parsed JSON as this type."
  @spec decode(term) :: t | term
  def decode(json), do: Infusion.Runtime.Schema.decode_module(json, __MODULE__)
end
