defmodule Twilio.WebhookTest do
  # The cases of Twilio's own SDK (twilio-python's test_request_validator.py).
  use ExUnit.Case, async: true

  alias Twilio.Webhook

  @token "12345"
  @url "https://mycompany.com/myapp.php?foo=1&bar=2"
  @params %{
    "CallSid" => "CA1234567890ABCDE",
    "Digits" => "1234",
    "From" => "+14158675309",
    "To" => "+18005551212",
    "Caller" => "+14158675309"
  }
  @expected "RSOYDt4T1cUTdK1PDd93/VVr8B8="
  @body ~s({"property": "value", "boolean": true})
  @body_hash "0a1ff7634d9ab3b95db5c9a2dfe9416e41502b283a80c7cf19632632f96e6620"

  test "computes Twilio's signature" do
    assert Webhook.signature(@url, @params, auth_token: @token) == @expected
    assert Webhook.valid?(@url, @params, @expected, auth_token: @token)
  end

  test "params as a keyword list or atom keys sign the same" do
    keyword = Enum.map(@params, fn {k, v} -> {String.to_atom(k), v} end)
    assert Webhook.valid?(@url, keyword, @expected, auth_token: @token)
  end

  test "repeated names: sorted by name, then value, duplicates removed" do
    params = [
      {"Sid", "CA123"},
      {"SidAccount", "AC123"},
      {"Digits", "5678"},
      {"Digits", "1234"},
      {"Digits", "1234"}
    ]

    assert Webhook.signature(@url, params, auth_token: @token) == "IK+Dwps556ElfBT0I3Rgjkr1wJU="

    as_map = %{"Sid" => "CA123", "SidAccount" => "AC123", "Digits" => ["5678", "1234", "1234"]}
    assert Webhook.signature(@url, as_map, auth_token: @token) == "IK+Dwps556ElfBT0I3Rgjkr1wJU="
  end

  test "the URL is tried with and without its port" do
    with_port = String.replace(@url, ".com", ".com:1234")
    assert Webhook.valid?(with_port, @params, @expected, auth_token: @token)

    http_with_port = with_port |> String.replace("https", "http")

    assert Webhook.valid?(http_with_port, @params, "Zmvh+3yNM1Phv2jhDCwEM3q5ebU=",
             auth_token: @token
           )

    assert Webhook.valid?(@url, @params, "kvajT1Ptam85bY51eRf/AJRuM3w=", auth_token: @token)

    http = String.replace(@url, "https", "http")
    assert Webhook.valid?(http, @params, "0ZXoZLH/DfblKGATFgpif+LLRf4=", auth_token: @token)
  end

  test "a JSON body is checked against bodySHA256" do
    url = @url <> "&bodySHA256=" <> @body_hash
    assert Webhook.valid?(url, @body, "a9nBmqA0ju/hNViExpshrM61xv4=", auth_token: @token)
    refute Webhook.valid?(url, "{}", "a9nBmqA0ju/hNViExpshrM61xv4=", auth_token: @token)
  end

  test "SharedKey signatures: HMAC-SHA256, from the settings header" do
    data = @url <> (@params |> Enum.sort() |> Enum.map_join(fn {k, v} -> k <> v end))
    sha256 = :crypto.mac(:hmac, :sha256, @token, data) |> Base.encode64()

    assert Webhook.signature(@url, @params, auth_token: @token, algorithm: :hmac_sha256) == sha256

    settings = "key=webhooks_sharedkey_1,algorithm=HMAC_SHA256"
    assert Webhook.valid?(@url, @params, sha256, auth_token: @token, settings: settings)

    assert Webhook.valid?(@url, @params, sha256,
             auth_token: @token,
             settings: " key=k , algorithm = hmac_sha256 "
           )

    # Not interchangeable with SHA-1.
    refute Webhook.valid?(@url, @params, sha256, auth_token: @token)
    refute Webhook.valid?(@url, @params, @expected, auth_token: @token, settings: settings)

    # No algorithm in the header means SHA-1; an unknown one fails.
    for header <- ["", "key=k", "key=k,algorithm="] do
      assert Webhook.valid?(@url, @params, @expected, auth_token: @token, settings: header)
    end

    refute Webhook.valid?(@url, @params, @expected,
             auth_token: @token,
             settings: "algorithm=HMAC_SHA512"
           )
  end

  test "rejects a wrong or missing signature, other params, another token" do
    refute Webhook.valid?(@url, @params, "RSOYDt4T1cUTdK1PDd93/VVr8B8", auth_token: @token)
    refute Webhook.valid?(@url, @params, nil, auth_token: @token)
    refute Webhook.valid?(@url, Map.put(@params, "Digits", "9999"), @expected, auth_token: @token)
    refute Webhook.valid?(@url, @params, @expected, auth_token: "54321")
  end

  test "the auth token comes from config or the environment" do
    Application.put_env(:twilio, :auth_token, @token)
    on_exit(fn -> Application.delete_env(:twilio, :auth_token) end)
    assert Webhook.valid?(@url, @params, @expected)
  end
end
