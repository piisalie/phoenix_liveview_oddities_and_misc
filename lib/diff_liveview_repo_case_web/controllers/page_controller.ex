defmodule DiffLiveviewRepoCaseWeb.PageController do
  use DiffLiveviewRepoCaseWeb, :controller

  def index(conn, _params) do
    live_render(conn, DiffLiveviewRepoCaseWeb.MessagesLive, session: %{})
  end

  def send_message(conn, _params) do
    result =
      Phoenix.PubSub.broadcast(
        DiffLiveviewRepoCase.PubSub,
        "messages",
        {:new_message, %{id: 3, content: "three"}}
      )

    conn |> text(result)
  end

  def update_var(conn, _params) do
    result =
      Phoenix.PubSub.broadcast(
        DiffLiveviewRepoCase.PubSub,
        "messages",
        {:update_thing, "a new hope"}
      )

    conn |> text(result)
  end
end
