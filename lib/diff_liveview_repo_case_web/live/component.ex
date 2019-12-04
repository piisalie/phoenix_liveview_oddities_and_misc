defmodule DiffLiveviewRepoCaseWeb.Component do
  use Phoenix.LiveComponent
  use Phoenix.HTML

  def render(assigns) do
    ~L"""
    <div class="some stuff">
      <%= title(@room_name) %>
      <%= @inner_content.(%{}) %>
    </div>
    """
  end

  def title(name) do
    content_tag(:div, name)
  end
end
