defmodule Mix.Tasks.Db.Clear do
  use Mix.Task
  alias Screamer.{Repo, Conversation, Message}

  def run(_) do
    Mix.Task.run "app.start", []

    Enum.each [Message, Conversation], fn model ->
      Repo.delete_all model
    end
  end
end
