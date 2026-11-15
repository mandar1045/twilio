# Changelog

## 0.2.0

What isn't in Twilio's API spec, written by hand:

  * `Twilio.Webhook.valid?/4`: checks the `X-Twilio-Signature` of a webhook
    request, with the rules of Twilio's official SDKs (URL with and without
    its port, sorted and deduplicated parameters, constant-time comparison),
    JSON bodies (`bodySHA256`) and SharedKey HMAC-SHA256 signatures.
    `Twilio.Webhook.signature/3` signs requests for tests. Checked against
    twilio-python on 2,000 random requests and on real webhooks from Twilio
  * `Twilio.AccessToken.generate/1`: access tokens for Twilio's client SDKs,
    with voice, video, chat, sync, task_router and playback grants; the same
    claims as twilio-python's tokens

## 0.1.0

First release: Twilio's core REST API (`2010-04-01`), generated from Twilio's
OpenAPI spec by Infusion 0.4.

  * 197 operations, one function each (plus a `!` variant), with docs and
    typespecs: `Twilio.Messages.create/2`, `Twilio.Calls.update/3`,
    `Twilio.AvailablePhoneNumbers.Local.list/3`, ...
  * The account comes from `config :twilio, account_sid: ...` (default
    `TWILIO_ACCOUNT_SID`); `account_sid:` on a call uses a subaccount
  * Basic auth from `TWILIO_ACCOUNT_SID` and `TWILIO_AUTH_TOKEN`, or an API
    key pair in your config
  * Responses decode into structs (`Twilio.Schemas.Message`, ...), list pages
    included; `_all` functions stream every item across pages
  * Typed errors with Twilio's error code; retries on connection errors, 429
    and 5xx
