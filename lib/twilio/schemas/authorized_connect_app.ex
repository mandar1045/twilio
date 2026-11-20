defmodule Twilio.Schemas.AuthorizedConnectApp do
  @moduledoc """
  ## Fields

    * `account_sid` - The SID of the [Account](https://www.twilio.com/docs/iam/api/account) that created the AuthorizedConnectApp resource.
    * `connect_app_company_name` - The company name set for the Connect App.
    * `connect_app_description` - A detailed description of the Connect App.
    * `connect_app_friendly_name` - The name of the Connect App.
    * `connect_app_homepage_url` - The public URL for the Connect App.
    * `connect_app_sid` - The SID that we assigned to the Connect App.
    * `permissions` - The set of permissions that you authorized for the Connect App. Can be: `get-all` or `post-all`.
    * `uri` - The URI of the resource, relative to `https://api.twilio.com`.
  """

  @derive {Inspect, except: [:__extra__, :__present__]}
  defstruct [
    :account_sid,
    :connect_app_company_name,
    :connect_app_description,
    :connect_app_friendly_name,
    :connect_app_homepage_url,
    :connect_app_sid,
    :permissions,
    :uri,
    __extra__: %{},
    __present__: []
  ]

  @type t :: %__MODULE__{
          account_sid: String.t() | nil,
          connect_app_company_name: String.t() | nil,
          connect_app_description: String.t() | nil,
          connect_app_friendly_name: String.t() | nil,
          connect_app_homepage_url: String.t() | nil,
          connect_app_sid: String.t() | nil,
          permissions: [Twilio.Schemas.AuthorizedConnectAppEnumPermission.t()] | nil,
          uri: String.t() | nil,
          __extra__: %{optional(String.t()) => term()},
          __present__: [atom()]
        }

  @doc false
  def __schema__(:fields) do
    [
      {:account_sid, "account_sid", :string},
      {:connect_app_company_name, "connect_app_company_name", :string},
      {:connect_app_description, "connect_app_description", :string},
      {:connect_app_friendly_name, "connect_app_friendly_name", :string},
      {:connect_app_homepage_url, "connect_app_homepage_url", :string},
      {:connect_app_sid, "connect_app_sid", :string},
      {:permissions, "permissions",
       {:array, {:ref, Twilio.Schemas.AuthorizedConnectAppEnumPermission}}},
      {:uri, "uri", :string}
    ]
  end

  def __schema__(:required), do: []

  def __schema__(:nullable),
    do: [
      "account_sid",
      "connect_app_company_name",
      "connect_app_description",
      "connect_app_friendly_name",
      "connect_app_homepage_url",
      "connect_app_sid",
      "permissions",
      "uri"
    ]

  def __schema__(:additional), do: nil

  @doc "Decodes parsed JSON into this struct."
  @spec decode(term) :: t | term
  def decode(json), do: Infusion.Runtime.Schema.decode_module(json, __MODULE__)
end
