defmodule BaseballReplay.Play.Result do
  defstruct [
    :type,
    :event,
    :event_type,
    :description,
    :rbi,
    :away_score,
    :home_score,
    :out?
  ]

  @type t :: %__MODULE__{
          type: String.t(),
          event: String.t(),
          event_type: String.t(),
          description: String.t(),
          rbi: non_neg_integer(),
          away_score: non_neg_integer(),
          home_score: non_neg_integer(),
          out?: boolean()
        }

  @spec parse(map()) :: {:ok, t()}
  def parse(json) do
    {:ok,
     %__MODULE__{
       type: json["type"],
       event: json["event"],
       event_type: json["eventType"],
       description: json["description"],
       rbi: json["rbi"],
       away_score: json["awayScore"],
       home_score: json["homeScore"],
       out?: json["isOut"]
     }}
  end
end
