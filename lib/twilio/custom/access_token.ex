defmodule Twilio.AccessToken do
  @moduledoc """
  Access tokens for Twilio's client SDKs: the Voice SDK in a browser or app,
  Video, Conversations (Chat), Sync.

  Your server makes a short-lived token for a user, and the client SDK uses
  it to talk to Twilio directly:

      token =
        Twilio.AccessToken.generate(
          identity: "alice",
          grants: [voice: [outgoing_application_sid: "AP...", incoming_allow: true]]
        )

  Tokens are signed with an [API key](https://www.twilio.com/docs/iam/api-keys)
  (`SK...` and its secret), not your auth token. The key, its secret and your
  account SID come from the options, else from your config, else from the
  environment:

      config :twilio,
        account_sid: "AC...",
        api_key_sid: "SK...",
        api_key_secret: "..."

      # or TWILIO_ACCOUNT_SID, TWILIO_API_KEY and TWILIO_API_SECRET

  The token is the same JWT Twilio's official SDKs make: HS256, a
  `twilio-fpa;v=1` content type, and the grants below.
  """

  @grants %{
    voice: "voice",
    video: "video",
    chat: "chat",
    sync: "data_sync",
    task_router: "task_router",
    playback: "player"
  }

  @doc """
  A signed access token, as a string.

  Options:

    * `:identity`: who the token is for (required for Voice, Chat and Sync)
    * `:grants`: what the token allows, a keyword list:
        * `voice: [incoming_allow: true, outgoing_application_sid: "AP...",
          outgoing_application_params: %{...}, push_credential_sid: "CR...",
          endpoint_id: "..."]`
        * `video: [room: "..."]`
        * `chat: [service_sid: "IS...", endpoint_id: "...",
          deployment_role_sid: "...", push_credential_sid: "..."]`
          (Conversations uses this grant too)
        * `sync: [service_sid: "IS...", endpoint_id: "..."]`
        * `task_router: [workspace_sid: "WS...", worker_sid: "WK...", role: "..."]`
        * `playback: %{...}`, the grant Twilio Live's API returned
    * `:ttl`: seconds the token is valid (default 3600; Twilio allows up to 24 hours)
    * `:valid_until`: a Unix time when it expires, instead of `:ttl`
    * `:nbf`: a Unix time before which it isn't valid (default: now; `false` to leave it out)
    * `:region`: the Twilio region, such as `"ie1"`
    * `:account_sid`, `:api_key_sid`, `:api_key_secret`: see the module docs
    * `:now`: the current Unix time (for tests)
  """
  @spec generate(keyword) :: String.t()
  def generate(opts \\ []) do
    now = Keyword.get_lazy(opts, :now, fn -> System.system_time(:second) end)
    key_sid = setting!(opts, :api_key_sid, "TWILIO_API_KEY")
    secret = setting!(opts, :api_key_secret, "TWILIO_API_SECRET")
    account_sid = setting!(opts, :account_sid, "TWILIO_ACCOUNT_SID")

    grants =
      opts
      |> Keyword.get(:grants, [])
      |> Map.new(fn {name, value} -> grant(name, value) end)

    grants =
      case opts[:identity] do
        nil -> grants
        identity -> Map.put(grants, "identity", to_string(identity))
      end

    nbf =
      case Keyword.get(opts, :nbf, now) do
        false -> nil
        nbf -> nbf
      end

    payload =
      %{
        "jti" => "#{key_sid}-#{now}",
        "grants" => grants,
        "iss" => key_sid,
        "sub" => account_sid,
        "exp" => opts[:valid_until] || now + Keyword.get(opts, :ttl, 3600),
        "nbf" => nbf
      }
      |> reject_nil()

    header =
      %{"typ" => "JWT", "alg" => "HS256", "cty" => "twilio-fpa;v=1", "twr" => opts[:region]}
      |> reject_nil()

    signing_input = encode(header) <> "." <> encode(payload)

    signature =
      :crypto.mac(:hmac, :sha256, secret, signing_input) |> Base.url_encode64(padding: false)

    signing_input <> "." <> signature
  end

  defp grant(:playback, grant) when is_map(grant), do: {"player", grant}

  defp grant(name, options) when is_map_key(@grants, name) and is_list(options) do
    {@grants[name], payload(name, options)}
  end

  defp grant(name, options) do
    raise ArgumentError,
          "unknown grant #{inspect(name)} => #{inspect(options)}; the grants are " <>
            Enum.map_join(Map.keys(@grants), ", ", &inspect/1)
  end

  # Only the options that are set, as the official SDKs do.
  defp payload(:voice, options) do
    outgoing =
      if sid = options[:outgoing_application_sid] do
        reject_nil(%{"application_sid" => sid, "params" => options[:outgoing_application_params]})
      end

    reject_nil(%{
      "incoming" => if(options[:incoming_allow] == true, do: %{"allow" => true}),
      "outgoing" => outgoing,
      "push_credential_sid" => options[:push_credential_sid],
      "endpoint_id" => options[:endpoint_id]
    })
  end

  defp payload(:video, options), do: take(options, [:room])

  defp payload(:chat, options),
    do: take(options, [:service_sid, :endpoint_id, :deployment_role_sid, :push_credential_sid])

  defp payload(:sync, options), do: take(options, [:service_sid, :endpoint_id])
  defp payload(:task_router, options), do: take(options, [:workspace_sid, :worker_sid, :role])

  defp take(options, keys) do
    for key <- keys,
        value = options[key],
        value not in [nil, false, ""],
        into: %{},
        do: {Atom.to_string(key), value}
  end

  defp reject_nil(map), do: for({k, v} <- map, v != nil, into: %{}, do: {k, v})

  defp encode(map), do: map |> JSON.encode!() |> Base.url_encode64(padding: false)

  defp setting!(opts, key, env) do
    opts[key] || Application.get_env(:twilio, key) || System.get_env(env) ||
      raise ArgumentError,
            "#{inspect(key)} is needed for an access token: pass #{key}: ..., " <>
              "set config :twilio, #{key}: ..., or set #{env}"
  end
end
