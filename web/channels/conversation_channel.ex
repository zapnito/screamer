require IEx

defmodule Screamer.ConversationChannel do
  use Screamer.Web, :channel
  alias Screamer.Conversation
  alias Screamer.Message
  alias Screamer.MessageView
  import Ecto.Query

  def join("conversations:" <> conversation_id, payload, socket) do
    if authorized?(payload) do
      messages = Message
      |> where(conversation_id: ^conversation_id)
      |> Repo.all

      messages_json = Phoenix.View.render(MessageView, "index.json", %{messages: messages})
      {:ok, messages_json, assign(socket, :conversation_id, conversation_id)}
    else
      {:error, %{reason: "unauthorized"}}
    end
  end

  # # Channels can be used in a request/response fashion
  # # by sending replies to requests from the client
  # def handle_in("ping", payload, socket) do
  #   {:reply, {:ok, payload}, socket}
  # end

  # # It is also common to receive messages from the client and
  # # broadcast to everyone in the current topic (conversations:lobby).
  # def handle_in("shout", payload, socket) do
  #   broadcast socket, "shout", payload
  #   {:noreply, socket}
  # end

  def handle_in("addMessage", message, socket) do
    conversation_id = socket.assigns.conversation_id
    conversation = Repo.get! Conversation, conversation_id
    changeset = build_assoc(conversation, :messages) |> Message.changeset(message)

    case Repo.insert(changeset) do
      {:ok, message} ->
        message_json = Phoenix.View.render(MessageView, "show.json", %{message: message})
        broadcast socket, "addMessage", message_json
        {:reply, {:ok, message_json}, socket}
      {:error, changeset} ->
        {:reply, {:error, %{errors: changeset}}, socket}
    end
  end

  # This is invoked every time a notification is being broadcast
  # to the client. The default implementation is just to push it
  # downstream but one could filter or change the event.
  def handle_out(event, payload, socket) do
    push socket, event, payload
    {:noreply, socket}
  end

  # Add authorization logic here as required.
  defp authorized?(_payload) do
    true
  end
end
