defmodule Twilio.Schemas.ValidationRequest do
  @moduledoc """
  ## Fields

    * `account_sid` - The SID of the [Account](https://www.twilio.com/docs/iam/api/account) responsible for the Caller ID.
    * `call_sid` - The SID of the [Call](https://www.twilio.com/docs/voice/api/call-resource) the Caller ID is associated with.
    * `friendly_name` - The string that you assigned to describe the resource.
    * `phone_number` - The phone number to verify in [E.164](https://www.twilio.com/docs/glossary/what-e164) format, which consists of a + followed by the country code and subscriber number.
    * `validation_code` - The 6 digit validation code that someone must enter to validate the Caller ID when `phone_number` is called.
  """

  @derive {Inspect, except: [:__extra__, :__present__]}
  defstruct [
    :account_sid,
    :call_sid,
    :friendly_name,
    :phone_number,
    :validation_code,
    __extra__: %{},
    __present__: []
  ]

  @type t :: %__MODULE__{
          account_sid: String.t() | nil,
          call_sid: String.t() | nil,
          friendly_name: String.t() | nil,
          phone_number: String.t() | nil,
          validation_code: String.t() | nil,
          __extra__: %{optional(String.t()) => term()},
          __present__: [atom()]
        }

  @doc false
  def __schema__(:fields) do
    [
      {:account_sid, "account_sid", :string},
      {:call_sid, "call_sid", :string},
      {:friendly_name, "friendly_name", :string},
      {:phone_number, "phone_number", :string},
      {:validation_code, "validation_code", :string}
    ]
  end

  def __schema__(:required), do: []

  def __schema__(:nullable),
    do: ["account_sid", "call_sid", "friendly_name", "phone_number", "validation_code"]

  def __schema__(:additional), do: nil

  @doc "Decodes parsed JSON into this struct."
  @spec decode(term) :: t | term
  def decode(json), do: Infusion.Runtime.Schema.decode_module(json, __MODULE__)
end
