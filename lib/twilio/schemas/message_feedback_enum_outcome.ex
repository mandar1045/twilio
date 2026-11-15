defmodule Twilio.Schemas.MessageFeedbackEnumOutcome do
  @moduledoc """
  Reported outcome indicating whether there is confirmation that the Message recipient performed a tracked user action. Can be: `unconfirmed` or `confirmed`. For more details see [How to Optimize Message Deliverability with Message Feedback](https://www.twilio.com/docs/messaging/guides/send-message-feedback-to-twilio).
  """

  @type t :: String.t()

  @doc false
  def __schema__(:type), do: {:enum, ["confirmed", "unconfirmed"]}

  @doc "Decodes parsed JSON as this type."
  @spec decode(term) :: t | term
  def decode(json), do: Infusion.Runtime.Schema.decode_module(json, __MODULE__)
end
