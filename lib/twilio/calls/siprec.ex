defmodule Twilio.Calls.Siprec do
  @moduledoc """
  API calls: `create`, `update`.
  """

  @create_operation %{
    id: "CreateSiprec",
    method: :post,
    path: "/2010-04-01/Accounts/{AccountSid}/Calls/{CallSid}/Siprec.json",
    path_params: ["CallSid"],
    client_path_params: [{"AccountSid", :account_sid}],
    params: [
      {:connector_name, "ConnectorName", :body},
      {:name, "Name", :body},
      {:parameter1_name, "Parameter1.Name", :body},
      {:parameter1_value, "Parameter1.Value", :body},
      {:parameter10_name, "Parameter10.Name", :body},
      {:parameter10_value, "Parameter10.Value", :body},
      {:parameter11_name, "Parameter11.Name", :body},
      {:parameter11_value, "Parameter11.Value", :body},
      {:parameter12_name, "Parameter12.Name", :body},
      {:parameter12_value, "Parameter12.Value", :body},
      {:parameter13_name, "Parameter13.Name", :body},
      {:parameter13_value, "Parameter13.Value", :body},
      {:parameter14_name, "Parameter14.Name", :body},
      {:parameter14_value, "Parameter14.Value", :body},
      {:parameter15_name, "Parameter15.Name", :body},
      {:parameter15_value, "Parameter15.Value", :body},
      {:parameter16_name, "Parameter16.Name", :body},
      {:parameter16_value, "Parameter16.Value", :body},
      {:parameter17_name, "Parameter17.Name", :body},
      {:parameter17_value, "Parameter17.Value", :body},
      {:parameter18_name, "Parameter18.Name", :body},
      {:parameter18_value, "Parameter18.Value", :body},
      {:parameter19_name, "Parameter19.Name", :body},
      {:parameter19_value, "Parameter19.Value", :body},
      {:parameter2_name, "Parameter2.Name", :body},
      {:parameter2_value, "Parameter2.Value", :body},
      {:parameter20_name, "Parameter20.Name", :body},
      {:parameter20_value, "Parameter20.Value", :body},
      {:parameter21_name, "Parameter21.Name", :body},
      {:parameter21_value, "Parameter21.Value", :body},
      {:parameter22_name, "Parameter22.Name", :body},
      {:parameter22_value, "Parameter22.Value", :body},
      {:parameter23_name, "Parameter23.Name", :body},
      {:parameter23_value, "Parameter23.Value", :body},
      {:parameter24_name, "Parameter24.Name", :body},
      {:parameter24_value, "Parameter24.Value", :body},
      {:parameter25_name, "Parameter25.Name", :body},
      {:parameter25_value, "Parameter25.Value", :body},
      {:parameter26_name, "Parameter26.Name", :body},
      {:parameter26_value, "Parameter26.Value", :body},
      {:parameter27_name, "Parameter27.Name", :body},
      {:parameter27_value, "Parameter27.Value", :body},
      {:parameter28_name, "Parameter28.Name", :body},
      {:parameter28_value, "Parameter28.Value", :body},
      {:parameter29_name, "Parameter29.Name", :body},
      {:parameter29_value, "Parameter29.Value", :body},
      {:parameter3_name, "Parameter3.Name", :body},
      {:parameter3_value, "Parameter3.Value", :body},
      {:parameter30_name, "Parameter30.Name", :body},
      {:parameter30_value, "Parameter30.Value", :body},
      {:parameter31_name, "Parameter31.Name", :body},
      {:parameter31_value, "Parameter31.Value", :body},
      {:parameter32_name, "Parameter32.Name", :body},
      {:parameter32_value, "Parameter32.Value", :body},
      {:parameter33_name, "Parameter33.Name", :body},
      {:parameter33_value, "Parameter33.Value", :body},
      {:parameter34_name, "Parameter34.Name", :body},
      {:parameter34_value, "Parameter34.Value", :body},
      {:parameter35_name, "Parameter35.Name", :body},
      {:parameter35_value, "Parameter35.Value", :body},
      {:parameter36_name, "Parameter36.Name", :body},
      {:parameter36_value, "Parameter36.Value", :body},
      {:parameter37_name, "Parameter37.Name", :body},
      {:parameter37_value, "Parameter37.Value", :body},
      {:parameter38_name, "Parameter38.Name", :body},
      {:parameter38_value, "Parameter38.Value", :body},
      {:parameter39_name, "Parameter39.Name", :body},
      {:parameter39_value, "Parameter39.Value", :body},
      {:parameter4_name, "Parameter4.Name", :body},
      {:parameter4_value, "Parameter4.Value", :body},
      {:parameter40_name, "Parameter40.Name", :body},
      {:parameter40_value, "Parameter40.Value", :body},
      {:parameter41_name, "Parameter41.Name", :body},
      {:parameter41_value, "Parameter41.Value", :body},
      {:parameter42_name, "Parameter42.Name", :body},
      {:parameter42_value, "Parameter42.Value", :body},
      {:parameter43_name, "Parameter43.Name", :body},
      {:parameter43_value, "Parameter43.Value", :body},
      {:parameter44_name, "Parameter44.Name", :body},
      {:parameter44_value, "Parameter44.Value", :body},
      {:parameter45_name, "Parameter45.Name", :body},
      {:parameter45_value, "Parameter45.Value", :body},
      {:parameter46_name, "Parameter46.Name", :body},
      {:parameter46_value, "Parameter46.Value", :body},
      {:parameter47_name, "Parameter47.Name", :body},
      {:parameter47_value, "Parameter47.Value", :body},
      {:parameter48_name, "Parameter48.Name", :body},
      {:parameter48_value, "Parameter48.Value", :body},
      {:parameter49_name, "Parameter49.Name", :body},
      {:parameter49_value, "Parameter49.Value", :body},
      {:parameter5_name, "Parameter5.Name", :body},
      {:parameter5_value, "Parameter5.Value", :body},
      {:parameter50_name, "Parameter50.Name", :body},
      {:parameter50_value, "Parameter50.Value", :body},
      {:parameter51_name, "Parameter51.Name", :body},
      {:parameter51_value, "Parameter51.Value", :body},
      {:parameter52_name, "Parameter52.Name", :body},
      {:parameter52_value, "Parameter52.Value", :body},
      {:parameter53_name, "Parameter53.Name", :body},
      {:parameter53_value, "Parameter53.Value", :body},
      {:parameter54_name, "Parameter54.Name", :body},
      {:parameter54_value, "Parameter54.Value", :body},
      {:parameter55_name, "Parameter55.Name", :body},
      {:parameter55_value, "Parameter55.Value", :body},
      {:parameter56_name, "Parameter56.Name", :body},
      {:parameter56_value, "Parameter56.Value", :body},
      {:parameter57_name, "Parameter57.Name", :body},
      {:parameter57_value, "Parameter57.Value", :body},
      {:parameter58_name, "Parameter58.Name", :body},
      {:parameter58_value, "Parameter58.Value", :body},
      {:parameter59_name, "Parameter59.Name", :body},
      {:parameter59_value, "Parameter59.Value", :body},
      {:parameter6_name, "Parameter6.Name", :body},
      {:parameter6_value, "Parameter6.Value", :body},
      {:parameter60_name, "Parameter60.Name", :body},
      {:parameter60_value, "Parameter60.Value", :body},
      {:parameter61_name, "Parameter61.Name", :body},
      {:parameter61_value, "Parameter61.Value", :body},
      {:parameter62_name, "Parameter62.Name", :body},
      {:parameter62_value, "Parameter62.Value", :body},
      {:parameter63_name, "Parameter63.Name", :body},
      {:parameter63_value, "Parameter63.Value", :body},
      {:parameter64_name, "Parameter64.Name", :body},
      {:parameter64_value, "Parameter64.Value", :body},
      {:parameter65_name, "Parameter65.Name", :body},
      {:parameter65_value, "Parameter65.Value", :body},
      {:parameter66_name, "Parameter66.Name", :body},
      {:parameter66_value, "Parameter66.Value", :body},
      {:parameter67_name, "Parameter67.Name", :body},
      {:parameter67_value, "Parameter67.Value", :body},
      {:parameter68_name, "Parameter68.Name", :body},
      {:parameter68_value, "Parameter68.Value", :body},
      {:parameter69_name, "Parameter69.Name", :body},
      {:parameter69_value, "Parameter69.Value", :body},
      {:parameter7_name, "Parameter7.Name", :body},
      {:parameter7_value, "Parameter7.Value", :body},
      {:parameter70_name, "Parameter70.Name", :body},
      {:parameter70_value, "Parameter70.Value", :body},
      {:parameter71_name, "Parameter71.Name", :body},
      {:parameter71_value, "Parameter71.Value", :body},
      {:parameter72_name, "Parameter72.Name", :body},
      {:parameter72_value, "Parameter72.Value", :body},
      {:parameter73_name, "Parameter73.Name", :body},
      {:parameter73_value, "Parameter73.Value", :body},
      {:parameter74_name, "Parameter74.Name", :body},
      {:parameter74_value, "Parameter74.Value", :body},
      {:parameter75_name, "Parameter75.Name", :body},
      {:parameter75_value, "Parameter75.Value", :body},
      {:parameter76_name, "Parameter76.Name", :body},
      {:parameter76_value, "Parameter76.Value", :body},
      {:parameter77_name, "Parameter77.Name", :body},
      {:parameter77_value, "Parameter77.Value", :body},
      {:parameter78_name, "Parameter78.Name", :body},
      {:parameter78_value, "Parameter78.Value", :body},
      {:parameter79_name, "Parameter79.Name", :body},
      {:parameter79_value, "Parameter79.Value", :body},
      {:parameter8_name, "Parameter8.Name", :body},
      {:parameter8_value, "Parameter8.Value", :body},
      {:parameter80_name, "Parameter80.Name", :body},
      {:parameter80_value, "Parameter80.Value", :body},
      {:parameter81_name, "Parameter81.Name", :body},
      {:parameter81_value, "Parameter81.Value", :body},
      {:parameter82_name, "Parameter82.Name", :body},
      {:parameter82_value, "Parameter82.Value", :body},
      {:parameter83_name, "Parameter83.Name", :body},
      {:parameter83_value, "Parameter83.Value", :body},
      {:parameter84_name, "Parameter84.Name", :body},
      {:parameter84_value, "Parameter84.Value", :body},
      {:parameter85_name, "Parameter85.Name", :body},
      {:parameter85_value, "Parameter85.Value", :body},
      {:parameter86_name, "Parameter86.Name", :body},
      {:parameter86_value, "Parameter86.Value", :body},
      {:parameter87_name, "Parameter87.Name", :body},
      {:parameter87_value, "Parameter87.Value", :body},
      {:parameter88_name, "Parameter88.Name", :body},
      {:parameter88_value, "Parameter88.Value", :body},
      {:parameter89_name, "Parameter89.Name", :body},
      {:parameter89_value, "Parameter89.Value", :body},
      {:parameter9_name, "Parameter9.Name", :body},
      {:parameter9_value, "Parameter9.Value", :body},
      {:parameter90_name, "Parameter90.Name", :body},
      {:parameter90_value, "Parameter90.Value", :body},
      {:parameter91_name, "Parameter91.Name", :body},
      {:parameter91_value, "Parameter91.Value", :body},
      {:parameter92_name, "Parameter92.Name", :body},
      {:parameter92_value, "Parameter92.Value", :body},
      {:parameter93_name, "Parameter93.Name", :body},
      {:parameter93_value, "Parameter93.Value", :body},
      {:parameter94_name, "Parameter94.Name", :body},
      {:parameter94_value, "Parameter94.Value", :body},
      {:parameter95_name, "Parameter95.Name", :body},
      {:parameter95_value, "Parameter95.Value", :body},
      {:parameter96_name, "Parameter96.Name", :body},
      {:parameter96_value, "Parameter96.Value", :body},
      {:parameter97_name, "Parameter97.Name", :body},
      {:parameter97_value, "Parameter97.Value", :body},
      {:parameter98_name, "Parameter98.Name", :body},
      {:parameter98_value, "Parameter98.Value", :body},
      {:parameter99_name, "Parameter99.Name", :body},
      {:parameter99_value, "Parameter99.Value", :body},
      {:status_callback, "StatusCallback", :body},
      {:status_callback_method, "StatusCallbackMethod", :body},
      {:track, "Track", :body}
    ],
    body: :form,
    response: {:ref, Twilio.Schemas.Siprec}
  }

  @doc """
  Create a Siprec

  `POST /2010-04-01/Accounts/{AccountSid}/Calls/{CallSid}/Siprec.json`

  ## Path parameters

    * `call_sid` (required) - The SID of the [Call](https://www.twilio.com/docs/voice/api/call-resource) the Siprec resource is associated with.

  `{AccountSid}` in the path is the `:account_sid` setting; pass `account_sid: "..."` as an option to use another.

  ## Parameters

    * `connector_name` - Unique name used when configuring the connector via Marketplace Add-on.
    * `name` - The user-specified name of this Siprec, if one was given when the Siprec was created. This may be used to stop the Siprec.
    * `parameter1_name` - Parameter name
    * `parameter1_value` - Parameter value
    * `parameter10_name` - Parameter name
    * `parameter10_value` - Parameter value
    * `parameter11_name` - Parameter name
    * `parameter11_value` - Parameter value
    * `parameter12_name` - Parameter name
    * `parameter12_value` - Parameter value
    * `parameter13_name` - Parameter name
    * `parameter13_value` - Parameter value
    * `parameter14_name` - Parameter name
    * `parameter14_value` - Parameter value
    * `parameter15_name` - Parameter name
    * `parameter15_value` - Parameter value
    * `parameter16_name` - Parameter name
    * `parameter16_value` - Parameter value
    * `parameter17_name` - Parameter name
    * `parameter17_value` - Parameter value
    * `parameter18_name` - Parameter name
    * `parameter18_value` - Parameter value
    * `parameter19_name` - Parameter name
    * `parameter19_value` - Parameter value
    * `parameter2_name` - Parameter name
    * `parameter2_value` - Parameter value
    * `parameter20_name` - Parameter name
    * `parameter20_value` - Parameter value
    * `parameter21_name` - Parameter name
    * `parameter21_value` - Parameter value
    * `parameter22_name` - Parameter name
    * `parameter22_value` - Parameter value
    * `parameter23_name` - Parameter name
    * `parameter23_value` - Parameter value
    * `parameter24_name` - Parameter name
    * `parameter24_value` - Parameter value
    * `parameter25_name` - Parameter name
    * `parameter25_value` - Parameter value
    * `parameter26_name` - Parameter name
    * `parameter26_value` - Parameter value
    * `parameter27_name` - Parameter name
    * `parameter27_value` - Parameter value
    * `parameter28_name` - Parameter name
    * `parameter28_value` - Parameter value
    * `parameter29_name` - Parameter name
    * `parameter29_value` - Parameter value
    * `parameter3_name` - Parameter name
    * `parameter3_value` - Parameter value
    * `parameter30_name` - Parameter name
    * `parameter30_value` - Parameter value
    * `parameter31_name` - Parameter name
    * `parameter31_value` - Parameter value
    * `parameter32_name` - Parameter name
    * `parameter32_value` - Parameter value
    * `parameter33_name` - Parameter name
    * `parameter33_value` - Parameter value
    * `parameter34_name` - Parameter name
    * `parameter34_value` - Parameter value
    * `parameter35_name` - Parameter name
    * `parameter35_value` - Parameter value
    * `parameter36_name` - Parameter name
    * `parameter36_value` - Parameter value
    * `parameter37_name` - Parameter name
    * `parameter37_value` - Parameter value
    * `parameter38_name` - Parameter name
    * `parameter38_value` - Parameter value
    * `parameter39_name` - Parameter name
    * `parameter39_value` - Parameter value
    * `parameter4_name` - Parameter name
    * `parameter4_value` - Parameter value
    * `parameter40_name` - Parameter name
    * `parameter40_value` - Parameter value
    * `parameter41_name` - Parameter name
    * `parameter41_value` - Parameter value
    * `parameter42_name` - Parameter name
    * `parameter42_value` - Parameter value
    * `parameter43_name` - Parameter name
    * `parameter43_value` - Parameter value
    * `parameter44_name` - Parameter name
    * `parameter44_value` - Parameter value
    * `parameter45_name` - Parameter name
    * `parameter45_value` - Parameter value
    * `parameter46_name` - Parameter name
    * `parameter46_value` - Parameter value
    * `parameter47_name` - Parameter name
    * `parameter47_value` - Parameter value
    * `parameter48_name` - Parameter name
    * `parameter48_value` - Parameter value
    * `parameter49_name` - Parameter name
    * `parameter49_value` - Parameter value
    * `parameter5_name` - Parameter name
    * `parameter5_value` - Parameter value
    * `parameter50_name` - Parameter name
    * `parameter50_value` - Parameter value
    * `parameter51_name` - Parameter name
    * `parameter51_value` - Parameter value
    * `parameter52_name` - Parameter name
    * `parameter52_value` - Parameter value
    * `parameter53_name` - Parameter name
    * `parameter53_value` - Parameter value
    * `parameter54_name` - Parameter name
    * `parameter54_value` - Parameter value
    * `parameter55_name` - Parameter name
    * `parameter55_value` - Parameter value
    * `parameter56_name` - Parameter name
    * `parameter56_value` - Parameter value
    * `parameter57_name` - Parameter name
    * `parameter57_value` - Parameter value
    * `parameter58_name` - Parameter name
    * `parameter58_value` - Parameter value
    * `parameter59_name` - Parameter name
    * `parameter59_value` - Parameter value
    * `parameter6_name` - Parameter name
    * `parameter6_value` - Parameter value
    * `parameter60_name` - Parameter name
    * `parameter60_value` - Parameter value
    * `parameter61_name` - Parameter name
    * `parameter61_value` - Parameter value
    * `parameter62_name` - Parameter name
    * `parameter62_value` - Parameter value
    * `parameter63_name` - Parameter name
    * `parameter63_value` - Parameter value
    * `parameter64_name` - Parameter name
    * `parameter64_value` - Parameter value
    * `parameter65_name` - Parameter name
    * `parameter65_value` - Parameter value
    * `parameter66_name` - Parameter name
    * `parameter66_value` - Parameter value
    * `parameter67_name` - Parameter name
    * `parameter67_value` - Parameter value
    * `parameter68_name` - Parameter name
    * `parameter68_value` - Parameter value
    * `parameter69_name` - Parameter name
    * `parameter69_value` - Parameter value
    * `parameter7_name` - Parameter name
    * `parameter7_value` - Parameter value
    * `parameter70_name` - Parameter name
    * `parameter70_value` - Parameter value
    * `parameter71_name` - Parameter name
    * `parameter71_value` - Parameter value
    * `parameter72_name` - Parameter name
    * `parameter72_value` - Parameter value
    * `parameter73_name` - Parameter name
    * `parameter73_value` - Parameter value
    * `parameter74_name` - Parameter name
    * `parameter74_value` - Parameter value
    * `parameter75_name` - Parameter name
    * `parameter75_value` - Parameter value
    * `parameter76_name` - Parameter name
    * `parameter76_value` - Parameter value
    * `parameter77_name` - Parameter name
    * `parameter77_value` - Parameter value
    * `parameter78_name` - Parameter name
    * `parameter78_value` - Parameter value
    * `parameter79_name` - Parameter name
    * `parameter79_value` - Parameter value
    * `parameter8_name` - Parameter name
    * `parameter8_value` - Parameter value
    * `parameter80_name` - Parameter name
    * `parameter80_value` - Parameter value
    * `parameter81_name` - Parameter name
    * `parameter81_value` - Parameter value
    * `parameter82_name` - Parameter name
    * `parameter82_value` - Parameter value
    * `parameter83_name` - Parameter name
    * `parameter83_value` - Parameter value
    * `parameter84_name` - Parameter name
    * `parameter84_value` - Parameter value
    * `parameter85_name` - Parameter name
    * `parameter85_value` - Parameter value
    * `parameter86_name` - Parameter name
    * `parameter86_value` - Parameter value
    * `parameter87_name` - Parameter name
    * `parameter87_value` - Parameter value
    * `parameter88_name` - Parameter name
    * `parameter88_value` - Parameter value
    * `parameter89_name` - Parameter name
    * `parameter89_value` - Parameter value
    * `parameter9_name` - Parameter name
    * `parameter9_value` - Parameter value
    * `parameter90_name` - Parameter name
    * `parameter90_value` - Parameter value
    * `parameter91_name` - Parameter name
    * `parameter91_value` - Parameter value
    * `parameter92_name` - Parameter name
    * `parameter92_value` - Parameter value
    * `parameter93_name` - Parameter name
    * `parameter93_value` - Parameter value
    * `parameter94_name` - Parameter name
    * `parameter94_value` - Parameter value
    * `parameter95_name` - Parameter name
    * `parameter95_value` - Parameter value
    * `parameter96_name` - Parameter name
    * `parameter96_value` - Parameter value
    * `parameter97_name` - Parameter name
    * `parameter97_value` - Parameter value
    * `parameter98_name` - Parameter name
    * `parameter98_value` - Parameter value
    * `parameter99_name` - Parameter name
    * `parameter99_value` - Parameter value
    * `status_callback` - Absolute URL of the status callback.
    * `status_callback_method` - The http method for the status_callback (one of GET, POST).
    * `track`
  """
  @spec create(String.t(), map() | keyword(), keyword()) ::
          {:ok, Twilio.Schemas.Siprec.t()} | {:error, Infusion.Runtime.Error.t()}
  def create(call_sid, params \\ %{}, opts \\ []),
    do: Twilio.__request__(@create_operation, [call_sid], params, opts)

  @doc "Like `create/3`, but returns the result or raises `Infusion.Runtime.Error`."
  @spec create!(String.t(), map() | keyword(), keyword()) :: Twilio.Schemas.Siprec.t()
  def create!(call_sid, params \\ %{}, opts \\ []),
    do:
      Infusion.Runtime.Request.unwrap!(
        Twilio.__request__(@create_operation, [call_sid], params, opts)
      )

  @update_operation %{
    id: "UpdateSiprec",
    method: :post,
    path: "/2010-04-01/Accounts/{AccountSid}/Calls/{CallSid}/Siprec/{Sid}.json",
    path_params: ["CallSid", "Sid"],
    client_path_params: [{"AccountSid", :account_sid}],
    params: [{:status, "Status", :body}],
    body: :form,
    response: {:ref, Twilio.Schemas.Siprec}
  }

  @doc """
  Stop a Siprec using either the SID of the Siprec resource or the `name` used when creating the resource

  `POST /2010-04-01/Accounts/{AccountSid}/Calls/{CallSid}/Siprec/{Sid}.json`

  ## Path parameters

    * `call_sid` (required) - The SID of the [Call](https://www.twilio.com/docs/voice/api/call-resource) the Siprec resource is associated with.
    * `sid` (required) - The SID of the Siprec resource, or the `name` used when creating the resource

  `{AccountSid}` in the path is the `:account_sid` setting; pass `account_sid: "..."` as an option to use another.

  ## Parameters

    * `status` (required)
  """
  @spec update(String.t(), String.t(), map() | keyword(), keyword()) ::
          {:ok, Twilio.Schemas.Siprec.t()} | {:error, Infusion.Runtime.Error.t()}
  def update(call_sid, sid, params \\ %{}, opts \\ []),
    do: Twilio.__request__(@update_operation, [call_sid, sid], params, opts)

  @doc "Like `update/4`, but returns the result or raises `Infusion.Runtime.Error`."
  @spec update!(String.t(), String.t(), map() | keyword(), keyword()) :: Twilio.Schemas.Siprec.t()
  def update!(call_sid, sid, params \\ %{}, opts \\ []),
    do:
      Infusion.Runtime.Request.unwrap!(
        Twilio.__request__(@update_operation, [call_sid, sid], params, opts)
      )
end
