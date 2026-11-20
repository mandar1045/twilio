defmodule Twilio.Schemas.IncomingPhoneNumberAssignedAddOnExtension do
  @moduledoc """
  ## Fields

    * `account_sid` - The SID of the [Account](https://www.twilio.com/docs/iam/api/account) that created the resource.
    * `assigned_add_on_sid` - The SID that uniquely identifies the assigned Add-on installation.
    * `enabled` - Whether the Extension will be invoked.
    * `friendly_name` - The string that you assigned to describe the resource.
    * `product_name` - A string that you assigned to describe the Product this Extension is used within.
    * `resource_sid` - The SID of the Phone Number to which the Add-on is assigned.
    * `sid` - The unique string that that we created to identify the resource.
    * `unique_name` - An application-defined string that uniquely identifies the resource. It can be used in place of the resource's `sid` in the URL to address the resource.
    * `uri` - The URI of the resource, relative to `https://api.twilio.com`.
  """

  @derive {Inspect, except: [:__extra__, :__present__]}
  defstruct [
    :account_sid,
    :assigned_add_on_sid,
    :enabled,
    :friendly_name,
    :product_name,
    :resource_sid,
    :sid,
    :unique_name,
    :uri,
    __extra__: %{},
    __present__: []
  ]

  @type t :: %__MODULE__{
          account_sid: String.t() | nil,
          assigned_add_on_sid: String.t() | nil,
          enabled: boolean() | nil,
          friendly_name: String.t() | nil,
          product_name: String.t() | nil,
          resource_sid: String.t() | nil,
          sid: String.t() | nil,
          unique_name: String.t() | nil,
          uri: String.t() | nil,
          __extra__: %{optional(String.t()) => term()},
          __present__: [atom()]
        }

  @doc false
  def __schema__(:fields) do
    [
      {:account_sid, "account_sid", :string},
      {:assigned_add_on_sid, "assigned_add_on_sid", :string},
      {:enabled, "enabled", :boolean},
      {:friendly_name, "friendly_name", :string},
      {:product_name, "product_name", :string},
      {:resource_sid, "resource_sid", :string},
      {:sid, "sid", :string},
      {:unique_name, "unique_name", :string},
      {:uri, "uri", :string}
    ]
  end

  def __schema__(:required), do: []

  def __schema__(:nullable),
    do: [
      "account_sid",
      "assigned_add_on_sid",
      "enabled",
      "friendly_name",
      "product_name",
      "resource_sid",
      "sid",
      "unique_name",
      "uri"
    ]

  def __schema__(:additional), do: nil

  @doc "Decodes parsed JSON into this struct."
  @spec decode(term) :: t | term
  def decode(json), do: Infusion.Runtime.Schema.decode_module(json, __MODULE__)
end
