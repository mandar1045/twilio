defmodule Twilio.Schemas.CallEvent do
  @moduledoc """
  ## Fields

    * `request` - Contains a dictionary representing the request of the call.
    * `response` - Contains a dictionary representing the call response, including a list of the call events.
  """

  @derive {Inspect, except: [:__extra__, :__present__]}
  defstruct [:request, :response, __extra__: %{}, __present__: []]

  @type t :: %__MODULE__{
          request: term() | nil,
          response: term() | nil,
          __extra__: %{optional(String.t()) => term()},
          __present__: [atom()]
        }

  @doc false
  def __schema__(:fields) do
    [{:request, "request", :any}, {:response, "response", :any}]
  end

  def __schema__(:required), do: []
  def __schema__(:nullable), do: ["request", "response"]
  def __schema__(:additional), do: nil

  @doc "Decodes parsed JSON into this struct."
  @spec decode(term) :: t | term
  def decode(json), do: Infusion.Runtime.Schema.decode_module(json, __MODULE__)
end
