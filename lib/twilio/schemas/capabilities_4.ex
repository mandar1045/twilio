defmodule Twilio.Schemas.AvailablePhoneNumberNational.Capabilities do
  @moduledoc """
  The set of Boolean properties that indicate whether a phone number can receive calls or messages.  Capabilities are: `Voice`, `SMS`, and `MMS` and each capability can be: `true` or `false`.

  ## Fields

    * `fax`
    * `mms`
    * `sms`
    * `voice`
  """

  @derive {Inspect, except: [:__extra__, :__present__]}
  defstruct [:fax, :mms, :sms, :voice, __extra__: %{}, __present__: []]

  @type t :: %__MODULE__{
          fax: boolean() | nil,
          mms: boolean() | nil,
          sms: boolean() | nil,
          voice: boolean() | nil,
          __extra__: %{optional(String.t()) => term()},
          __present__: [atom()]
        }

  @doc false
  def __schema__(:fields) do
    [
      {:fax, "fax", :boolean},
      {:mms, "mms", :boolean},
      {:sms, "sms", :boolean},
      {:voice, "voice", :boolean}
    ]
  end

  def __schema__(:required), do: []
  def __schema__(:nullable), do: []
  def __schema__(:additional), do: nil

  @doc "Decodes parsed JSON into this struct."
  @spec decode(term) :: t | term
  def decode(json), do: Infusion.Runtime.Schema.decode_module(json, __MODULE__)
end
