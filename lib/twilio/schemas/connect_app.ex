defmodule Twilio.Schemas.ConnectApp do
  @moduledoc """
  ## Fields

    * `account_sid` - The SID of the [Account](https://www.twilio.com/docs/iam/api/account) that created the ConnectApp resource.
    * `authorize_redirect_url` - The URL we redirect the user to after we authenticate the user and obtain authorization to access the Connect App.
    * `company_name` - The company name set for the Connect App.
    * `deauthorize_callback_method` - The HTTP method we use to call `deauthorize_callback_url`.
    * `deauthorize_callback_url` - The URL we call using the `deauthorize_callback_method` to de-authorize the Connect App.
    * `description` - The description of the Connect App.
    * `friendly_name` - The string that you assigned to describe the resource.
    * `homepage_url` - The public URL where users can obtain more information about this Connect App.
    * `permissions` - The set of permissions that your ConnectApp requests.
    * `sid` - The unique string that that we created to identify the ConnectApp resource.
    * `uri` - The URI of the resource, relative to `https://api.twilio.com`.
  """

  @derive {Inspect, except: [:__extra__, :__present__]}
  defstruct [
    :account_sid,
    :authorize_redirect_url,
    :company_name,
    :deauthorize_callback_method,
    :deauthorize_callback_url,
    :description,
    :friendly_name,
    :homepage_url,
    :permissions,
    :sid,
    :uri,
    __extra__: %{},
    __present__: []
  ]

  @type t :: %__MODULE__{
          account_sid: String.t() | nil,
          authorize_redirect_url: String.t() | nil,
          company_name: String.t() | nil,
          deauthorize_callback_method: String.t() | nil,
          deauthorize_callback_url: String.t() | nil,
          description: String.t() | nil,
          friendly_name: String.t() | nil,
          homepage_url: String.t() | nil,
          permissions: [Twilio.Schemas.ConnectAppEnumPermission.t()] | nil,
          sid: String.t() | nil,
          uri: String.t() | nil,
          __extra__: %{optional(String.t()) => term()},
          __present__: [atom()]
        }

  @doc false
  def __schema__(:fields) do
    [
      {:account_sid, "account_sid", :string},
      {:authorize_redirect_url, "authorize_redirect_url", :string},
      {:company_name, "company_name", :string},
      {:deauthorize_callback_method, "deauthorize_callback_method", {:enum, ["GET", "POST"]}},
      {:deauthorize_callback_url, "deauthorize_callback_url", :string},
      {:description, "description", :string},
      {:friendly_name, "friendly_name", :string},
      {:homepage_url, "homepage_url", :string},
      {:permissions, "permissions", {:array, {:ref, Twilio.Schemas.ConnectAppEnumPermission}}},
      {:sid, "sid", :string},
      {:uri, "uri", :string}
    ]
  end

  def __schema__(:required), do: []

  def __schema__(:nullable),
    do: [
      "account_sid",
      "authorize_redirect_url",
      "company_name",
      "deauthorize_callback_method",
      "deauthorize_callback_url",
      "description",
      "friendly_name",
      "homepage_url",
      "permissions",
      "sid",
      "uri"
    ]

  def __schema__(:additional), do: nil

  @doc "Decodes parsed JSON into this struct."
  @spec decode(term) :: t | term
  def decode(json), do: Infusion.Runtime.Schema.decode_module(json, __MODULE__)
end
