defmodule BaseballReplay.Play.Runner do
  @derive Jason.Encoder

  defstruct [
    :movement,
    :details,
    :credits
  ]

  @type base :: :"1B" | :"2B" | :"3B"

  @type movement :: %{
    origin_base: base(),
    start: base(),
    end: base(),
    out_base: base(),
    out?: boolean(),
    out_number: non_neg_integer()
  }

  @type t :: %__MODULE__{
    movement: movement(),
  }

  @spec parse(map()) :: {:ok, t()}
  def parse(json) do
    {:ok,
     %__MODULE__{
       movement: parse_movement(json["movement"])
     }}
  end

  @spec parse_movement(map()) :: movement()
  defp parse_movement(json) do
    origin_base: base(json["originBase"]),
    start: base(json["start"]),
    end: base(json["end"]),
    out_base: base(json["outBase"]),
    out?: json["isOut"],
    out_number: json["outNumber"]
  end

  defp base("1B"), do: :"1B"
  defp base("2B"), do: :"2B"
  defp base("3B"), do: :"3B"
end
