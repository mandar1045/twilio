defmodule Twilio.Schemas.SipIpAccessControlListsListResponse do
  @moduledoc """
  ## Fields

    * `end`
    * `first_page_uri`
    * `ip_access_control_lists`
    * `next_page_uri`
    * `page`
    * `page_size`
    * `previous_page_uri`
    * `start`
    * `uri`
  """

  @derive {Inspect, except: [:__extra__, :__present__]}
  defstruct [
    :end,
    :first_page_uri,
    :ip_access_control_lists,
    :next_page_uri,
    :page,
    :page_size,
    :previous_page_uri,
    :start,
    :uri,
    __extra__: %{},
    __present__: []
  ]

  @type t :: %__MODULE__{
          end: integer() | nil,
          first_page_uri: String.t() | nil,
          ip_access_control_lists: [Twilio.Schemas.SipIpAccessControlList.t()] | nil,
          next_page_uri: String.t() | nil,
          page: integer() | nil,
          page_size: integer() | nil,
          previous_page_uri: String.t() | nil,
          start: integer() | nil,
          uri: String.t() | nil,
          __extra__: %{optional(String.t()) => term()},
          __present__: [atom()]
        }

  @doc false
  def __schema__(:fields) do
    [
      {:end, "end", :integer},
      {:first_page_uri, "first_page_uri", :string},
      {:ip_access_control_lists, "ip_access_control_lists",
       {:array, {:ref, Twilio.Schemas.SipIpAccessControlList}}},
      {:next_page_uri, "next_page_uri", :string},
      {:page, "page", :integer},
      {:page_size, "page_size", :integer},
      {:previous_page_uri, "previous_page_uri", :string},
      {:start, "start", :integer},
      {:uri, "uri", :string}
    ]
  end

  def __schema__(:required), do: []
  def __schema__(:nullable), do: ["next_page_uri", "previous_page_uri"]
  def __schema__(:additional), do: nil

  @doc "Decodes parsed JSON into this struct."
  @spec decode(term) :: t | term
  def decode(json), do: Infusion.Runtime.Schema.decode_module(json, __MODULE__)
end
