defmodule Twilio.Schemas.AvailablePhoneNumbersMobileListResponse do
  @moduledoc """
  ## Fields

    * `available_phone_numbers`
    * `end`
    * `first_page_uri`
    * `next_page_uri`
    * `page`
    * `page_size`
    * `previous_page_uri`
    * `start`
    * `uri`
  """

  @derive {Inspect, except: [:__extra__, :__present__]}
  defstruct [
    :available_phone_numbers,
    :end,
    :first_page_uri,
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
          available_phone_numbers: [Twilio.Schemas.AvailablePhoneNumberMobile.t()] | nil,
          end: integer() | nil,
          first_page_uri: String.t() | nil,
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
      {:available_phone_numbers, "available_phone_numbers",
       {:array, {:ref, Twilio.Schemas.AvailablePhoneNumberMobile}}},
      {:end, "end", :integer},
      {:first_page_uri, "first_page_uri", :string},
      {:next_page_uri, "next_page_uri", :string},
      {:page, "page", :integer},
      {:page_size, "page_size", :integer},
      {:previous_page_uri, "previous_page_uri", :string},
      {:start, "start", :integer},
      {:uri, "uri", :string}
    ]
  end

  @doc "Decodes parsed JSON into this struct."
  @spec decode(term) :: t | term
  def decode(json), do: Infusion.Runtime.Schema.decode_module(json, __MODULE__)
end
