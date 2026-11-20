defmodule Twilio.Schemas.SmsVerification.SendCodeAttempt do
  @moduledoc """
  ## Fields

    * `attempt_sid` - The SID of the verification attempt.
    * `time` - The date and time of the attempt in ISO 8601 format.
  """

  @derive {Inspect, except: [:__extra__, :__present__]}
  defstruct [:attempt_sid, :time, __extra__: %{}, __present__: []]

  @type t :: %__MODULE__{
          attempt_sid: String.t() | nil,
          time: String.t() | nil,
          __extra__: %{optional(String.t()) => term()},
          __present__: [atom()]
        }

  @doc false
  def __schema__(:fields) do
    [{:attempt_sid, "attempt_sid", :string}, {:time, "time", :string}]
  end

  def __schema__(:required), do: []
  def __schema__(:nullable), do: []
  def __schema__(:additional), do: nil

  @doc "Decodes parsed JSON into this struct."
  @spec decode(term) :: t | term
  def decode(json), do: Infusion.Runtime.Schema.decode_module(json, __MODULE__)
end
