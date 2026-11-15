defmodule Twilio.Tokens do
  @moduledoc """
  API calls: `create`.
  """

  @create_operation %{
    id: "CreateToken",
    method: :post,
    path: "/2010-04-01/Accounts/{AccountSid}/Tokens.json",
    path_params: [],
    client_path_params: [{"AccountSid", :account_sid}],
    params: [{:ttl, "Ttl", :body}],
    body: :form,
    response: {:ref, Twilio.Schemas.Token}
  }

  @doc """
  Create a new token for ICE servers

  `POST /2010-04-01/Accounts/{AccountSid}/Tokens.json`

  `{AccountSid}` in the path is the `:account_sid` setting; pass `account_sid: "..."` as an option to use another.

  ## Parameters

    * `ttl` - The duration in seconds for which the generated credentials are valid. The default value is 86400 (24 hours).
  """
  @spec create(map() | keyword(), keyword()) ::
          {:ok, Twilio.Schemas.Token.t()} | {:error, Infusion.Runtime.Error.t()}
  def create(params \\ %{}, opts \\ []),
    do: Twilio.__request__(@create_operation, [], params, opts)

  @doc "Like `create/2`, but returns the result or raises `Infusion.Runtime.Error`."
  @spec create!(map() | keyword(), keyword()) :: Twilio.Schemas.Token.t()
  def create!(params \\ %{}, opts \\ []),
    do: Infusion.Runtime.Request.unwrap!(Twilio.__request__(@create_operation, [], params, opts))
end
