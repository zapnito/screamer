require IEx

defmodule Screamer.MessageView do
  use Screamer.Web, :view
  @attributes ~W(id body conversation_id)a

  def render("index.json", %{messages: messages}) do
    Enum.map(messages, &(render("show.json", %{message: &1})))
  end

  def render("show.json", %{message: message}) do
    message |> Map.take(@attributes)
  end
end
