defmodule Twilio.Calls.UserDefinedMessages do
  @moduledoc """
  API calls: `create`.
  """

  @create_operation %{
    id: "CreateUserDefinedMessage",
    method: :post,
    path: "/2010-04-01/Accounts/{AccountSid}/Calls/{CallSid}/UserDefinedMessages.json",
    path_params: ["CallSid"],
    client_path_params: [{"AccountSid", :account_sid}],
    params: [{:content, "Content", :body}, {:idempotency_key, "IdempotencyKey", :body}],
    body: :form,
    response: {:ref, Twilio.Schemas.UserDefinedMessage}
  }

  @doc """
  Create a new User Defined Message for the given Call SID.

  `POST /2010-04-01/Accounts/{AccountSid}/Calls/{CallSid}/UserDefinedMessages.json`

  ## Path parameters

    * `call_sid` (required) - The SID of the [Call](https://www.twilio.com/docs/voice/api/call-resource) the User Defined Message is associated with.

  `{AccountSid}` in the path is the `:account_sid` setting; pass `account_sid: "..."` as an option to use another.

  ## Parameters

    * `content` (required) - The User Defined Message in the form of URL-encoded JSON string.
    * `idempotency_key` - A unique string value to identify API call. This should be a unique string value per API call and can be a randomly generated.
  """
  @spec create(String.t(), map() | keyword(), keyword()) ::
          {:ok, Twilio.Schemas.UserDefinedMessage.t()} | {:error, Infusion.Runtime.Error.t()}
  def create(call_sid, params \\ %{}, opts \\ []),
    do: Twilio.__request__(@create_operation, [call_sid], params, opts)

  @doc "Like `create/3`, but returns the result or raises `Infusion.Runtime.Error`."
  @spec create!(String.t(), map() | keyword(), keyword()) :: Twilio.Schemas.UserDefinedMessage.t()
  def create!(call_sid, params \\ %{}, opts \\ []),
    do:
      Infusion.Runtime.Request.unwrap!(
        Twilio.__request__(@create_operation, [call_sid], params, opts)
      )
end
