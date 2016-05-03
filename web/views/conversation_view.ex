require IEx

defmodule Screamer.ConversationView do
  use Screamer.Web, :view
  @attributes ~W(id name)a

  def render("index.json", %{conversations: conversations}) do
    Enum.map(conversations, &(&1 |> Map.take(@attributes)))
  end

  def render("show.json", %{conversation: conversation}) do
    conversation |> Map.take(@attributes)
  end
end
