defmodule Twilio.Schemas.MessageEnumScheduleType do
  @moduledoc """
  For Messaging Services only: Include this parameter with a value of `fixed` in conjuction with the `send_time` parameter in order to [schedule a Message](https://www.twilio.com/docs/messaging/features/message-scheduling).
  """

  @type t :: String.t()

  @doc false
  def __schema__(:type), do: {:enum, ["fixed"]}

  @doc "Decodes parsed JSON as this type."
  @spec decode(term) :: t | term
  def decode(json), do: Infusion.Runtime.Schema.decode_module(json, __MODULE__)
end
