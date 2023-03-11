defmodule BaseballReplay.Play do
  @moduledoc """
  Represent an individual play.
  """

  alias BaseballReplay.Play.{About, Result}

  @derive Jason.Encoder

  defstruct [
    :result,
    :about,
    :play_end_time,
    :at_bat_index
  ]

  @type t :: %__MODULE__{
          result: Result.t(),
          about: About.t(),
          play_end_time: DateTime.t(),
          at_bat_index: non_neg_integer()
        }

  def parse(json) do
    {:ok, result} = Result.parse(json["result"])
    {:ok, about} = About.parse(json["about"])
    {:ok, play_end_time, _} = DateTime.from_iso8601(json["playEndTime"])

    {:ok,
     %__MODULE__{
       result: result,
       about: about,
       play_end_time: play_end_time,
       at_bat_index: json["atBatIndex"]
     }}
  end

  @spec start_time(t()) :: DateTime.t()
  def start_time(%__MODULE__{about: about}), do: About.start_time(about)
end
