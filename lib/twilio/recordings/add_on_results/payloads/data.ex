defmodule Twilio.Recordings.AddOnResults.Payloads.Data do
  @moduledoc """
  API calls: `list`.
  """

  @list_operation %{
    id: "FetchRecordingAddOnResultPayloadData",
    method: :get,
    path:
      "/2010-04-01/Accounts/{AccountSid}/Recordings/{ReferenceSid}/AddOnResults/{AddOnResultSid}/Payloads/{PayloadSid}/Data.json",
    path_params: ["ReferenceSid", "AddOnResultSid", "PayloadSid"],
    client_path_params: [{"AccountSid", :account_sid}],
    params: [],
    response: nil
  }

  @doc """
  Fetch an instance of a result payload

  `GET /2010-04-01/Accounts/{AccountSid}/Recordings/{ReferenceSid}/AddOnResults/{AddOnResultSid}/Payloads/{PayloadSid}/Data.json`

  ## Path parameters

    * `reference_sid` (required) - The SID of the recording to which the AddOnResult resource that contains the payload to fetch belongs.
    * `add_on_result_sid` (required) - The SID of the AddOnResult to which the payload to fetch belongs.
    * `payload_sid` (required) - The Twilio-provided string that uniquely identifies the Recording AddOnResult Payload resource to fetch.

  `{AccountSid}` in the path is the `:account_sid` setting; pass `account_sid: "..."` as an option to use another.
  """
  @spec list(String.t(), String.t(), String.t(), keyword()) ::
          {:ok, nil} | {:error, Infusion.Runtime.Error.t()}
  def list(reference_sid, add_on_result_sid, payload_sid, opts \\ []),
    do:
      Twilio.__request__(
        @list_operation,
        [reference_sid, add_on_result_sid, payload_sid],
        %{},
        opts
      )

  @doc "Like `list/4`, but returns the result or raises `Infusion.Runtime.Error`."
  @spec list!(String.t(), String.t(), String.t(), keyword()) :: nil
  def list!(reference_sid, add_on_result_sid, payload_sid, opts \\ []),
    do:
      Infusion.Runtime.Request.unwrap!(
        Twilio.__request__(
          @list_operation,
          [reference_sid, add_on_result_sid, payload_sid],
          %{},
          opts
        )
      )
end
