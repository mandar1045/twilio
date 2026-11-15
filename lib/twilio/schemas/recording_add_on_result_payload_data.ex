defmodule Twilio.Schemas.RecordingAddOnResultPayloadData do
  @moduledoc """
  ## Fields

    * `redirect_to` - The URL to redirect to to get the data returned by the AddOn that was previously stored.
  """

  @derive {Inspect, except: [:__extra__, :__present__]}
  defstruct [:redirect_to, __extra__: %{}, __present__: []]

  @type t :: %__MODULE__{
          redirect_to: String.t() | nil,
          __extra__: %{optional(String.t()) => term()},
          __present__: [atom()]
        }

  @doc false
  def __schema__(:fields) do
    [{:redirect_to, "redirect_to", :string}]
  end

  @doc "Decodes parsed JSON into this struct."
  @spec decode(term) :: t | term
  def decode(json), do: Infusion.Runtime.Schema.decode_module(json, __MODULE__)
end
