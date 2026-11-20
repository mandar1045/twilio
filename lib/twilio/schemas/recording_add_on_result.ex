defmodule Twilio.Schemas.RecordingAddOnResult do
  @moduledoc """
  ## Fields

    * `account_sid` - The SID of the [Account](https://www.twilio.com/docs/iam/api/account) that created the Recording AddOnResult resource.
    * `add_on_configuration_sid` - The SID of the Add-on configuration.
    * `add_on_sid` - The SID of the Add-on to which the result belongs.
    * `date_completed` - The date and time in GMT that the result was completed specified in [RFC 2822](https://www.ietf.org/rfc/rfc2822.txt) format.
    * `date_created` - The date and time in GMT that the resource was created specified in [RFC 2822](https://www.ietf.org/rfc/rfc2822.txt) format.
    * `date_updated` - The date and time in GMT that the resource was last updated specified in [RFC 2822](https://www.ietf.org/rfc/rfc2822.txt) format.
    * `reference_sid` - The SID of the recording to which the AddOnResult resource belongs.
    * `sid` - The unique string that that we created to identify the Recording AddOnResult resource.
    * `status`
    * `subresource_uris` - A list of related resources identified by their relative URIs.
  """

  @derive {Inspect, except: [:__extra__, :__present__]}
  defstruct [
    :account_sid,
    :add_on_configuration_sid,
    :add_on_sid,
    :date_completed,
    :date_created,
    :date_updated,
    :reference_sid,
    :sid,
    :status,
    :subresource_uris,
    __extra__: %{},
    __present__: []
  ]

  @type t :: %__MODULE__{
          account_sid: String.t() | nil,
          add_on_configuration_sid: String.t() | nil,
          add_on_sid: String.t() | nil,
          date_completed: String.t() | nil,
          date_created: String.t() | nil,
          date_updated: String.t() | nil,
          reference_sid: String.t() | nil,
          sid: String.t() | nil,
          status: Twilio.Schemas.RecordingAddOnResultEnumStatus.t() | nil,
          subresource_uris: map() | nil,
          __extra__: %{optional(String.t()) => term()},
          __present__: [atom()]
        }

  @doc false
  def __schema__(:fields) do
    [
      {:account_sid, "account_sid", :string},
      {:add_on_configuration_sid, "add_on_configuration_sid", :string},
      {:add_on_sid, "add_on_sid", :string},
      {:date_completed, "date_completed", :string},
      {:date_created, "date_created", :string},
      {:date_updated, "date_updated", :string},
      {:reference_sid, "reference_sid", :string},
      {:sid, "sid", :string},
      {:status, "status", {:ref, Twilio.Schemas.RecordingAddOnResultEnumStatus}},
      {:subresource_uris, "subresource_uris", :any}
    ]
  end

  def __schema__(:required), do: []

  def __schema__(:nullable),
    do: [
      "account_sid",
      "add_on_configuration_sid",
      "add_on_sid",
      "date_completed",
      "date_created",
      "date_updated",
      "reference_sid",
      "sid",
      "subresource_uris"
    ]

  def __schema__(:additional), do: nil

  @doc "Decodes parsed JSON into this struct."
  @spec decode(term) :: t | term
  def decode(json), do: Infusion.Runtime.Schema.decode_module(json, __MODULE__)
end
