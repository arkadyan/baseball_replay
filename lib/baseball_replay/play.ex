defmodule BaseballReplay.Play do
  @moduledoc """
  Represent an individual play.
  """

  alias BaseballReplay.Play.{About, Count, Matchup, Result}

  @derive Jason.Encoder

  defstruct [
    :result,
    :about,
    :count,
    :matchup,
    :pitch_index,
    :action_index,
    :runner_index,
    :play_end_time,
    :at_bat_index
  ]

  @type t :: %__MODULE__{
          result: Result.t(),
          about: About.t(),
          count: Count.t(),
          matchup: Matchup.t(),
          pitch_index: [non_neg_integer()],
          action_index: [non_neg_integer()],
          runner_index: [non_neg_integer()],
          play_end_time: DateTime.t(),
          at_bat_index: non_neg_integer()
        }

  @spec parse(map()) :: {:ok, t()}
  def parse(json) do
    {:ok, result} = Result.parse(json["result"])
    {:ok, about} = About.parse(json["about"])
    {:ok, count} = Count.parse(json["count"])
    {:ok, matchup} = Matchup.parse(json["matchup"])
    {:ok, play_end_time, _} = DateTime.from_iso8601(json["playEndTime"])

    {:ok,
     %__MODULE__{
       result: result,
       about: about,
       count: count,
       matchup: matchup,
       pitch_index: json["pitchIndex"],
       action_index: json["actionIndex"],
       runner_index: json["runnerIndex"],
       play_end_time: play_end_time,
       at_bat_index: json["atBatIndex"]
     }}
  end

  @spec start_time(t()) :: DateTime.t()
  def start_time(%__MODULE__{about: about}), do: About.start_time(about)
end
