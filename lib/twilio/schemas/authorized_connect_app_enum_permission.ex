defmodule Twilio.Schemas.AuthorizedConnectAppEnumPermission do
  @moduledoc """
  The set of permissions that you authorized for the Connect App.  Can be: `get-all` or `post-all`.
  """

  @type t :: String.t()

  @doc false
  def __schema__(:type), do: {:enum, ["get-all", "post-all"]}

  @doc "Decodes parsed JSON as this type."
  @spec decode(term) :: t | term
  def decode(json), do: Infusion.Runtime.Schema.decode_module(json, __MODULE__)
end
