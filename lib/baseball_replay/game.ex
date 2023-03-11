defmodule BaseballReplay.Game do
  @moduledoc """
  Represent an individual game.
  """

  alias BaseballReplay.Play

  @derive Jason.Encoder

  defstruct [
    :start_time,
    :current_play,
    all_plays: []
  ]

  @type t :: %__MODULE__{
          start_time: DateTime.t(),
          all_plays: list(Play.t()),
          current_play: Play.t()
          #         scoringPlays: String.t(),
          #         playsByInning: String.t()
        }

  def parse(binary) do
    json = Jason.decode!(binary)

    all_plays =
      json["allPlays"]
      |> Enum.map(fn play_json ->
        {:ok, play} = Play.parse(play_json)
        play
      end)

    start_time = all_plays |> List.first() |> Play.start_time()

    {:ok, current_play} = Play.parse(json["currentPlay"])

    {:ok,
     %__MODULE__{
       start_time: start_time,
       all_plays: all_plays,
       current_play: current_play
     }}
  end

  def start_time(%__MODULE__{start_time: start_time}), do: start_time
end
