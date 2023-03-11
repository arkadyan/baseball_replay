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
end
