defmodule TwilioLiveTest do
  # Against the real API, with your account:
  #
  #     TWILIO_ACCOUNT_SID=AC... TWILIO_AUTH_TOKEN=... mix test --only live
  #
  # Only reads, unless TWILIO_TEST_FROM (your Twilio number) and
  # TWILIO_TEST_TO (on a trial account: a verified number) are set; then it
  # also sends one SMS.
  use ExUnit.Case, async: false

  @moduletag :live

  test "account, balance, messages, available numbers" do
    sid = System.fetch_env!("TWILIO_ACCOUNT_SID")

    assert {:ok, %Twilio.Schemas.Account{sid: ^sid} = account} = Twilio.Accounts.retrieve(sid)
    IO.puts("\n  account: #{account.friendly_name} (#{account.status}, #{account.type})")

    assert {:ok, %Twilio.Schemas.Balance{} = balance} = Twilio.Balance.retrieve()
    IO.puts("  balance: #{balance.balance} #{balance.currency}")

    assert {:ok, %Twilio.Schemas.MessagesListResponse{messages: messages}} =
             Twilio.Messages.list(page_size: 3)

    IO.puts("  last messages: #{length(messages)}")

    assert {:ok, page} = Twilio.AvailablePhoneNumbers.Local.list("US", page_size: 2)

    IO.puts(
      "  US numbers for sale: #{Enum.map_join(page.available_phone_numbers, ", ", & &1.phone_number)}"
    )

    # Two pages of one: paging through next_page_uri.
    numbers = Twilio.Messages.list_all!(page_size: 1) |> Enum.take(2)
    IO.puts("  paged messages: #{length(numbers)}")

    assert {:error, %Infusion.Runtime.Error{status: 404, type: :not_found}} =
             Twilio.Messages.retrieve("SM00000000000000000000000000000000")
  end

  test "sends an SMS" do
    case {System.get_env("TWILIO_TEST_FROM"), System.get_env("TWILIO_TEST_TO")} do
      {from, to} when is_binary(from) and is_binary(to) ->
        assert {:ok, %Twilio.Schemas.Message{sid: "SM" <> _} = message} =
                 Twilio.Messages.create(
                   to: to,
                   from: from,
                   body: "Hello from the Elixir Twilio SDK"
                 )

        IO.puts("\n  sent #{message.sid}: #{message.status}")
        assert {:ok, %Twilio.Schemas.Message{}} = Twilio.Messages.retrieve(message.sid)

      _ ->
        IO.puts("\n  skipped: set TWILIO_TEST_FROM and TWILIO_TEST_TO to send an SMS")
    end
  end
end
