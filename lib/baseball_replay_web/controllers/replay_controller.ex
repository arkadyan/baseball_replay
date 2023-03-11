defmodule BaseballReplayWeb.ReplayController do
  use BaseballReplayWeb, :controller

  alias BaseballReplay.{Game, Replay}

  def index(conn, _params) do
    replays = [mock_replay()]

    render(conn, :index, replays: replays)
  end

  def show(conn, _params) do
    replay =
      mock_replay()
      |> Replay.in_progress()

    json(conn, replay)
  end

  defp mock_replay do
    {:ok, game} =
      "715722-playByPlay.json"
      |> fixture_path()
      |> File.read!()
      |> Game.parse()

    Replay.new("715722", game, ~U[2023-03-11 20:00:00.000Z])
  end

  defp fixture_path(path) do
    fixture_path = Path.expand("../../../test/support/fixtures", __DIR__)
    Path.expand(path, fixture_path)
  end
end
