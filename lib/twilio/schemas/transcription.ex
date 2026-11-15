defmodule Twilio.Schemas.Transcription do
  @moduledoc """
  ## Fields

    * `account_sid` - The SID of the [Account](https://www.twilio.com/docs/iam/api/account) that created the Transcription resource.
    * `api_version` - The API version used to create the transcription.
    * `date_created` - The date and time in GMT that the resource was created specified in [RFC 2822](https://www.ietf.org/rfc/rfc2822.txt) format.
    * `date_updated` - The date and time in GMT that the resource was last updated specified in [RFC 2822](https://www.ietf.org/rfc/rfc2822.txt) format.
    * `duration` - The duration of the transcribed audio in seconds.
    * `price` - The charge for the transcript in the currency associated with the account. This value is populated after the transcript is complete so it may not be available immediately.
    * `price_unit` - The currency in which `price` is measured, in [ISO 4127](https://www.iso.org/iso/home/standards/currency_codes.htm) format (e.g. `usd`, `eur`, `jpy`).
    * `recording_sid` - The SID of the [Recording](https://www.twilio.com/docs/voice/api/recording) from which the transcription was created.
    * `sid` - The unique string that that we created to identify the Transcription resource.
    * `status`
    * `transcription_text` - The text content of the transcription.
    * `type` - The transcription type. Can only be: `fast`.
    * `uri` - The URI of the resource, relative to `https://api.twilio.com`.
  """

  @derive {Inspect, except: [:__extra__, :__present__]}
  defstruct [
    :account_sid,
    :api_version,
    :date_created,
    :date_updated,
    :duration,
    :price,
    :price_unit,
    :recording_sid,
    :sid,
    :status,
    :transcription_text,
    :type,
    :uri,
    __extra__: %{},
    __present__: []
  ]

  @type t :: %__MODULE__{
          account_sid: String.t() | nil,
          api_version: String.t() | nil,
          date_created: String.t() | nil,
          date_updated: String.t() | nil,
          duration: String.t() | nil,
          price: number() | nil,
          price_unit: String.t() | nil,
          recording_sid: String.t() | nil,
          sid: String.t() | nil,
          status: Twilio.Schemas.TranscriptionEnumStatus.t() | nil,
          transcription_text: String.t() | nil,
          type: String.t() | nil,
          uri: String.t() | nil,
          __extra__: %{optional(String.t()) => term()},
          __present__: [atom()]
        }

  @doc false
  def __schema__(:fields) do
    [
      {:account_sid, "account_sid", :string},
      {:api_version, "api_version", :string},
      {:date_created, "date_created", :string},
      {:date_updated, "date_updated", :string},
      {:duration, "duration", :string},
      {:price, "price", :number},
      {:price_unit, "price_unit", :string},
      {:recording_sid, "recording_sid", :string},
      {:sid, "sid", :string},
      {:status, "status", {:ref, Twilio.Schemas.TranscriptionEnumStatus}},
      {:transcription_text, "transcription_text", :string},
      {:type, "type", :string},
      {:uri, "uri", :string}
    ]
  end

  @doc "Decodes parsed JSON into this struct."
  @spec decode(term) :: t | term
  def decode(json), do: Infusion.Runtime.Schema.decode_module(json, __MODULE__)
end
