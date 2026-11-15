defmodule Twilio.Schemas.NewSigningKey do
  @moduledoc """
  ## Fields

    * `date_created` - The date and time in GMT that the resource was created specified in [RFC 2822](https://www.ietf.org/rfc/rfc2822.txt) format.
    * `date_updated` - The date and time in GMT that the resource was last updated specified in [RFC 2822](https://www.ietf.org/rfc/rfc2822.txt) format.
    * `friendly_name` - The string that you assigned to describe the resource.
    * `secret` - The secret your application uses to sign Access Tokens and to authenticate to the REST API (you will use this as the basic-auth `password`). **Note that for security reasons, this field is ONLY returned when the API Key is first created.**
    * `sid` - The unique string that that we created to identify the NewSigningKey resource.
  """

  @derive {Inspect, except: [:__extra__, :__present__]}
  defstruct [
    :date_created,
    :date_updated,
    :friendly_name,
    :secret,
    :sid,
    __extra__: %{},
    __present__: []
  ]

  @type t :: %__MODULE__{
          date_created: String.t() | nil,
          date_updated: String.t() | nil,
          friendly_name: String.t() | nil,
          secret: String.t() | nil,
          sid: String.t() | nil,
          __extra__: %{optional(String.t()) => term()},
          __present__: [atom()]
        }

  @doc false
  def __schema__(:fields) do
    [
      {:date_created, "date_created", :string},
      {:date_updated, "date_updated", :string},
      {:friendly_name, "friendly_name", :string},
      {:secret, "secret", :string},
      {:sid, "sid", :string}
    ]
  end

  @doc "Decodes parsed JSON into this struct."
  @spec decode(term) :: t | term
  def decode(json), do: Infusion.Runtime.Schema.decode_module(json, __MODULE__)
end
