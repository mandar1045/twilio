# How this SDK is generated. Regenerate it, from this directory, with
#
#     mix infusion.gen --config infusion.exs
#
# Every setting is described in Infusion.Config.
[
  name: "Twilio",
  spec: "https://raw.githubusercontent.com/twilio/twilio-oai/main/spec/json/twilio_api_v2010.json",
  out: ".",
  app: :twilio,
  version: "0.1.0",
  license: "Apache-2.0",
  description:
    "Twilio's REST API (messages, calls, phone numbers, recordings, ...) for Elixir: " <>
      "typed structs, retries, pagination. Generated from Twilio's OpenAPI spec.",
  links: %{
    "Twilio API" => "https://www.twilio.com/docs/usage/api",
    "Infusion" => "https://github.com/mandar1045/infusion"
  },
  # Hand-written; regenerating doesn't touch it
  keep: ["README.md"],

  # Basic auth with the account SID and auth token, as the official SDKs do
  auth: :basic,
  env_var: {"TWILIO_ACCOUNT_SID", "TWILIO_AUTH_TOKEN"},

  # Every path starts /2010-04-01/Accounts/{AccountSid}: the account comes
  # from the client, so calls read Twilio.Messages.create(%{to: ..., body: ...})
  path_defaults: %{"AccountSid" => {:account_sid, {:env, "TWILIO_ACCOUNT_SID"}}},

  # api.v2010.account.message -> Twilio.Schemas.Message
  schema_names: :last_segment,

  # The resources of an account sit at the top, as in the official SDKs
  # (client.messages, client.calls); Twilio.Accounts keeps the account calls.
  rename_modules: %{
    "Accounts.Addresses" => "Addresses",
    "Accounts.Applications" => "Applications",
    "Accounts.AuthorizedConnectApps" => "AuthorizedConnectApps",
    "Accounts.AvailablePhoneNumbers" => "AvailablePhoneNumbers",
    "Accounts.Balance" => "Balance",
    "Accounts.Calls" => "Calls",
    "Accounts.Conferences" => "Conferences",
    "Accounts.ConnectApps" => "ConnectApps",
    "Accounts.IncomingPhoneNumbers" => "IncomingPhoneNumbers",
    "Accounts.Keys" => "Keys",
    "Accounts.Messages" => "Messages",
    "Accounts.Notifications" => "Notifications",
    "Accounts.OutgoingCallerIds" => "OutgoingCallerIds",
    "Accounts.Queues" => "Queues",
    "Accounts.Recordings" => "Recordings",
    "Accounts.SigningKeys" => "SigningKeys",
    "Accounts.Sip" => "Sip",
    "Accounts.Sms" => "Sms",
    "Accounts.Tokens" => "Tokens",
    "Accounts.Transcriptions" => "Transcriptions",
    "Accounts.Usage" => "Usage"
  }
]
