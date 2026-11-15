defmodule Twilio.Calls.Payments do
  @moduledoc """
  API calls: `create`, `update`.
  """

  @create_operation %{
    id: "CreatePayments",
    method: :post,
    path: "/2010-04-01/Accounts/{AccountSid}/Calls/{CallSid}/Payments.json",
    path_params: ["CallSid"],
    client_path_params: [{"AccountSid", :account_sid}],
    params: [
      {:bank_account_type, "BankAccountType", :body},
      {:charge_amount, "ChargeAmount", :body},
      {:confirmation, "Confirmation", :body},
      {:currency, "Currency", :body},
      {:description, "Description", :body},
      {:idempotency_key, "IdempotencyKey", :body},
      {:input, "Input", :body},
      {:min_postal_code_length, "MinPostalCodeLength", :body},
      {:parameter, "Parameter", :body},
      {:payment_connector, "PaymentConnector", :body},
      {:payment_method, "PaymentMethod", :body},
      {:postal_code, "PostalCode", :body},
      {:require_matching_inputs, "RequireMatchingInputs", :body},
      {:security_code, "SecurityCode", :body},
      {:status_callback, "StatusCallback", :body},
      {:timeout, "Timeout", :body},
      {:token_type, "TokenType", :body},
      {:valid_card_types, "ValidCardTypes", :body}
    ],
    body: :form,
    response: {:ref, Twilio.Schemas.Payments}
  }

  @doc """
  create an instance of payments. This will start a new payments session

  `POST /2010-04-01/Accounts/{AccountSid}/Calls/{CallSid}/Payments.json`

  ## Path parameters

    * `call_sid` (required) - The SID of the call that will create the resource. Call leg associated with this sid is expected to provide payment information thru DTMF.

  `{AccountSid}` in the path is the `:account_sid` setting; pass `account_sid: "..."` as an option to use another.

  ## Parameters

    * `bank_account_type`
    * `charge_amount` - A positive decimal value less than 1,000,000 to charge against the credit card or bank account. Default currency can be overwritten with `currency` field. Leave blank or set to 0 to tokenize.
    * `confirmation` - Whether to prompt the caller to confirm their payment information before submitting to the payment gateway. If `true`, the caller will hear the last 4 digits of their card or account number and must press 1 to confirm or 2 to cancel. Default is `false`.
    * `currency` - The currency of the `charge_amount`, formatted as [ISO 4127](http://www.iso.org/iso/home/standards/currency_codes.htm) format. The default value is `USD` and all values allowed from the Pay Connector are accepted.
    * `description` - The description can be used to provide more details regarding the transaction. This information is submitted along with the payment details to the Payment Connector which are then posted on the transactions.
    * `idempotency_key` (required) - A unique token that will be used to ensure that multiple API calls with the same information do not result in multiple transactions. This should be a unique string value per API call and can be a randomly generated.
    * `input` - A list of inputs that should be accepted. Currently only `dtmf` is supported. All digits captured during a pay session are redacted from the logs.
    * `min_postal_code_length` - A positive integer that is used to validate the length of the `PostalCode` inputted by the user. User must enter this many digits.
    * `parameter` - A single-level JSON object used to pass custom parameters to payment processors. (Required for ACH payments). The information that has to be included here depends on the <Pay> Connector. [Read more](https://www.twilio.com/console/voice/pay-connectors).
    * `payment_connector` - This is the unique name corresponding to the Pay Connector installed in the Twilio Add-ons. Learn more about [<Pay> Connectors](https://www.twilio.com/console/voice/pay-connectors). The default value is `Default`.
    * `payment_method`
    * `postal_code` - Indicates whether the credit card postal code (zip code) is a required piece of payment information that must be provided by the caller. The default is `true`.
    * `require_matching_inputs` - A comma-separated list of payment information fields that require the caller to enter the same value twice for confirmation. Supported values are `payment-card-number`, `expiration-date`, `security-code`, and `postal-code`.
    * `security_code` - Indicates whether the credit card security code is a required piece of payment information that must be provided by the caller. The default is `true`.
    * `status_callback` (required) - Provide an absolute or relative URL to receive status updates regarding your Pay session. Read more about the [expected StatusCallback values](https://www.twilio.com/docs/voice/api/payment-resource#statuscallback)
    * `timeout` - The number of seconds that <Pay> should wait for the caller to press a digit between each subsequent digit, after the first one, before moving on to validate the digits captured. The default is `5`, maximum is `600`.
    * `token_type`
    * `valid_card_types` - Credit card types separated by space that Pay should accept. The default value is `visa mastercard amex`
  """
  @spec create(String.t(), map() | keyword(), keyword()) ::
          {:ok, Twilio.Schemas.Payments.t()} | {:error, Infusion.Runtime.Error.t()}
  def create(call_sid, params \\ %{}, opts \\ []),
    do: Twilio.__request__(@create_operation, [call_sid], params, opts)

  @doc "Like `create/3`, but returns the result or raises `Infusion.Runtime.Error`."
  @spec create!(String.t(), map() | keyword(), keyword()) :: Twilio.Schemas.Payments.t()
  def create!(call_sid, params \\ %{}, opts \\ []),
    do:
      Infusion.Runtime.Request.unwrap!(
        Twilio.__request__(@create_operation, [call_sid], params, opts)
      )

  @update_operation %{
    id: "UpdatePayments",
    method: :post,
    path: "/2010-04-01/Accounts/{AccountSid}/Calls/{CallSid}/Payments/{Sid}.json",
    path_params: ["CallSid", "Sid"],
    client_path_params: [{"AccountSid", :account_sid}],
    params: [
      {:capture, "Capture", :body},
      {:idempotency_key, "IdempotencyKey", :body},
      {:status, "Status", :body},
      {:status_callback, "StatusCallback", :body}
    ],
    body: :form,
    response: {:ref, Twilio.Schemas.Payments}
  }

  @doc """
  update an instance of payments with different phases of payment flows.

  `POST /2010-04-01/Accounts/{AccountSid}/Calls/{CallSid}/Payments/{Sid}.json`

  ## Path parameters

    * `call_sid` (required) - The SID of the call that will update the resource. This should be the same call sid that was used to create payments resource.
    * `sid` (required) - The SID of Payments session that needs to be updated.

  `{AccountSid}` in the path is the `:account_sid` setting; pass `account_sid: "..."` as an option to use another.

  ## Parameters

    * `capture`
    * `idempotency_key` (required) - A unique token that will be used to ensure that multiple API calls with the same information do not result in multiple transactions. This should be a unique string value per API call and can be a randomly generated.
    * `status`
    * `status_callback` (required) - Provide an absolute or relative URL to receive status updates regarding your Pay session. Read more about the [Update](https://www.twilio.com/docs/voice/api/payment-resource#statuscallback-update) and [Complete/Cancel](https://www.twilio.com/docs/voice/api/payment-resource#statuscallback-cancelcomplete) POST requests.
  """
  @spec update(String.t(), String.t(), map() | keyword(), keyword()) ::
          {:ok, Twilio.Schemas.Payments.t()} | {:error, Infusion.Runtime.Error.t()}
  def update(call_sid, sid, params \\ %{}, opts \\ []),
    do: Twilio.__request__(@update_operation, [call_sid, sid], params, opts)

  @doc "Like `update/4`, but returns the result or raises `Infusion.Runtime.Error`."
  @spec update!(String.t(), String.t(), map() | keyword(), keyword()) ::
          Twilio.Schemas.Payments.t()
  def update!(call_sid, sid, params \\ %{}, opts \\ []),
    do:
      Infusion.Runtime.Request.unwrap!(
        Twilio.__request__(@update_operation, [call_sid, sid], params, opts)
      )
end
