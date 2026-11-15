defmodule Twilio.Messages.Media do
  @moduledoc """
  API calls: `delete`, `list`, `retrieve`.
  """

  @delete_operation %{
    id: "DeleteMedia",
    method: :delete,
    path: "/2010-04-01/Accounts/{AccountSid}/Messages/{MessageSid}/Media/{Sid}.json",
    path_params: ["MessageSid", "Sid"],
    client_path_params: [{"AccountSid", :account_sid}],
    params: [],
    response: nil
  }

  @doc """
  Delete the Media resource.

  `DELETE /2010-04-01/Accounts/{AccountSid}/Messages/{MessageSid}/Media/{Sid}.json`

  ## Path parameters

    * `message_sid` (required) - The SID of the Message resource that is associated with the Media resource.
    * `sid` (required) - The unique identifier of the to-be-deleted Media resource.

  `{AccountSid}` in the path is the `:account_sid` setting; pass `account_sid: "..."` as an option to use another.
  """
  @spec delete(String.t(), String.t(), keyword()) ::
          {:ok, nil} | {:error, Infusion.Runtime.Error.t()}
  def delete(message_sid, sid, opts \\ []),
    do: Twilio.__request__(@delete_operation, [message_sid, sid], %{}, opts)

  @doc "Like `delete/3`, but returns the result or raises `Infusion.Runtime.Error`."
  @spec delete!(String.t(), String.t(), keyword()) :: nil
  def delete!(message_sid, sid, opts \\ []),
    do:
      Infusion.Runtime.Request.unwrap!(
        Twilio.__request__(@delete_operation, [message_sid, sid], %{}, opts)
      )

  @list_operation %{
    id: "ListMedia",
    method: :get,
    path: "/2010-04-01/Accounts/{AccountSid}/Messages/{MessageSid}/Media.json",
    path_params: ["MessageSid"],
    client_path_params: [{"AccountSid", :account_sid}],
    params: [
      {:date_created, "DateCreated", :query},
      {:date_created_query, "DateCreated<", :query},
      {:date_created_query_2, "DateCreated>", :query},
      {:page_size, "PageSize", :query},
      {:page, "Page", :query},
      {:page_token, "PageToken", :query}
    ],
    response: {:ref, Twilio.Schemas.MessagesMediaListResponse},
    paginate: %{
      from: ["next_page_uri"],
      items: ["media_list"],
      style: :next_url,
      item: {:ref, Twilio.Schemas.Media}
    }
  }

  @doc """
  Read a list of Media resources associated with a specific Message resource

  `GET /2010-04-01/Accounts/{AccountSid}/Messages/{MessageSid}/Media.json`

  ## Path parameters

    * `message_sid` (required) - The SID of the Message resource that is associated with the Media resources.

  `{AccountSid}` in the path is the `:account_sid` setting; pass `account_sid: "..."` as an option to use another.

  ## Parameters

    * `date_created` - Only include Media resources that were created on this date. Specify a date as `YYYY-MM-DD` in GMT, for example: `2009-07-06`, to read Media that were created on this date. You can also specify an inequality, such as `StartTime<=YYYY-MM-DD`, to read Media that were created on or before midnight of this date, and `StartTime>=YYYY-MM-DD` to read Media that were created on or after midnight of this date.
    * `date_created_query` - Only include Media resources that were created on this date. Specify a date as `YYYY-MM-DD` in GMT, for example: `2009-07-06`, to read Media that were created on this date. You can also specify an inequality, such as `StartTime<=YYYY-MM-DD`, to read Media that were created on or before midnight of this date, and `StartTime>=YYYY-MM-DD` to read Media that were created on or after midnight of this date.
    * `date_created_query_2` - Only include Media resources that were created on this date. Specify a date as `YYYY-MM-DD` in GMT, for example: `2009-07-06`, to read Media that were created on this date. You can also specify an inequality, such as `StartTime<=YYYY-MM-DD`, to read Media that were created on or before midnight of this date, and `StartTime>=YYYY-MM-DD` to read Media that were created on or after midnight of this date.
    * `page_size` - How many resources to return in each list page. The default is 50, and the maximum is 1000.
    * `page` - The page index. This value is simply for client state.
    * `page_token` - The page token. This is provided by the API.

  To read every item across all pages, use `list_all`.
  """
  @spec list(String.t(), map() | keyword(), keyword()) ::
          {:ok, Twilio.Schemas.MessagesMediaListResponse.t()}
          | {:error, Infusion.Runtime.Error.t()}
  def list(message_sid, params \\ %{}, opts \\ []),
    do: Twilio.__request__(@list_operation, [message_sid], params, opts)

  @doc "Like `list/3`, but returns the result or raises `Infusion.Runtime.Error`."
  @spec list!(String.t(), map() | keyword(), keyword()) ::
          Twilio.Schemas.MessagesMediaListResponse.t()
  def list!(message_sid, params \\ %{}, opts \\ []),
    do:
      Infusion.Runtime.Request.unwrap!(
        Twilio.__request__(@list_operation, [message_sid], params, opts)
      )

  @doc """
  Like `list/3`, but returns every item, from every page: a lazy stream of `Twilio.Schemas.Media.t()` that fetches pages as it is read.

  The first page is fetched right away, so its errors are returned; a later page that fails raises `Infusion.Runtime.Error`. Stopping early (`Enum.take/2`) fetches no more pages.
  """
  @spec list_all(String.t(), map() | keyword(), keyword()) ::
          {:ok, Enumerable.t()} | {:error, Infusion.Runtime.Error.t()}
  def list_all(message_sid, params \\ %{}, opts \\ []),
    do: Twilio.__paginate__(@list_operation, [message_sid], params, opts)

  @doc "Like `list_all/3`, but returns the stream or raises `Infusion.Runtime.Error`."
  @spec list_all!(String.t(), map() | keyword(), keyword()) :: Enumerable.t()
  def list_all!(message_sid, params \\ %{}, opts \\ []),
    do:
      Infusion.Runtime.Request.unwrap!(
        Twilio.__paginate__(@list_operation, [message_sid], params, opts)
      )

  @retrieve_operation %{
    id: "FetchMedia",
    method: :get,
    path: "/2010-04-01/Accounts/{AccountSid}/Messages/{MessageSid}/Media/{Sid}.json",
    path_params: ["MessageSid", "Sid"],
    client_path_params: [{"AccountSid", :account_sid}],
    params: [],
    response: {:ref, Twilio.Schemas.Media}
  }

  @doc """
  Fetch a single Media resource associated with a specific Message resource

  `GET /2010-04-01/Accounts/{AccountSid}/Messages/{MessageSid}/Media/{Sid}.json`

  ## Path parameters

    * `message_sid` (required) - The SID of the Message resource that is associated with the Media resource.
    * `sid` (required) - The Twilio-provided string that uniquely identifies the Media resource to fetch.

  `{AccountSid}` in the path is the `:account_sid` setting; pass `account_sid: "..."` as an option to use another.
  """
  @spec retrieve(String.t(), String.t(), keyword()) ::
          {:ok, Twilio.Schemas.Media.t()} | {:error, Infusion.Runtime.Error.t()}
  def retrieve(message_sid, sid, opts \\ []),
    do: Twilio.__request__(@retrieve_operation, [message_sid, sid], %{}, opts)

  @doc "Like `retrieve/3`, but returns the result or raises `Infusion.Runtime.Error`."
  @spec retrieve!(String.t(), String.t(), keyword()) :: Twilio.Schemas.Media.t()
  def retrieve!(message_sid, sid, opts \\ []),
    do:
      Infusion.Runtime.Request.unwrap!(
        Twilio.__request__(@retrieve_operation, [message_sid, sid], %{}, opts)
      )
end
