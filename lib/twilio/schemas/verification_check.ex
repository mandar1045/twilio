defmodule Twilio.Schemas.VerificationCheck do
  @moduledoc """
  ## Fields

    * `caller_id_sid` - The SID of the OutgoingCallerId resource created when verification is approved.
    * `phone_number` - The phone number being verified in [E.164](https://www.twilio.com/docs/glossary/what-e164) format.
    * `status` - The status of the verification. Can be: `pending`, `approved`, or `failed`.
    * `verification_sid` - The SID that uniquely identifies the verification.
  """

  @derive {Inspect, except: [:__extra__, :__present__]}
  defstruct [
    :caller_id_sid,
    :phone_number,
    :status,
    :verification_sid,
    __extra__: %{},
    __present__: []
  ]

  @type t :: %__MODULE__{
          caller_id_sid: String.t() | nil,
          phone_number: String.t() | nil,
          status: String.t() | nil,
          verification_sid: String.t() | nil,
          __extra__: %{optional(String.t()) => term()},
          __present__: [atom()]
        }

  @doc false
  def __schema__(:fields) do
    [
      {:caller_id_sid, "caller_id_sid", :string},
      {:phone_number, "phone_number", :string},
      {:status, "status", :string},
      {:verification_sid, "verification_sid", :string}
    ]
  end

  def __schema__(:required), do: []
  def __schema__(:nullable), do: ["caller_id_sid", "phone_number", "status", "verification_sid"]
  def __schema__(:additional), do: nil

  @doc "Decodes parsed JSON into this struct."
  @spec decode(term) :: t | term
  def decode(json), do: Infusion.Runtime.Schema.decode_module(json, __MODULE__)
end
