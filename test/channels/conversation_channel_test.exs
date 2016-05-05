require IEx
defmodule Screamer.ConversationChannelTest do
  use Screamer.ChannelCase

  alias Screamer.ConversationChannel
  alias Screamer.Conversation

  setup do
    conversation_changeset = Conversation.changeset(
      %Conversation{}, %{
        id: Ecto.UUID.generate,
        name: "Lobby"
      }
    )

    {:ok, conversation} = Repo.insert conversation_changeset

    message_changeset = build_assoc(
      conversation,
      :messages,
      id: Ecto.UUID.generate,
      body: "Hello world"
    )

    {:ok, message} = Repo.insert message_changeset
    {:ok, socket} = connect(Screamer.UserSocket, %{})
    {:ok, socket: socket, conversation: conversation, message: message}
  end

  # test "ping replies with status ok", %{socket: socket} do
  #   ref = push socket, "ping", %{"hello" => "there"}
  #   assert_reply ref, :ok, %{"hello" => "there"}
  # end

  # test "shout broadcasts to conversations:lobby", %{socket: socket} do
  #   push socket, "shout", %{"hello" => "all"}
  #   assert_broadcast "shout", %{"hello" => "all"}
  # end

  test "join", %{socket: socket, conversation: conversation, message: message} do
    {:ok, json, _} =
      socket
      |> subscribe_and_join(ConversationChannel, "conversations:#{conversation.id}")
    assert message.id == List.first(json).id
  end

  # test "broadcasts are pushed to the client", %{socket: socket, conversation: conversation} do
  #   {:ok, _, _} = socket |> subscribe_and_join(ConversationChannel, "conversations:#{conversation.id}")

  #   broadcast_from! socket, "broadcast", %{"some" => "data"}
  #   assert_push "broadcast", %{"some" => "data"}
  # end
end
