defmodule DiffLiveviewRepoCaseWeb.MessagesLive do
  use Phoenix.LiveView
  use Phoenix.HTML

  def render(assigns) do
    ~L"""
      <div>TITLE: <%= @struct.title %> </div>

      <div id="messages">
        <%= for message <- @struct.messages do %>
          <div id="<%= message.id %>"><%= message.content %></div>
        <% end %>
      </div>

      <br>

      <%= cool_divs(@other_thing) %>
    """
  end

  def mount(_initial_params, socket) do
    Phoenix.PubSub.subscribe(DiffLiveviewRepoCase.PubSub, "messages")
    messages = [%{id: 1, content: "first"}, %{id: 2, content: "second"}]

    {:ok,
     assign(
       socket,
       room_name: "Hello World",
       other_thing: "test",
       struct: %{messages: messages, title: "some place nice"}
     )}
  end

  def handle_info({:new_message, message}, socket) do
    new_struct = %{socket.assigns.struct | messages: [message | socket.assigns.struct.messages]}

    {:noreply, assign(socket, :struct, new_struct)}
  end

  def handle_info({:update_thing, message}, socket) do
    {:noreply, assign(socket, :other_thing, message)}
  end

  def cool_divs(text) do
    content_tag(:div) do
      [
        content_tag(:span, text)
      ]
    end
  end
end
