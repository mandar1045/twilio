defmodule Twilio.Schemas.SipCredential do
  @moduledoc """
  ## Fields

    * `account_sid` - The unique id of the Account that is responsible for this resource.
    * `credential_list_sid` - The unique id that identifies the credential list that includes this credential.
    * `date_created` - The date that this resource was created, given as GMT in [RFC 2822](https://www.php.net/manual/en/class.datetime.php#datetime.constants.rfc2822) format.
    * `date_updated` - The date that this resource was last updated, given as GMT in [RFC 2822](https://www.php.net/manual/en/class.datetime.php#datetime.constants.rfc2822) format.
    * `sid` - A 34 character string that uniquely identifies this resource.
    * `uri` - The URI for this resource, relative to `https://api.twilio.com`
    * `username` - The username for this credential.
  """

  @derive {Inspect, except: [:__extra__, :__present__]}
  defstruct [
    :account_sid,
    :credential_list_sid,
    :date_created,
    :date_updated,
    :sid,
    :uri,
    :username,
    __extra__: %{},
    __present__: []
  ]

  @type t :: %__MODULE__{
          account_sid: String.t() | nil,
          credential_list_sid: String.t() | nil,
          date_created: String.t() | nil,
          date_updated: String.t() | nil,
          sid: String.t() | nil,
          uri: String.t() | nil,
          username: String.t() | nil,
          __extra__: %{optional(String.t()) => term()},
          __present__: [atom()]
        }

  @doc false
  def __schema__(:fields) do
    [
      {:account_sid, "account_sid", :string},
      {:credential_list_sid, "credential_list_sid", :string},
      {:date_created, "date_created", :string},
      {:date_updated, "date_updated", :string},
      {:sid, "sid", :string},
      {:uri, "uri", :string},
      {:username, "username", :string}
    ]
  end

  @doc "Decodes parsed JSON into this struct."
  @spec decode(term) :: t | term
  def decode(json), do: Infusion.Runtime.Schema.decode_module(json, __MODULE__)
end
