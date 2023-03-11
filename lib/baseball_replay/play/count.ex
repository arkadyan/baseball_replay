defmodule BaseballReplay.Play.Count do
  @derive Jason.Encoder

  defstruct [
    :balls,
    :strikes,
    :outs
  ]

  @type t :: %__MODULE__{
          balls: non_neg_integer(),
          strikes: non_neg_integer(),
          outs: non_neg_integer()
        }

  @spec parse(map()) :: {:ok, t()}
  def parse(json) do
    {:ok,
     %__MODULE__{
       balls: json["balls"],
       strikes: json["strikes"],
       outs: json["outs"]
     }}
  end
end
