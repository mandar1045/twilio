defmodule Twilio.Balance do
  @moduledoc """
  API calls: `retrieve`.
  """

  @retrieve_operation %{
    id: "FetchBalance",
    method: :get,
    path: "/2010-04-01/Accounts/{AccountSid}/Balance.json",
    path_params: [],
    client_path_params: [{"AccountSid", :account_sid}],
    params: [],
    response: {:ref, Twilio.Schemas.Balance}
  }

  @doc """
  Fetch the balance for an Account based on Account Sid. Balance changes may not be reflected immediately. Child accounts do not contain balance information

  `GET /2010-04-01/Accounts/{AccountSid}/Balance.json`

  `{AccountSid}` in the path is the `:account_sid` setting; pass `account_sid: "..."` as an option to use another.
  """
  @spec retrieve(keyword()) ::
          {:ok, Twilio.Schemas.Balance.t()} | {:error, Infusion.Runtime.Error.t()}
  def retrieve(opts \\ []), do: Twilio.__request__(@retrieve_operation, [], %{}, opts)

  @doc "Like `retrieve/1`, but returns the result or raises `Infusion.Runtime.Error`."
  @spec retrieve!(keyword()) :: Twilio.Schemas.Balance.t()
  def retrieve!(opts \\ []),
    do: Infusion.Runtime.Request.unwrap!(Twilio.__request__(@retrieve_operation, [], %{}, opts))
end
