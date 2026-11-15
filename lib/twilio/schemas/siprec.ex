defmodule Twilio.Schemas.Siprec do
  @moduledoc """
  ## Fields

    * `account_sid` - The SID of the [Account](https://www.twilio.com/docs/iam/api/account) that created this Siprec resource.
    * `call_sid` - The SID of the [Call](https://www.twilio.com/docs/voice/api/call-resource) the Siprec resource is associated with.
    * `date_updated` - The date and time in GMT that this resource was last updated, specified in [RFC 2822](https://www.ietf.org/rfc/rfc2822.txt) format.
    * `name` - The user-specified name of this Siprec, if one was given when the Siprec was created. This may be used to stop the Siprec.
    * `sid` - The SID of the Siprec resource.
    * `status`
    * `uri` - The URI of the resource, relative to `https://api.twilio.com`.
  """

  @derive {Inspect, except: [:__extra__, :__present__]}
  defstruct [
    :account_sid,
    :call_sid,
    :date_updated,
    :name,
    :sid,
    :status,
    :uri,
    __extra__: %{},
    __present__: []
  ]

  @type t :: %__MODULE__{
          account_sid: String.t() | nil,
          call_sid: String.t() | nil,
          date_updated: String.t() | nil,
          name: String.t() | nil,
          sid: String.t() | nil,
          status: Twilio.Schemas.SiprecEnumStatus.t() | nil,
          uri: String.t() | nil,
          __extra__: %{optional(String.t()) => term()},
          __present__: [atom()]
        }

  @doc false
  def __schema__(:fields) do
    [
      {:account_sid, "account_sid", :string},
      {:call_sid, "call_sid", :string},
      {:date_updated, "date_updated", :string},
      {:name, "name", :string},
      {:sid, "sid", :string},
      {:status, "status", {:ref, Twilio.Schemas.SiprecEnumStatus}},
      {:uri, "uri", :string}
    ]
  end

  @doc "Decodes parsed JSON into this struct."
  @spec decode(term) :: t | term
  def decode(json), do: Infusion.Runtime.Schema.decode_module(json, __MODULE__)
end
