defmodule BaseballReplay.Play.About do
  @derive Jason.Encoder

  defstruct [
    :at_bat_index,
    :half_inning,
    :top_inning?,
    :inning,
    :start_time,
    :end_time,
    :complete?,
    :scoring_play?,
    :review?,
    :out?,
    :captivating_index
  ]

  @type t :: %__MODULE__{
          at_bat_index: non_neg_integer(),
          half_inning: String.t(),
          top_inning?: boolean(),
          inning: String.t(),
          start_time: DateTime.t(),
          end_time: DateTime.t(),
          complete?: boolean(),
          scoring_play?: boolean(),
          review?: boolean(),
          out?: boolean(),
          captivating_index: non_neg_integer()
        }

  @spec parse(map()) :: {:ok, t()}
  def parse(json) do
    {:ok, start_time, _} = DateTime.from_iso8601(json["startTime"])
    {:ok, end_time, _} = DateTime.from_iso8601(json["endTime"])

    {:ok,
     %__MODULE__{
       at_bat_index: json["atBatIndex"],
       half_inning: json["halfInning"],
       top_inning?: json["isTopInning"],
       inning: json["inning"],
       start_time: start_time,
       end_time: end_time,
       complete?: json["isComplete"],
       scoring_play?: json["isScoringPlay"],
       review?: json["hasReview"],
       out?: json["hasOut"],
       captivating_index: json["captivatingIndex"]
     }}
  end

  @spec start_time(t()) :: DateTime.t()
  def start_time(%__MODULE__{start_time: start_time}), do: start_time
end
