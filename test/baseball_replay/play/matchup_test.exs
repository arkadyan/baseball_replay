defmodule BaseballReplay.Play.MatchupTest do
  use ExUnit.Case, async: true

  alias BaseballReplay.Play.{Matchup, Splits}
  alias BaseballReplay.Player

  @json %{
    "batter" => %{
      "id" => 665_161,
      "fullName" => "Jeremy Pena",
      "link" => "/api/v1/people/665161"
    },
    "batSide" => %{"code" => "R", "description" => "Right"},
    "pitcher" => %{
      "id" => 624_133,
      "fullName" => "Ranger Suarez",
      "link" => "/api/v1/people/624133"
    },
    "pitchHand" => %{"code" => "L", "description" => "Left"},
    "batterHotColdZones" => [],
    "pitcherHotColdZones" => [],
    "splits" => %{
      "batter" => "vs_LHP",
      "pitcher" => "vs_RHB",
      "menOnBase" => "Empty"
    }
  }

  describe "parse/1" do
    test "parses json data into a Matchup struct" do
      assert Matchup.parse(@json) ==
               {:ok,
                %Matchup{
                  batter: %Player{
                    id: 665_161,
                    full_name: "Jeremy Pena",
                    link: "/api/v1/people/665161"
                  },
                  bat_side: :right,
                  pitcher: %Player{
                    id: 624_133,
                    full_name: "Ranger Suarez",
                    link: "/api/v1/people/624133"
                  },
                  pitch_hand: :left,
                  batter_hot_cold_zones: [],
                  pitcher_hot_cold_zones: [],
                  splits: %Splits{
                    batter: :vs_lhp,
                    pitcher: :vs_rhb,
                    men_on_base: :empty
                  }
                }}
    end
  end
end
