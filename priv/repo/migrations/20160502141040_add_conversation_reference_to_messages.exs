defmodule Screamer.Repo.Migrations.AddConversationReferenceToMessages do
  use Ecto.Migration

  def change do
    alter table(:messages) do
      add :conversation_id, references(:conversations, type: :uuid)
    end
  end
end
