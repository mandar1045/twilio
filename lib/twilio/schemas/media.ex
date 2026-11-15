defmodule Twilio.Schemas.Media do
  @moduledoc """
  ## Fields

    * `account_sid` - The SID of the [Account](https://www.twilio.com/docs/iam/api/account) associated with this Media resource.
    * `content_type` - The default [MIME type](https://en.wikipedia.org/wiki/Internet_media_type) of the media, for example `image/jpeg`, `image/png`, or `image/gif`.
    * `date_created` - The date and time in GMT when this Media resource was created, specified in [RFC 2822](https://www.ietf.org/rfc/rfc2822.txt) format.
    * `date_updated` - The date and time in GMT when this Media resource was last updated, specified in [RFC 2822](https://www.ietf.org/rfc/rfc2822.txt) format.
    * `parent_sid` - The SID of the Message resource that is associated with this Media resource.
    * `sid` - The unique string that identifies this Media resource.
    * `uri` - The URI of this Media resource, relative to `https://api.twilio.com`.
  """

  @derive {Inspect, except: [:__extra__, :__present__]}
  defstruct [
    :account_sid,
    :content_type,
    :date_created,
    :date_updated,
    :parent_sid,
    :sid,
    :uri,
    __extra__: %{},
    __present__: []
  ]

  @type t :: %__MODULE__{
          account_sid: String.t() | nil,
          content_type: String.t() | nil,
          date_created: String.t() | nil,
          date_updated: String.t() | nil,
          parent_sid: String.t() | nil,
          sid: String.t() | nil,
          uri: String.t() | nil,
          __extra__: %{optional(String.t()) => term()},
          __present__: [atom()]
        }

  @doc false
  def __schema__(:fields) do
    [
      {:account_sid, "account_sid", :string},
      {:content_type, "content_type", :string},
      {:date_created, "date_created", :string},
      {:date_updated, "date_updated", :string},
      {:parent_sid, "parent_sid", :string},
      {:sid, "sid", :string},
      {:uri, "uri", :string}
    ]
  end

  @doc "Decodes parsed JSON into this struct."
  @spec decode(term) :: t | term
  def decode(json), do: Infusion.Runtime.Schema.decode_module(json, __MODULE__)
end
