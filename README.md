# Twilio

Twilio's REST API for Elixir: send messages, make calls, buy phone numbers,
read recordings and usage. Every call of Twilio's core API (`2010-04-01`,
197 operations) has a function with docs and typespecs, and every response
decodes into a struct. Plus what isn't in the API: checking that webhooks
come from Twilio, and access tokens for Twilio's client SDKs.

```elixir
{:ok, message} =
  Twilio.Messages.create(to: "+15558675310", from: "+15017122661", body: "Hello from Elixir")

message.sid     #=> "SM..."
message.status  #=> "queued"
```

Generated from [Twilio's OpenAPI spec](https://github.com/twilio/twilio-oai)
by [Infusion](https://github.com/mandar1045/infusion), so it follows the API
as Twilio changes it.

## Installation

```elixir
def deps do
  [{:twilio, "~> 0.2"}]
end
```

## Configuration

The SDK reads `TWILIO_ACCOUNT_SID` and `TWILIO_AUTH_TOKEN` from the
environment. Or set them in your config:

```elixir
# config/runtime.exs
config :twilio,
  api_key: {System.fetch_env!("TWILIO_ACCOUNT_SID"), System.fetch_env!("TWILIO_AUTH_TOKEN")},
  account_sid: System.fetch_env!("TWILIO_ACCOUNT_SID")
```

With an [API key](https://www.twilio.com/docs/iam/api-keys) instead of the
auth token, `api_key` is `{key_sid, key_secret}` and `account_sid` stays your
account's SID.

## Usage

Every function returns `{:ok, result}` or `{:error, %Infusion.Runtime.Error{}}`,
and has a `!` variant that returns the result or raises.

```elixir
# Calls
{:ok, call} =
  Twilio.Calls.create(
    to: "+15558675310",
    from: "+15017122661",
    url: "http://demo.twilio.com/docs/voice.xml"
  )

Twilio.Calls.update(call.sid, status: "completed")

# Phone numbers
{:ok, page} = Twilio.AvailablePhoneNumbers.Local.list("US", area_code: 415, page_size: 5)
Twilio.IncomingPhoneNumbers.create(phone_number: hd(page.available_phone_numbers).phone_number)

# Your account
{:ok, balance} = Twilio.Balance.retrieve()
```

**Lists** come one page at a time, or as a lazy stream of every item with
the `_all` functions, which fetch the next page only when the stream gets
there:

```elixir
Twilio.Messages.list_all!(date_sent: "2026-11-15", page_size: 100)
|> Stream.filter(&(&1.status == "failed"))
|> Enum.take(10)
```

**Subaccounts**: the account comes from your config, and any call can use
another one:

```elixir
Twilio.Messages.list(%{page_size: 20}, account_sid: "AC...")
```

**Errors** carry Twilio's error code and message:

```elixir
case Twilio.Messages.create(to: "+1555", from: "+15017122661", body: "Hi") do
  {:ok, message} ->
    message

  {:error, %Infusion.Runtime.Error{type: :bad_request, body: %{"code" => 21211}}} ->
    # https://www.twilio.com/docs/errors/21211: not a valid phone number
    :invalid_number

  {:error, %Infusion.Runtime.Error{type: :rate_limit}} ->
    :try_later
end
```

**Retries**: connection errors, 429 and 5xx responses are retried twice with
backoff, as Twilio's official SDKs do. Set `max_retries` and `timeout` in
your config, or on a single call:

```elixir
Twilio.Messages.retrieve("SM...", timeout: 5_000, max_retries: 0)
```

**Anything else**: `Twilio.request/4` calls an endpoint this SDK has no
function for, and `raw: true` returns the whole `%Req.Response{}`, for
headers.

## Webhooks

Twilio signs the requests it sends your app (incoming messages and calls,
status callbacks) with your auth token. Check the signature before trusting
one:

```elixir
def incoming_sms(conn, params) do
  signature = conn |> get_req_header("x-twilio-signature") |> List.first()

  if Twilio.Webhook.valid?(current_url(conn), params, signature) do
    # params["From"], params["Body"], ...
  else
    send_resp(conn, 403, "")
  end
end
```

The URL must be the public one Twilio called, query string included. The
auth token comes from `config :twilio, auth_token: ...` or
`TWILIO_AUTH_TOKEN`. JSON bodies (`bodySHA256`) and SharedKey (HMAC-SHA256)
signatures work too. `Twilio.Webhook.signature/3` signs requests for your
tests.

## Access tokens

For Twilio's Voice, Video, Conversations and Sync client SDKs, your server
hands each user a short-lived token, signed with an
[API key](https://www.twilio.com/docs/iam/api-keys):

```elixir
Twilio.AccessToken.generate(
  identity: "alice",
  grants: [voice: [outgoing_application_sid: "AP...", incoming_allow: true]],
  ttl: 3600
)
```

The key comes from `config :twilio, api_key_sid: ..., api_key_secret: ...`
or `TWILIO_API_KEY` and `TWILIO_API_SECRET`. Grants: `voice`, `video`,
`chat`, `sync`, `task_router`, `playback`.

## Testing your code

Requests go through [Req](https://hexdocs.pm/req), so you can stub Twilio
with `Req.Test`:

```elixir
# config/test.exs
config :twilio, req_options: [plug: {Req.Test, Twilio}], api_key: {"AC1", "token"}, account_sid: "AC1"

# in a test
Req.Test.stub(Twilio, fn conn ->
  Req.Test.json(conn, %{"sid" => "SM1", "status" => "queued"})
end)

assert {:ok, %Twilio.Schemas.Message{sid: "SM1"}} = MyApp.Notify.send_sms("+15558675310")
```

## What's covered

Twilio's core API: Messages, Calls (with recordings, streams, payments,
transcriptions), Conferences, Queues, phone numbers (available, incoming,
caller IDs), Addresses, Applications, Recordings, Transcriptions, SIP,
Usage, Keys and Accounts; webhook signatures and access tokens. Twilio's
newer product APIs (Verify, Conversations, Messaging Services, ...) are
separate specs and not in this package yet.

## License

Apache 2.0. Not affiliated with or endorsed by Twilio.
