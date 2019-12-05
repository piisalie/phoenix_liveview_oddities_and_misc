defmodule DiffLiveviewRepoCaseWeb.Component do
  use Phoenix.LiveComponent
  use Phoenix.HTML

  def render(assigns) do
    ~L"""
    <div class="some stuff">
      <%= title(@room_name) %>
      <%= @inner_content.(%{}) %>

      <%= other_stuff() %>
    </div>
    """
  end

  def title(name) do
    content_tag(:div, name)
  end

  def other_stuff, do: other_stuff(do: [])

  def other_stuff(do: block) do
    content_tag(:div) do
      [block, link("about", to: "#", class: "whatever"), link("home", to: "#", class: "whatever")]
    end
  end
end
