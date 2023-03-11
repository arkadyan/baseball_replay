defmodule BaseballReplayWeb.ReplayController do
  use BaseballReplayWeb, :controller

  alias BaseballReplay.{Game, Replay}

  def index(conn, _params) do
    replays = mock_replays()

    render(conn, :index, replays: replays)
  end

  defp mock_replays do
    {:ok, game} =
      "715722-playByPlay.json"
      |> fixture_path()
      |> File.read!()
      |> Game.parse()

    replay = Replay.new("715722", game, ~U[2023-03-11 18:00:00.000Z])

    [replay]
  end

  defp fixture_path(path) do
    fixture_path = Path.expand("../../../test/support/fixtures", __DIR__)
    Path.expand(path, fixture_path)
  end
end
