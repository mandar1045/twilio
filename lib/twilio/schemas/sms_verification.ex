defmodule Twilio.Schemas.SmsVerification do
  @moduledoc """
  ## Fields

    * `phone_number` - The phone number being verified in [E.164](https://www.twilio.com/docs/glossary/what-e164) format.
    * `send_code_attempts` - An array of verification attempt objects containing the channel attempted and the channel-specific transaction SID.
    * `verification_sid` - The SID that uniquely identifies the verification.
  """

  @derive {Inspect, except: [:__extra__, :__present__]}
  defstruct [
    :phone_number,
    :send_code_attempts,
    :verification_sid,
    __extra__: %{},
    __present__: []
  ]

  @type t :: %__MODULE__{
          phone_number: String.t() | nil,
          send_code_attempts: [Twilio.Schemas.SmsVerification.SendCodeAttempt.t()] | nil,
          verification_sid: String.t() | nil,
          __extra__: %{optional(String.t()) => term()},
          __present__: [atom()]
        }

  @doc false
  def __schema__(:fields) do
    [
      {:phone_number, "phone_number", :string},
      {:send_code_attempts, "send_code_attempts",
       {:array, {:ref, Twilio.Schemas.SmsVerification.SendCodeAttempt}}},
      {:verification_sid, "verification_sid", :string}
    ]
  end

  def __schema__(:required), do: []
  def __schema__(:nullable), do: ["phone_number", "send_code_attempts", "verification_sid"]
  def __schema__(:additional), do: nil

  @doc "Decodes parsed JSON into this struct."
  @spec decode(term) :: t | term
  def decode(json), do: Infusion.Runtime.Schema.decode_module(json, __MODULE__)
end
