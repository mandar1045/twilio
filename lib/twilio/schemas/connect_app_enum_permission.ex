defmodule Twilio.Schemas.ConnectAppEnumPermission do
  @moduledoc """
  The set of permissions that your ConnectApp requests.
  """

  @type t :: String.t()

  @doc false
  def __schema__(:type), do: {:enum, ["get-all", "post-all"]}

  @doc "Decodes parsed JSON as this type."
  @spec decode(term) :: t | term
  def decode(json), do: Infusion.Runtime.Schema.decode_module(json, __MODULE__)
end
