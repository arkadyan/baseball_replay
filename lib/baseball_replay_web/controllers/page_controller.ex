defmodule BaseballReplayWeb.PageController do
  use BaseballReplayWeb, :controller

  def home(conn, _params) do
    # The home page is often custom made,
    # so skip the default app layout.
    # render(conn, :home, layout: false)
    redirect(conn, to: ~p"/replays")
  end
end
