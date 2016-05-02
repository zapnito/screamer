defmodule Screamer.Repo.Migrations.CreateConversation do
  use Ecto.Migration

  def change do
    create table(:conversations, primary_key: false) do
      add :id, :uuid, primary_key: true
      add :name, :string

      timestamps
    end

  end
end
