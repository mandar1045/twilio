defmodule Twilio.Schemas.AvailablePhoneNumbersListResponse do
  @moduledoc """
  ## Fields

    * `countries`
    * `uri`
  """

  @derive {Inspect, except: [:__extra__, :__present__]}
  defstruct [:countries, :uri, __extra__: %{}, __present__: []]

  @type t :: %__MODULE__{
          countries: [Twilio.Schemas.AvailablePhoneNumberCountry.t()] | nil,
          uri: String.t() | nil,
          __extra__: %{optional(String.t()) => term()},
          __present__: [atom()]
        }

  @doc false
  def __schema__(:fields) do
    [
      {:countries, "countries", {:array, {:ref, Twilio.Schemas.AvailablePhoneNumberCountry}}},
      {:uri, "uri", :string}
    ]
  end

  @doc "Decodes parsed JSON into this struct."
  @spec decode(term) :: t | term
  def decode(json), do: Infusion.Runtime.Schema.decode_module(json, __MODULE__)
end
