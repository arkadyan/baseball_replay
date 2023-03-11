defmodule BaseballReplay.PlayTest do
  use ExUnit.Case, async: true

  alias BaseballReplay.Play
  alias BaseballReplay.Play.{About, Count, Matchup, Result}

  @json %{
    "result" => %{
      "type" => "atBat",
      "event" => "Lineout",
      "eventType" => "field_out",
      "description" => "Jose Altuve lines out to right fielder Nick Castellanos.",
      "rbi" => 0,
      "awayScore" => 0,
      "homeScore" => 0,
      "isOut" => true
    },
    "about" => %{
      "atBatIndex" => 0,
      "halfInning" => "top",
      "isTopInning" => true,
      "inning" => 1,
      "startTime" => "2022-11-02T00:05:14.458Z",
      "endTime" => "2022-11-02T00:05:23.532Z",
      "isComplete" => true,
      "isScoringPlay" => false,
      "hasReview" => false,
      "hasOut" => true,
      "captivatingIndex" => 0
    },
    "count" => %{"balls" => 0, "strikes" => 0, "outs" => 1},
    "matchup" => %{
      "batter" => %{
        "id" => 514_888,
        "fullName" => "Jose Altuve",
        "link" => "/api/v1/people/514888"
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
    },
    "pitchIndex" => [3],
    "actionIndex" => [0, 1, 2],
    "runnerIndex" => [0],
    "runners" => [
      %{
        "movement" => %{
          "originBase" => nil,
          "start" => nil,
          "end" => nil,
          "outBase" => "1B",
          "isOut" => true,
          "outNumber" => 1
        },
        "details" => %{
          "event" => "Lineout",
          "eventType" => "field_out",
          "movementReason" => nil,
          "runner" => %{
            "id" => 514_888,
            "fullName" => "Jose Altuve",
            "link" => "/api/v1/people/514888"
          },
          "responsiblePitcher" => nil,
          "isScoringEvent" => false,
          "rbi" => false,
          "earned" => false,
          "teamUnearned" => false,
          "playIndex" => 3
        },
        "credits" => [
          %{
            "player" => %{"id" => 592_206, "link" => "/api/v1/people/592206"},
            "position" => %{
              "code" => "9",
              "name" => "Outfielder",
              "type" => "Outfielder",
              "abbreviation" => "RF"
            },
            "credit" => "f_putout"
          }
        ]
      }
    ],
    "playEvents" => [
      %{
        "details" => %{
          "description" => "Status Change - Pre-Game",
          "event" => "Game Advisory",
          "eventType" => "game_advisory",
          "awayScore" => 0,
          "homeScore" => 0,
          "isScoringPlay" => false,
          "isOut" => false,
          "hasReview" => false
        },
        "count" => %{"balls" => 0, "strikes" => 0, "outs" => 0},
        "index" => 0,
        "startTime" => "2022-11-01T20:33:07.159Z",
        "endTime" => "2022-11-01T23:38:34.433Z",
        "isPitch" => false,
        "type" => "action",
        "player" => %{"id" => 514_888, "link" => "/api/v1/people/514888"}
      },
      %{
        "details" => %{
          "description" => "Status Change - Warmup",
          "event" => "Game Advisory",
          "eventType" => "game_advisory",
          "awayScore" => 0,
          "homeScore" => 0,
          "isScoringPlay" => false,
          "isOut" => false,
          "hasReview" => false
        },
        "count" => %{"balls" => 0, "strikes" => 0, "outs" => 0},
        "index" => 1,
        "startTime" => "2022-11-01T23:38:34.433Z",
        "endTime" => "2022-11-02T00:04:43.487Z",
        "isPitch" => false,
        "type" => "action",
        "player" => %{"id" => 514_888, "link" => "/api/v1/people/514888"}
      },
      %{
        "details" => %{
          "description" => "Status Change - In Progress",
          "event" => "Game Advisory",
          "eventType" => "game_advisory",
          "awayScore" => 0,
          "homeScore" => 0,
          "isScoringPlay" => false,
          "isOut" => false,
          "hasReview" => false
        },
        "count" => %{"balls" => 0, "strikes" => 0, "outs" => 0},
        "index" => 2,
        "startTime" => "2022-11-02T00:04:43.487Z",
        "endTime" => "2022-11-02T00:05:16.795Z",
        "isPitch" => false,
        "type" => "action",
        "player" => %{"id" => 514_888, "link" => "/api/v1/people/514888"}
      },
      %{
        "details" => %{
          "call" => %{"code" => "X", "description" => "In play, out(s)"},
          "description" => "In play, out(s)",
          "code" => "X",
          "ballColor" => "rgba(26, 86, 190, 1.0)",
          "trailColor" => "rgba(50, 0, 221, 1.0)",
          "isInPlay" => true,
          "isStrike" => false,
          "isBall" => false,
          "type" => %{"code" => "SI", "description" => "Sinker"},
          "isOut" => true,
          "hasReview" => false
        },
        "count" => %{"balls" => 0, "strikes" => 0, "outs" => 0},
        "pitchData" => %{
          "startSpeed" => 92.4,
          "endSpeed" => 84.5,
          "strikeZoneTop" => 2.83674163069378,
          "strikeZoneBottom" => 1.29744008799729,
          "coordinates" => %{
            "aY" => 29.92680664888909,
            "aZ" => -26.64737938111913,
            "pfxX" => 8.633789852209489,
            "pfxZ" => 3.026369139082906,
            "pX" => 0.9491882313945162,
            "pZ" => 2.1634371977786464,
            "vX0" => -5.833895485248186,
            "vY0" => -134.4029993983669,
            "vZ0" => -4.30048781179255,
            "x" => 80.82,
            "y" => 180.37,
            "x0" => 2.0294692236958722,
            "y0" => 50.00116430460623,
            "z0" => 5.683314989463316,
            "aX" => 15.74783810894544
          },
          "breaks" => %{
            "breakAngle" => 27.6,
            "breakLength" => 7.2,
            "breakY" => 24.0,
            "spinRate" => 1964,
            "spinDirection" => 127
          },
          "zone" => 12,
          "typeConfidence" => 0.91,
          "plateTime" => 0.4079982848269914,
          "extension" => 6.06807054428763
        },
        "hitData" => %{
          "launchSpeed" => 77.5,
          "launchAngle" => 26.0,
          "totalDistance" => 243.0,
          "trajectory" => "line_drive",
          "hardness" => "medium",
          "location" => "9",
          "coordinates" => %{"coordX" => 166.32, "coordY" => 111.33}
        },
        "index" => 3,
        "playId" => "2e9c7c31-f790-41e1-b482-8e2c9356d90c",
        "pitchNumber" => 1,
        "startTime" => "2022-11-02T00:05:16.795Z",
        "endTime" => "2022-11-02T00:05:23.532Z",
        "isPitch" => true,
        "type" => "pitch"
      }
    ],
    "playEndTime" => "2022-11-02T00:05:23.532Z",
    "atBatIndex" => 0
  }

  describe "parse/1" do
    test "parses json data into a Play struct" do
      assert {:ok,
              %Play{
                result: %Result{},
                about: %About{},
                count: %Count{},
                matchup: %Matchup{},
                pitch_index: [3],
                action_index: [0, 1, 2],
                runner_index: [0],
                play_end_time: ~U[2022-11-02 00:05:23.532Z],
                at_bat_index: 0
              }} = Play.parse(@json)
    end
  end

  describe "start_time/1" do
    test "returns the play's start_time" do
      start_time = ~U[2022-11-02 00:05:14.458Z]
      play = %Play{about: %About{start_time: start_time}}

      assert Play.start_time(play) == start_time
    end
  end
end
