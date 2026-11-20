defmodule Twilio.Schemas.ConferenceRecording do
  @moduledoc """
  ## Fields

    * `account_sid` - The SID of the [Account](https://www.twilio.com/docs/iam/api/account) that created the Conference Recording resource.
    * `api_version` - The API version used to create the recording.
    * `call_sid` - The SID of the [Call](https://www.twilio.com/docs/voice/api/call-resource) the Conference Recording resource is associated with.
    * `channels` - The number of channels in the final recording file. Can be: `1`, or `2`. Separating a two leg call into two separate channels of the recording file is supported in [Dial](https://www.twilio.com/docs/voice/twiml/dial#attributes-record) and [Outbound Rest API](https://www.twilio.com/docs/voice/make-calls) record options.
    * `conference_sid` - The Conference SID that identifies the conference associated with the recording.
    * `date_created` - The date and time in GMT that the resource was created specified in [RFC 2822](https://www.ietf.org/rfc/rfc2822.txt) format.
    * `date_updated` - The date and time in GMT that the resource was last updated, specified in [RFC 2822](https://www.ietf.org/rfc/rfc2822.txt) format.
    * `duration` - The length of the recording in seconds.
    * `encryption_details` - How to decrypt the recording if it was encrypted using [Call Recording Encryption](https://www.twilio.com/docs/voice/tutorials/voice-recording-encryption) feature.
    * `error_code` - The error code that describes why the recording is `absent`. The error code is described in our [Error Dictionary](https://www.twilio.com/docs/api/errors). This value is null if the recording `status` is not `absent`.
    * `price` - The one-time cost of creating the recording in the `price_unit` currency.
    * `price_unit` - The currency used in the `price` property. Example: `USD`.
    * `sid` - The unique string that that we created to identify the Conference Recording resource.
    * `source`
    * `start_time` - The start time of the recording in GMT and in [RFC 2822](https://www.php.net/manual/en/class.datetime.php#datetime.constants.rfc2822) format.
    * `status`
    * `uri` - The URI of the resource, relative to `https://api.twilio.com`.
  """

  @derive {Inspect, except: [:__extra__, :__present__]}
  defstruct [
    :account_sid,
    :api_version,
    :call_sid,
    :channels,
    :conference_sid,
    :date_created,
    :date_updated,
    :duration,
    :encryption_details,
    :error_code,
    :price,
    :price_unit,
    :sid,
    :source,
    :start_time,
    :status,
    :uri,
    __extra__: %{},
    __present__: []
  ]

  @type t :: %__MODULE__{
          account_sid: String.t() | nil,
          api_version: String.t() | nil,
          call_sid: String.t() | nil,
          channels: integer() | nil,
          conference_sid: String.t() | nil,
          date_created: String.t() | nil,
          date_updated: String.t() | nil,
          duration: String.t() | nil,
          encryption_details: term() | nil,
          error_code: integer() | nil,
          price: String.t() | nil,
          price_unit: String.t() | nil,
          sid: String.t() | nil,
          source: Twilio.Schemas.ConferenceRecordingEnumSource.t() | nil,
          start_time: String.t() | nil,
          status: Twilio.Schemas.ConferenceRecordingEnumStatus.t() | nil,
          uri: String.t() | nil,
          __extra__: %{optional(String.t()) => term()},
          __present__: [atom()]
        }

  @doc false
  def __schema__(:fields) do
    [
      {:account_sid, "account_sid", :string},
      {:api_version, "api_version", :string},
      {:call_sid, "call_sid", :string},
      {:channels, "channels", :integer},
      {:conference_sid, "conference_sid", :string},
      {:date_created, "date_created", :string},
      {:date_updated, "date_updated", :string},
      {:duration, "duration", :string},
      {:encryption_details, "encryption_details", :any},
      {:error_code, "error_code", :integer},
      {:price, "price", :string},
      {:price_unit, "price_unit", :string},
      {:sid, "sid", :string},
      {:source, "source", {:ref, Twilio.Schemas.ConferenceRecordingEnumSource}},
      {:start_time, "start_time", :string},
      {:status, "status", {:ref, Twilio.Schemas.ConferenceRecordingEnumStatus}},
      {:uri, "uri", :string}
    ]
  end

  def __schema__(:required), do: []

  def __schema__(:nullable),
    do: [
      "account_sid",
      "api_version",
      "call_sid",
      "conference_sid",
      "date_created",
      "date_updated",
      "duration",
      "encryption_details",
      "error_code",
      "price",
      "price_unit",
      "sid",
      "start_time",
      "uri"
    ]

  def __schema__(:additional), do: nil

  @doc "Decodes parsed JSON into this struct."
  @spec decode(term) :: t | term
  def decode(json), do: Infusion.Runtime.Schema.decode_module(json, __MODULE__)
end
