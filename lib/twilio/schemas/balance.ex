defmodule Twilio.Schemas.Balance do
  @moduledoc """
  ## Fields

    * `account_sid` - The unique SID identifier of the Account.
    * `balance` - The balance of the Account, in units specified by the unit parameter. Balance changes may not be reflected immediately. Child accounts do not contain balance information
    * `currency` - The units of currency for the account balance
  """

  @derive {Inspect, except: [:__extra__, :__present__]}
  defstruct [:account_sid, :balance, :currency, __extra__: %{}, __present__: []]

  @type t :: %__MODULE__{
          account_sid: String.t() | nil,
          balance: String.t() | nil,
          currency: String.t() | nil,
          __extra__: %{optional(String.t()) => term()},
          __present__: [atom()]
        }

  @doc false
  def __schema__(:fields) do
    [
      {:account_sid, "account_sid", :string},
      {:balance, "balance", :string},
      {:currency, "currency", :string}
    ]
  end

  def __schema__(:required), do: []
  def __schema__(:nullable), do: ["account_sid", "balance", "currency"]
  def __schema__(:additional), do: nil

  @doc "Decodes parsed JSON into this struct."
  @spec decode(term) :: t | term
  def decode(json), do: Infusion.Runtime.Schema.decode_module(json, __MODULE__)
end
