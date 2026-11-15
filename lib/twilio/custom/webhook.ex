defmodule Twilio.Webhook do
  @moduledoc """
  Checks that a webhook request really comes from Twilio.

  Twilio signs every request it sends to your app (incoming messages and
  calls, status callbacks) with your auth token, in the `X-Twilio-Signature`
  header. Check it before acting on the request:

      # A Phoenix controller
      def incoming_sms(conn, params) do
        signature = conn |> get_req_header("x-twilio-signature") |> List.first()

        if Twilio.Webhook.valid?(current_url(conn), params, signature) do
          # ...
        else
          send_resp(conn, 403, "")
        end
      end

  The URL must be the one Twilio requested, query string included. Behind a
  proxy or load balancer that is the public URL (`https://example.com/sms`),
  not the one your app sees (`http://10.0.0.5:4000/sms`); build it from your
  configured host if they differ.

  Requests with a JSON body (some newer Twilio products) are signed over the
  URL alone, with the body's SHA-256 in a `bodySHA256` query parameter: pass
  the raw body, as a binary, instead of the params.

  Webhooks signed with a SharedKey instead of the auth token say so in an
  `X-Twilio-Webhooks-Signature-Settings` header; pass it as `:settings` and
  the SharedKey secret as `:auth_token`.

  Same rules as Twilio's official SDKs: parameters sorted by name, then value,
  duplicates removed; the URL tried with and without its default port, since
  Twilio signs either; signatures compared in constant time.
  """

  @doc """
  Whether `signature` (the `X-Twilio-Signature` header) is Twilio's signature
  of a request to `url` with `params`.

  `params` is the form body as a map, keyword list or list of pairs (repeated
  names allowed), or the raw body as a binary for JSON requests.

  Options:

    * `:auth_token`: the secret it was signed with. Default:
      `config :twilio, auth_token: ...`, then the `TWILIO_AUTH_TOKEN`
      environment variable
    * `:settings`: the `X-Twilio-Webhooks-Signature-Settings` header, when
      the request has one
    * `:algorithm`: `:hmac_sha1` (the default) or `:hmac_sha256`, instead of
      reading it from `:settings`
  """
  @spec valid?(
          String.t(),
          map | keyword | [{String.t(), term}] | binary,
          String.t() | nil,
          keyword
        ) ::
          boolean
  def valid?(url, params, signature, opts \\ [])

  def valid?(_url, _params, nil, _opts), do: false

  def valid?(url, params, signature, opts) when is_binary(signature) do
    case algorithm(opts) do
      :error ->
        false

      algorithm ->
        {params, body_ok?} = body(url, params)
        token = auth_token!(opts)

        body_ok? and
          Enum.any?([without_port(url), with_port(url)], fn candidate ->
            secure_compare(compute(candidate, params, algorithm, token), signature)
          end)
    end
  end

  @doc """
  The signature Twilio would send for a request to `url` with `params`:
  useful in your tests, to sign the requests you send to your own webhook.

  Takes the `:auth_token` and `:algorithm` options of `valid?/4`.
  """
  @spec signature(String.t(), map | keyword | [{String.t(), term}], keyword) :: String.t()
  def signature(url, params, opts \\ []) do
    case algorithm(opts) do
      :error -> raise ArgumentError, "unsupported algorithm: #{inspect(opts[:algorithm])}"
      algorithm -> compute(url, params, algorithm, auth_token!(opts))
    end
  end

  # HMAC of the URL followed by every name and value, sorted, without
  # separators.
  defp compute(url, params, algorithm, token) do
    data =
      params
      |> pairs()
      |> Enum.uniq()
      |> Enum.sort()
      |> Enum.reduce(url, fn {name, value}, acc -> acc <> name <> value end)

    :crypto.mac(:hmac, hash(algorithm), token, data) |> Base.encode64()
  end

  defp hash(:hmac_sha1), do: :sha
  defp hash(:hmac_sha256), do: :sha256

  defp pairs(params) when is_map(params) or is_list(params) do
    Enum.flat_map(params, fn
      {name, values} when is_list(values) -> Enum.map(values, &{to_string(name), to_string(&1)})
      {name, value} -> [{to_string(name), to_string(value)}]
    end)
  end

  # A JSON body is signed through the URL: its hash must match `bodySHA256`.
  defp body(url, body) when is_binary(body) do
    query = url |> URI.parse() |> Map.get(:query) |> Kernel.||("") |> URI.decode_query()

    case query do
      %{"bodySHA256" => expected} ->
        actual = :crypto.hash(:sha256, body) |> Base.encode16(case: :lower)
        {[], secure_compare(actual, expected)}

      _ ->
        {[], true}
    end
  end

  defp body(_url, params), do: {params, true}

  # Twilio signs some requests with the port (https://host:443/...) and some
  # without, so both are tried, as the official SDKs do.
  defp without_port(url) do
    case split(url) do
      {scheme, authority, rest} -> scheme <> String.replace(authority, ~r/:\d+\z/, "") <> rest
      nil -> url
    end
  end

  defp with_port(url) do
    case split(url) do
      {scheme, authority, rest} ->
        if Regex.match?(~r/:\d+\z/, authority) do
          url
        else
          port = if String.downcase(scheme) == "https://", do: "443", else: "80"
          scheme <> authority <> ":" <> port <> rest
        end

      nil ->
        url
    end
  end

  defp split(url) do
    case Regex.run(~r{\A([a-zA-Z][a-zA-Z0-9+.-]*://)([^/?#]*)(.*)\z}s, url) do
      [_, scheme, authority, rest] -> {scheme, authority, rest}
      nil -> nil
    end
  end

  defp algorithm(opts) do
    case opts[:algorithm] || from_settings(opts[:settings]) do
      algorithm when algorithm in [:hmac_sha1, :hmac_sha256] -> algorithm
      _ -> :error
    end
  end

  # "key=webhooks_sharedkey_...,algorithm=HMAC_SHA256"; missing means the
  # auth token's HMAC-SHA1.
  defp from_settings(nil), do: :hmac_sha1

  defp from_settings(header) do
    header
    |> String.split(",")
    |> Enum.find_value("HMAC_SHA1", fn part ->
      case String.split(part, "=", parts: 2) do
        [name, value] ->
          if String.trim(name) == "algorithm" and String.trim(value) != "",
            do: String.trim(value)

        _ ->
          nil
      end
    end)
    |> String.upcase()
    |> case do
      "HMAC_SHA1" -> :hmac_sha1
      "HMAC_SHA256" -> :hmac_sha256
      _ -> :error
    end
  end

  defp auth_token!(opts) do
    opts[:auth_token] || Application.get_env(:twilio, :auth_token) ||
      System.get_env("TWILIO_AUTH_TOKEN") ||
      raise ArgumentError,
            "no auth token: pass auth_token: ..., set config :twilio, auth_token: ..., " <>
              "or set TWILIO_AUTH_TOKEN"
  end

  defp secure_compare(a, b) when byte_size(a) == byte_size(b), do: :crypto.hash_equals(a, b)
  defp secure_compare(_a, _b), do: false
end
