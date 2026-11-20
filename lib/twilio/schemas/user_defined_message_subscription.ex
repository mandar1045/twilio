defmodule Twilio.Schemas.UserDefinedMessageSubscription do
  @moduledoc """
  ## Fields

    * `account_sid` - The SID of the [Account](https://www.twilio.com/docs/iam/api/account) that subscribed to the User Defined Messages.
    * `call_sid` - The SID of the [Call](https://www.twilio.com/docs/voice/api/call-resource) the User Defined Message Subscription is associated with. This refers to the Call SID that is producing the User Defined Messages.
    * `date_created` - The date that this User Defined Message Subscription was created, given in RFC 2822 format.
    * `sid` - The SID that uniquely identifies this User Defined Message Subscription.
    * `uri` - The URI of the User Defined Message Subscription Resource, relative to `https://api.twilio.com`.
  """

  @derive {Inspect, except: [:__extra__, :__present__]}
  defstruct [:account_sid, :call_sid, :date_created, :sid, :uri, __extra__: %{}, __present__: []]

  @type t :: %__MODULE__{
          account_sid: String.t() | nil,
          call_sid: String.t() | nil,
          date_created: String.t() | nil,
          sid: String.t() | nil,
          uri: String.t() | nil,
          __extra__: %{optional(String.t()) => term()},
          __present__: [atom()]
        }

  @doc false
  def __schema__(:fields) do
    [
      {:account_sid, "account_sid", :string},
      {:call_sid, "call_sid", :string},
      {:date_created, "date_created", :string},
      {:sid, "sid", :string},
      {:uri, "uri", :string}
    ]
  end

  def __schema__(:required), do: []
  def __schema__(:nullable), do: ["account_sid", "call_sid", "date_created", "sid", "uri"]
  def __schema__(:additional), do: nil

  @doc "Decodes parsed JSON into this struct."
  @spec decode(term) :: t | term
  def decode(json), do: Infusion.Runtime.Schema.decode_module(json, __MODULE__)
end
