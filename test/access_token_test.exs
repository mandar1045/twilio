defmodule Twilio.AccessTokenTest do
  use ExUnit.Case, async: true

  @opts [account_sid: "AC123", api_key_sid: "SK123", api_key_secret: "secret", now: 1_700_000_000]

  defp decode(token) do
    [header, payload, signature] = String.split(token, ".")
    expected = :crypto.mac(:hmac, :sha256, "secret", header <> "." <> payload)
    assert Base.url_decode64!(signature, padding: false) == expected

    {JSON.decode!(Base.url_decode64!(header, padding: false)),
     JSON.decode!(Base.url_decode64!(payload, padding: false))}
  end

  test "a voice token, as Twilio's SDKs make it" do
    token =
      Twilio.AccessToken.generate(
        @opts ++
          [
            identity: "alice",
            grants: [
              voice: [
                incoming_allow: true,
                outgoing_application_sid: "AP123",
                outgoing_application_params: %{"foo" => "bar"}
              ]
            ]
          ]
      )

    assert {header, payload} = decode(token)
    assert header == %{"typ" => "JWT", "alg" => "HS256", "cty" => "twilio-fpa;v=1"}

    assert payload == %{
             "jti" => "SK123-1700000000",
             "iss" => "SK123",
             "sub" => "AC123",
             "nbf" => 1_700_000_000,
             "exp" => 1_700_003_600,
             "grants" => %{
               "identity" => "alice",
               "voice" => %{
                 "incoming" => %{"allow" => true},
                 "outgoing" => %{"application_sid" => "AP123", "params" => %{"foo" => "bar"}}
               }
             }
           }
  end

  test "every grant, a region, ttl and nbf options" do
    token =
      Twilio.AccessToken.generate(
        @opts ++
          [
            grants: [
              video: [room: "standup"],
              chat: [service_sid: "IS1", endpoint_id: "e1"],
              sync: [service_sid: "IS2"],
              task_router: [workspace_sid: "WS1", worker_sid: "WK1", role: "worker"],
              playback: %{"requestCredentials" => nil, "playbackUrl" => "https://x"}
            ],
            region: "ie1",
            ttl: 60,
            nbf: false
          ]
      )

    assert {%{"twr" => "ie1"}, payload} = decode(token)
    assert payload["exp"] == 1_700_000_060
    refute Map.has_key?(payload, "nbf")

    assert payload["grants"] == %{
             "video" => %{"room" => "standup"},
             "chat" => %{"service_sid" => "IS1", "endpoint_id" => "e1"},
             "data_sync" => %{"service_sid" => "IS2"},
             "task_router" => %{
               "workspace_sid" => "WS1",
               "worker_sid" => "WK1",
               "role" => "worker"
             },
             "player" => %{"requestCredentials" => nil, "playbackUrl" => "https://x"}
           }
  end

  test "asks for what's missing and rejects unknown grants" do
    assert_raise ArgumentError, ~r/:api_key_secret is needed/, fn ->
      Twilio.AccessToken.generate(Keyword.delete(@opts, :api_key_secret))
    end

    assert_raise ArgumentError, ~r/unknown grant :fax/, fn ->
      Twilio.AccessToken.generate(@opts ++ [grants: [fax: []]])
    end
  end
end
