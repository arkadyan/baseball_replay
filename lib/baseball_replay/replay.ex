defmodule BaseballReplay.Replay do
  alias BaseballReplay.Game

  @derive Jason.Encoder

  defstruct [
    :game_id,
    :game,
    :replay_start_time,
    :time_offset
  ]

  @type id :: String.t()

  @type t :: %__MODULE__{
          game_id: id(),
          game: Game.t(),
          replay_start_time: DateTime.t(),
          time_offset: non_neg_integer()
        }

  def new(game_id, game, replay_start_time) do
    %__MODULE__{
      game_id: game_id,
      game: game,
      replay_start_time: replay_start_time,
      time_offset: DateTime.diff(replay_start_time, Game.start_time(game))
    }
  end

  def in_progress(
        %__MODULE__{game: game, replay_start_time: replay_start_time, time_offset: time_offset} =
          replay,
        current_time \\ DateTime.utc_now()
      ) do
    time_since_replay_start = DateTime.diff(current_time, replay_start_time)

    relative_game_time =
      game
      |> Game.start_time()
      |> DateTime.add(time_since_replay_start)

    IO.inspect(relative_game_time, label: "relative_game_time")
    IO.inspect(time_offset, label: "time_offset")

    %__MODULE__{
      replay
      | game: Game.in_progress(game, relative_game_time)
    }
  end
end
