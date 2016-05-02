defmodule Mix.Tasks.Db.Seed do
  use Mix.Task
  alias Screamer.Repo
  alias Screamer.Conversation

  def run(_) do
    Mix.Task.run "app.start", []
    conversation_id = "eecf4c2b-f6e5-3ae3-bef7-1ea09f91d3e7"
    conversation = Repo.get Conversation, conversation_id

    unless conversation do
      Repo.insert! Conversation.changeset(%Conversation{}, %{id: "eecf4c2b-f6e5-3ae3-bef7-1ea09f91d3e7", name: "Lobby"})
    end
  end
end
