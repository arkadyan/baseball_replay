defmodule BaseballReplay.Play.Matchup do
  @derive Jason.Encoder

  alias BaseballReplay.Play.Splits
  alias BaseballReplay.Player

  defstruct [
    :batter,
    :bat_side,
    :pitcher,
    :pitch_hand,
    :batter_hot_cold_zones,
    :pitcher_hot_cold_zones,
    :splits
  ]

  @type bat_pitch_hand :: :left | :right

  @type t :: %__MODULE__{
          batter: Player.t(),
          bat_side: bat_pitch_hand(),
          pitcher: Player.t(),
          pitch_hand: bat_pitch_hand(),
          batter_hot_cold_zones: [non_neg_integer()],
          pitcher_hot_cold_zones: [non_neg_integer()],
          splits: Splits.t()
        }

  @spec parse(map()) :: {:ok, t()}
  def parse(json) do
    {:ok, batter} = Player.parse(json["batter"])
    {:ok, pitcher} = Player.parse(json["pitcher"])
    {:ok, splits} = Splits.parse(json["splits"])

    {:ok,
     %__MODULE__{
       batter: batter,
       bat_side: bat_pitch_hand(json["batSide"]),
       pitcher: pitcher,
       pitch_hand: bat_pitch_hand(json["pitchHand"]),
       batter_hot_cold_zones: json["batterHotColdZones"],
       pitcher_hot_cold_zones: json["pitcherHotColdZones"],
       splits: splits
     }}
  end

  @spec bat_pitch_hand(map()) :: bat_pitch_hand() | nil
  defp bat_pitch_hand(%{"code" => "L", "description" => "Left"}), do: :left
  defp bat_pitch_hand(%{"code" => "R", "description" => "Right"}), do: :right
  defp bat_pitch_hand(_), do: nil
end
