defmodule TwilioTest do
  # Against a stub of the API: what goes over the wire, and what comes back.
  use ExUnit.Case, async: false

  setup do
    Application.put_env(:twilio, :req_options, plug: {Req.Test, __MODULE__})
    Application.put_env(:twilio, :api_key, {"AC123", "token"})
    Application.put_env(:twilio, :account_sid, "AC123")
    Application.put_env(:twilio, :sleep, fn _ms -> :ok end)

    on_exit(fn ->
      for key <- [:req_options, :api_key, :account_sid, :sleep],
          do: Application.delete_env(:twilio, key)
    end)

    Req.Test.verify_on_exit!()
    :ok
  end

  @message %{
    "sid" => "SM1",
    "account_sid" => "AC123",
    "to" => "+15558675310",
    "from" => "+15017122661",
    "body" => "Hello",
    "status" => "queued",
    "num_segments" => "1",
    "price" => nil,
    "date_created" => "Sat, 15 Nov 2026 10:00:00 +0000"
  }

  test "sends a message: form body, basic auth, the account from config" do
    Req.Test.expect(__MODULE__, fn conn ->
      assert conn.method == "POST"
      assert conn.request_path == "/2010-04-01/Accounts/AC123/Messages.json"

      assert ["Basic " <> credentials] = Plug.Conn.get_req_header(conn, "authorization")
      assert Base.decode64!(credentials) == "AC123:token"

      {:ok, body, conn} = Plug.Conn.read_body(conn)

      assert URI.decode_query(body) == %{
               "To" => "+15558675310",
               "From" => "+15017122661",
               "Body" => "Hello"
             }

      conn |> Plug.Conn.put_status(201) |> Req.Test.json(@message)
    end)

    assert {:ok, %Twilio.Schemas.Message{sid: "SM1", status: "queued", body: "Hello"}} =
             Twilio.Messages.create(to: "+15558675310", from: "+15017122661", body: "Hello")
  end

  test "a call can use another account (a subaccount)" do
    Req.Test.expect(__MODULE__, fn conn ->
      assert conn.request_path == "/2010-04-01/Accounts/AC999/Messages/SM1.json"
      Req.Test.json(conn, @message)
    end)

    assert {:ok, %Twilio.Schemas.Message{}} =
             Twilio.Messages.retrieve("SM1", account_sid: "AC999")
  end

  test "list_all reads every page through next_page_uri" do
    pages = [
      {"PageSize=2", ["SM1", "SM2"],
       "/2010-04-01/Accounts/AC123/Messages.json?PageSize=2&Page=1&PageToken=PASM2"},
      {"PageSize=2&Page=1&PageToken=PASM2", ["SM3"], nil}
    ]

    for {query, sids, next} <- pages do
      Req.Test.expect(__MODULE__, fn conn ->
        assert conn.request_path == "/2010-04-01/Accounts/AC123/Messages.json"
        assert conn.query_string == query

        Req.Test.json(conn, %{
          "messages" => Enum.map(sids, &Map.put(@message, "sid", &1)),
          "next_page_uri" => next,
          "page_size" => 2
        })
      end)
    end

    assert [%Twilio.Schemas.Message{sid: "SM1"}, %{sid: "SM2"}, %{sid: "SM3"}] =
             Twilio.Messages.list_all!(page_size: 2) |> Enum.to_list()
  end

  test "the first page of a list is a struct too" do
    Req.Test.expect(__MODULE__, fn conn ->
      Req.Test.json(conn, %{"messages" => [@message], "next_page_uri" => nil, "page" => 0})
    end)

    assert {:ok,
            %Twilio.Schemas.MessagesListResponse{
              messages: [%Twilio.Schemas.Message{sid: "SM1"}],
              page: 0
            }} = Twilio.Messages.list()
  end

  test "errors come back typed, with Twilio's error code" do
    Req.Test.expect(__MODULE__, fn conn ->
      conn
      |> Plug.Conn.put_status(400)
      |> Req.Test.json(%{
        "code" => 21_211,
        "message" => "The 'To' number +1555 is not a valid phone number.",
        "more_info" => "https://www.twilio.com/docs/errors/21211",
        "status" => 400
      })
    end)

    assert {:error, %Infusion.Runtime.Error{type: :bad_request, status: 400} = error} =
             Twilio.Messages.create(to: "+1555", from: "+15017122661", body: "x")

    assert error.body["code"] == 21_211
    assert Exception.message(error) =~ "not a valid phone number"
  end

  test "without credentials the account is asked for, not guessed" do
    Application.delete_env(:twilio, :account_sid)
    previous = System.get_env("TWILIO_ACCOUNT_SID")
    System.delete_env("TWILIO_ACCOUNT_SID")
    on_exit(fn -> if previous, do: System.put_env("TWILIO_ACCOUNT_SID", previous) end)

    assert_raise ArgumentError, ~r/:account_sid setting/, fn -> Twilio.Messages.list() end
  end
end
