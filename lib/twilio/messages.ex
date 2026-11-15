defmodule Twilio.Messages do
  @moduledoc """
  API calls: `create`, `delete`, `feedback`, `list`, `retrieve`, `update`.
  """

  @create_operation %{
    id: "CreateMessage",
    method: :post,
    path: "/2010-04-01/Accounts/{AccountSid}/Messages.json",
    path_params: [],
    client_path_params: [{"AccountSid", :account_sid}],
    params: [
      {:address_retention, "AddressRetention", :body},
      {:application_sid, "ApplicationSid", :body},
      {:attempt, "Attempt", :body},
      {:body, "Body", :body},
      {:content_retention, "ContentRetention", :body},
      {:content_sid, "ContentSid", :body},
      {:content_variables, "ContentVariables", :body},
      {:fallback_from, "FallbackFrom", :body},
      {:force_delivery, "ForceDelivery", :body},
      {:from, "From", :body},
      {:max_price, "MaxPrice", :body},
      {:media_url, "MediaUrl", :body},
      {:message_intent, "MessageIntent", :body},
      {:messaging_service_sid, "MessagingServiceSid", :body},
      {:persistent_action, "PersistentAction", :body},
      {:provide_feedback, "ProvideFeedback", :body},
      {:risk_check, "RiskCheck", :body},
      {:schedule_type, "ScheduleType", :body},
      {:send_as_mms, "SendAsMms", :body},
      {:send_at, "SendAt", :body},
      {:shorten_urls, "ShortenUrls", :body},
      {:smart_encoded, "SmartEncoded", :body},
      {:status_callback, "StatusCallback", :body},
      {:to, "To", :body},
      {:traffic_type, "TrafficType", :body},
      {:validity_period, "ValidityPeriod", :body}
    ],
    body: :form,
    response: {:ref, Twilio.Schemas.Message}
  }

  @doc """
  Send a message

  `POST /2010-04-01/Accounts/{AccountSid}/Messages.json`

  `{AccountSid}` in the path is the `:account_sid` setting; pass `account_sid: "..."` as an option to use another.

  ## Parameters

    * `address_retention`
    * `application_sid` - The SID of the associated [TwiML Application](https://www.twilio.com/docs/usage/api/applications). [Message status callback requests](https://www.twilio.com/docs/sms/api/message-resource#twilios-request-to-the-statuscallback-url) are sent to the TwiML App's `message_status_callback` URL. Note that the `status_callback` parameter of a request takes priority over the `application_sid` parameter; if both are included `application_sid` is ignored.
    * `attempt` - Total number of attempts made (including this request) to send the message regardless of the provider used
    * `body` - The text content of the outgoing message. Can be up to 1,600 characters in length. SMS only: If the `body` contains more than 160 [GSM-7](https://www.twilio.com/docs/glossary/what-is-gsm-7-character-encoding) characters (or 70 [UCS-2](https://www.twilio.com/docs/glossary/what-is-ucs-2-character-encoding) characters), the message is segmented and charged accordingly. For long `body` text, consider using the [send_as_mms parameter](https://www.twilio.com/blog/mms-for-long-text-messages).
    * `content_retention`
    * `content_sid` - For [Content Editor/API](https://www.twilio.com/docs/content) only: The SID of the Content Template to be used with the Message, e.g., `HXXXXXXXXXXXXXXXXXXXXXXXXXXXXX`. If this parameter is not provided, a Content Template is not used. Find the SID in the Console on the Content Editor page. For Content API users, the SID is found in Twilio's response when [creating the Template](https://www.twilio.com/docs/content/content-api-resources#create-templates) or by [fetching your Templates](https://www.twilio.com/docs/content/content-api-resources#fetch-all-content-resources).
    * `content_variables` - For [Content Editor/API](https://www.twilio.com/docs/content) only: Key-value pairs of [Template variables](https://www.twilio.com/docs/content/using-variables-with-content-api) and their substitution values. `content_sid` parameter must also be provided. If values are not defined in the `content_variables` parameter, the [Template's default placeholder values](https://www.twilio.com/docs/content/content-api-resources#create-templates) are used.
    * `fallback_from` - A fallback SMS sender to use when the recipient cannot be reached over RCS. This parameter may only be used when also providing a [Messaging Service](https://twilio.com/docs/messaging/services) containing an RCS sender. The fallback SMS sender must be either a Twilio phone number (in [E.164](https://en.wikipedia.org/wiki/E.164) format), [alphanumeric sender ID](https://www.twilio.com/docs/sms/quickstart), or [short code](https://www.twilio.com/en-us/messaging/channels/sms/short-codes), hosted within Twilio and belong to the Account creating the Message.
    * `force_delivery` - Reserved
    * `from` - The sender's Twilio phone number (in [E.164](https://en.wikipedia.org/wiki/E.164) format), [alphanumeric sender ID](https://www.twilio.com/docs/sms/quickstart), [Wireless SIM](https://www.twilio.com/docs/iot/wireless/programmable-wireless-send-machine-machine-sms-commands), [short code](https://www.twilio.com/en-us/messaging/channels/sms/short-codes), or [channel address](https://www.twilio.com/docs/messaging/channels) (e.g., `whatsapp:+15554449999`). The value of the `from` parameter must be a sender that is hosted within Twilio and belongs to the Account creating the Message. If you are using `messaging_service_sid`, this parameter can be empty (Twilio assigns a `from` value from the Messaging Service's Sender Pool) or you can provide a specific sender from your Sender Pool.
    * `max_price` - [OBSOLETE] This parameter will no longer have any effect as of 2024-06-03.
    * `media_url` - The URL of media to include in the Message content. `jpeg`, `jpg`, `gif`, and `png` file types are fully supported by Twilio and content is formatted for delivery on destination devices. The media size limit is 5 MB for supported file types (`jpeg`, `jpg`, `png`, `gif`) and 500 KB for [other types](https://www.twilio.com/docs/messaging/guides/accepted-mime-types) of accepted media. To send more than one image in the message, provide multiple `media_url` parameters in the POST request. You can include up to ten `media_url` parameters per message. [International](https://support.twilio.com/hc/en-us/articles/223179808-Sending-and-receiving-MMS-messages) and [carrier](https://support.twilio.com/hc/en-us/articles/223133707-Is-MMS-supported-for-all-carriers-in-US-and-Canada-) limits apply.
    * `message_intent` - Specifies the purpose or use case of the outbound communication. This parameter is used by Twilio's [Traffic Shaping](https://www.twilio.com/docs/messaging/features/traffic-shaping) and [Compliance Toolkit](https://www.twilio.com/docs/messaging/features/compliance-toolkit) products. Possible values include: `otp`, `notifications`, `marketing`, `fraud`, `security`, `customercare`, `delivery`, `education`, `polling`, `announcements`, and `events`.
    * `messaging_service_sid` - The SID of the [Messaging Service](https://www.twilio.com/docs/messaging/services) you want to associate with the Message. When this parameter is provided and the `from` parameter is omitted, Twilio selects the optimal sender from the Messaging Service's Sender Pool. You may also provide a `from` parameter if you want to use a specific Sender from the Sender Pool.
    * `persistent_action` - Rich actions for non-SMS/MMS channels. Used for [sending location in WhatsApp messages](https://www.twilio.com/docs/whatsapp/message-features#location-messages-with-whatsapp).
    * `provide_feedback` - Boolean indicating whether or not you intend to provide delivery confirmation feedback to Twilio (used in conjunction with the [Message Feedback subresource](https://www.twilio.com/docs/sms/api/message-feedback-resource)). Default value is `false`.
    * `risk_check`
    * `schedule_type`
    * `send_as_mms` - If set to `true`, Twilio delivers the message as a single MMS message, regardless of the presence of media.
    * `send_at` - The time that Twilio will send the message. Must be in ISO 8601 format.
    * `shorten_urls` - For Messaging Services with [Link Shortening configured](https://www.twilio.com/docs/messaging/features/link-shortening) only: A Boolean indicating whether or not Twilio should shorten links in the `body` of the Message. Default value is `false`. If `true`, the `messaging_service_sid` parameter must also be provided.
    * `smart_encoded` - Whether to detect Unicode characters that have a similar GSM-7 character and replace them. Can be: `true` or `false`.
    * `status_callback` - The URL of the endpoint to which Twilio sends [Message status callback requests](https://www.twilio.com/docs/sms/api/message-resource#twilios-request-to-the-statuscallback-url). URL must contain a valid hostname and underscores are not allowed. If you include this parameter with the `messaging_service_sid`, Twilio uses this URL instead of the Status Callback URL of the [Messaging Service](https://www.twilio.com/docs/messaging/api/service-resource).
    * `to` (required) - The recipient's phone number in [E.164](https://www.twilio.com/docs/glossary/what-e164) format (for SMS/MMS) or [channel address](https://www.twilio.com/docs/messaging/channels), e.g. `whatsapp:+15552229999`.
    * `traffic_type`
    * `validity_period` - The maximum length in seconds that the Message can remain in Twilio's outgoing message queue. If a queued Message exceeds the `validity_period`, the Message is not sent. Accepted values are integers from `1` to `36000`. Default value is `36000`. A `validity_period` greater than `5` is recommended. [Learn more about the validity period](https://www.twilio.com/blog/take-more-control-of-outbound-messages-using-validity-period-html)
  """
  @spec create(map() | keyword(), keyword()) ::
          {:ok, Twilio.Schemas.Message.t()} | {:error, Infusion.Runtime.Error.t()}
  def create(params \\ %{}, opts \\ []),
    do: Twilio.__request__(@create_operation, [], params, opts)

  @doc "Like `create/2`, but returns the result or raises `Infusion.Runtime.Error`."
  @spec create!(map() | keyword(), keyword()) :: Twilio.Schemas.Message.t()
  def create!(params \\ %{}, opts \\ []),
    do: Infusion.Runtime.Request.unwrap!(Twilio.__request__(@create_operation, [], params, opts))

  @delete_operation %{
    id: "DeleteMessage",
    method: :delete,
    path: "/2010-04-01/Accounts/{AccountSid}/Messages/{Sid}.json",
    path_params: ["Sid"],
    client_path_params: [{"AccountSid", :account_sid}],
    params: [],
    response: nil
  }

  @doc """
  Deletes a Message resource from your account

  `DELETE /2010-04-01/Accounts/{AccountSid}/Messages/{Sid}.json`

  ## Path parameters

    * `sid` (required) - The SID of the Message resource you wish to delete

  `{AccountSid}` in the path is the `:account_sid` setting; pass `account_sid: "..."` as an option to use another.
  """
  @spec delete(String.t(), keyword()) :: {:ok, nil} | {:error, Infusion.Runtime.Error.t()}
  def delete(sid, opts \\ []), do: Twilio.__request__(@delete_operation, [sid], %{}, opts)

  @doc "Like `delete/2`, but returns the result or raises `Infusion.Runtime.Error`."
  @spec delete!(String.t(), keyword()) :: nil
  def delete!(sid, opts \\ []),
    do: Infusion.Runtime.Request.unwrap!(Twilio.__request__(@delete_operation, [sid], %{}, opts))

  @feedback_operation %{
    id: "CreateMessageFeedback",
    method: :post,
    path: "/2010-04-01/Accounts/{AccountSid}/Messages/{MessageSid}/Feedback.json",
    path_params: ["MessageSid"],
    client_path_params: [{"AccountSid", :account_sid}],
    params: [{:outcome, "Outcome", :body}],
    body: :form,
    response: {:ref, Twilio.Schemas.MessageFeedback}
  }

  @doc """
  Create Message Feedback to confirm a tracked user action was performed by the recipient of the associated Message

  `POST /2010-04-01/Accounts/{AccountSid}/Messages/{MessageSid}/Feedback.json`

  ## Path parameters

    * `message_sid` (required) - The SID of the Message resource for which to create MessageFeedback.

  `{AccountSid}` in the path is the `:account_sid` setting; pass `account_sid: "..."` as an option to use another.

  ## Parameters

    * `outcome`
  """
  @spec feedback(String.t(), map() | keyword(), keyword()) ::
          {:ok, Twilio.Schemas.MessageFeedback.t()} | {:error, Infusion.Runtime.Error.t()}
  def feedback(message_sid, params \\ %{}, opts \\ []),
    do: Twilio.__request__(@feedback_operation, [message_sid], params, opts)

  @doc "Like `feedback/3`, but returns the result or raises `Infusion.Runtime.Error`."
  @spec feedback!(String.t(), map() | keyword(), keyword()) :: Twilio.Schemas.MessageFeedback.t()
  def feedback!(message_sid, params \\ %{}, opts \\ []),
    do:
      Infusion.Runtime.Request.unwrap!(
        Twilio.__request__(@feedback_operation, [message_sid], params, opts)
      )

  @list_operation %{
    id: "ListMessage",
    method: :get,
    path: "/2010-04-01/Accounts/{AccountSid}/Messages.json",
    path_params: [],
    client_path_params: [{"AccountSid", :account_sid}],
    params: [
      {:to, "To", :query},
      {:from, "From", :query},
      {:date_sent, "DateSent", :query},
      {:date_sent_query, "DateSent<", :query},
      {:date_sent_query_2, "DateSent>", :query},
      {:page_size, "PageSize", :query},
      {:page, "Page", :query},
      {:page_token, "PageToken", :query}
    ],
    response: {:ref, Twilio.Schemas.MessagesListResponse},
    paginate: %{
      from: ["next_page_uri"],
      items: ["messages"],
      style: :next_url,
      item: {:ref, Twilio.Schemas.Message}
    }
  }

  @doc """
  Retrieve a list of Message resources associated with a Twilio Account

  `GET /2010-04-01/Accounts/{AccountSid}/Messages.json`

  `{AccountSid}` in the path is the `:account_sid` setting; pass `account_sid: "..."` as an option to use another.

  ## Parameters

    * `to` - Filter by recipient. For example: Set this parameter to `+15558881111` to retrieve a list of Message resources sent to `+15558881111`.
    * `from` - Filter by sender. For example: Set this parameter to `+15552229999` to retrieve a list of Message resources sent by `+15552229999`.
    * `date_sent` - Filter by Message `sent_date`. Accepts GMT dates in the following formats: `YYYY-MM-DD` (to find Messages with a specific `sent_date`), `<=YYYY-MM-DD` (to find Messages with `sent_date`s on and before a specific date), and `>=YYYY-MM-DD` (to find Messages with `sent_dates` on and after a specific date).
    * `date_sent_query` - Filter by Message `sent_date`. Accepts GMT dates in the following formats: `YYYY-MM-DD` (to find Messages with a specific `sent_date`), `<=YYYY-MM-DD` (to find Messages with `sent_date`s on and before a specific date), and `>=YYYY-MM-DD` (to find Messages with `sent_dates` on and after a specific date).
    * `date_sent_query_2` - Filter by Message `sent_date`. Accepts GMT dates in the following formats: `YYYY-MM-DD` (to find Messages with a specific `sent_date`), `<=YYYY-MM-DD` (to find Messages with `sent_date`s on and before a specific date), and `>=YYYY-MM-DD` (to find Messages with `sent_dates` on and after a specific date).
    * `page_size` - How many resources to return in each list page. The default is 50, and the maximum is 1000.
    * `page` - The page index. This value is simply for client state.
    * `page_token` - The page token. This is provided by the API.

  To read every item across all pages, use `list_all`.
  """
  @spec list(map() | keyword(), keyword()) ::
          {:ok, Twilio.Schemas.MessagesListResponse.t()} | {:error, Infusion.Runtime.Error.t()}
  def list(params \\ %{}, opts \\ []), do: Twilio.__request__(@list_operation, [], params, opts)

  @doc "Like `list/2`, but returns the result or raises `Infusion.Runtime.Error`."
  @spec list!(map() | keyword(), keyword()) :: Twilio.Schemas.MessagesListResponse.t()
  def list!(params \\ %{}, opts \\ []),
    do: Infusion.Runtime.Request.unwrap!(Twilio.__request__(@list_operation, [], params, opts))

  @doc """
  Like `list/2`, but returns every item, from every page: a lazy stream of `Twilio.Schemas.Message.t()` that fetches pages as it is read.

  The first page is fetched right away, so its errors are returned; a later page that fails raises `Infusion.Runtime.Error`. Stopping early (`Enum.take/2`) fetches no more pages.
  """
  @spec list_all(map() | keyword(), keyword()) ::
          {:ok, Enumerable.t()} | {:error, Infusion.Runtime.Error.t()}
  def list_all(params \\ %{}, opts \\ []),
    do: Twilio.__paginate__(@list_operation, [], params, opts)

  @doc "Like `list_all/2`, but returns the stream or raises `Infusion.Runtime.Error`."
  @spec list_all!(map() | keyword(), keyword()) :: Enumerable.t()
  def list_all!(params \\ %{}, opts \\ []),
    do: Infusion.Runtime.Request.unwrap!(Twilio.__paginate__(@list_operation, [], params, opts))

  @retrieve_operation %{
    id: "FetchMessage",
    method: :get,
    path: "/2010-04-01/Accounts/{AccountSid}/Messages/{Sid}.json",
    path_params: ["Sid"],
    client_path_params: [{"AccountSid", :account_sid}],
    params: [],
    response: {:ref, Twilio.Schemas.Message}
  }

  @doc """
  Fetch a specific Message

  `GET /2010-04-01/Accounts/{AccountSid}/Messages/{Sid}.json`

  ## Path parameters

    * `sid` (required) - The SID of the Message resource to be fetched

  `{AccountSid}` in the path is the `:account_sid` setting; pass `account_sid: "..."` as an option to use another.
  """
  @spec retrieve(String.t(), keyword()) ::
          {:ok, Twilio.Schemas.Message.t()} | {:error, Infusion.Runtime.Error.t()}
  def retrieve(sid, opts \\ []), do: Twilio.__request__(@retrieve_operation, [sid], %{}, opts)

  @doc "Like `retrieve/2`, but returns the result or raises `Infusion.Runtime.Error`."
  @spec retrieve!(String.t(), keyword()) :: Twilio.Schemas.Message.t()
  def retrieve!(sid, opts \\ []),
    do:
      Infusion.Runtime.Request.unwrap!(Twilio.__request__(@retrieve_operation, [sid], %{}, opts))

  @update_operation %{
    id: "UpdateMessage",
    method: :post,
    path: "/2010-04-01/Accounts/{AccountSid}/Messages/{Sid}.json",
    path_params: ["Sid"],
    client_path_params: [{"AccountSid", :account_sid}],
    params: [{:body, "Body", :body}, {:status, "Status", :body}],
    body: :form,
    response: {:ref, Twilio.Schemas.Message}
  }

  @doc """
  Update a Message resource (used to redact Message `body` text and to cancel not-yet-sent messages)

  `POST /2010-04-01/Accounts/{AccountSid}/Messages/{Sid}.json`

  ## Path parameters

    * `sid` (required) - The SID of the Message resource to be updated

  `{AccountSid}` in the path is the `:account_sid` setting; pass `account_sid: "..."` as an option to use another.

  ## Parameters

    * `body` - The new `body` of the Message resource. To redact the text content of a Message, this parameter's value must be an empty string
    * `status`
  """
  @spec update(String.t(), map() | keyword(), keyword()) ::
          {:ok, Twilio.Schemas.Message.t()} | {:error, Infusion.Runtime.Error.t()}
  def update(sid, params \\ %{}, opts \\ []),
    do: Twilio.__request__(@update_operation, [sid], params, opts)

  @doc "Like `update/3`, but returns the result or raises `Infusion.Runtime.Error`."
  @spec update!(String.t(), map() | keyword(), keyword()) :: Twilio.Schemas.Message.t()
  def update!(sid, params \\ %{}, opts \\ []),
    do:
      Infusion.Runtime.Request.unwrap!(Twilio.__request__(@update_operation, [sid], params, opts))
end
