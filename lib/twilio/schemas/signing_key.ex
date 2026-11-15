defmodule Twilio.Schemas.SigningKey do
  @moduledoc """
  ## Fields

    * `date_created`
    * `date_updated`
    * `friendly_name`
    * `sid`
  """

  @derive {Inspect, except: [:__extra__, :__present__]}
  defstruct [:date_created, :date_updated, :friendly_name, :sid, __extra__: %{}, __present__: []]

  @type t :: %__MODULE__{
          date_created: String.t() | nil,
          date_updated: String.t() | nil,
          friendly_name: String.t() | nil,
          sid: String.t() | nil,
          __extra__: %{optional(String.t()) => term()},
          __present__: [atom()]
        }

  @doc false
  def __schema__(:fields) do
    [
      {:date_created, "date_created", :string},
      {:date_updated, "date_updated", :string},
      {:friendly_name, "friendly_name", :string},
      {:sid, "sid", :string}
    ]
  end

  @doc "Decodes parsed JSON into this struct."
  @spec decode(term) :: t | term
  def decode(json), do: Infusion.Runtime.Schema.decode_module(json, __MODULE__)
end
