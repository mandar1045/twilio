defmodule Twilio.Schemas.UsageTrigger do
  @moduledoc """
  ## Fields

    * `account_sid` - The SID of the [Account](https://www.twilio.com/docs/iam/api/account) that the trigger monitors.
    * `api_version` - The API version used to create the resource.
    * `callback_method` - The HTTP method we use to call `callback_url`. Can be: `GET` or `POST`.
    * `callback_url` - The URL we call using the `callback_method` when the trigger fires.
    * `current_value` - The current value of the field the trigger is watching.
    * `date_created` - The date and time in GMT that the resource was created specified in [RFC 2822](https://www.ietf.org/rfc/rfc2822.txt) format.
    * `date_fired` - The date and time in GMT that the trigger was last fired specified in [RFC 2822](https://www.ietf.org/rfc/rfc2822.txt) format.
    * `date_updated` - The date and time in GMT that the resource was last updated specified in [RFC 2822](https://www.ietf.org/rfc/rfc2822.txt) format.
    * `friendly_name` - The string that you assigned to describe the trigger.
    * `recurring`
    * `sid` - The unique string that that we created to identify the UsageTrigger resource.
    * `trigger_by`
    * `trigger_value` - The value at which the trigger will fire. Must be a positive, numeric value.
    * `uri` - The URI of the resource, relative to `https://api.twilio.com`.
    * `usage_category` - The usage category the trigger watches. Must be one of the supported [usage categories](https://www.twilio.com/docs/usage/api/usage-record#usage-categories).
    * `usage_record_uri` - The URI of the [UsageRecord](https://www.twilio.com/docs/usage/api/usage-record) resource this trigger watches, relative to `https://api.twilio.com`.
  """

  @derive {Inspect, except: [:__extra__, :__present__]}
  defstruct [
    :account_sid,
    :api_version,
    :callback_method,
    :callback_url,
    :current_value,
    :date_created,
    :date_fired,
    :date_updated,
    :friendly_name,
    :recurring,
    :sid,
    :trigger_by,
    :trigger_value,
    :uri,
    :usage_category,
    :usage_record_uri,
    __extra__: %{},
    __present__: []
  ]

  @type t :: %__MODULE__{
          account_sid: String.t() | nil,
          api_version: String.t() | nil,
          callback_method: String.t() | nil,
          callback_url: String.t() | nil,
          current_value: String.t() | nil,
          date_created: String.t() | nil,
          date_fired: String.t() | nil,
          date_updated: String.t() | nil,
          friendly_name: String.t() | nil,
          recurring: Twilio.Schemas.UsageTriggerEnumRecurring.t() | nil,
          sid: String.t() | nil,
          trigger_by: Twilio.Schemas.UsageTriggerEnumTriggerField.t() | nil,
          trigger_value: String.t() | nil,
          uri: String.t() | nil,
          usage_category: String.t() | nil,
          usage_record_uri: String.t() | nil,
          __extra__: %{optional(String.t()) => term()},
          __present__: [atom()]
        }

  @doc false
  def __schema__(:fields) do
    [
      {:account_sid, "account_sid", :string},
      {:api_version, "api_version", :string},
      {:callback_method, "callback_method", {:enum, ["GET", "POST"]}},
      {:callback_url, "callback_url", :string},
      {:current_value, "current_value", :string},
      {:date_created, "date_created", :string},
      {:date_fired, "date_fired", :string},
      {:date_updated, "date_updated", :string},
      {:friendly_name, "friendly_name", :string},
      {:recurring, "recurring", {:ref, Twilio.Schemas.UsageTriggerEnumRecurring}},
      {:sid, "sid", :string},
      {:trigger_by, "trigger_by", {:ref, Twilio.Schemas.UsageTriggerEnumTriggerField}},
      {:trigger_value, "trigger_value", :string},
      {:uri, "uri", :string},
      {:usage_category, "usage_category", :string},
      {:usage_record_uri, "usage_record_uri", :string}
    ]
  end

  def __schema__(:required), do: []

  def __schema__(:nullable),
    do: [
      "account_sid",
      "api_version",
      "callback_method",
      "callback_url",
      "current_value",
      "date_created",
      "date_fired",
      "date_updated",
      "friendly_name",
      "sid",
      "trigger_value",
      "uri",
      "usage_category",
      "usage_record_uri"
    ]

  def __schema__(:additional), do: nil

  @doc "Decodes parsed JSON into this struct."
  @spec decode(term) :: t | term
  def decode(json), do: Infusion.Runtime.Schema.decode_module(json, __MODULE__)
end
