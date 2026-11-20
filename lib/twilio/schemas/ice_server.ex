defmodule Twilio.Schemas.Token.IceServer do
  @moduledoc """
  ## Fields

    * `credential`
    * `url`
    * `urls`
    * `username`
  """

  @derive {Inspect, except: [:__extra__, :__present__]}
  defstruct [:credential, :url, :urls, :username, __extra__: %{}, __present__: []]

  @type t :: %__MODULE__{
          credential: String.t() | nil,
          url: String.t() | nil,
          urls: String.t() | nil,
          username: String.t() | nil,
          __extra__: %{optional(String.t()) => term()},
          __present__: [atom()]
        }

  @doc false
  def __schema__(:fields) do
    [
      {:credential, "credential", :string},
      {:url, "url", :string},
      {:urls, "urls", :string},
      {:username, "username", :string}
    ]
  end

  def __schema__(:required), do: []
  def __schema__(:nullable), do: []
  def __schema__(:additional), do: nil

  @doc "Decodes parsed JSON into this struct."
  @spec decode(term) :: t | term
  def decode(json), do: Infusion.Runtime.Schema.decode_module(json, __MODULE__)
end
