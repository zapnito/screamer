defmodule Screamer.MessageTest do
  use Screamer.ModelCase

  alias Screamer.Message
  alias Ecto.UUID

  @valid_attrs %{id: UUID.generate, body: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Message.changeset(%Message{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Message.changeset(%Message{}, @invalid_attrs)
    refute changeset.valid?
  end
end
