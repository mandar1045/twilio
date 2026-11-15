defmodule Twilio.Schemas.Usage do
  @moduledoc false

  @derive {Inspect, except: [:__extra__, :__present__]}
  defstruct __extra__: %{}, __present__: []

  @type t :: %__MODULE__{
          __extra__: %{optional(String.t()) => term()},
          __present__: [atom()]
        }

  @doc false
  def __schema__(:fields) do
    []
  end

  @doc "Decodes parsed JSON into this struct."
  @spec decode(term) :: t | term
  def decode(json), do: Infusion.Runtime.Schema.decode_module(json, __MODULE__)
end
