defmodule Twilio.Schemas.Account do
  @moduledoc """
  ## Fields

    * `auth_token` - The authorization token for this account. This token should be kept a secret, so no sharing.
    * `date_created` - The date that this account was created, in GMT in RFC 2822 format
    * `date_updated` - The date that this account was last updated, in GMT in RFC 2822 format.
    * `friendly_name` - A human readable description of this account, up to 64 characters long. By default the FriendlyName is your email address.
    * `owner_account_sid` - The unique 34 character id that represents the parent of this account. The OwnerAccountSid of a parent account is it's own sid.
    * `sid` - A 34 character string that uniquely identifies this resource.
    * `status`
    * `subresource_uris` - A Map of various subresources available for the given Account Instance
    * `type`
    * `uri` - The URI for this resource, relative to `https://api.twilio.com`
  """

  @derive {Inspect, except: [:__extra__, :__present__]}
  defstruct [
    :auth_token,
    :date_created,
    :date_updated,
    :friendly_name,
    :owner_account_sid,
    :sid,
    :status,
    :subresource_uris,
    :type,
    :uri,
    __extra__: %{},
    __present__: []
  ]

  @type t :: %__MODULE__{
          auth_token: String.t() | nil,
          date_created: String.t() | nil,
          date_updated: String.t() | nil,
          friendly_name: String.t() | nil,
          owner_account_sid: String.t() | nil,
          sid: String.t() | nil,
          status: Twilio.Schemas.AccountEnumStatus.t() | nil,
          subresource_uris: map() | nil,
          type: Twilio.Schemas.AccountEnumType.t() | nil,
          uri: String.t() | nil,
          __extra__: %{optional(String.t()) => term()},
          __present__: [atom()]
        }

  @doc false
  def __schema__(:fields) do
    [
      {:auth_token, "auth_token", :string},
      {:date_created, "date_created", :string},
      {:date_updated, "date_updated", :string},
      {:friendly_name, "friendly_name", :string},
      {:owner_account_sid, "owner_account_sid", :string},
      {:sid, "sid", :string},
      {:status, "status", {:ref, Twilio.Schemas.AccountEnumStatus}},
      {:subresource_uris, "subresource_uris", :any},
      {:type, "type", {:ref, Twilio.Schemas.AccountEnumType}},
      {:uri, "uri", :string}
    ]
  end

  def __schema__(:required), do: []

  def __schema__(:nullable),
    do: [
      "auth_token",
      "date_created",
      "date_updated",
      "friendly_name",
      "owner_account_sid",
      "sid",
      "subresource_uris",
      "uri"
    ]

  def __schema__(:additional), do: nil

  @doc "Decodes parsed JSON into this struct."
  @spec decode(term) :: t | term
  def decode(json), do: Infusion.Runtime.Schema.decode_module(json, __MODULE__)
end
