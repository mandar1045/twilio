defmodule Twilio.Schemas.RecordingAddOnResultPayload do
  @moduledoc """
  ## Fields

    * `account_sid` - The SID of the [Account](https://www.twilio.com/docs/iam/api/account) that created the Recording AddOnResult Payload resource.
    * `add_on_configuration_sid` - The SID of the Add-on configuration.
    * `add_on_result_sid` - The SID of the AddOnResult to which the payload belongs.
    * `add_on_sid` - The SID of the Add-on to which the result belongs.
    * `content_type` - The MIME type of the payload.
    * `date_created` - The date and time in GMT that the resource was created specified in [RFC 2822](https://www.ietf.org/rfc/rfc2822.txt) format.
    * `date_updated` - The date and time in GMT that the resource was last updated specified in [RFC 2822](https://www.ietf.org/rfc/rfc2822.txt) format.
    * `label` - The string provided by the vendor that describes the payload.
    * `reference_sid` - The SID of the recording to which the AddOnResult resource that contains the payload belongs.
    * `sid` - The unique string that that we created to identify the Recording AddOnResult Payload resource.
    * `subresource_uris` - A list of related resources identified by their relative URIs.
  """

  @derive {Inspect, except: [:__extra__, :__present__]}
  defstruct [
    :account_sid,
    :add_on_configuration_sid,
    :add_on_result_sid,
    :add_on_sid,
    :content_type,
    :date_created,
    :date_updated,
    :label,
    :reference_sid,
    :sid,
    :subresource_uris,
    __extra__: %{},
    __present__: []
  ]

  @type t :: %__MODULE__{
          account_sid: String.t() | nil,
          add_on_configuration_sid: String.t() | nil,
          add_on_result_sid: String.t() | nil,
          add_on_sid: String.t() | nil,
          content_type: String.t() | nil,
          date_created: String.t() | nil,
          date_updated: String.t() | nil,
          label: String.t() | nil,
          reference_sid: String.t() | nil,
          sid: String.t() | nil,
          subresource_uris: map() | nil,
          __extra__: %{optional(String.t()) => term()},
          __present__: [atom()]
        }

  @doc false
  def __schema__(:fields) do
    [
      {:account_sid, "account_sid", :string},
      {:add_on_configuration_sid, "add_on_configuration_sid", :string},
      {:add_on_result_sid, "add_on_result_sid", :string},
      {:add_on_sid, "add_on_sid", :string},
      {:content_type, "content_type", :string},
      {:date_created, "date_created", :string},
      {:date_updated, "date_updated", :string},
      {:label, "label", :string},
      {:reference_sid, "reference_sid", :string},
      {:sid, "sid", :string},
      {:subresource_uris, "subresource_uris", :any}
    ]
  end

  @doc "Decodes parsed JSON into this struct."
  @spec decode(term) :: t | term
  def decode(json), do: Infusion.Runtime.Schema.decode_module(json, __MODULE__)
end
