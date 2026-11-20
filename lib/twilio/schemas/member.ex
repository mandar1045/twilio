defmodule Twilio.Schemas.Member do
  @moduledoc """
  ## Fields

    * `call_sid` - The SID of the [Call](https://www.twilio.com/docs/voice/api/call-resource) the Member resource is associated with.
    * `date_enqueued` - The date that the member was enqueued, given in RFC 2822 format.
    * `position` - This member's current position in the queue.
    * `queue_sid` - The SID of the Queue the member is in.
    * `uri` - The URI of the resource, relative to `https://api.twilio.com`.
    * `wait_time` - The number of seconds the member has been in the queue.
  """

  @derive {Inspect, except: [:__extra__, :__present__]}
  defstruct [
    :call_sid,
    :date_enqueued,
    :position,
    :queue_sid,
    :uri,
    :wait_time,
    __extra__: %{},
    __present__: []
  ]

  @type t :: %__MODULE__{
          call_sid: String.t() | nil,
          date_enqueued: String.t() | nil,
          position: integer() | nil,
          queue_sid: String.t() | nil,
          uri: String.t() | nil,
          wait_time: integer() | nil,
          __extra__: %{optional(String.t()) => term()},
          __present__: [atom()]
        }

  @doc false
  def __schema__(:fields) do
    [
      {:call_sid, "call_sid", :string},
      {:date_enqueued, "date_enqueued", :string},
      {:position, "position", :integer},
      {:queue_sid, "queue_sid", :string},
      {:uri, "uri", :string},
      {:wait_time, "wait_time", :integer}
    ]
  end

  def __schema__(:required), do: []
  def __schema__(:nullable), do: ["call_sid", "date_enqueued", "queue_sid", "uri"]
  def __schema__(:additional), do: nil

  @doc "Decodes parsed JSON into this struct."
  @spec decode(term) :: t | term
  def decode(json), do: Infusion.Runtime.Schema.decode_module(json, __MODULE__)
end
