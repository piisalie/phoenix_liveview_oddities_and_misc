defmodule DiffLiveviewRepoCaseWeb.MessagesLive do
  use Phoenix.LiveView
  use Phoenix.HTML

  def render(assigns) do
    ~L"""

      <%= live_component @socket, DiffLiveviewRepoCaseWeb.Component, id: :component, room_name: @room_name do %>

      <div>OUTSIDE TITLE: <%= @other_name %> </div>

      <div id="messages" phx-update="append">
        <%= for message <- @messages do %>
          <div id="<%= message.id %>"><%= message.content %></div>
        <% end %>
      </div>
      <% end %>
      <br>
      <%= cool_divs(@other_thing) %>
    """
  end

  def mount(_initial_params, socket) do
    Phoenix.PubSub.subscribe(DiffLiveviewRepoCase.PubSub, "messages")

    {:ok,
     assign(
       socket,
       room_name: "Hello World",
       other_name: "SECOND TITLE",
       other_thing: "test"
     ), temporary_assigns: [messages: [%{id: 1, content: "first"}, %{id: 2, content: "second"}]]}
  end

  def handle_info({:new_message, message}, socket) do
    {:noreply, assign(socket, :messages, [message])}
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
