defmodule Twilio.Schemas.IncomingPhoneNumberAssignedAddOn do
  @moduledoc """
  ## Fields

    * `account_sid` - The SID of the [Account](https://www.twilio.com/docs/iam/api/account) that created the resource.
    * `configuration` - A JSON string that represents the current configuration of this Add-on installation.
    * `date_created` - The date and time in GMT that the resource was created specified in [RFC 2822](https://www.ietf.org/rfc/rfc2822.txt) format.
    * `date_updated` - The date and time in GMT that the resource was last updated specified in [RFC 2822](https://www.ietf.org/rfc/rfc2822.txt) format.
    * `description` - A short description of the functionality that the Add-on provides.
    * `friendly_name` - The string that you assigned to describe the resource.
    * `resource_sid` - The SID of the Phone Number to which the Add-on is assigned.
    * `sid` - The unique string that that we created to identify the resource.
    * `subresource_uris` - A list of related resources identified by their relative URIs.
    * `unique_name` - An application-defined string that uniquely identifies the resource. It can be used in place of the resource's `sid` in the URL to address the resource.
    * `uri` - The URI of the resource, relative to `https://api.twilio.com`.
  """

  @derive {Inspect, except: [:__extra__, :__present__]}
  defstruct [
    :account_sid,
    :configuration,
    :date_created,
    :date_updated,
    :description,
    :friendly_name,
    :resource_sid,
    :sid,
    :subresource_uris,
    :unique_name,
    :uri,
    __extra__: %{},
    __present__: []
  ]

  @type t :: %__MODULE__{
          account_sid: String.t() | nil,
          configuration: term() | nil,
          date_created: String.t() | nil,
          date_updated: String.t() | nil,
          description: String.t() | nil,
          friendly_name: String.t() | nil,
          resource_sid: String.t() | nil,
          sid: String.t() | nil,
          subresource_uris: map() | nil,
          unique_name: String.t() | nil,
          uri: String.t() | nil,
          __extra__: %{optional(String.t()) => term()},
          __present__: [atom()]
        }

  @doc false
  def __schema__(:fields) do
    [
      {:account_sid, "account_sid", :string},
      {:configuration, "configuration", :any},
      {:date_created, "date_created", :string},
      {:date_updated, "date_updated", :string},
      {:description, "description", :string},
      {:friendly_name, "friendly_name", :string},
      {:resource_sid, "resource_sid", :string},
      {:sid, "sid", :string},
      {:subresource_uris, "subresource_uris", :any},
      {:unique_name, "unique_name", :string},
      {:uri, "uri", :string}
    ]
  end

  @doc "Decodes parsed JSON into this struct."
  @spec decode(term) :: t | term
  def decode(json), do: Infusion.Runtime.Schema.decode_module(json, __MODULE__)
end
