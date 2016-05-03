defmodule Screamer.ConversationTest do
  use Screamer.ModelCase

  alias Screamer.Conversation
  alias Ecto.UUID

  @valid_attrs %{id: UUID.generate, name: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Conversation.changeset(%Conversation{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Conversation.changeset(%Conversation{}, @invalid_attrs)
    refute changeset.valid?
  end
end
