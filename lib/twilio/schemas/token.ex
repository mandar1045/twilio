defmodule Twilio.Schemas.Token do
  @moduledoc """
  ## Fields

    * `account_sid` - The SID of the [Account](https://www.twilio.com/docs/iam/api/account) that created the Token resource.
    * `date_created` - The date and time in GMT that the resource was created specified in [RFC 2822](https://www.ietf.org/rfc/rfc2822.txt) format.
    * `date_updated` - The date and time in GMT that the resource was last updated specified in [RFC 2822](https://www.ietf.org/rfc/rfc2822.txt) format.
    * `ice_servers` - An array representing the ephemeral credentials and the STUN and TURN server URIs.
    * `password` - The temporary password that the username will use when authenticating with Twilio.
    * `ttl` - The duration in seconds for which the username and password are valid.
    * `username` - The temporary username that uniquely identifies a Token.
  """

  @derive {Inspect, except: [:__extra__, :__present__]}
  defstruct [
    :account_sid,
    :date_created,
    :date_updated,
    :ice_servers,
    :password,
    :ttl,
    :username,
    __extra__: %{},
    __present__: []
  ]

  @type t :: %__MODULE__{
          account_sid: String.t() | nil,
          date_created: String.t() | nil,
          date_updated: String.t() | nil,
          ice_servers: [Twilio.Schemas.Token.IceServer.t()] | nil,
          password: String.t() | nil,
          ttl: String.t() | nil,
          username: String.t() | nil,
          __extra__: %{optional(String.t()) => term()},
          __present__: [atom()]
        }

  @doc false
  def __schema__(:fields) do
    [
      {:account_sid, "account_sid", :string},
      {:date_created, "date_created", :string},
      {:date_updated, "date_updated", :string},
      {:ice_servers, "ice_servers", {:array, {:ref, Twilio.Schemas.Token.IceServer}}},
      {:password, "password", :string},
      {:ttl, "ttl", :string},
      {:username, "username", :string}
    ]
  end

  def __schema__(:required), do: []

  def __schema__(:nullable),
    do: [
      "account_sid",
      "date_created",
      "date_updated",
      "ice_servers",
      "password",
      "ttl",
      "username"
    ]

  def __schema__(:additional), do: nil

  @doc "Decodes parsed JSON into this struct."
  @spec decode(term) :: t | term
  def decode(json), do: Infusion.Runtime.Schema.decode_module(json, __MODULE__)
end
