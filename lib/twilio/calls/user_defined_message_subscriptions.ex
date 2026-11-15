defmodule Twilio.Calls.UserDefinedMessageSubscriptions do
  @moduledoc """
  API calls: `create`, `delete`.
  """

  @create_operation %{
    id: "CreateUserDefinedMessageSubscription",
    method: :post,
    path:
      "/2010-04-01/Accounts/{AccountSid}/Calls/{CallSid}/UserDefinedMessageSubscriptions.json",
    path_params: ["CallSid"],
    client_path_params: [{"AccountSid", :account_sid}],
    params: [
      {:callback, "Callback", :body},
      {:idempotency_key, "IdempotencyKey", :body},
      {:method, "Method", :body}
    ],
    body: :form,
    response: {:ref, Twilio.Schemas.UserDefinedMessageSubscription}
  }

  @doc """
  Subscribe to User Defined Messages for a given Call SID.

  `POST /2010-04-01/Accounts/{AccountSid}/Calls/{CallSid}/UserDefinedMessageSubscriptions.json`

  ## Path parameters

    * `call_sid` (required) - The SID of the [Call](https://www.twilio.com/docs/voice/api/call-resource) the User Defined Messages subscription is associated with. This refers to the Call SID that is producing the user defined messages.

  `{AccountSid}` in the path is the `:account_sid` setting; pass `account_sid: "..."` as an option to use another.

  ## Parameters

    * `callback` (required) - The URL we should call using the `method` to send user defined events to your application. URLs must contain a valid hostname (underscores are not permitted).
    * `idempotency_key` - A unique string value to identify API call. This should be a unique string value per API call and can be a randomly generated.
    * `method` - The HTTP method Twilio will use when requesting the above `Url`. Either `GET` or `POST`. Default is `POST`.
  """
  @spec create(String.t(), map() | keyword(), keyword()) ::
          {:ok, Twilio.Schemas.UserDefinedMessageSubscription.t()}
          | {:error, Infusion.Runtime.Error.t()}
  def create(call_sid, params \\ %{}, opts \\ []),
    do: Twilio.__request__(@create_operation, [call_sid], params, opts)

  @doc "Like `create/3`, but returns the result or raises `Infusion.Runtime.Error`."
  @spec create!(String.t(), map() | keyword(), keyword()) ::
          Twilio.Schemas.UserDefinedMessageSubscription.t()
  def create!(call_sid, params \\ %{}, opts \\ []),
    do:
      Infusion.Runtime.Request.unwrap!(
        Twilio.__request__(@create_operation, [call_sid], params, opts)
      )

  @delete_operation %{
    id: "DeleteUserDefinedMessageSubscription",
    method: :delete,
    path:
      "/2010-04-01/Accounts/{AccountSid}/Calls/{CallSid}/UserDefinedMessageSubscriptions/{Sid}.json",
    path_params: ["CallSid", "Sid"],
    client_path_params: [{"AccountSid", :account_sid}],
    params: [],
    response: nil
  }

  @doc """
  Delete a specific User Defined Message Subscription.

  `DELETE /2010-04-01/Accounts/{AccountSid}/Calls/{CallSid}/UserDefinedMessageSubscriptions/{Sid}.json`

  ## Path parameters

    * `call_sid` (required) - The SID of the [Call](https://www.twilio.com/docs/voice/api/call-resource) the User Defined Message Subscription is associated with. This refers to the Call SID that is producing the User Defined Messages.
    * `sid` (required) - The SID that uniquely identifies this User Defined Message Subscription.

  `{AccountSid}` in the path is the `:account_sid` setting; pass `account_sid: "..."` as an option to use another.
  """
  @spec delete(String.t(), String.t(), keyword()) ::
          {:ok, nil} | {:error, Infusion.Runtime.Error.t()}
  def delete(call_sid, sid, opts \\ []),
    do: Twilio.__request__(@delete_operation, [call_sid, sid], %{}, opts)

  @doc "Like `delete/3`, but returns the result or raises `Infusion.Runtime.Error`."
  @spec delete!(String.t(), String.t(), keyword()) :: nil
  def delete!(call_sid, sid, opts \\ []),
    do:
      Infusion.Runtime.Request.unwrap!(
        Twilio.__request__(@delete_operation, [call_sid, sid], %{}, opts)
      )
end
