defmodule Twilio.Schemas.Queue do
  @moduledoc """
  ## Fields

    * `account_sid` - The SID of the [Account](https://www.twilio.com/docs/iam/api/account) that created this Queue resource.
    * `average_wait_time` - The average wait time in seconds of the members in this queue. This is calculated at the time of the request.
    * `current_size` - The number of calls currently in the queue.
    * `date_created` - The date and time in GMT that this resource was created specified in [RFC 2822](https://www.ietf.org/rfc/rfc2822.txt) format.
    * `date_updated` - The date and time in GMT that this resource was last updated, specified in [RFC 2822](https://www.ietf.org/rfc/rfc2822.txt) format.
    * `friendly_name` - A string that you assigned to describe this resource.
    * `max_size` - The maximum number of calls that can be in the queue. The default is 1000 and the maximum is 5000.
    * `sid` - The unique string that that we created to identify this Queue resource.
    * `uri` - The URI of this resource, relative to `https://api.twilio.com`.
  """

  @derive {Inspect, except: [:__extra__, :__present__]}
  defstruct [
    :account_sid,
    :average_wait_time,
    :current_size,
    :date_created,
    :date_updated,
    :friendly_name,
    :max_size,
    :sid,
    :uri,
    __extra__: %{},
    __present__: []
  ]

  @type t :: %__MODULE__{
          account_sid: String.t() | nil,
          average_wait_time: integer() | nil,
          current_size: integer() | nil,
          date_created: String.t() | nil,
          date_updated: String.t() | nil,
          friendly_name: String.t() | nil,
          max_size: integer() | nil,
          sid: String.t() | nil,
          uri: String.t() | nil,
          __extra__: %{optional(String.t()) => term()},
          __present__: [atom()]
        }

  @doc false
  def __schema__(:fields) do
    [
      {:account_sid, "account_sid", :string},
      {:average_wait_time, "average_wait_time", :integer},
      {:current_size, "current_size", :integer},
      {:date_created, "date_created", :string},
      {:date_updated, "date_updated", :string},
      {:friendly_name, "friendly_name", :string},
      {:max_size, "max_size", :integer},
      {:sid, "sid", :string},
      {:uri, "uri", :string}
    ]
  end

  @doc "Decodes parsed JSON into this struct."
  @spec decode(term) :: t | term
  def decode(json), do: Infusion.Runtime.Schema.decode_module(json, __MODULE__)
end
