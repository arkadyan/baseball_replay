defmodule BaseballReplayWeb.ReplayController do
  use BaseballReplayWeb, :controller

  alias BaseballReplay.{Game, Replay}

  def index(conn, _params) do
    replays = [mock_replay()]

    render(conn, :index, replays: replays, page_title: "Replays")
  end

  def show(conn, _params) do
    replay =
      mock_replay()
      |> Replay.in_progress()

    json(conn, replay)
  end

  defp mock_replay do
    # {:ok, game} =
    #   "715722-playByPlay.json"
    #   |> fixture_path()
    #   |> File.read!()
    #   |> Game.parse()
    {:ok, game} =
      mock_data()
      |> Game.parse()

    Replay.new("715722", game, ~U[2023-03-11 20:00:00.000Z])
  end

  defp fixture_path(path) do
    fixture_path = Path.expand("../../../priv/play_by_play", __DIR__)
    Path.expand(path, fixture_path)
  end

  defp mock_data do
    """
    {
      "copyright": "Copyright 2023 MLB Advanced Media, L.P.  Use of any content on this page acknowledges agreement to the terms posted here http://gdx.mlb.com/components/copyright.txt",
      "allPlays": [
        {
          "result": {
            "type": "atBat",
            "event": "Lineout",
            "eventType": "field_out",
            "description": "Jose Altuve lines out to right fielder Nick Castellanos.",
            "rbi": 0,
            "awayScore": 0,
            "homeScore": 0,
            "isOut": true
          },
          "about": {
            "atBatIndex": 0,
            "halfInning": "top",
            "isTopInning": true,
            "inning": 1,
            "startTime": "2022-11-02T00:05:14.458Z",
            "endTime": "2022-11-02T00:05:23.532Z",
            "isComplete": true,
            "isScoringPlay": false,
            "hasReview": false,
            "hasOut": true,
            "captivatingIndex": 0
          },
          "count": { "balls": 0, "strikes": 0, "outs": 1 },
          "matchup": {
            "batter": {
              "id": 514888,
              "fullName": "Jose Altuve",
              "link": "/api/v1/people/514888"
            },
            "batSide": { "code": "R", "description": "Right" },
            "pitcher": {
              "id": 624133,
              "fullName": "Ranger Suarez",
              "link": "/api/v1/people/624133"
            },
            "pitchHand": { "code": "L", "description": "Left" },
            "batterHotColdZones": [],
            "pitcherHotColdZones": [],
            "splits": {
              "batter": "vs_LHP",
              "pitcher": "vs_RHB",
              "menOnBase": "Empty"
            }
          },
          "pitchIndex": [3],
          "actionIndex": [0, 1, 2],
          "runnerIndex": [0],
          "runners": [
            {
              "movement": {
                "originBase": null,
                "start": null,
                "end": null,
                "outBase": "1B",
                "isOut": true,
                "outNumber": 1
              },
              "details": {
                "event": "Lineout",
                "eventType": "field_out",
                "movementReason": null,
                "runner": {
                  "id": 514888,
                  "fullName": "Jose Altuve",
                  "link": "/api/v1/people/514888"
                },
                "responsiblePitcher": null,
                "isScoringEvent": false,
                "rbi": false,
                "earned": false,
                "teamUnearned": false,
                "playIndex": 3
              },
              "credits": [
                {
                  "player": { "id": 592206, "link": "/api/v1/people/592206" },
                  "position": {
                    "code": "9",
                    "name": "Outfielder",
                    "type": "Outfielder",
                    "abbreviation": "RF"
                  },
                  "credit": "f_putout"
                }
              ]
            }
          ],
          "playEvents": [
            {
              "details": {
                "description": "Status Change - Pre-Game",
                "event": "Game Advisory",
                "eventType": "game_advisory",
                "awayScore": 0,
                "homeScore": 0,
                "isScoringPlay": false,
                "isOut": false,
                "hasReview": false
              },
              "count": { "balls": 0, "strikes": 0, "outs": 0 },
              "index": 0,
              "startTime": "2022-11-01T20:33:07.159Z",
              "endTime": "2022-11-01T23:38:34.433Z",
              "isPitch": false,
              "type": "action",
              "player": { "id": 514888, "link": "/api/v1/people/514888" }
            },
            {
              "details": {
                "description": "Status Change - Warmup",
                "event": "Game Advisory",
                "eventType": "game_advisory",
                "awayScore": 0,
                "homeScore": 0,
                "isScoringPlay": false,
                "isOut": false,
                "hasReview": false
              },
              "count": { "balls": 0, "strikes": 0, "outs": 0 },
              "index": 1,
              "startTime": "2022-11-01T23:38:34.433Z",
              "endTime": "2022-11-02T00:04:43.487Z",
              "isPitch": false,
              "type": "action",
              "player": { "id": 514888, "link": "/api/v1/people/514888" }
            },
            {
              "details": {
                "description": "Status Change - In Progress",
                "event": "Game Advisory",
                "eventType": "game_advisory",
                "awayScore": 0,
                "homeScore": 0,
                "isScoringPlay": false,
                "isOut": false,
                "hasReview": false
              },
              "count": { "balls": 0, "strikes": 0, "outs": 0 },
              "index": 2,
              "startTime": "2022-11-02T00:04:43.487Z",
              "endTime": "2022-11-02T00:05:16.795Z",
              "isPitch": false,
              "type": "action",
              "player": { "id": 514888, "link": "/api/v1/people/514888" }
            },
            {
              "details": {
                "call": { "code": "X", "description": "In play, out(s)" },
                "description": "In play, out(s)",
                "code": "X",
                "ballColor": "rgba(26, 86, 190, 1.0)",
                "trailColor": "rgba(50, 0, 221, 1.0)",
                "isInPlay": true,
                "isStrike": false,
                "isBall": false,
                "type": { "code": "SI", "description": "Sinker" },
                "isOut": true,
                "hasReview": false
              },
              "count": { "balls": 0, "strikes": 0, "outs": 0 },
              "pitchData": {
                "startSpeed": 92.4,
                "endSpeed": 84.5,
                "strikeZoneTop": 2.83674163069378,
                "strikeZoneBottom": 1.29744008799729,
                "coordinates": {
                  "aY": 29.92680664888909,
                  "aZ": -26.64737938111913,
                  "pfxX": 8.633789852209489,
                  "pfxZ": 3.026369139082906,
                  "pX": 0.9491882313945162,
                  "pZ": 2.1634371977786464,
                  "vX0": -5.833895485248186,
                  "vY0": -134.4029993983669,
                  "vZ0": -4.30048781179255,
                  "x": 80.82,
                  "y": 180.37,
                  "x0": 2.0294692236958722,
                  "y0": 50.00116430460623,
                  "z0": 5.683314989463316,
                  "aX": 15.74783810894544
                },
                "breaks": {
                  "breakAngle": 27.6,
                  "breakLength": 7.2,
                  "breakY": 24.0,
                  "spinRate": 1964,
                  "spinDirection": 127
                },
                "zone": 12,
                "typeConfidence": 0.91,
                "plateTime": 0.4079982848269914,
                "extension": 6.06807054428763
              },
              "hitData": {
                "launchSpeed": 77.5,
                "launchAngle": 26.0,
                "totalDistance": 243.0,
                "trajectory": "line_drive",
                "hardness": "medium",
                "location": "9",
                "coordinates": { "coordX": 166.32, "coordY": 111.33 }
              },
              "index": 3,
              "playId": "2e9c7c31-f790-41e1-b482-8e2c9356d90c",
              "pitchNumber": 1,
              "startTime": "2022-11-02T00:05:16.795Z",
              "endTime": "2022-11-02T00:05:23.532Z",
              "isPitch": true,
              "type": "pitch"
            }
          ],
          "playEndTime": "2022-11-02T00:05:23.532Z",
          "atBatIndex": 0
        },
        {
          "result": {
            "type": "atBat",
            "event": "Groundout",
            "eventType": "field_out",
            "description": "Jeremy Pena grounds out, shortstop Bryson Stott to first baseman Rhys Hoskins.",
            "rbi": 0,
            "awayScore": 0,
            "homeScore": 0,
            "isOut": true
          },
          "about": {
            "atBatIndex": 1,
            "halfInning": "top",
            "isTopInning": true,
            "inning": 1,
            "startTime": "2022-11-02T00:05:41.916Z",
            "endTime": "2022-11-02T00:06:06.605Z",
            "isComplete": true,
            "isScoringPlay": false,
            "hasReview": false,
            "hasOut": true,
            "captivatingIndex": 0
          },
          "count": { "balls": 0, "strikes": 0, "outs": 2 },
          "matchup": {
            "batter": {
              "id": 665161,
              "fullName": "Jeremy Pena",
              "link": "/api/v1/people/665161"
            },
            "batSide": { "code": "R", "description": "Right" },
            "pitcher": {
              "id": 624133,
              "fullName": "Ranger Suarez",
              "link": "/api/v1/people/624133"
            },
            "pitchHand": { "code": "L", "description": "Left" },
            "batterHotColdZones": [],
            "pitcherHotColdZones": [],
            "splits": {
              "batter": "vs_LHP",
              "pitcher": "vs_RHB",
              "menOnBase": "Empty"
            }
          },
          "pitchIndex": [0],
          "actionIndex": [],
          "runnerIndex": [0],
          "runners": [
            {
              "movement": {
                "originBase": null,
                "start": null,
                "end": null,
                "outBase": "1B",
                "isOut": true,
                "outNumber": 2
              },
              "details": {
                "event": "Groundout",
                "eventType": "field_out",
                "movementReason": null,
                "runner": {
                  "id": 665161,
                  "fullName": "Jeremy Pena",
                  "link": "/api/v1/people/665161"
                },
                "responsiblePitcher": null,
                "isScoringEvent": false,
                "rbi": false,
                "earned": false,
                "teamUnearned": false,
                "playIndex": 0
              },
              "credits": [
                {
                  "player": { "id": 681082, "link": "/api/v1/people/681082" },
                  "position": {
                    "code": "6",
                    "name": "Shortstop",
                    "type": "Infielder",
                    "abbreviation": "SS"
                  },
                  "credit": "f_assist"
                },
                {
                  "player": { "id": 656555, "link": "/api/v1/people/656555" },
                  "position": {
                    "code": "3",
                    "name": "First Base",
                    "type": "Infielder",
                    "abbreviation": "1B"
                  },
                  "credit": "f_putout"
                }
              ]
            }
          ],
          "playEvents": [
            {
              "details": {
                "call": { "code": "X", "description": "In play, out(s)" },
                "description": "In play, out(s)",
                "code": "X",
                "ballColor": "rgba(26, 86, 190, 1.0)",
                "trailColor": "rgba(50, 0, 221, 1.0)",
                "isInPlay": true,
                "isStrike": false,
                "isBall": false,
                "type": { "code": "SI", "description": "Sinker" },
                "isOut": true,
                "hasReview": false
              },
              "count": { "balls": 0, "strikes": 0, "outs": 1 },
              "pitchData": {
                "startSpeed": 93.8,
                "endSpeed": 85.2,
                "strikeZoneTop": 3.63,
                "strikeZoneBottom": 1.75,
                "coordinates": {
                  "aY": 33.00918412140677,
                  "aZ": -30.782455874582734,
                  "pfxX": 9.754434835609244,
                  "pfxZ": 0.7479381845517334,
                  "pX": 0.3808891287956554,
                  "pZ": 2.2549572599621484,
                  "vX0": -7.570708065534267,
                  "vY0": -136.3063240032082,
                  "vZ0": -3.631514041468175,
                  "x": 102.48,
                  "y": 177.9,
                  "x0": 1.9422265282419835,
                  "y0": 50.00277686138949,
                  "z0": 5.755538106651938,
                  "aX": 18.154841440097602
                },
                "breaks": {
                  "breakAngle": 27.6,
                  "breakLength": 7.2,
                  "breakY": 24.0,
                  "spinRate": 1880,
                  "spinDirection": 134
                },
                "zone": 9,
                "typeConfidence": 0.92,
                "plateTime": 0.40352371720244484,
                "extension": 6.114519100333419
              },
              "hitData": {
                "launchSpeed": 90.7,
                "launchAngle": -52.0,
                "totalDistance": 1.0,
                "trajectory": "ground_ball",
                "hardness": "medium",
                "location": "6",
                "coordinates": { "coordX": 116.27, "coordY": 157.61 }
              },
              "index": 0,
              "playId": "1e24b484-a91d-497e-b02c-28ffea37e7f0",
              "pitchNumber": 1,
              "startTime": "2022-11-02T00:05:58.527Z",
              "endTime": "2022-11-02T00:06:06.605Z",
              "isPitch": true,
              "type": "pitch"
            }
          ],
          "playEndTime": "2022-11-02T00:06:06.605Z",
          "atBatIndex": 1
        },
        {
          "result": {
            "type": "atBat",
            "event": "Strikeout",
            "eventType": "strikeout",
            "description": "Yordan Alvarez strikes out swinging.",
            "rbi": 0,
            "awayScore": 0,
            "homeScore": 0,
            "isOut": true
          },
          "about": {
            "atBatIndex": 2,
            "halfInning": "top",
            "isTopInning": true,
            "inning": 1,
            "startTime": "2022-11-02T00:06:24.649Z",
            "endTime": "2022-11-02T00:09:04.582Z",
            "isComplete": true,
            "isScoringPlay": false,
            "hasReview": false,
            "hasOut": true,
            "captivatingIndex": 14
          },
          "count": { "balls": 2, "strikes": 3, "outs": 3 },
          "matchup": {
            "batter": {
              "id": 670541,
              "fullName": "Yordan Alvarez",
              "link": "/api/v1/people/670541"
            },
            "batSide": { "code": "L", "description": "Left" },
            "pitcher": {
              "id": 624133,
              "fullName": "Ranger Suarez",
              "link": "/api/v1/people/624133"
            },
            "pitchHand": { "code": "L", "description": "Left" },
            "batterHotColdZones": [],
            "pitcherHotColdZones": [],
            "splits": {
              "batter": "vs_LHP",
              "pitcher": "vs_LHB",
              "menOnBase": "Empty"
            }
          },
          "pitchIndex": [0, 1, 2, 3, 4, 5, 6],
          "actionIndex": [],
          "runnerIndex": [0],
          "runners": [
            {
              "movement": {
                "originBase": null,
                "start": null,
                "end": null,
                "outBase": "1B",
                "isOut": true,
                "outNumber": 3
              },
              "details": {
                "event": "Strikeout",
                "eventType": "strikeout",
                "movementReason": null,
                "runner": {
                  "id": 670541,
                  "fullName": "Yordan Alvarez",
                  "link": "/api/v1/people/670541"
                },
                "responsiblePitcher": null,
                "isScoringEvent": false,
                "rbi": false,
                "earned": false,
                "teamUnearned": false,
                "playIndex": 6
              },
              "credits": [
                {
                  "player": { "id": 592663, "link": "/api/v1/people/592663" },
                  "position": {
                    "code": "2",
                    "name": "Catcher",
                    "type": "Catcher",
                    "abbreviation": "C"
                  },
                  "credit": "f_putout"
                }
              ]
            }
          ],
          "playEvents": [
            {
              "details": {
                "call": { "code": "C", "description": "Called Strike" },
                "description": "Called Strike",
                "code": "C",
                "ballColor": "rgba(170, 21, 11, 1.0)",
                "trailColor": "rgba(50, 0, 221, 1.0)",
                "isInPlay": false,
                "isStrike": true,
                "isBall": false,
                "type": { "code": "SI", "description": "Sinker" },
                "isOut": false,
                "hasReview": false
              },
              "count": { "balls": 0, "strikes": 1, "outs": 2 },
              "pitchData": {
                "startSpeed": 95.2,
                "endSpeed": 86.8,
                "strikeZoneTop": 3.66976838552069,
                "strikeZoneBottom": 1.7947687102054,
                "coordinates": {
                  "aY": 32.35687472494664,
                  "aZ": -26.149274199262955,
                  "pfxX": 9.494979086992121,
                  "pfxZ": 3.1304807442059603,
                  "pX": 0.10205426975794497,
                  "pZ": 1.9187558982516264,
                  "vX0": -8.25598640348315,
                  "vY0": -138.25908339605192,
                  "vZ0": -5.684004545088959,
                  "x": 113.11,
                  "y": 186.97,
                  "x0": 1.9010230078438242,
                  "y0": 50.006393672671194,
                  "z0": 5.768822772962923,
                  "aX": 18.288636600497725
                },
                "breaks": {
                  "breakAngle": 31.2,
                  "breakLength": 7.2,
                  "breakY": 24.0,
                  "spinRate": 1864,
                  "spinDirection": 135
                },
                "zone": 8,
                "typeConfidence": 0.92,
                "plateTime": 0.39697713508430343,
                "extension": 6.1774499848925055
              },
              "index": 0,
              "playId": "94e455dd-51fa-4242-bd4f-457ef5bce9e5",
              "pitchNumber": 1,
              "startTime": "2022-11-02T00:06:49.830Z",
              "endTime": "2022-11-02T00:06:53.434Z",
              "isPitch": true,
              "type": "pitch"
            },
            {
              "details": {
                "call": { "code": "F", "description": "Foul" },
                "description": "Foul",
                "code": "F",
                "ballColor": "rgba(170, 21, 11, 1.0)",
                "trailColor": "rgba(50, 0, 221, 1.0)",
                "isInPlay": false,
                "isStrike": true,
                "isBall": false,
                "type": { "code": "SI", "description": "Sinker" },
                "isOut": false,
                "hasReview": false
              },
              "count": { "balls": 0, "strikes": 2, "outs": 2 },
              "pitchData": {
                "startSpeed": 93.7,
                "endSpeed": 85.3,
                "strikeZoneTop": 3.48,
                "strikeZoneBottom": 1.73,
                "coordinates": {
                  "aY": 31.746170963686676,
                  "aZ": -26.701063924839037,
                  "pfxX": 9.426518148670322,
                  "pfxZ": 2.922573203449554,
                  "pX": 0.969533687757631,
                  "pZ": 3.133833935304137,
                  "vX0": -6.055883574497251,
                  "vY0": -136.37373443228367,
                  "vZ0": -2.267866305135384,
                  "x": 80.04,
                  "y": 154.17,
                  "x0": 2.0014832611124382,
                  "y0": 50.000267084871595,
                  "z0": 5.829741683350176,
                  "aX": 17.641521202006437
                },
                "breaks": {
                  "breakAngle": 31.2,
                  "breakLength": 7.2,
                  "breakY": 24.0,
                  "spinRate": 1851,
                  "spinDirection": 134
                },
                "zone": 12,
                "typeConfidence": 0.92,
                "plateTime": 0.40259169126912786,
                "extension": 6.134113367558702
              },
              "index": 1,
              "playId": "a47f4cea-beea-4b0b-bcfc-53fe5b44b386",
              "pitchNumber": 2,
              "startTime": "2022-11-02T00:07:03.049Z",
              "endTime": "2022-11-02T00:07:07.146Z",
              "isPitch": true,
              "type": "pitch"
            },
            {
              "details": {
                "call": { "code": "B", "description": "Ball" },
                "description": "Ball",
                "code": "B",
                "ballColor": "rgba(39, 161, 39, 1.0)",
                "trailColor": "rgba(152, 0, 101, 1.0)",
                "isInPlay": false,
                "isStrike": false,
                "isBall": true,
                "type": { "code": "FC", "description": "Cutter" },
                "isOut": false,
                "hasReview": false
              },
              "count": { "balls": 1, "strikes": 2, "outs": 2 },
              "pitchData": {
                "startSpeed": 89.0,
                "endSpeed": 81.7,
                "strikeZoneTop": 3.56698315594169,
                "strikeZoneBottom": 1.72737918064766,
                "coordinates": {
                  "aY": 28.53641884799775,
                  "aZ": -29.452119431376037,
                  "pfxX": 0.08939351769592996,
                  "pfxZ": 1.6240979280432848,
                  "pX": -2.4361829140806193,
                  "pZ": 0.3260099774070362,
                  "vX0": -10.634343868981281,
                  "vY0": -129.07000512176523,
                  "vZ0": -7.786445068719408,
                  "x": 209.86,
                  "y": 229.98,
                  "x0": 1.737293394067483,
                  "y0": 50.00178813970493,
                  "z0": 5.670846544098747,
                  "aX": 0.14961708393332734
                },
                "breaks": {
                  "breakAngle": 3.6,
                  "breakLength": 7.2,
                  "breakY": 24.0,
                  "spinRate": 2155,
                  "spinDirection": 191
                },
                "zone": 13,
                "typeConfidence": 0.92,
                "plateTime": 0.4254420504318128,
                "extension": 6.326289588428983
              },
              "index": 2,
              "playId": "d01a555a-dbcb-4376-8efd-7393eadcce30",
              "pitchNumber": 3,
              "startTime": "2022-11-02T00:07:30.574Z",
              "endTime": "2022-11-02T00:07:33.718Z",
              "isPitch": true,
              "type": "pitch"
            },
            {
              "details": {
                "call": { "code": "F", "description": "Foul" },
                "description": "Foul",
                "code": "F",
                "ballColor": "rgba(170, 21, 11, 1.0)",
                "trailColor": "rgba(50, 0, 221, 1.0)",
                "isInPlay": false,
                "isStrike": true,
                "isBall": false,
                "type": { "code": "SI", "description": "Sinker" },
                "isOut": false,
                "hasReview": false
              },
              "count": { "balls": 1, "strikes": 2, "outs": 2 },
              "pitchData": {
                "startSpeed": 94.8,
                "endSpeed": 86.2,
                "strikeZoneTop": 3.48,
                "strikeZoneBottom": 1.73,
                "coordinates": {
                  "aY": 32.64309180765302,
                  "aZ": -25.669204640842928,
                  "pfxX": 9.92202666526687,
                  "pfxZ": 3.422726987555362,
                  "pX": -0.35702076286933704,
                  "pZ": 1.910894861034763,
                  "vX0": -9.290593487567538,
                  "vY0": -137.5627848401014,
                  "vZ0": -5.785518128505646,
                  "x": 130.61,
                  "y": 187.19,
                  "x0": 1.7872544116493199,
                  "y0": 50.006142071623835,
                  "z0": 5.79911718574791,
                  "aX": 18.87780753476402
                },
                "breaks": {
                  "breakAngle": 32.4,
                  "breakLength": 7.2,
                  "breakY": 24.0,
                  "spinRate": 2028,
                  "spinDirection": 137
                },
                "zone": 7,
                "typeConfidence": 0.92,
                "plateTime": 0.39930734830616643,
                "extension": 6.044889634023428
              },
              "index": 3,
              "playId": "2c458ba4-1c12-41ba-8503-d873f30892d4",
              "pitchNumber": 4,
              "startTime": "2022-11-02T00:07:51.629Z",
              "endTime": "2022-11-02T00:07:54.645Z",
              "isPitch": true,
              "type": "pitch"
            },
            {
              "details": {
                "call": { "code": "F", "description": "Foul" },
                "description": "Foul",
                "code": "F",
                "ballColor": "rgba(170, 21, 11, 1.0)",
                "trailColor": "rgba(0, 85, 254, 1.0)",
                "isInPlay": false,
                "isStrike": true,
                "isBall": false,
                "type": { "code": "CH", "description": "Changeup" },
                "isOut": false,
                "hasReview": false
              },
              "count": { "balls": 1, "strikes": 2, "outs": 2 },
              "pitchData": {
                "startSpeed": 85.2,
                "endSpeed": 77.7,
                "strikeZoneTop": 3.48,
                "strikeZoneBottom": 1.73,
                "coordinates": {
                  "aY": 27.017972495225827,
                  "aZ": -29.89900433747727,
                  "pfxX": 8.652763605554693,
                  "pfxZ": 1.4804599313060267,
                  "pX": 0.2278822208465652,
                  "pZ": 1.283149910560547,
                  "vX0": -7.168497895197948,
                  "vY0": -123.82553164920303,
                  "vZ0": -4.555255571005229,
                  "x": 108.31,
                  "y": 204.13,
                  "x0": 2.0502896817197347,
                  "y0": 50.002651884952705,
                  "z0": 5.67669828925766,
                  "aX": 13.303139962077964
                },
                "breaks": {
                  "breakAngle": 21.6,
                  "breakLength": 8.4,
                  "breakY": 24.0,
                  "spinRate": 1444,
                  "spinDirection": 116
                },
                "zone": 14,
                "typeConfidence": 0.87,
                "plateTime": 0.44403127201561343,
                "extension": 6.438976463603839
              },
              "index": 4,
              "playId": "f501ddb7-218e-4598-85a2-71d0f46861a1",
              "pitchNumber": 5,
              "startTime": "2022-11-02T00:08:13.634Z",
              "endTime": "2022-11-02T00:08:17.075Z",
              "isPitch": true,
              "type": "pitch"
            },
            {
              "details": {
                "call": { "code": "B", "description": "Ball" },
                "description": "Ball",
                "code": "B",
                "ballColor": "rgba(39, 161, 39, 1.0)",
                "trailColor": "rgba(50, 0, 221, 1.0)",
                "isInPlay": false,
                "isStrike": false,
                "isBall": true,
                "type": { "code": "SI", "description": "Sinker" },
                "isOut": false,
                "hasReview": false
              },
              "count": { "balls": 2, "strikes": 2, "outs": 2 },
              "pitchData": {
                "startSpeed": 95.4,
                "endSpeed": 86.7,
                "strikeZoneTop": 3.59275312632104,
                "strikeZoneBottom": 1.72737918064766,
                "coordinates": {
                  "aY": 33.14755010854885,
                  "aZ": -28.45704771907259,
                  "pfxX": 10.8315050350643,
                  "pfxZ": 1.9372021432052158,
                  "pX": -1.27526540971158,
                  "pZ": 1.9073038345448554,
                  "vX0": -12.188549451253289,
                  "vY0": -138.28605838270556,
                  "vZ0": -5.091416079799013,
                  "x": 165.61,
                  "y": 187.28,
                  "x0": 1.7991090383141422,
                  "y0": 50.005871066234945,
                  "z0": 5.7005769111334965,
                  "aX": 20.8139289514493
                },
                "breaks": {
                  "breakAngle": 31.2,
                  "breakLength": 7.2,
                  "breakY": 24.0,
                  "spinRate": 2011,
                  "spinDirection": 130
                },
                "zone": 13,
                "typeConfidence": 0.92,
                "plateTime": 0.39731242128393296,
                "extension": 6.04114152540215
              },
              "index": 5,
              "playId": "48b1f7c2-b4b4-447a-91b4-48cb0e6da019",
              "pitchNumber": 6,
              "startTime": "2022-11-02T00:08:40.263Z",
              "endTime": "2022-11-02T00:08:44.141Z",
              "isPitch": true,
              "type": "pitch"
            },
            {
              "details": {
                "call": { "code": "S", "description": "Swinging Strike" },
                "description": "Swinging Strike",
                "code": "S",
                "ballColor": "rgba(170, 21, 11, 1.0)",
                "trailColor": "rgba(0, 34, 255, 1.0)",
                "isInPlay": false,
                "isStrike": true,
                "isBall": false,
                "type": { "code": "CU", "description": "Curveball" },
                "isOut": true,
                "hasReview": false
              },
              "count": { "balls": 2, "strikes": 3, "outs": 2 },
              "pitchData": {
                "startSpeed": 80.1,
                "endSpeed": 73.5,
                "strikeZoneTop": 3.48,
                "strikeZoneBottom": 1.73,
                "coordinates": {
                  "aY": 24.104562730702376,
                  "aZ": -39.1281907917701,
                  "pfxX": -4.475363833686339,
                  "pfxZ": -5.109207149736901,
                  "pX": -0.982400707679682,
                  "pZ": 1.800456845651697,
                  "vX0": -5.229537671484149,
                  "vY0": -116.50471206555287,
                  "vZ0": -0.8563767358933356,
                  "x": 154.45,
                  "y": 190.17,
                  "x0": 1.8822487329720068,
                  "y0": 50.005381868758604,
                  "z0": 5.906266771721418,
                  "aX": -6.086037597431038
                },
                "breaks": {
                  "breakAngle": 9.6,
                  "breakLength": 12.0,
                  "breakY": 24.0,
                  "spinRate": 2298,
                  "spinDirection": 304
                },
                "zone": 13,
                "typeConfidence": 0.55,
                "plateTime": 0.47208982309297154,
                "extension": 6.1833079943906775
              },
              "index": 6,
              "playId": "a3f1ae88-56f8-42b1-af10-b3c11dc2239f",
              "pitchNumber": 7,
              "startTime": "2022-11-02T00:09:00.501Z",
              "endTime": "2022-11-02T00:09:04.582Z",
              "isPitch": true,
              "type": "pitch"
            }
          ],
          "playEndTime": "2022-11-02T00:09:04.582Z",
          "atBatIndex": 2
        },
        {
          "result": {
            "type": "atBat",
            "event": "Walk",
            "eventType": "walk",
            "description": "Kyle Schwarber walks.",
            "rbi": 0,
            "awayScore": 0,
            "homeScore": 0,
            "isOut": false
          },
          "about": {
            "atBatIndex": 3,
            "halfInning": "bottom",
            "isTopInning": false,
            "inning": 1,
            "startTime": "2022-11-02T00:11:59.756Z",
            "endTime": "2022-11-02T00:14:10.835Z",
            "isComplete": true,
            "isScoringPlay": false,
            "hasReview": false,
            "hasOut": false,
            "captivatingIndex": 0
          },
          "count": { "balls": 4, "strikes": 2, "outs": 0 },
          "matchup": {
            "batter": {
              "id": 656941,
              "fullName": "Kyle Schwarber",
              "link": "/api/v1/people/656941"
            },
            "batSide": { "code": "L", "description": "Left" },
            "pitcher": {
              "id": 621121,
              "fullName": "Lance McCullers Jr.",
              "link": "/api/v1/people/621121"
            },
            "pitchHand": { "code": "R", "description": "Right" },
            "postOnFirst": {
              "id": 656941,
              "fullName": "Kyle Schwarber",
              "link": "/api/v1/people/656941"
            },
            "batterHotColdZones": [],
            "pitcherHotColdZones": [],
            "splits": {
              "batter": "vs_RHP",
              "pitcher": "vs_LHB",
              "menOnBase": "Men_On"
            }
          },
          "pitchIndex": [0, 1, 2, 3, 4, 5],
          "actionIndex": [],
          "runnerIndex": [0],
          "runners": [
            {
              "movement": {
                "originBase": null,
                "start": null,
                "end": "1B",
                "outBase": null,
                "isOut": false,
                "outNumber": null
              },
              "details": {
                "event": "Walk",
                "eventType": "walk",
                "movementReason": null,
                "runner": {
                  "id": 656941,
                  "fullName": "Kyle Schwarber",
                  "link": "/api/v1/people/656941"
                },
                "responsiblePitcher": null,
                "isScoringEvent": false,
                "rbi": false,
                "earned": false,
                "teamUnearned": false,
                "playIndex": 5
              },
              "credits": []
            }
          ],
          "playEvents": [
            {
              "details": {
                "call": { "code": "B", "description": "Ball" },
                "description": "Ball",
                "code": "B",
                "ballColor": "rgba(39, 161, 39, 1.0)",
                "trailColor": "rgba(0, 0, 254, 1.0)",
                "isInPlay": false,
                "isStrike": false,
                "isBall": true,
                "type": { "code": "SL", "description": "Slider" },
                "isOut": false,
                "hasReview": false
              },
              "count": { "balls": 1, "strikes": 0, "outs": 0 },
              "pitchData": {
                "startSpeed": 82.9,
                "endSpeed": 75.8,
                "strikeZoneTop": 3.33487218418705,
                "strikeZoneBottom": 1.55747363276292,
                "coordinates": {
                  "aY": 24.639763321807692,
                  "aZ": -31.267493599552605,
                  "pfxX": 7.660925781522444,
                  "pfxZ": 0.6145876244194746,
                  "pX": -1.1056112016377044,
                  "pZ": 3.038737388876373,
                  "vX0": -0.364925378602556,
                  "vY0": -120.77661919235437,
                  "vZ0": 1.6383956821628596,
                  "x": 159.14,
                  "y": 156.73,
                  "x0": -1.9465833128688768,
                  "y0": 50.001297230957086,
                  "z0": 5.111629001465414,
                  "aX": 11.258658781569643
                },
                "breaks": {
                  "breakAngle": 20.4,
                  "breakLength": 9.6,
                  "breakY": 24.0,
                  "spinRate": 2993,
                  "spinDirection": 38
                },
                "zone": 11,
                "typeConfidence": 0.88,
                "plateTime": 0.45439273424639337,
                "extension": 5.764488234238135
              },
              "index": 0,
              "playId": "44cdc776-68d0-46d5-961c-60fbb520ddd5",
              "pitchNumber": 1,
              "startTime": "2022-11-02T00:12:25.493Z",
              "endTime": "2022-11-02T00:12:29.255Z",
              "isPitch": true,
              "type": "pitch"
            },
            {
              "details": {
                "call": { "code": "C", "description": "Called Strike" },
                "description": "Called Strike",
                "code": "C",
                "ballColor": "rgba(170, 21, 11, 1.0)",
                "trailColor": "rgba(0, 0, 254, 1.0)",
                "isInPlay": false,
                "isStrike": true,
                "isBall": false,
                "type": { "code": "SL", "description": "Slider" },
                "isOut": false,
                "hasReview": false
              },
              "count": { "balls": 1, "strikes": 1, "outs": 0 },
              "pitchData": {
                "startSpeed": 83.8,
                "endSpeed": 76.7,
                "strikeZoneTop": 3.28324873299728,
                "strikeZoneBottom": 1.55747363276292,
                "coordinates": {
                  "aY": 24.870274038209153,
                  "aZ": -29.730511119885964,
                  "pfxX": 7.299462826068563,
                  "pfxZ": 1.6244519114620566,
                  "pX": -0.4625485915196859,
                  "pZ": 2.838985166848709,
                  "vX0": 0.8808903701937683,
                  "vY0": -122.12301104674819,
                  "vZ0": 0.8139583134029422,
                  "x": 134.63,
                  "y": 162.13,
                  "x0": -1.776288413556446,
                  "y0": 50.00389747236978,
                  "z0": 5.065992708298174,
                  "aX": 10.984978733561967
                },
                "breaks": {
                  "breakAngle": 20.4,
                  "breakLength": 8.4,
                  "breakY": 24.0,
                  "spinRate": 2994,
                  "spinDirection": 84
                },
                "zone": 1,
                "typeConfidence": 0.9,
                "plateTime": 0.449135861343696,
                "extension": 5.687282427795405
              },
              "index": 1,
              "playId": "8504c7ee-96e0-47c3-9f10-f11fd30031f9",
              "pitchNumber": 2,
              "startTime": "2022-11-02T00:12:39.494Z",
              "endTime": "2022-11-02T00:12:42.682Z",
              "isPitch": true,
              "type": "pitch"
            },
            {
              "details": {
                "call": { "code": "B", "description": "Ball" },
                "description": "Ball",
                "code": "B",
                "ballColor": "rgba(39, 161, 39, 1.0)",
                "trailColor": "rgba(153, 171, 0, 1.0)",
                "isInPlay": false,
                "isStrike": false,
                "isBall": true,
                "type": { "code": "KC", "description": "Knuckle Curve" },
                "isOut": false,
                "hasReview": false
              },
              "count": { "balls": 2, "strikes": 1, "outs": 0 },
              "pitchData": {
                "startSpeed": 84.9,
                "endSpeed": 77.8,
                "strikeZoneTop": 3.17995612965271,
                "strikeZoneBottom": 1.48330058790539,
                "coordinates": {
                  "aY": 27.424861192446315,
                  "aZ": -42.51799599405604,
                  "pfxX": 6.268316079455814,
                  "pfxZ": -6.775874124807989,
                  "pX": 1.8033789849687094,
                  "pZ": 1.5289002284651707,
                  "vX0": 5.639797327201741,
                  "vY0": -123.52769916463309,
                  "vZ0": -0.5938406989367663,
                  "x": 48.26,
                  "y": 197.5,
                  "x0": -1.3339761953662486,
                  "y0": 50.00399312501531,
                  "z0": 5.38520022686755,
                  "aX": 9.567030489084086
                },
                "breaks": {
                  "breakAngle": 14.4,
                  "breakLength": 12.0,
                  "breakY": 24.0,
                  "spinRate": 3125,
                  "spinDirection": 48
                },
                "zone": 14,
                "typeConfidence": 0.91,
                "plateTime": 0.4454996528055828,
                "extension": 5.6559509064613485
              },
              "index": 2,
              "playId": "ad10e178-953c-4a06-8f3e-549046f1f20a",
              "pitchNumber": 3,
              "startTime": "2022-11-02T00:12:58.023Z",
              "endTime": "2022-11-02T00:13:01.023Z",
              "isPitch": true,
              "type": "pitch"
            },
            {
              "details": {
                "call": { "code": "B", "description": "Ball" },
                "description": "Ball",
                "code": "B",
                "ballColor": "rgba(39, 161, 39, 1.0)",
                "trailColor": "rgba(153, 171, 0, 1.0)",
                "isInPlay": false,
                "isStrike": false,
                "isBall": true,
                "type": { "code": "KC", "description": "Knuckle Curve" },
                "isOut": false,
                "hasReview": false
              },
              "count": { "balls": 3, "strikes": 1, "outs": 0 },
              "pitchData": {
                "startSpeed": 82.3,
                "endSpeed": 74.7,
                "strikeZoneTop": 3.23160998272546,
                "strikeZoneBottom": 1.50928726231962,
                "coordinates": {
                  "aY": 25.329642491669315,
                  "aZ": -39.23784108331509,
                  "pfxX": 9.817092684448939,
                  "pfxZ": -4.924798205399906,
                  "pX": -2.233816751018928,
                  "pZ": 3.919189186978474,
                  "vX0": -3.9130100731657076,
                  "vY0": -119.62566054070338,
                  "vZ0": 4.571511957054503,
                  "x": 202.15,
                  "y": 132.96,
                  "x0": -1.8428307030901743,
                  "y0": 50.003737404251886,
                  "z0": 5.5233275793407905,
                  "aX": 14.07961614111853
                },
                "breaks": {
                  "breakAngle": 19.2,
                  "breakLength": 12.0,
                  "breakY": 24.0,
                  "spinRate": 3025,
                  "spinDirection": 67
                },
                "zone": 11,
                "typeConfidence": 0.9,
                "plateTime": 0.45972077358893904,
                "extension": 5.793078723190949
              },
              "index": 3,
              "playId": "71950af7-e11c-448a-84b9-2c82fc6bcb74",
              "pitchNumber": 4,
              "startTime": "2022-11-02T00:13:15.266Z",
              "endTime": "2022-11-02T00:13:18.266Z",
              "isPitch": true,
              "type": "pitch"
            },
            {
              "details": {
                "call": { "code": "C", "description": "Called Strike" },
                "description": "Called Strike",
                "code": "C",
                "ballColor": "rgba(170, 21, 11, 1.0)",
                "trailColor": "rgba(0, 0, 254, 1.0)",
                "isInPlay": false,
                "isStrike": true,
                "isBall": false,
                "type": { "code": "SL", "description": "Slider" },
                "isOut": false,
                "hasReview": false
              },
              "count": { "balls": 3, "strikes": 2, "outs": 0 },
              "pitchData": {
                "startSpeed": 83.2,
                "endSpeed": 75.9,
                "strikeZoneTop": 3.25743125799196,
                "strikeZoneBottom": 1.53527148575927,
                "coordinates": {
                  "aY": 25.535236063145106,
                  "aZ": -28.582523464496195,
                  "pfxX": 9.840205162056375,
                  "pfxZ": 2.439283172383109,
                  "pX": -0.7095493609459436,
                  "pZ": 1.9196762991250298,
                  "vX0": -0.26675164526977146,
                  "vY0": -121.15144825806613,
                  "vZ0": -1.00593104387926,
                  "x": 144.05,
                  "y": 186.95,
                  "x0": -1.8744268067838672,
                  "y0": 50.00569348774887,
                  "z0": 4.857702524634313,
                  "aX": 14.505487406882768
                },
                "breaks": {
                  "breakAngle": 26.4,
                  "breakLength": 8.4,
                  "breakY": 24.0,
                  "spinRate": 3050,
                  "spinDirection": 80
                },
                "zone": 7,
                "typeConfidence": 0.91,
                "plateTime": 0.4535747868560853,
                "extension": 5.705525429054331
              },
              "index": 4,
              "playId": "fd6c3b7b-6d4b-4412-82c7-25874d3d758c",
              "pitchNumber": 5,
              "startTime": "2022-11-02T00:13:34.320Z",
              "endTime": "2022-11-02T00:13:37.657Z",
              "isPitch": true,
              "type": "pitch"
            },
            {
              "details": {
                "call": { "code": "B", "description": "Ball" },
                "description": "Ball",
                "code": "B",
                "ballColor": "rgba(39, 161, 39, 1.0)",
                "trailColor": "rgba(0, 0, 254, 1.0)",
                "isInPlay": false,
                "isStrike": false,
                "isBall": true,
                "type": { "code": "SL", "description": "Slider" },
                "isOut": false,
                "hasReview": false
              },
              "count": { "balls": 4, "strikes": 2, "outs": 0 },
              "pitchData": {
                "startSpeed": 83.9,
                "endSpeed": 76.2,
                "strikeZoneTop": 3.15412360106627,
                "strikeZoneBottom": 1.50928726231962,
                "coordinates": {
                  "aY": 27.23551429517426,
                  "aZ": -29.84312052758918,
                  "pfxX": 10.61061517216086,
                  "pfxZ": 1.5647169072678553,
                  "pX": -1.0943159040522468,
                  "pZ": 1.7846741757394915,
                  "vX0": -1.5046671634323323,
                  "vY0": -122.11567663320852,
                  "vZ0": -1.20171273813127,
                  "x": 158.71,
                  "y": 190.59,
                  "x0": -1.8415947420307404,
                  "y0": 50.00205492511004,
                  "z0": 4.884148933259834,
                  "aX": 15.796199036438727
                },
                "breaks": {
                  "breakAngle": 27.6,
                  "breakLength": 9.6,
                  "breakY": 24.0,
                  "spinRate": 2978,
                  "spinDirection": 78
                },
                "zone": 13,
                "typeConfidence": 0.91,
                "plateTime": 0.450983865083991,
                "extension": 5.882653394223116
              },
              "index": 5,
              "playId": "e524c8ba-ac53-4bb4-8a16-3b0c000908f1",
              "pitchNumber": 6,
              "startTime": "2022-11-02T00:14:06.829Z",
              "endTime": "2022-11-02T00:14:10.835Z",
              "isPitch": true,
              "type": "pitch"
            }
          ],
          "playEndTime": "2022-11-02T00:14:10.835Z",
          "atBatIndex": 3
        },
        {
          "result": {
            "type": "atBat",
            "event": "Strikeout",
            "eventType": "strikeout",
            "description": "Rhys Hoskins strikes out swinging.",
            "rbi": 0,
            "awayScore": 0,
            "homeScore": 0,
            "isOut": true
          },
          "about": {
            "atBatIndex": 4,
            "halfInning": "bottom",
            "isTopInning": false,
            "inning": 1,
            "startTime": "2022-11-02T00:14:20.167Z",
            "endTime": "2022-11-02T00:16:28.529Z",
            "isComplete": true,
            "isScoringPlay": false,
            "hasReview": false,
            "hasOut": true,
            "captivatingIndex": 14
          },
          "count": { "balls": 1, "strikes": 3, "outs": 1 },
          "matchup": {
            "batter": {
              "id": 656555,
              "fullName": "Rhys Hoskins",
              "link": "/api/v1/people/656555"
            },
            "batSide": { "code": "R", "description": "Right" },
            "pitcher": {
              "id": 621121,
              "fullName": "Lance McCullers Jr.",
              "link": "/api/v1/people/621121"
            },
            "pitchHand": { "code": "R", "description": "Right" },
            "postOnFirst": {
              "id": 656941,
              "fullName": "Kyle Schwarber",
              "link": "/api/v1/people/656941"
            },
            "batterHotColdZones": [],
            "pitcherHotColdZones": [],
            "splits": {
              "batter": "vs_RHP",
              "pitcher": "vs_RHB",
              "menOnBase": "Men_On"
            }
          },
          "pitchIndex": [0, 1, 2, 3],
          "actionIndex": [],
          "runnerIndex": [0],
          "runners": [
            {
              "movement": {
                "originBase": null,
                "start": null,
                "end": null,
                "outBase": "1B",
                "isOut": true,
                "outNumber": 1
              },
              "details": {
                "event": "Strikeout",
                "eventType": "strikeout",
                "movementReason": null,
                "runner": {
                  "id": 656555,
                  "fullName": "Rhys Hoskins",
                  "link": "/api/v1/people/656555"
                },
                "responsiblePitcher": null,
                "isScoringEvent": false,
                "rbi": false,
                "earned": false,
                "teamUnearned": false,
                "playIndex": 3
              },
              "credits": [
                {
                  "player": { "id": 455117, "link": "/api/v1/people/455117" },
                  "position": {
                    "code": "2",
                    "name": "Catcher",
                    "type": "Catcher",
                    "abbreviation": "C"
                  },
                  "credit": "f_putout"
                }
              ]
            }
          ],
          "playEvents": [
            {
              "details": {
                "call": { "code": "F", "description": "Foul" },
                "description": "Foul",
                "code": "F",
                "ballColor": "rgba(170, 21, 11, 1.0)",
                "trailColor": "rgba(50, 0, 221, 1.0)",
                "isInPlay": false,
                "isStrike": true,
                "isBall": false,
                "type": { "code": "SI", "description": "Sinker" },
                "isOut": false,
                "hasReview": false
              },
              "count": { "balls": 0, "strikes": 1, "outs": 0 },
              "pitchData": {
                "startSpeed": 95.8,
                "endSpeed": 87.7,
                "strikeZoneTop": 3.63,
                "strikeZoneBottom": 1.71,
                "coordinates": {
                  "aY": 31.591847564345343,
                  "aZ": -25.493757113400193,
                  "pfxX": -7.513732790484738,
                  "pfxZ": 3.391980278127587,
                  "pX": -0.5248904720674042,
                  "pZ": 2.1152373674418956,
                  "vX0": 5.130449499857829,
                  "vY0": -139.4553252838942,
                  "vZ0": -3.5620520373396802,
                  "x": 137.01,
                  "y": 181.67,
                  "x0": -1.4130416760748552,
                  "y0": 50.00007809182469,
                  "z0": 5.092201782912133,
                  "aX": -14.785340284885473
                },
                "breaks": {
                  "breakAngle": 27.6,
                  "breakLength": 6.0,
                  "breakY": 24.0,
                  "spinRate": 2138,
                  "spinDirection": 239
                },
                "zone": 7,
                "typeConfidence": 0.9,
                "plateTime": 0.3928854979436558,
                "extension": 5.812166859738548
              },
              "index": 0,
              "playId": "d8ee28ea-e4a0-418c-ab37-1ac66c3fdcbb",
              "pitchNumber": 1,
              "startTime": "2022-11-02T00:14:52.531Z",
              "endTime": "2022-11-02T00:14:57.718Z",
              "isPitch": true,
              "type": "pitch"
            },
            {
              "details": {
                "call": { "code": "F", "description": "Foul" },
                "description": "Foul",
                "code": "F",
                "ballColor": "rgba(170, 21, 11, 1.0)",
                "trailColor": "rgba(50, 0, 221, 1.0)",
                "isInPlay": false,
                "isStrike": true,
                "isBall": false,
                "type": { "code": "SI", "description": "Sinker" },
                "isOut": false,
                "hasReview": false
              },
              "count": { "balls": 0, "strikes": 2, "outs": 0 },
              "pitchData": {
                "startSpeed": 95.8,
                "endSpeed": 87.9,
                "strikeZoneTop": 3.63,
                "strikeZoneBottom": 1.71,
                "coordinates": {
                  "aY": 30.196832679239876,
                  "aZ": -23.22541535520518,
                  "pfxX": -7.005229123822405,
                  "pfxZ": 4.5372008649970805,
                  "pX": 0.8252616570868175,
                  "pZ": 2.569747283704469,
                  "vX0": 8.008082292935264,
                  "vY0": -139.31714326785294,
                  "vZ0": -2.9886494082254362,
                  "x": 85.54,
                  "y": 169.4,
                  "x0": -1.1711821848536357,
                  "y0": 50.0044737786834,
                  "z0": 5.184985580080388,
                  "aX": -13.823659983159345
                },
                "breaks": {
                  "breakAngle": 26.4,
                  "breakLength": 6.0,
                  "breakY": 24.0,
                  "spinRate": 2117,
                  "spinDirection": 239
                },
                "zone": 6,
                "typeConfidence": 0.9,
                "plateTime": 0.39258804256527435,
                "extension": 5.859083493761172
              },
              "index": 1,
              "playId": "e2a8f591-eafe-4f1b-93e9-68e48a69f2b6",
              "pitchNumber": 2,
              "startTime": "2022-11-02T00:15:25.437Z",
              "endTime": "2022-11-02T00:15:29.107Z",
              "isPitch": true,
              "type": "pitch"
            },
            {
              "details": {
                "call": { "code": "B", "description": "Ball" },
                "description": "Ball",
                "code": "B",
                "ballColor": "rgba(39, 161, 39, 1.0)",
                "trailColor": "rgba(0, 0, 254, 1.0)",
                "isInPlay": false,
                "isStrike": false,
                "isBall": true,
                "type": { "code": "SL", "description": "Slider" },
                "isOut": false,
                "hasReview": false
              },
              "count": { "balls": 1, "strikes": 2, "outs": 0 },
              "pitchData": {
                "startSpeed": 85.2,
                "endSpeed": 77.6,
                "strikeZoneTop": 3.59275312632104,
                "strikeZoneBottom": 1.63918334425841,
                "coordinates": {
                  "aY": 28.472306956367866,
                  "aZ": -30.360964701786504,
                  "pfxX": 6.913638898516105,
                  "pfxZ": 1.1892428221089557,
                  "pX": 2.300804080791437,
                  "pZ": 0.7237831814118226,
                  "vX0": 6.968902805255967,
                  "vY0": -123.850948482994,
                  "vZ0": -3.75935856140969,
                  "x": 29.3,
                  "y": 219.24,
                  "x0": -1.4649371920999554,
                  "y0": 50.00586612813965,
                  "z0": 4.845907637873696,
                  "aX": 10.566526173741495
                },
                "breaks": {
                  "breakAngle": 20.4,
                  "breakLength": 8.4,
                  "breakY": 24.0,
                  "spinRate": 3103,
                  "spinDirection": 61
                },
                "zone": 14,
                "typeConfidence": 0.9,
                "plateTime": 0.4450195634313321,
                "extension": 5.929312852405967
              },
              "index": 2,
              "playId": "77a00d62-8882-487d-a9ea-388e758f4063",
              "pitchNumber": 3,
              "startTime": "2022-11-02T00:15:56.302Z",
              "endTime": "2022-11-02T00:15:59.302Z",
              "isPitch": true,
              "type": "pitch"
            },
            {
              "details": {
                "call": { "code": "S", "description": "Swinging Strike" },
                "description": "Swinging Strike",
                "code": "S",
                "ballColor": "rgba(170, 21, 11, 1.0)",
                "trailColor": "rgba(0, 0, 254, 1.0)",
                "isInPlay": false,
                "isStrike": true,
                "isBall": false,
                "type": { "code": "SL", "description": "Slider" },
                "isOut": true,
                "hasReview": false
              },
              "count": { "balls": 1, "strikes": 3, "outs": 0 },
              "pitchData": {
                "startSpeed": 84.9,
                "endSpeed": 77.0,
                "strikeZoneTop": 3.63,
                "strikeZoneBottom": 1.71,
                "coordinates": {
                  "aY": 28.752447382146922,
                  "aZ": -26.185650410319152,
                  "pfxX": 9.963263604243199,
                  "pfxZ": 3.94729736736347,
                  "pX": 1.1867693951822813,
                  "pZ": 0.9983797502004297,
                  "vX0": 3.362375512477333,
                  "vY0": -123.4574596268546,
                  "vZ0": -4.043719937448231,
                  "x": 71.76,
                  "y": 211.82,
                  "x0": -1.4935293348851655,
                  "y0": 50.000703291444005,
                  "z0": 4.908212363307354,
                  "aX": 15.09542153608916
                },
                "breaks": {
                  "breakAngle": 30.0,
                  "breakLength": 8.4,
                  "breakY": 24.0,
                  "spinRate": 3144,
                  "spinDirection": 65
                },
                "zone": 14,
                "typeConfidence": 0.91,
                "plateTime": 0.4467945475564834,
                "extension": 5.756910045191827
              },
              "index": 3,
              "playId": "cf49bd3d-2791-4327-a4dd-4e4d5d93d2f4",
              "pitchNumber": 4,
              "startTime": "2022-11-02T00:16:22.412Z",
              "endTime": "2022-11-02T00:16:28.529Z",
              "isPitch": true,
              "type": "pitch"
            }
          ],
          "playEndTime": "2022-11-02T00:16:28.529Z",
          "atBatIndex": 4
        },
        {
          "result": {
            "type": "atBat",
            "event": "Pop Out",
            "eventType": "field_out",
            "description": "J.T. Realmuto pops out to catcher Martin Maldonado in foul territory.",
            "rbi": 0,
            "awayScore": 0,
            "homeScore": 0,
            "isOut": true
          },
          "about": {
            "atBatIndex": 5,
            "halfInning": "bottom",
            "isTopInning": false,
            "inning": 1,
            "startTime": "2022-11-02T00:16:38.269Z",
            "endTime": "2022-11-02T00:21:01.146Z",
            "isComplete": true,
            "isScoringPlay": false,
            "hasReview": false,
            "hasOut": true,
            "captivatingIndex": 0
          },
          "count": { "balls": 3, "strikes": 2, "outs": 2 },
          "matchup": {
            "batter": {
              "id": 592663,
              "fullName": "J.T. Realmuto",
              "link": "/api/v1/people/592663"
            },
            "batSide": { "code": "R", "description": "Right" },
            "pitcher": {
              "id": 621121,
              "fullName": "Lance McCullers Jr.",
              "link": "/api/v1/people/621121"
            },
            "pitchHand": { "code": "R", "description": "Right" },
            "postOnFirst": {
              "id": 656941,
              "fullName": "Kyle Schwarber",
              "link": "/api/v1/people/656941"
            },
            "batterHotColdZones": [],
            "pitcherHotColdZones": [],
            "splits": {
              "batter": "vs_RHP",
              "pitcher": "vs_RHB",
              "menOnBase": "Men_On"
            }
          },
          "pitchIndex": [0, 1, 2, 3, 4, 5, 6, 7],
          "actionIndex": [],
          "runnerIndex": [0],
          "runners": [
            {
              "movement": {
                "originBase": null,
                "start": null,
                "end": null,
                "outBase": "1B",
                "isOut": true,
                "outNumber": 2
              },
              "details": {
                "event": "Pop Out",
                "eventType": "field_out",
                "movementReason": null,
                "runner": {
                  "id": 592663,
                  "fullName": "J.T. Realmuto",
                  "link": "/api/v1/people/592663"
                },
                "responsiblePitcher": null,
                "isScoringEvent": false,
                "rbi": false,
                "earned": false,
                "teamUnearned": false,
                "playIndex": 7
              },
              "credits": [
                {
                  "player": { "id": 455117, "link": "/api/v1/people/455117" },
                  "position": {
                    "code": "2",
                    "name": "Catcher",
                    "type": "Catcher",
                    "abbreviation": "C"
                  },
                  "credit": "f_putout"
                }
              ]
            }
          ],
          "playEvents": [
            {
              "details": {
                "call": { "code": "B", "description": "Ball" },
                "description": "Ball",
                "code": "B",
                "ballColor": "rgba(39, 161, 39, 1.0)",
                "trailColor": "rgba(0, 0, 254, 1.0)",
                "isInPlay": false,
                "isStrike": false,
                "isBall": true,
                "type": { "code": "SL", "description": "Slider" },
                "isOut": false,
                "hasReview": false
              },
              "count": { "balls": 1, "strikes": 0, "outs": 1 },
              "pitchData": {
                "startSpeed": 85.0,
                "endSpeed": 77.6,
                "strikeZoneTop": 3.6442806950077,
                "strikeZoneBottom": 1.71709021733318,
                "coordinates": {
                  "aY": 27.10238192334141,
                  "aZ": -28.306782071186035,
                  "pfxX": 6.440302350593017,
                  "pfxZ": 2.5211814962554975,
                  "pX": 0.247159414168046,
                  "pZ": 1.115018215314363,
                  "vX0": 2.207176129522197,
                  "vY0": -123.7343736471222,
                  "vZ0": -3.3954180263533855,
                  "x": 107.58,
                  "y": 208.67,
                  "x0": -1.4956789746685168,
                  "y0": 50.00389920386955,
                  "z0": 4.903919880807261,
                  "aX": 9.881401242220695
                },
                "breaks": {
                  "breakAngle": 19.2,
                  "breakLength": 8.4,
                  "breakY": 24.0,
                  "spinRate": 3019,
                  "spinDirection": 78
                },
                "zone": 14,
                "typeConfidence": 0.9,
                "plateTime": 0.44444602379905174,
                "extension": 5.8940574492505124
              },
              "index": 0,
              "playId": "d459b951-247d-4e6c-952b-b8f1a6dfba61",
              "pitchNumber": 1,
              "startTime": "2022-11-02T00:17:14.165Z",
              "endTime": "2022-11-02T00:17:18.062Z",
              "isPitch": true,
              "type": "pitch"
            },
            {
              "details": {
                "call": { "code": "F", "description": "Foul" },
                "description": "Foul",
                "code": "F",
                "ballColor": "rgba(170, 21, 11, 1.0)",
                "trailColor": "rgba(50, 0, 221, 1.0)",
                "isInPlay": false,
                "isStrike": true,
                "isBall": false,
                "type": { "code": "SI", "description": "Sinker" },
                "isOut": false,
                "hasReview": false
              },
              "count": { "balls": 1, "strikes": 1, "outs": 1 },
              "pitchData": {
                "startSpeed": 96.4,
                "endSpeed": 88.3,
                "strikeZoneTop": 3.63,
                "strikeZoneBottom": 1.69,
                "coordinates": {
                  "aY": 31.698933385824596,
                  "aZ": -24.685458497760457,
                  "pfxX": -9.19340861839808,
                  "pfxZ": 3.762572395121609,
                  "pX": 0.01912770736169174,
                  "pZ": 1.621595477358535,
                  "vX0": 6.918302246615523,
                  "vY0": -140.1396026152729,
                  "vZ0": -5.190970064956623,
                  "x": 116.27,
                  "y": 195.0,
                  "x0": -1.2873026319576848,
                  "y0": 50.00068057508782,
                  "z0": 5.110611851045954,
                  "aX": -18.281872349819373
                },
                "breaks": {
                  "breakAngle": 33.6,
                  "breakLength": 6.0,
                  "breakY": 24.0,
                  "spinRate": 2187,
                  "spinDirection": 237
                },
                "zone": 8,
                "typeConfidence": 0.9,
                "plateTime": 0.39086800420360523,
                "extension": 5.78717074575681
              },
              "index": 1,
              "playId": "6016acb2-65c1-4585-9d4e-19778356dd61",
              "pitchNumber": 2,
              "startTime": "2022-11-02T00:17:38.091Z",
              "endTime": "2022-11-02T00:17:41.091Z",
              "isPitch": true,
              "type": "pitch"
            },
            {
              "details": {
                "call": { "code": "B", "description": "Ball" },
                "description": "Ball",
                "code": "B",
                "ballColor": "rgba(39, 161, 39, 1.0)",
                "trailColor": "rgba(50, 0, 221, 1.0)",
                "isInPlay": false,
                "isStrike": false,
                "isBall": true,
                "type": { "code": "SI", "description": "Sinker" },
                "isOut": false,
                "hasReview": false
              },
              "count": { "balls": 2, "strikes": 1, "outs": 1 },
              "pitchData": {
                "startSpeed": 94.5,
                "endSpeed": 86.5,
                "strikeZoneTop": 3.67003824531632,
                "strikeZoneBottom": 1.71709021733318,
                "coordinates": {
                  "aY": 31.258881020638572,
                  "aZ": -27.840427158697743,
                  "pfxX": -6.5977926800301105,
                  "pfxZ": 2.2610530987070927,
                  "pX": -2.0612494802536174,
                  "pZ": 2.722409864787393,
                  "vX0": 0.888225932632538,
                  "vY0": -137.71801112366873,
                  "vZ0": -1.72410557484147,
                  "x": 195.57,
                  "y": 165.27,
                  "x0": -1.5314327159047927,
                  "y0": 50.00308064509666,
                  "z0": 5.244027480971098,
                  "aX": -12.642986371617681
                },
                "breaks": {
                  "breakAngle": 24.0,
                  "breakLength": 6.0,
                  "breakY": 24.0,
                  "spinRate": 2068,
                  "spinDirection": 233
                },
                "zone": 11,
                "typeConfidence": 0.9,
                "plateTime": 0.3980875256650127,
                "extension": 5.923078412662623
              },
              "index": 2,
              "playId": "0f4eb9d2-7fa2-40a7-bc15-21db308bbe28",
              "pitchNumber": 3,
              "startTime": "2022-11-02T00:18:07.506Z",
              "endTime": "2022-11-02T00:18:10.876Z",
              "isPitch": true,
              "type": "pitch"
            },
            {
              "details": {
                "call": { "code": "C", "description": "Called Strike" },
                "description": "Called Strike",
                "code": "C",
                "ballColor": "rgba(170, 21, 11, 1.0)",
                "trailColor": "rgba(50, 0, 221, 1.0)",
                "isInPlay": false,
                "isStrike": true,
                "isBall": false,
                "type": { "code": "SI", "description": "Sinker" },
                "isOut": false,
                "hasReview": false
              },
              "count": { "balls": 2, "strikes": 2, "outs": 1 },
              "pitchData": {
                "startSpeed": 96.1,
                "endSpeed": 88.1,
                "strikeZoneTop": 3.72154075816263,
                "strikeZoneBottom": 1.79497314600699,
                "coordinates": {
                  "aY": 30.680984412910156,
                  "aZ": -28.275852352352,
                  "pfxX": -6.390613491009758,
                  "pfxZ": 1.965906853116806,
                  "pX": 0.7656627881806191,
                  "pZ": 2.9392038534503917,
                  "vX0": 7.371777060745453,
                  "vY0": -139.7690138187527,
                  "vZ0": -1.463439452524077,
                  "x": 87.81,
                  "y": 159.42,
                  "x0": -1.0722393964411314,
                  "y0": 50.00471217212095,
                  "z0": 5.3215717813509364,
                  "aX": -12.681192735386457
                },
                "breaks": {
                  "breakAngle": 21.6,
                  "breakLength": 6.0,
                  "breakY": 24.0,
                  "spinRate": 2114,
                  "spinDirection": 226
                },
                "zone": 6,
                "typeConfidence": 0.9,
                "plateTime": 0.3914720143822703,
                "extension": 5.917531022949308
              },
              "index": 3,
              "playId": "4ae14bf4-4003-48b0-a32b-01fee0ec588f",
              "pitchNumber": 4,
              "startTime": "2022-11-02T00:18:36.735Z",
              "endTime": "2022-11-02T00:18:40.002Z",
              "isPitch": true,
              "type": "pitch"
            },
            {
              "details": {
                "call": { "code": "F", "description": "Foul" },
                "description": "Foul",
                "code": "F",
                "ballColor": "rgba(170, 21, 11, 1.0)",
                "trailColor": "rgba(0, 0, 254, 1.0)",
                "isInPlay": false,
                "isStrike": true,
                "isBall": false,
                "type": { "code": "SL", "description": "Slider" },
                "isOut": false,
                "hasReview": false
              },
              "count": { "balls": 2, "strikes": 2, "outs": 1 },
              "pitchData": {
                "startSpeed": 85.2,
                "endSpeed": 78.4,
                "strikeZoneTop": 3.63,
                "strikeZoneBottom": 1.69,
                "coordinates": {
                  "aY": 24.890838013832926,
                  "aZ": -28.106777909957938,
                  "pfxX": 7.233616495041295,
                  "pfxZ": 2.60659838967734,
                  "pX": -0.14304901281263147,
                  "pZ": 1.693083905269937,
                  "vX0": 1.1328568560282215,
                  "vY0": -124.16713066355736,
                  "vZ0": -2.4238220673129076,
                  "x": 122.45,
                  "y": 193.07,
                  "x0": -1.5450500667887246,
                  "y0": 50.00360178239177,
                  "z0": 5.020856789417638,
                  "aX": 11.293860781649807
                },
                "breaks": {
                  "breakAngle": 21.6,
                  "breakLength": 8.4,
                  "breakY": 24.0,
                  "spinRate": 2966,
                  "spinDirection": 73
                },
                "zone": 8,
                "typeConfidence": 0.91,
                "plateTime": 0.44113580214617176,
                "extension": 5.914481867199707
              },
              "index": 4,
              "playId": "5dbb2ec2-8352-4e10-87ef-a4f02bfd09af",
              "pitchNumber": 5,
              "startTime": "2022-11-02T00:19:06.839Z",
              "endTime": "2022-11-02T00:19:10.247Z",
              "isPitch": true,
              "type": "pitch"
            },
            {
              "details": {
                "call": { "code": "B", "description": "Ball" },
                "description": "Ball",
                "code": "B",
                "ballColor": "rgba(39, 161, 39, 1.0)",
                "trailColor": "rgba(0, 85, 254, 1.0)",
                "isInPlay": false,
                "isStrike": false,
                "isBall": true,
                "type": { "code": "CH", "description": "Changeup" },
                "isOut": false,
                "hasReview": false
              },
              "count": { "balls": 3, "strikes": 2, "outs": 1 },
              "pitchData": {
                "startSpeed": 88.1,
                "endSpeed": 80.4,
                "strikeZoneTop": 3.67003824531632,
                "strikeZoneBottom": 1.71709021733318,
                "coordinates": {
                  "aY": 28.543004080116862,
                  "aZ": -37.00424141361065,
                  "pfxX": -10.339538944977377,
                  "pfxZ": -2.92414431909844,
                  "pX": -1.8153242165324457,
                  "pZ": 2.5766576832809975,
                  "vX0": 2.5497668053502696,
                  "vY0": -128.24945792524085,
                  "vZ0": 0.5964758590577302,
                  "x": 186.2,
                  "y": 169.21,
                  "x0": -1.4844199259934427,
                  "y0": 50.002143345947864,
                  "z0": 5.246068764078378,
                  "aX": -17.082388287204093
                },
                "breaks": {
                  "breakAngle": 24.0,
                  "breakLength": 9.6,
                  "breakY": 24.0,
                  "spinRate": 1811,
                  "spinDirection": 265
                },
                "zone": 13,
                "typeConfidence": 0.91,
                "plateTime": 0.4284151561319254,
                "extension": 5.494249485434897
              },
              "index": 5,
              "playId": "c3d92388-e156-439c-8252-6c00b60d984a",
              "pitchNumber": 6,
              "startTime": "2022-11-02T00:19:37.642Z",
              "endTime": "2022-11-02T00:19:41.224Z",
              "isPitch": true,
              "type": "pitch"
            },
            {
              "details": {
                "call": { "code": "F", "description": "Foul" },
                "description": "Foul",
                "code": "F",
                "ballColor": "rgba(170, 21, 11, 1.0)",
                "trailColor": "rgba(0, 0, 254, 1.0)",
                "isInPlay": false,
                "isStrike": true,
                "isBall": false,
                "type": { "code": "SL", "description": "Slider" },
                "isOut": false,
                "hasReview": false
              },
              "count": { "balls": 3, "strikes": 2, "outs": 1 },
              "pitchData": {
                "startSpeed": 85.0,
                "endSpeed": 77.4,
                "strikeZoneTop": 3.63,
                "strikeZoneBottom": 1.69,
                "coordinates": {
                  "aY": 27.056232146030222,
                  "aZ": -26.17807688347387,
                  "pfxX": 10.414891505879798,
                  "pfxZ": 3.8993491607272865,
                  "pX": -0.4258134443256734,
                  "pZ": 2.280752514284979,
                  "vX0": -0.287609274232389,
                  "vY0": -123.8058458487014,
                  "vZ0": -1.3722587313712227,
                  "x": 133.23,
                  "y": 177.2,
                  "x0": -1.6582777793324193,
                  "y0": 50.00157740470883,
                  "z0": 5.054262855693535,
                  "aX": 16.001122433547756
                },
                "breaks": {
                  "breakAngle": 31.2,
                  "breakLength": 8.4,
                  "breakY": 24.0,
                  "spinRate": 2970,
                  "spinDirection": 84
                },
                "zone": 7,
                "typeConfidence": 0.91,
                "plateTime": 0.4441375170771371,
                "extension": 5.87809566327026
              },
              "index": 6,
              "playId": "9e6362af-72a1-4438-a42e-02b6c0a2a980",
              "pitchNumber": 7,
              "startTime": "2022-11-02T00:20:08.474Z",
              "endTime": "2022-11-02T00:20:11.479Z",
              "isPitch": true,
              "type": "pitch"
            },
            {
              "details": {
                "call": { "code": "X", "description": "In play, out(s)" },
                "description": "In play, out(s)",
                "code": "X",
                "ballColor": "rgba(26, 86, 190, 1.0)",
                "trailColor": "rgba(0, 0, 254, 1.0)",
                "isInPlay": true,
                "isStrike": false,
                "isBall": false,
                "type": { "code": "SL", "description": "Slider" },
                "isOut": true,
                "hasReview": false
              },
              "count": { "balls": 3, "strikes": 2, "outs": 1 },
              "pitchData": {
                "startSpeed": 85.3,
                "endSpeed": 77.3,
                "strikeZoneTop": 3.63,
                "strikeZoneBottom": 1.69,
                "coordinates": {
                  "aY": 28.161350858637505,
                  "aZ": -26.69537332232905,
                  "pfxX": 8.661781210633578,
                  "pfxZ": 3.5578084026798464,
                  "pX": -0.3825295201558188,
                  "pZ": 2.387552420660967,
                  "vX0": 0.2398054240303363,
                  "vY0": -124.17640803784694,
                  "vZ0": -0.8220619406087051,
                  "x": 131.58,
                  "y": 174.32,
                  "x0": -1.6034979539823686,
                  "y0": 50.00204984864942,
                  "z0": 4.972397883087293,
                  "aX": 13.333549391276309
                },
                "breaks": {
                  "breakAngle": 26.4,
                  "breakLength": 8.4,
                  "breakY": 24.0,
                  "spinRate": 2838,
                  "spinDirection": 78
                },
                "zone": 4,
                "typeConfidence": 0.9,
                "plateTime": 0.44350973378367486,
                "extension": 5.902673886084552
              },
              "hitData": {
                "launchSpeed": 89.1,
                "launchAngle": 80.0,
                "totalDistance": 26.0,
                "trajectory": "popup",
                "hardness": "medium",
                "location": "2",
                "coordinates": { "coordX": 147.46, "coordY": 208.36 }
              },
              "index": 7,
              "playId": "9fe2d58e-747f-4ef0-ad20-bcb18ead00c0",
              "pitchNumber": 8,
              "startTime": "2022-11-02T00:20:48.638Z",
              "endTime": "2022-11-02T00:21:01.146Z",
              "isPitch": true,
              "type": "pitch"
            }
          ],
          "playEndTime": "2022-11-02T00:21:01.146Z",
          "atBatIndex": 5
        },
        {
          "result": {
            "type": "atBat",
            "event": "Home Run",
            "eventType": "home_run",
            "description": "Bryce Harper homers (6) on a fly ball to right center field.    Kyle Schwarber scores.",
            "rbi": 2,
            "awayScore": 0,
            "homeScore": 2,
            "isOut": false
          },
          "about": {
            "atBatIndex": 6,
            "halfInning": "bottom",
            "isTopInning": false,
            "inning": 1,
            "startTime": "2022-11-02T00:21:15.395Z",
            "endTime": "2022-11-02T00:22:32.985Z",
            "isComplete": true,
            "isScoringPlay": true,
            "hasReview": false,
            "hasOut": false,
            "captivatingIndex": 75
          },
          "count": { "balls": 0, "strikes": 0, "outs": 2 },
          "matchup": {
            "batter": {
              "id": 547180,
              "fullName": "Bryce Harper",
              "link": "/api/v1/people/547180"
            },
            "batSide": { "code": "L", "description": "Left" },
            "pitcher": {
              "id": 621121,
              "fullName": "Lance McCullers Jr.",
              "link": "/api/v1/people/621121"
            },
            "pitchHand": { "code": "R", "description": "Right" },
            "batterHotColdZones": [],
            "pitcherHotColdZones": [],
            "splits": {
              "batter": "vs_RHP",
              "pitcher": "vs_LHB",
              "menOnBase": "Empty"
            }
          },
          "pitchIndex": [0],
          "actionIndex": [],
          "runnerIndex": [0, 1],
          "runners": [
            {
              "movement": {
                "originBase": null,
                "start": null,
                "end": "score",
                "outBase": null,
                "isOut": false,
                "outNumber": null
              },
              "details": {
                "event": "Home Run",
                "eventType": "home_run",
                "movementReason": null,
                "runner": {
                  "id": 547180,
                  "fullName": "Bryce Harper",
                  "link": "/api/v1/people/547180"
                },
                "responsiblePitcher": {
                  "id": 621121,
                  "link": "/api/v1/people/621121"
                },
                "isScoringEvent": true,
                "rbi": true,
                "earned": true,
                "teamUnearned": false,
                "playIndex": 0
              },
              "credits": []
            },
            {
              "movement": {
                "originBase": "1B",
                "start": "1B",
                "end": "score",
                "outBase": null,
                "isOut": false,
                "outNumber": null
              },
              "details": {
                "event": "Home Run",
                "eventType": "home_run",
                "movementReason": "r_adv_force",
                "runner": {
                  "id": 656941,
                  "fullName": "Kyle Schwarber",
                  "link": "/api/v1/people/656941"
                },
                "responsiblePitcher": {
                  "id": 621121,
                  "link": "/api/v1/people/621121"
                },
                "isScoringEvent": true,
                "rbi": true,
                "earned": true,
                "teamUnearned": false,
                "playIndex": 0
              },
              "credits": []
            }
          ],
          "playEvents": [
            {
              "details": {
                "call": { "code": "E", "description": "In play, run(s)" },
                "description": "In play, run(s)",
                "code": "E",
                "ballColor": "rgba(26, 86, 190, 1.0)",
                "trailColor": "rgba(153, 171, 0, 1.0)",
                "isInPlay": true,
                "isStrike": false,
                "isBall": false,
                "type": { "code": "KC", "description": "Knuckle Curve" },
                "isOut": false,
                "hasReview": false
              },
              "count": { "balls": 0, "strikes": 0, "outs": 2 },
              "pitchData": {
                "startSpeed": 84.6,
                "endSpeed": 77.6,
                "strikeZoneTop": 3.25,
                "strikeZoneBottom": 1.61,
                "coordinates": {
                  "aY": 25.762378867013556,
                  "aZ": -36.25275497691068,
                  "pfxX": 7.868885042516287,
                  "pfxZ": -2.6746902818238887,
                  "pX": 0.10450978249770981,
                  "pZ": 2.1568216267536164,
                  "vX0": 1.5204010880057286,
                  "vY0": -123.15685059510653,
                  "vZ0": -0.44057625270700485,
                  "x": 113.02,
                  "y": 180.55,
                  "x0": -1.5434791371405039,
                  "y0": 50.0009925730941,
                  "z0": 5.41936769211881,
                  "aX": 12.015882037009613
                },
                "breaks": {
                  "breakAngle": 19.2,
                  "breakLength": 9.6,
                  "breakY": 24.0,
                  "spinRate": 2985,
                  "spinDirection": 57
                },
                "zone": 5,
                "typeConfidence": 0.89,
                "plateTime": 0.4457298951622959,
                "extension": 5.872414007857045
              },
              "hitData": {
                "launchSpeed": 103.9,
                "launchAngle": 28.0,
                "totalDistance": 402.0,
                "trajectory": "fly_ball",
                "hardness": "medium",
                "location": "89",
                "coordinates": { "coordX": 193.13, "coordY": 50.82 }
              },
              "index": 0,
              "playId": "c77ee8cc-13fe-470d-8532-6745a8947a53",
              "pitchNumber": 1,
              "startTime": "2022-11-02T00:22:00.970Z",
              "endTime": "2022-11-02T00:22:32.985Z",
              "isPitch": true,
              "type": "pitch"
            }
          ],
          "playEndTime": "2022-11-02T00:22:32.985Z",
          "atBatIndex": 6
        },
        {
          "result": {
            "type": "atBat",
            "event": "Groundout",
            "eventType": "field_out",
            "description": "Nick Castellanos grounds out, third baseman Alex Bregman to first baseman Yuli Gurriel.",
            "rbi": 0,
            "awayScore": 0,
            "homeScore": 2,
            "isOut": true
          },
          "about": {
            "atBatIndex": 7,
            "halfInning": "bottom",
            "isTopInning": false,
            "inning": 1,
            "startTime": "2022-11-02T00:22:56.506Z",
            "endTime": "2022-11-02T00:24:19.847Z",
            "isComplete": true,
            "isScoringPlay": false,
            "hasReview": false,
            "hasOut": true,
            "captivatingIndex": 0
          },
          "count": { "balls": 2, "strikes": 0, "outs": 3 },
          "matchup": {
            "batter": {
              "id": 592206,
              "fullName": "Nick Castellanos",
              "link": "/api/v1/people/592206"
            },
            "batSide": { "code": "R", "description": "Right" },
            "pitcher": {
              "id": 621121,
              "fullName": "Lance McCullers Jr.",
              "link": "/api/v1/people/621121"
            },
            "pitchHand": { "code": "R", "description": "Right" },
            "batterHotColdZones": [],
            "pitcherHotColdZones": [],
            "splits": {
              "batter": "vs_RHP",
              "pitcher": "vs_RHB",
              "menOnBase": "Empty"
            }
          },
          "pitchIndex": [0, 1, 2],
          "actionIndex": [],
          "runnerIndex": [0],
          "runners": [
            {
              "movement": {
                "originBase": null,
                "start": null,
                "end": null,
                "outBase": "1B",
                "isOut": true,
                "outNumber": 3
              },
              "details": {
                "event": "Groundout",
                "eventType": "field_out",
                "movementReason": null,
                "runner": {
                  "id": 592206,
                  "fullName": "Nick Castellanos",
                  "link": "/api/v1/people/592206"
                },
                "responsiblePitcher": null,
                "isScoringEvent": false,
                "rbi": false,
                "earned": false,
                "teamUnearned": false,
                "playIndex": 2
              },
              "credits": [
                {
                  "player": { "id": 608324, "link": "/api/v1/people/608324" },
                  "position": {
                    "code": "5",
                    "name": "Third Base",
                    "type": "Infielder",
                    "abbreviation": "3B"
                  },
                  "credit": "f_assist"
                },
                {
                  "player": { "id": 493329, "link": "/api/v1/people/493329" },
                  "position": {
                    "code": "3",
                    "name": "First Base",
                    "type": "Infielder",
                    "abbreviation": "1B"
                  },
                  "credit": "f_putout"
                }
              ]
            }
          ],
          "playEvents": [
            {
              "details": {
                "call": { "code": "B", "description": "Ball" },
                "description": "Ball",
                "code": "B",
                "ballColor": "rgba(39, 161, 39, 1.0)",
                "trailColor": "rgba(50, 0, 221, 1.0)",
                "isInPlay": false,
                "isStrike": false,
                "isBall": true,
                "type": { "code": "SI", "description": "Sinker" },
                "isOut": false,
                "hasReview": false
              },
              "count": { "balls": 1, "strikes": 0, "outs": 2 },
              "pitchData": {
                "startSpeed": 94.6,
                "endSpeed": 86.6,
                "strikeZoneTop": 3.56685058229393,
                "strikeZoneBottom": 1.74295292927551,
                "coordinates": {
                  "aY": 30.726519341597516,
                  "aZ": -27.446422274984915,
                  "pfxX": -10.670681724454669,
                  "pfxZ": 2.4811560024182127,
                  "pX": 1.783174353056626,
                  "pZ": 0.9108108407828819,
                  "vX0": 11.181726444537768,
                  "vY0": -137.25568905032773,
                  "vZ0": -6.154313755156217,
                  "x": 49.03,
                  "y": 214.19,
                  "x0": -0.9595128237348647,
                  "y0": 50.00349106594441,
                  "z0": 5.054162330442949,
                  "aX": -20.336020264867944
                },
                "breaks": {
                  "breakAngle": 32.4,
                  "breakLength": 7.2,
                  "breakY": 24.0,
                  "spinRate": 2105,
                  "spinDirection": 241
                },
                "zone": 14,
                "typeConfidence": 0.9,
                "plateTime": 0.3992518396053768,
                "extension": 5.895471148404323
              },
              "index": 0,
              "playId": "21c770a2-ee3f-47c3-a069-1f11c283cd4d",
              "pitchNumber": 1,
              "startTime": "2022-11-02T00:23:12.793Z",
              "endTime": "2022-11-02T00:23:15.793Z",
              "isPitch": true,
              "type": "pitch"
            },
            {
              "details": {
                "call": { "code": "B", "description": "Ball" },
                "description": "Ball",
                "code": "B",
                "ballColor": "rgba(39, 161, 39, 1.0)",
                "trailColor": "rgba(50, 0, 221, 1.0)",
                "isInPlay": false,
                "isStrike": false,
                "isBall": true,
                "type": { "code": "SI", "description": "Sinker" },
                "isOut": false,
                "hasReview": false
              },
              "count": { "balls": 2, "strikes": 0, "outs": 2 },
              "pitchData": {
                "startSpeed": 94.5,
                "endSpeed": 86.3,
                "strikeZoneTop": 3.56685058229393,
                "strikeZoneBottom": 1.74295292927551,
                "coordinates": {
                  "aY": 30.79091279329556,
                  "aZ": -26.442839796159316,
                  "pfxX": -7.829770001488996,
                  "pfxZ": 3.0116717722445863,
                  "pX": 1.8430540255122885,
                  "pZ": 1.9937911860038842,
                  "vX0": 10.499093780217361,
                  "vY0": -137.2042672239961,
                  "vZ0": -3.5084005917463466,
                  "x": 46.75,
                  "y": 184.95,
                  "x0": -1.0186112548291364,
                  "y0": 50.00298196745746,
                  "z0": 5.09409434654824,
                  "aX": -14.90523523340663
                },
                "breaks": {
                  "breakAngle": 25.2,
                  "breakLength": 6.0,
                  "breakY": 24.0,
                  "spinRate": 2184,
                  "spinDirection": 241
                },
                "zone": 14,
                "typeConfidence": 0.9,
                "plateTime": 0.39942752625366396,
                "extension": 5.865205447781233
              },
              "index": 1,
              "playId": "3604fb69-0780-45d6-ab7a-f5cc76bcaf6c",
              "pitchNumber": 2,
              "startTime": "2022-11-02T00:23:27.571Z",
              "endTime": "2022-11-02T00:23:30.940Z",
              "isPitch": true,
              "type": "pitch"
            },
            {
              "details": {
                "call": { "code": "X", "description": "In play, out(s)" },
                "description": "In play, out(s)",
                "code": "X",
                "ballColor": "rgba(26, 86, 190, 1.0)",
                "trailColor": "rgba(50, 0, 221, 1.0)",
                "isInPlay": true,
                "isStrike": false,
                "isBall": false,
                "type": { "code": "SI", "description": "Sinker" },
                "isOut": true,
                "hasReview": false
              },
              "count": { "balls": 2, "strikes": 0, "outs": 2 },
              "pitchData": {
                "startSpeed": 94.6,
                "endSpeed": 87.0,
                "strikeZoneTop": 3.69,
                "strikeZoneBottom": 1.8,
                "coordinates": {
                  "aY": 29.831679689985602,
                  "aZ": -30.796477369140135,
                  "pfxX": -9.04519372212799,
                  "pfxZ": 0.7142368463401789,
                  "pX": -0.11059910685609683,
                  "pZ": 1.9406711815577753,
                  "vX0": 6.557249943763723,
                  "vY0": -137.7209222036286,
                  "vZ0": -2.9834570236090885,
                  "x": 121.22,
                  "y": 186.38,
                  "x0": -1.3441059205093961,
                  "y0": 50.00166044266622,
                  "z0": 5.1151382700563,
                  "aX": -17.42005883066901
                },
                "breaks": {
                  "breakAngle": 27.6,
                  "breakLength": 7.2,
                  "breakY": 24.0,
                  "spinRate": 2070,
                  "spinDirection": 242
                },
                "zone": 8,
                "typeConfidence": 0.9,
                "plateTime": 0.39729892547028633,
                "extension": 5.972077772508301
              },
              "hitData": {
                "launchSpeed": 69.4,
                "launchAngle": -29.0,
                "totalDistance": 6.0,
                "trajectory": "ground_ball",
                "hardness": "medium",
                "location": "5",
                "coordinates": { "coordX": 102.34, "coordY": 169.83 }
              },
              "index": 2,
              "playId": "54cd583e-8485-41ae-970f-5b4b3ec6c6c4",
              "pitchNumber": 3,
              "startTime": "2022-11-02T00:24:10.948Z",
              "endTime": "2022-11-02T00:24:19.847Z",
              "isPitch": true,
              "type": "pitch"
            }
          ],
          "playEndTime": "2022-11-02T00:24:19.847Z",
          "atBatIndex": 7
        },
        {
          "result": {
            "type": "atBat",
            "event": "Groundout",
            "eventType": "field_out",
            "description": "Alex Bregman grounds out, third baseman Alec Bohm to first baseman Rhys Hoskins.",
            "rbi": 0,
            "awayScore": 0,
            "homeScore": 2,
            "isOut": true
          },
          "about": {
            "atBatIndex": 8,
            "halfInning": "top",
            "isTopInning": true,
            "inning": 2,
            "startTime": "2022-11-02T00:27:16.429Z",
            "endTime": "2022-11-02T00:28:08.210Z",
            "isComplete": true,
            "isScoringPlay": false,
            "hasReview": false,
            "hasOut": true,
            "captivatingIndex": 0
          },
          "count": { "balls": 1, "strikes": 1, "outs": 1 },
          "matchup": {
            "batter": {
              "id": 608324,
              "fullName": "Alex Bregman",
              "link": "/api/v1/people/608324"
            },
            "batSide": { "code": "R", "description": "Right" },
            "pitcher": {
              "id": 624133,
              "fullName": "Ranger Suarez",
              "link": "/api/v1/people/624133"
            },
            "pitchHand": { "code": "L", "description": "Left" },
            "batterHotColdZones": [],
            "pitcherHotColdZones": [],
            "splits": {
              "batter": "vs_LHP",
              "pitcher": "vs_RHB",
              "menOnBase": "Empty"
            }
          },
          "pitchIndex": [0, 1, 2],
          "actionIndex": [],
          "runnerIndex": [0],
          "runners": [
            {
              "movement": {
                "originBase": null,
                "start": null,
                "end": null,
                "outBase": "1B",
                "isOut": true,
                "outNumber": 1
              },
              "details": {
                "event": "Groundout",
                "eventType": "field_out",
                "movementReason": null,
                "runner": {
                  "id": 608324,
                  "fullName": "Alex Bregman",
                  "link": "/api/v1/people/608324"
                },
                "responsiblePitcher": null,
                "isScoringEvent": false,
                "rbi": false,
                "earned": false,
                "teamUnearned": false,
                "playIndex": 2
              },
              "credits": [
                {
                  "player": { "id": 664761, "link": "/api/v1/people/664761" },
                  "position": {
                    "code": "5",
                    "name": "Third Base",
                    "type": "Infielder",
                    "abbreviation": "3B"
                  },
                  "credit": "f_assist"
                },
                {
                  "player": { "id": 656555, "link": "/api/v1/people/656555" },
                  "position": {
                    "code": "3",
                    "name": "First Base",
                    "type": "Infielder",
                    "abbreviation": "1B"
                  },
                  "credit": "f_putout"
                }
              ]
            }
          ],
          "playEvents": [
            {
              "details": {
                "call": { "code": "B", "description": "Ball" },
                "description": "Ball",
                "code": "B",
                "ballColor": "rgba(39, 161, 39, 1.0)",
                "trailColor": "rgba(50, 0, 221, 1.0)",
                "isInPlay": false,
                "isStrike": false,
                "isBall": true,
                "type": { "code": "SI", "description": "Sinker" },
                "isOut": false,
                "hasReview": false
              },
              "count": { "balls": 1, "strikes": 0, "outs": 0 },
              "pitchData": {
                "startSpeed": 92.6,
                "endSpeed": 84.6,
                "strikeZoneTop": 3.3734511779465,
                "strikeZoneBottom": 1.65207052564424,
                "coordinates": {
                  "aY": 30.73352528782243,
                  "aZ": -26.854989169242124,
                  "pfxX": 10.017464609819712,
                  "pfxZ": 2.917233804580264,
                  "pX": 0.45528726258203206,
                  "pZ": 1.0984561376089932,
                  "vX0": -7.660341719793308,
                  "vY0": -134.54960219247408,
                  "vZ0": -6.921958387377659,
                  "x": 99.65,
                  "y": 209.12,
                  "x0": 2.0457974520511133,
                  "y0": 50.00203056884437,
                  "z0": 5.622436769470384,
                  "aX": 18.262560180193077
                },
                "breaks": {
                  "breakAngle": 30.0,
                  "breakLength": 7.2,
                  "breakY": 24.0,
                  "spinRate": 1965,
                  "spinDirection": 134
                },
                "zone": 14,
                "typeConfidence": 0.92,
                "plateTime": 0.4079588552483262,
                "extension": 6.0469546127481255
              },
              "index": 0,
              "playId": "d2614baf-6a9c-43d2-b21e-52ca5e4d31ca",
              "pitchNumber": 1,
              "startTime": "2022-11-02T00:27:34.604Z",
              "endTime": "2022-11-02T00:27:37.979Z",
              "isPitch": true,
              "type": "pitch"
            },
            {
              "details": {
                "call": { "code": "C", "description": "Called Strike" },
                "description": "Called Strike",
                "code": "C",
                "ballColor": "rgba(170, 21, 11, 1.0)",
                "trailColor": "rgba(152, 0, 101, 1.0)",
                "isInPlay": false,
                "isStrike": true,
                "isBall": false,
                "type": { "code": "FC", "description": "Cutter" },
                "isOut": false,
                "hasReview": false
              },
              "count": { "balls": 1, "strikes": 1, "outs": 0 },
              "pitchData": {
                "startSpeed": 87.8,
                "endSpeed": 80.4,
                "strikeZoneTop": 3.34764775061222,
                "strikeZoneBottom": 1.60012338062716,
                "coordinates": {
                  "aY": 27.338191698738942,
                  "aZ": -28.392557456959945,
                  "pfxX": -0.13595072249764106,
                  "pfxZ": 2.288702103772996,
                  "pX": 0.8280764367735977,
                  "pZ": 2.5349376762840032,
                  "vX0": -3.3821520981232966,
                  "vY0": -127.88916552298849,
                  "vZ0": -2.7474219892128358,
                  "x": 85.44,
                  "y": 170.34,
                  "x0": 2.187447481390129,
                  "y0": 50.0011876205182,
                  "z0": 5.859208049918777,
                  "aX": -0.22335911981904402
                },
                "breaks": {
                  "breakAngle": 1.2,
                  "breakLength": 7.2,
                  "breakY": 24.0,
                  "spinRate": 2081,
                  "spinDirection": 156
                },
                "zone": 6,
                "typeConfidence": 0.91,
                "plateTime": 0.42892795306792575,
                "extension": 6.038305950305256
              },
              "index": 1,
              "playId": "2703f940-09ed-47ba-ab6c-9cd6cf1b75c0",
              "pitchNumber": 2,
              "startTime": "2022-11-02T00:27:47.373Z",
              "endTime": "2022-11-02T00:27:50.468Z",
              "isPitch": true,
              "type": "pitch"
            },
            {
              "details": {
                "call": { "code": "X", "description": "In play, out(s)" },
                "description": "In play, out(s)",
                "code": "X",
                "ballColor": "rgba(26, 86, 190, 1.0)",
                "trailColor": "rgba(0, 85, 254, 1.0)",
                "isInPlay": true,
                "isStrike": false,
                "isBall": false,
                "type": { "code": "CH", "description": "Changeup" },
                "isOut": true,
                "hasReview": false
              },
              "count": { "balls": 1, "strikes": 1, "outs": 0 },
              "pitchData": {
                "startSpeed": 85.0,
                "endSpeed": 77.3,
                "strikeZoneTop": 3.16,
                "strikeZoneBottom": 1.51,
                "coordinates": {
                  "aY": 27.148761749917128,
                  "aZ": -27.434589580303477,
                  "pfxX": 9.157659997469297,
                  "pfxZ": 3.097892855808454,
                  "pX": 0.5104042809308545,
                  "pZ": 1.8985828098312154,
                  "vX0": -6.605714710578473,
                  "vY0": -123.57808235107579,
                  "vZ0": -3.5624815603826594,
                  "x": 97.54,
                  "y": 187.52,
                  "x0": 2.0429579501094137,
                  "y0": 50.00360660665535,
                  "z0": 5.691516414106547,
                  "aX": 14.009399715717159
                },
                "breaks": {
                  "breakAngle": 24.0,
                  "breakLength": 8.4,
                  "breakY": 24.0,
                  "spinRate": 1468,
                  "spinDirection": 121
                },
                "zone": 9,
                "typeConfidence": 0.89,
                "plateTime": 0.44510437361568833,
                "extension": 6.341767362615478
              },
              "hitData": {
                "launchSpeed": 78.7,
                "launchAngle": -15.0,
                "totalDistance": 9.0,
                "trajectory": "ground_ball",
                "hardness": "medium",
                "location": "5",
                "coordinates": { "coordX": 98.79, "coordY": 163.75 }
              },
              "index": 2,
              "playId": "c1c2aa6a-2284-42a9-9450-d71a1e4ec268",
              "pitchNumber": 3,
              "startTime": "2022-11-02T00:28:00.644Z",
              "endTime": "2022-11-02T00:28:08.210Z",
              "isPitch": true,
              "type": "pitch"
            }
          ],
          "playEndTime": "2022-11-02T00:28:08.210Z",
          "atBatIndex": 8
        },
        {
          "result": {
            "type": "atBat",
            "event": "Groundout",
            "eventType": "field_out",
            "description": "Kyle Tucker grounds out, shortstop Bryson Stott to first baseman Rhys Hoskins.",
            "rbi": 0,
            "awayScore": 0,
            "homeScore": 2,
            "isOut": true
          },
          "about": {
            "atBatIndex": 9,
            "halfInning": "top",
            "isTopInning": true,
            "inning": 2,
            "startTime": "2022-11-02T00:28:22.820Z",
            "endTime": "2022-11-02T00:29:51.109Z",
            "isComplete": true,
            "isScoringPlay": false,
            "hasReview": false,
            "hasOut": true,
            "captivatingIndex": 0
          },
          "count": { "balls": 1, "strikes": 2, "outs": 2 },
          "matchup": {
            "batter": {
              "id": 663656,
              "fullName": "Kyle Tucker",
              "link": "/api/v1/people/663656"
            },
            "batSide": { "code": "L", "description": "Left" },
            "pitcher": {
              "id": 624133,
              "fullName": "Ranger Suarez",
              "link": "/api/v1/people/624133"
            },
            "pitchHand": { "code": "L", "description": "Left" },
            "batterHotColdZones": [],
            "pitcherHotColdZones": [],
            "splits": {
              "batter": "vs_LHP",
              "pitcher": "vs_LHB",
              "menOnBase": "Empty"
            }
          },
          "pitchIndex": [0, 1, 2, 3],
          "actionIndex": [],
          "runnerIndex": [0],
          "runners": [
            {
              "movement": {
                "originBase": null,
                "start": null,
                "end": null,
                "outBase": "1B",
                "isOut": true,
                "outNumber": 2
              },
              "details": {
                "event": "Groundout",
                "eventType": "field_out",
                "movementReason": null,
                "runner": {
                  "id": 663656,
                  "fullName": "Kyle Tucker",
                  "link": "/api/v1/people/663656"
                },
                "responsiblePitcher": null,
                "isScoringEvent": false,
                "rbi": false,
                "earned": false,
                "teamUnearned": false,
                "playIndex": 3
              },
              "credits": [
                {
                  "player": { "id": 681082, "link": "/api/v1/people/681082" },
                  "position": {
                    "code": "6",
                    "name": "Shortstop",
                    "type": "Infielder",
                    "abbreviation": "SS"
                  },
                  "credit": "f_assist"
                },
                {
                  "player": { "id": 656555, "link": "/api/v1/people/656555" },
                  "position": {
                    "code": "3",
                    "name": "First Base",
                    "type": "Infielder",
                    "abbreviation": "1B"
                  },
                  "credit": "f_putout"
                }
              ]
            }
          ],
          "playEvents": [
            {
              "details": {
                "call": { "code": "B", "description": "Ball" },
                "description": "Ball",
                "code": "B",
                "ballColor": "rgba(39, 161, 39, 1.0)",
                "trailColor": "rgba(50, 0, 221, 1.0)",
                "isInPlay": false,
                "isStrike": false,
                "isBall": true,
                "type": { "code": "SI", "description": "Sinker" },
                "isOut": false,
                "hasReview": false
              },
              "count": { "balls": 1, "strikes": 0, "outs": 1 },
              "pitchData": {
                "startSpeed": 95.2,
                "endSpeed": 86.8,
                "strikeZoneTop": 3.6055031722719,
                "strikeZoneBottom": 1.67804021909878,
                "coordinates": {
                  "aY": 31.704175885614653,
                  "aZ": -26.784298901311086,
                  "pfxX": 10.50300092372845,
                  "pfxZ": 2.803346486623341,
                  "pX": -1.1059889682870823,
                  "pZ": 2.1579588629021713,
                  "vX0": -11.760769117092732,
                  "vY0": -138.0839444167551,
                  "vZ0": -4.704076974270618,
                  "x": 159.16,
                  "y": 180.52,
                  "x0": 1.8505497576000103,
                  "y0": 50.00537547177495,
                  "z0": 5.693114886114784,
                  "aX": 20.21774463451269
                },
                "breaks": {
                  "breakAngle": 32.4,
                  "breakLength": 7.2,
                  "breakY": 24.0,
                  "spinRate": 1975,
                  "spinDirection": 128
                },
                "zone": 13,
                "typeConfidence": 0.92,
                "plateTime": 0.3971691902816801,
                "extension": 6.078109491875541
              },
              "index": 0,
              "playId": "49e3155d-cf7c-4f69-9bc2-b094ed0873c3",
              "pitchNumber": 1,
              "startTime": "2022-11-02T00:28:47.864Z",
              "endTime": "2022-11-02T00:28:51.457Z",
              "isPitch": true,
              "type": "pitch"
            },
            {
              "details": {
                "call": { "code": "C", "description": "Called Strike" },
                "description": "Called Strike",
                "code": "C",
                "ballColor": "rgba(170, 21, 11, 1.0)",
                "trailColor": "rgba(50, 0, 221, 1.0)",
                "isInPlay": false,
                "isStrike": true,
                "isBall": false,
                "type": { "code": "SI", "description": "Sinker" },
                "isOut": false,
                "hasReview": false
              },
              "count": { "balls": 1, "strikes": 1, "outs": 1 },
              "pitchData": {
                "startSpeed": 95.2,
                "endSpeed": 86.7,
                "strikeZoneTop": 3.57973580581409,
                "strikeZoneBottom": 1.67804021909878,
                "coordinates": {
                  "aY": 32.390897436210594,
                  "aZ": -23.85991793460175,
                  "pfxX": 10.248359971946371,
                  "pfxZ": 4.3225393063768,
                  "pX": -0.38220480176922134,
                  "pZ": 1.5723766488551263,
                  "vX0": -9.765150231201082,
                  "vY0": -138.16942153522317,
                  "vZ0": -6.5537233330239495,
                  "x": 131.57,
                  "y": 196.33,
                  "x0": 1.8759359768907629,
                  "y0": 50.002144477683366,
                  "z0": 5.591525624097687,
                  "aX": 19.704300970989028
                },
                "breaks": {
                  "breakAngle": 34.8,
                  "breakLength": 6.0,
                  "breakY": 24.0,
                  "spinRate": 2123,
                  "spinDirection": 131
                },
                "zone": 7,
                "typeConfidence": 0.92,
                "plateTime": 0.3972723410597143,
                "extension": 5.954382803926491
              },
              "index": 1,
              "playId": "863e77fb-073e-4769-b657-c5825ba3b2b3",
              "pitchNumber": 2,
              "startTime": "2022-11-02T00:29:04.041Z",
              "endTime": "2022-11-02T00:29:07.411Z",
              "isPitch": true,
              "type": "pitch"
            },
            {
              "details": {
                "call": { "code": "C", "description": "Called Strike" },
                "description": "Called Strike",
                "code": "C",
                "ballColor": "rgba(170, 21, 11, 1.0)",
                "trailColor": "rgba(50, 0, 221, 1.0)",
                "isInPlay": false,
                "isStrike": true,
                "isBall": false,
                "type": { "code": "SI", "description": "Sinker" },
                "isOut": false,
                "hasReview": false
              },
              "count": { "balls": 1, "strikes": 2, "outs": 1 },
              "pitchData": {
                "startSpeed": 95.6,
                "endSpeed": 87.2,
                "strikeZoneTop": 3.59262000347399,
                "strikeZoneBottom": 1.66505569834992,
                "coordinates": {
                  "aY": 32.00486650959987,
                  "aZ": -23.641728099281046,
                  "pfxX": 10.791403455130173,
                  "pfxZ": 4.394305299817175,
                  "pX": -0.7887953024734735,
                  "pZ": 1.7929124565009253,
                  "vX0": -11.13209276724475,
                  "vY0": -138.67832741249893,
                  "vZ0": -6.138924985024466,
                  "x": 147.07,
                  "y": 190.37,
                  "x0": 1.881962885064686,
                  "y0": 50.00224591194793,
                  "z0": 5.620043251771702,
                  "aX": 20.94712318078634
                },
                "breaks": {
                  "breakAngle": 36.0,
                  "breakLength": 6.0,
                  "breakY": 24.0,
                  "spinRate": 2148,
                  "spinDirection": 130
                },
                "zone": 7,
                "typeConfidence": 0.92,
                "plateTime": 0.39549367875697206,
                "extension": 6.100246371518646
              },
              "index": 2,
              "playId": "de21158b-780f-447e-b9d2-2d313b188a21",
              "pitchNumber": 3,
              "startTime": "2022-11-02T00:29:23.938Z",
              "endTime": "2022-11-02T00:29:27.288Z",
              "isPitch": true,
              "type": "pitch"
            },
            {
              "details": {
                "call": { "code": "X", "description": "In play, out(s)" },
                "description": "In play, out(s)",
                "code": "X",
                "ballColor": "rgba(26, 86, 190, 1.0)",
                "trailColor": "rgba(50, 0, 221, 1.0)",
                "isInPlay": true,
                "isStrike": false,
                "isBall": false,
                "type": { "code": "SI", "description": "Sinker" },
                "isOut": true,
                "hasReview": false
              },
              "count": { "balls": 1, "strikes": 2, "outs": 1 },
              "pitchData": {
                "startSpeed": 94.8,
                "endSpeed": 86.4,
                "strikeZoneTop": 3.64,
                "strikeZoneBottom": 1.74,
                "coordinates": {
                  "aY": 32.12033476538718,
                  "aZ": -26.43339978939176,
                  "pfxX": 9.950820171379966,
                  "pfxZ": 3.0017591291573655,
                  "pX": 0.7088996699447165,
                  "pZ": 2.5219385488981403,
                  "vX0": -6.893828745975464,
                  "vY0": -137.81250403576956,
                  "vZ0": -3.893379865151958,
                  "x": 89.98,
                  "y": 170.69,
                  "x0": 1.9565899990911213,
                  "y0": 50.005452208628185,
                  "z0": 5.749526891027499,
                  "aX": 19.043447163737248
                },
                "breaks": {
                  "breakAngle": 32.4,
                  "breakLength": 7.2,
                  "breakY": 24.0,
                  "spinRate": 2118,
                  "spinDirection": 133
                },
                "zone": 6,
                "typeConfidence": 0.92,
                "plateTime": 0.39824273549864486,
                "extension": 6.025146683583018
              },
              "hitData": {
                "launchSpeed": 84.8,
                "launchAngle": -9.0,
                "totalDistance": 15.0,
                "trajectory": "ground_ball",
                "hardness": "medium",
                "location": "6",
                "coordinates": { "coordX": 143.91, "coordY": 146.0 }
              },
              "index": 3,
              "playId": "873fe70e-834f-477d-a003-ab9662b00512",
              "pitchNumber": 4,
              "startTime": "2022-11-02T00:29:43.696Z",
              "endTime": "2022-11-02T00:29:51.109Z",
              "isPitch": true,
              "type": "pitch"
            }
          ],
          "playEndTime": "2022-11-02T00:29:51.109Z",
          "atBatIndex": 9
        },
        {
          "result": {
            "type": "atBat",
            "event": "Single",
            "eventType": "single",
            "description": "Yuli Gurriel singles on a soft ground ball to third baseman Alec Bohm.",
            "rbi": 0,
            "awayScore": 0,
            "homeScore": 2,
            "isOut": false
          },
          "about": {
            "atBatIndex": 10,
            "halfInning": "top",
            "isTopInning": true,
            "inning": 2,
            "startTime": "2022-11-02T00:30:01.642Z",
            "endTime": "2022-11-02T00:31:33.265Z",
            "isComplete": true,
            "isScoringPlay": false,
            "hasReview": false,
            "hasOut": false,
            "captivatingIndex": 33
          },
          "count": { "balls": 2, "strikes": 2, "outs": 2 },
          "matchup": {
            "batter": {
              "id": 493329,
              "fullName": "Yuli Gurriel",
              "link": "/api/v1/people/493329"
            },
            "batSide": { "code": "R", "description": "Right" },
            "pitcher": {
              "id": 624133,
              "fullName": "Ranger Suarez",
              "link": "/api/v1/people/624133"
            },
            "pitchHand": { "code": "L", "description": "Left" },
            "postOnFirst": {
              "id": 493329,
              "fullName": "Yuli Gurriel",
              "link": "/api/v1/people/493329"
            },
            "batterHotColdZones": [],
            "pitcherHotColdZones": [],
            "splits": {
              "batter": "vs_LHP",
              "pitcher": "vs_RHB",
              "menOnBase": "Men_On"
            }
          },
          "pitchIndex": [0, 1, 2, 3, 4],
          "actionIndex": [],
          "runnerIndex": [0],
          "runners": [
            {
              "movement": {
                "originBase": null,
                "start": null,
                "end": "1B",
                "outBase": null,
                "isOut": false,
                "outNumber": null
              },
              "details": {
                "event": "Single",
                "eventType": "single",
                "movementReason": null,
                "runner": {
                  "id": 493329,
                  "fullName": "Yuli Gurriel",
                  "link": "/api/v1/people/493329"
                },
                "responsiblePitcher": null,
                "isScoringEvent": false,
                "rbi": false,
                "earned": false,
                "teamUnearned": false,
                "playIndex": 4
              },
              "credits": [
                {
                  "player": { "id": 664761, "link": "/api/v1/people/664761" },
                  "position": {
                    "code": "5",
                    "name": "Third Base",
                    "type": "Infielder",
                    "abbreviation": "3B"
                  },
                  "credit": "f_fielded_ball"
                }
              ]
            }
          ],
          "playEvents": [
            {
              "details": {
                "call": { "code": "F", "description": "Foul" },
                "description": "Foul",
                "code": "F",
                "ballColor": "rgba(170, 21, 11, 1.0)",
                "trailColor": "rgba(152, 0, 101, 1.0)",
                "isInPlay": false,
                "isStrike": true,
                "isBall": false,
                "type": { "code": "FC", "description": "Cutter" },
                "isOut": false,
                "hasReview": false
              },
              "count": { "balls": 0, "strikes": 1, "outs": 2 },
              "pitchData": {
                "startSpeed": 87.3,
                "endSpeed": 79.6,
                "strikeZoneTop": 3.39,
                "strikeZoneBottom": 1.64,
                "coordinates": {
                  "aY": 28.049015999128205,
                  "aZ": -29.477784666128056,
                  "pfxX": -1.749876835699097,
                  "pfxZ": 1.6605720238954333,
                  "pX": 0.4542635499842309,
                  "pZ": 2.6131729961724544,
                  "vX0": -3.5920759097693646,
                  "vY0": -127.05859769660319,
                  "vZ0": -2.300641126165411,
                  "x": 99.68,
                  "y": 168.22,
                  "x0": 2.118227556841272,
                  "y0": 50.00141147651699,
                  "z0": 5.8922523375792615,
                  "aX": -2.8362628580749205
                },
                "breaks": {
                  "breakAngle": 7.2,
                  "breakLength": 7.2,
                  "breakY": 24.0,
                  "spinRate": 2190,
                  "spinDirection": 184
                },
                "zone": 6,
                "typeConfidence": 0.89,
                "plateTime": 0.4324518800301176,
                "extension": 6.077900189831957
              },
              "index": 0,
              "playId": "90425c85-4fc0-40d7-a044-956d7c294fe5",
              "pitchNumber": 1,
              "startTime": "2022-11-02T00:30:20.000Z",
              "endTime": "2022-11-02T00:30:23.914Z",
              "isPitch": true,
              "type": "pitch"
            },
            {
              "details": {
                "call": { "code": "B", "description": "Ball" },
                "description": "Ball",
                "code": "B",
                "ballColor": "rgba(39, 161, 39, 1.0)",
                "trailColor": "rgba(0, 85, 254, 1.0)",
                "isInPlay": false,
                "isStrike": false,
                "isBall": true,
                "type": { "code": "CH", "description": "Changeup" },
                "isOut": false,
                "hasReview": false
              },
              "count": { "balls": 1, "strikes": 1, "outs": 2 },
              "pitchData": {
                "startSpeed": 87.1,
                "endSpeed": 79.6,
                "strikeZoneTop": 3.41214898057973,
                "strikeZoneBottom": 1.66505569834992,
                "coordinates": {
                  "aY": 27.487964306353895,
                  "aZ": -27.60732416034643,
                  "pfxX": 8.287164429138016,
                  "pfxZ": 2.834889576538533,
                  "pX": 1.4102728606344754,
                  "pZ": 1.0895841336313077,
                  "vX0": -4.690589624192539,
                  "vY0": -126.6185052811154,
                  "vZ0": -5.612606996684461,
                  "x": 63.24,
                  "y": 209.36,
                  "x0": 2.2165963688751145,
                  "y0": 50.004604934425544,
                  "z0": 5.562858322732793,
                  "aX": 13.366361502420434
                },
                "breaks": {
                  "breakAngle": 22.8,
                  "breakLength": 8.4,
                  "breakY": 24.0,
                  "spinRate": 1495,
                  "spinDirection": 118
                },
                "zone": 14,
                "typeConfidence": 0.61,
                "plateTime": 0.43370250215430284,
                "extension": 6.127217416407256
              },
              "index": 1,
              "playId": "fd8a2a88-2034-49ae-89df-b0a41d30d74b",
              "pitchNumber": 2,
              "startTime": "2022-11-02T00:30:34.136Z",
              "endTime": "2022-11-02T00:30:37.136Z",
              "isPitch": true,
              "type": "pitch"
            },
            {
              "details": {
                "call": { "code": "S", "description": "Swinging Strike" },
                "description": "Swinging Strike",
                "code": "S",
                "ballColor": "rgba(170, 21, 11, 1.0)",
                "trailColor": "rgba(0, 85, 254, 1.0)",
                "isInPlay": false,
                "isStrike": true,
                "isBall": false,
                "type": { "code": "CH", "description": "Changeup" },
                "isOut": false,
                "hasReview": false
              },
              "count": { "balls": 1, "strikes": 2, "outs": 2 },
              "pitchData": {
                "startSpeed": 85.7,
                "endSpeed": 78.1,
                "strikeZoneTop": 3.39,
                "strikeZoneBottom": 1.64,
                "coordinates": {
                  "aY": 26.80838813070192,
                  "aZ": -25.335109092193644,
                  "pfxX": 6.486092861212166,
                  "pfxZ": 4.37925752371696,
                  "pX": -0.019749272682717863,
                  "pZ": 2.0123539308852307,
                  "vX0": -6.69784508845988,
                  "vY0": -124.5929887094805,
                  "vZ0": -3.813590226579506,
                  "x": 117.75,
                  "y": 184.45,
                  "x0": 1.8703453247644817,
                  "y0": 50.00050913791632,
                  "z0": 5.674786563587459,
                  "aX": 10.119309859524268
                },
                "breaks": {
                  "breakAngle": 18.0,
                  "breakLength": 7.2,
                  "breakY": 24.0,
                  "spinRate": 1390,
                  "spinDirection": 116
                },
                "zone": 8,
                "typeConfidence": 0.88,
                "plateTime": 0.440897208261831,
                "extension": 6.034208118880632
              },
              "index": 2,
              "playId": "63d8c89b-32cf-4c2a-8566-8589734a8578",
              "pitchNumber": 3,
              "startTime": "2022-11-02T00:30:47.525Z",
              "endTime": "2022-11-02T00:30:50.525Z",
              "isPitch": true,
              "type": "pitch"
            },
            {
              "details": {
                "call": { "code": "B", "description": "Ball" },
                "description": "Ball",
                "code": "B",
                "ballColor": "rgba(39, 161, 39, 1.0)",
                "trailColor": "rgba(50, 0, 221, 1.0)",
                "isInPlay": false,
                "isStrike": false,
                "isBall": true,
                "type": { "code": "SI", "description": "Sinker" },
                "isOut": false,
                "hasReview": false
              },
              "count": { "balls": 2, "strikes": 2, "outs": 2 },
              "pitchData": {
                "startSpeed": 95.1,
                "endSpeed": 85.7,
                "strikeZoneTop": 3.43794258793256,
                "strikeZoneBottom": 1.71698983696302,
                "coordinates": {
                  "aY": 34.79135993610319,
                  "aZ": -26.14414014936075,
                  "pfxX": 9.814049737474814,
                  "pfxZ": 3.1714340547480706,
                  "pX": -0.9527262395164189,
                  "pZ": 3.2544785930942113,
                  "vX0": -10.680864171075042,
                  "vY0": -137.94878851610125,
                  "vZ0": -2.3500135938240714,
                  "x": 153.32,
                  "y": 150.91,
                  "x0": 1.7208997278978129,
                  "y0": 50.000355136902186,
                  "z0": 5.906319084352777,
                  "aX": 18.64191609813006
                },
                "breaks": {
                  "breakAngle": 31.2,
                  "breakLength": 7.2,
                  "breakY": 24.0,
                  "spinRate": 2051,
                  "spinDirection": 139
                },
                "zone": 11,
                "typeConfidence": 0.92,
                "plateTime": 0.3992502691951345,
                "extension": 6.080519090365778
              },
              "index": 3,
              "playId": "49691098-52df-4fc8-a6d5-955a3ee3f539",
              "pitchNumber": 4,
              "startTime": "2022-11-02T00:31:04.888Z",
              "endTime": "2022-11-02T00:31:08.231Z",
              "isPitch": true,
              "type": "pitch"
            },
            {
              "details": {
                "call": { "code": "D", "description": "In play, no out" },
                "description": "In play, no out",
                "code": "D",
                "ballColor": "rgba(26, 86, 190, 1.0)",
                "trailColor": "rgba(0, 34, 255, 1.0)",
                "isInPlay": true,
                "isStrike": false,
                "isBall": false,
                "type": { "code": "CU", "description": "Curveball" },
                "isOut": false,
                "hasReview": false
              },
              "count": { "balls": 2, "strikes": 2, "outs": 2 },
              "pitchData": {
                "startSpeed": 78.6,
                "endSpeed": 72.3,
                "strikeZoneTop": 3.39,
                "strikeZoneBottom": 1.64,
                "coordinates": {
                  "aY": 23.133893261581363,
                  "aZ": -37.17256910386039,
                  "pfxX": -5.878091705792035,
                  "pfxZ": -3.814010983131837,
                  "pX": -1.1313915586859864,
                  "pZ": 1.105479655910111,
                  "vX0": -5.172686579599502,
                  "vY0": -114.37494947346593,
                  "vZ0": -2.1529433047798294,
                  "x": 160.13,
                  "y": 208.93,
                  "x0": 1.9316916598814062,
                  "y0": 50.00228851868475,
                  "z0": 5.7401491482555365,
                  "aX": -7.705761880769683
                },
                "breaks": {
                  "breakAngle": 13.2,
                  "breakLength": 12.0,
                  "breakY": 24.0,
                  "spinRate": 2400,
                  "spinDirection": 304
                },
                "zone": 13,
                "typeConfidence": 0.85,
                "plateTime": 0.4808069440396383,
                "extension": 6.218821766353581
              },
              "hitData": {
                "launchSpeed": 64.9,
                "launchAngle": -57.0,
                "totalDistance": 6.0,
                "trajectory": "ground_ball",
                "hardness": "soft",
                "location": "5",
                "coordinates": { "coordX": 102.58, "coordY": 177.52 }
              },
              "index": 4,
              "playId": "35cf11d1-958f-4ce4-9ca2-f7653666fe58",
              "pitchNumber": 5,
              "startTime": "2022-11-02T00:31:24.795Z",
              "endTime": "2022-11-02T00:31:33.265Z",
              "isPitch": true,
              "type": "pitch"
            }
          ],
          "playEndTime": "2022-11-02T00:31:33.265Z",
          "atBatIndex": 10
        },
        {
          "result": {
            "type": "atBat",
            "event": "Single",
            "eventType": "single",
            "description": "David Hensley singles on a ground ball to center fielder Brandon Marsh.   Yuli Gurriel to 3rd.",
            "rbi": 0,
            "awayScore": 0,
            "homeScore": 2,
            "isOut": false
          },
          "about": {
            "atBatIndex": 11,
            "halfInning": "top",
            "isTopInning": true,
            "inning": 2,
            "startTime": "2022-11-02T00:31:56.009Z",
            "endTime": "2022-11-02T00:34:27.758Z",
            "isComplete": true,
            "isScoringPlay": false,
            "hasReview": false,
            "hasOut": false,
            "captivatingIndex": 33
          },
          "count": { "balls": 3, "strikes": 2, "outs": 2 },
          "matchup": {
            "batter": {
              "id": 682073,
              "fullName": "David Hensley",
              "link": "/api/v1/people/682073"
            },
            "batSide": { "code": "R", "description": "Right" },
            "pitcher": {
              "id": 624133,
              "fullName": "Ranger Suarez",
              "link": "/api/v1/people/624133"
            },
            "pitchHand": { "code": "L", "description": "Left" },
            "postOnFirst": {
              "id": 682073,
              "fullName": "David Hensley",
              "link": "/api/v1/people/682073"
            },
            "postOnThird": {
              "id": 493329,
              "fullName": "Yuli Gurriel",
              "link": "/api/v1/people/493329"
            },
            "batterHotColdZones": [],
            "pitcherHotColdZones": [],
            "splits": {
              "batter": "vs_LHP",
              "pitcher": "vs_RHB",
              "menOnBase": "RISP"
            }
          },
          "pitchIndex": [0, 1, 2, 3, 4, 5],
          "actionIndex": [],
          "runnerIndex": [0, 1, 2],
          "runners": [
            {
              "movement": {
                "originBase": null,
                "start": null,
                "end": "1B",
                "outBase": null,
                "isOut": false,
                "outNumber": null
              },
              "details": {
                "event": "Single",
                "eventType": "single",
                "movementReason": null,
                "runner": {
                  "id": 682073,
                  "fullName": "David Hensley",
                  "link": "/api/v1/people/682073"
                },
                "responsiblePitcher": null,
                "isScoringEvent": false,
                "rbi": false,
                "earned": false,
                "teamUnearned": false,
                "playIndex": 5
              },
              "credits": [
                {
                  "player": { "id": 669016, "link": "/api/v1/people/669016" },
                  "position": {
                    "code": "8",
                    "name": "Outfielder",
                    "type": "Outfielder",
                    "abbreviation": "CF"
                  },
                  "credit": "f_fielded_ball"
                }
              ]
            },
            {
              "movement": {
                "originBase": "1B",
                "start": "1B",
                "end": "2B",
                "outBase": null,
                "isOut": false,
                "outNumber": null
              },
              "details": {
                "event": "Single",
                "eventType": "single",
                "movementReason": "r_adv_force",
                "runner": {
                  "id": 493329,
                  "fullName": "Yuli Gurriel",
                  "link": "/api/v1/people/493329"
                },
                "responsiblePitcher": null,
                "isScoringEvent": false,
                "rbi": false,
                "earned": false,
                "teamUnearned": false,
                "playIndex": 5
              },
              "credits": []
            },
            {
              "movement": {
                "originBase": "1B",
                "start": "2B",
                "end": "3B",
                "outBase": null,
                "isOut": false,
                "outNumber": null
              },
              "details": {
                "event": "Single",
                "eventType": "single",
                "movementReason": "r_adv_play",
                "runner": {
                  "id": 493329,
                  "fullName": "Yuli Gurriel",
                  "link": "/api/v1/people/493329"
                },
                "responsiblePitcher": null,
                "isScoringEvent": false,
                "rbi": false,
                "earned": false,
                "teamUnearned": false,
                "playIndex": 5
              },
              "credits": []
            }
          ],
          "playEvents": [
            {
              "details": {
                "call": { "code": "C", "description": "Called Strike" },
                "description": "Called Strike",
                "code": "C",
                "ballColor": "rgba(170, 21, 11, 1.0)",
                "trailColor": "rgba(50, 0, 221, 1.0)",
                "isInPlay": false,
                "isStrike": true,
                "isBall": false,
                "type": { "code": "SI", "description": "Sinker" },
                "isOut": false,
                "hasReview": false
              },
              "count": { "balls": 0, "strikes": 1, "outs": 2 },
              "pitchData": {
                "startSpeed": 94.5,
                "endSpeed": 85.9,
                "strikeZoneTop": 3.54107706971731,
                "strikeZoneBottom": 1.7689133355097,
                "coordinates": {
                  "aY": 32.73081714807929,
                  "aZ": -23.05163253440543,
                  "pfxX": 10.566091644765914,
                  "pfxZ": 4.823996475445886,
                  "pX": 0.6105237307913044,
                  "pZ": 1.741002918632663,
                  "vX0": -7.462123603313265,
                  "vY0": -137.2101815201428,
                  "vZ0": -6.361833330361271,
                  "x": 93.73,
                  "y": 191.77,
                  "x0": 2.0041883773789917,
                  "y0": 50.00260399802658,
                  "z0": 5.679650144083038,
                  "aX": 19.977977447182713
                },
                "breaks": {
                  "breakAngle": 37.2,
                  "breakLength": 6.0,
                  "breakY": 24.0,
                  "spinRate": 2047,
                  "spinDirection": 133
                },
                "zone": 9,
                "typeConfidence": 0.92,
                "plateTime": 0.4004730488236543,
                "extension": 6.169715464970124
              },
              "index": 0,
              "playId": "bcf550d1-6177-4de0-b938-67e7bae5f0a0",
              "pitchNumber": 1,
              "startTime": "2022-11-02T00:32:10.666Z",
              "endTime": "2022-11-02T00:32:14.159Z",
              "isPitch": true,
              "type": "pitch"
            },
            {
              "details": {
                "call": { "code": "C", "description": "Called Strike" },
                "description": "Called Strike",
                "code": "C",
                "ballColor": "rgba(170, 21, 11, 1.0)",
                "trailColor": "rgba(0, 85, 254, 1.0)",
                "isInPlay": false,
                "isStrike": true,
                "isBall": false,
                "type": { "code": "CH", "description": "Changeup" },
                "isOut": false,
                "hasReview": false
              },
              "count": { "balls": 0, "strikes": 2, "outs": 2 },
              "pitchData": {
                "startSpeed": 87.0,
                "endSpeed": 79.3,
                "strikeZoneTop": 3.46373222475205,
                "strikeZoneBottom": 1.69102408462595,
                "coordinates": {
                  "aY": 27.357927442185026,
                  "aZ": -24.441785887905162,
                  "pfxX": 9.187812524699774,
                  "pfxZ": 4.8150458023277265,
                  "pX": -0.18825009232642267,
                  "pZ": 1.6361135860149643,
                  "vX0": -8.265319780413593,
                  "vY0": -126.32982707041894,
                  "vZ0": -4.879935468476087,
                  "x": 124.18,
                  "y": 194.6,
                  "x0": 1.9429296469670059,
                  "y0": 50.00061909536071,
                  "z0": 5.573982421353078,
                  "aX": 14.748452569822858
                },
                "breaks": {
                  "breakAngle": 27.6,
                  "breakLength": 7.2,
                  "breakY": 24.0,
                  "spinRate": 1587,
                  "spinDirection": 115
                },
                "zone": 8,
                "typeConfidence": 0.78,
                "plateTime": 0.4346841634738676,
                "extension": 6.13345908179857
              },
              "index": 1,
              "playId": "7b55f080-20ee-40c7-81a7-23e040e81e27",
              "pitchNumber": 2,
              "startTime": "2022-11-02T00:32:37.277Z",
              "endTime": "2022-11-02T00:32:40.789Z",
              "isPitch": true,
              "type": "pitch"
            },
            {
              "details": {
                "call": { "code": "B", "description": "Ball" },
                "description": "Ball",
                "code": "B",
                "ballColor": "rgba(39, 161, 39, 1.0)",
                "trailColor": "rgba(0, 85, 254, 1.0)",
                "isInPlay": false,
                "isStrike": false,
                "isBall": true,
                "type": { "code": "CH", "description": "Changeup" },
                "isOut": false,
                "hasReview": false
              },
              "count": { "balls": 1, "strikes": 2, "outs": 2 },
              "pitchData": {
                "startSpeed": 85.4,
                "endSpeed": 77.7,
                "strikeZoneTop": 3.51529948983676,
                "strikeZoneBottom": 1.66505569834992,
                "coordinates": {
                  "aY": 26.963069444162933,
                  "aZ": -27.54330146912787,
                  "pfxX": 8.109538845727572,
                  "pfxZ": 2.991211955392112,
                  "pX": 1.998946109742257,
                  "pZ": 2.9000910702658493,
                  "vX0": -2.9436125700997544,
                  "vY0": -124.26661839029782,
                  "vZ0": -1.0637867325470116,
                  "x": 40.8,
                  "y": 160.48,
                  "x0": 2.1511934463736906,
                  "y0": 50.00496978540403,
                  "z0": 5.640398141336149,
                  "aX": 12.572271372604689
                },
                "breaks": {
                  "breakAngle": 22.8,
                  "breakLength": 8.4,
                  "breakY": 24.0,
                  "spinRate": 1573,
                  "spinDirection": 120
                },
                "zone": 12,
                "typeConfidence": 0.88,
                "plateTime": 0.44225679716718336,
                "extension": 6.247561273581782
              },
              "index": 2,
              "playId": "cfd3e6c5-bee6-491e-abf3-820865448f98",
              "pitchNumber": 3,
              "startTime": "2022-11-02T00:33:00.002Z",
              "endTime": "2022-11-02T00:33:05.541Z",
              "isPitch": true,
              "type": "pitch"
            },
            {
              "details": {
                "call": { "code": "B", "description": "Ball" },
                "description": "Ball",
                "code": "B",
                "ballColor": "rgba(39, 161, 39, 1.0)",
                "trailColor": "rgba(50, 0, 221, 1.0)",
                "isInPlay": false,
                "isStrike": false,
                "isBall": true,
                "type": { "code": "SI", "description": "Sinker" },
                "isOut": false,
                "hasReview": false
              },
              "count": { "balls": 2, "strikes": 2, "outs": 2 },
              "pitchData": {
                "startSpeed": 95.7,
                "endSpeed": 86.6,
                "strikeZoneTop": 3.46373222475205,
                "strikeZoneBottom": 1.69102408462595,
                "coordinates": {
                  "aY": 33.89043576105731,
                  "aZ": -22.71332915556798,
                  "pfxX": 11.484111302981539,
                  "pfxZ": 4.926808931894398,
                  "pX": -2.34214561574497,
                  "pZ": 1.6907542122365251,
                  "vX0": -14.87549135000354,
                  "vY0": -138.40211457114955,
                  "vZ0": -6.829407800102518,
                  "x": 206.28,
                  "y": 193.13,
                  "x0": 1.6365075832655511,
                  "y0": 50.00099651211747,
                  "z0": 5.735513961528325,
                  "aX": 22.04554630415058
                },
                "breaks": {
                  "breakAngle": 37.2,
                  "breakLength": 6.0,
                  "breakY": 24.0,
                  "spinRate": 2077,
                  "spinDirection": 134
                },
                "zone": 13,
                "typeConfidence": 0.92,
                "plateTime": 0.3973306436002826,
                "extension": 6.2425852104162605
              },
              "index": 3,
              "playId": "37a503cc-c047-4b25-aeb1-1e05f31ce748",
              "pitchNumber": 4,
              "startTime": "2022-11-02T00:33:25.504Z",
              "endTime": "2022-11-02T00:33:29.294Z",
              "isPitch": true,
              "type": "pitch"
            },
            {
              "details": {
                "call": { "code": "*B", "description": "Ball In Dirt" },
                "description": "Ball In Dirt",
                "code": "*B",
                "ballColor": "rgba(39, 161, 39, 1.0)",
                "trailColor": "rgba(0, 85, 254, 1.0)",
                "isInPlay": false,
                "isStrike": false,
                "isBall": true,
                "type": { "code": "CH", "description": "Changeup" },
                "isOut": false,
                "hasReview": false
              },
              "count": { "balls": 3, "strikes": 2, "outs": 2 },
              "pitchData": {
                "startSpeed": 88.3,
                "endSpeed": 80.1,
                "strikeZoneTop": 3.43794258793256,
                "strikeZoneBottom": 1.66505569834992,
                "coordinates": {
                  "aY": 30.076110284127157,
                  "aZ": -26.651476945623603,
                  "pfxX": 8.963370757530274,
                  "pfxZ": 3.3801599112287244,
                  "pX": -0.07133846552976199,
                  "pZ": 0.1655925529532492,
                  "vX0": -8.034978509910584,
                  "vY0": -127.98783492530549,
                  "vZ0": -8.045355679500029,
                  "x": 119.72,
                  "y": 234.31,
                  "x0": 1.9669735555299197,
                  "y0": 50.003115359873476,
                  "z0": 5.482908607585238,
                  "aX": 14.649921349899792
                },
                "breaks": {
                  "breakAngle": 24.0,
                  "breakLength": 7.2,
                  "breakY": 24.0,
                  "spinRate": 1628,
                  "spinDirection": 122
                },
                "zone": 13,
                "typeConfidence": 2.0,
                "plateTime": 0.43040045970634466,
                "extension": 6.056346268075847
              },
              "index": 4,
              "playId": "34fcfc52-8148-4f6e-88b4-d6809ed74c52",
              "pitchNumber": 5,
              "startTime": "2022-11-02T00:33:51.104Z",
              "endTime": "2022-11-02T00:33:54.104Z",
              "isPitch": true,
              "type": "pitch"
            },
            {
              "details": {
                "call": { "code": "D", "description": "In play, no out" },
                "description": "In play, no out",
                "code": "D",
                "ballColor": "rgba(26, 86, 190, 1.0)",
                "trailColor": "rgba(0, 85, 254, 1.0)",
                "isInPlay": true,
                "isStrike": false,
                "isBall": false,
                "type": { "code": "CH", "description": "Changeup" },
                "isOut": false,
                "hasReview": false,
                "runnerGoing": true
              },
              "count": { "balls": 3, "strikes": 2, "outs": 2 },
              "pitchData": {
                "startSpeed": 84.7,
                "endSpeed": 77.7,
                "strikeZoneTop": 3.4,
                "strikeZoneBottom": 1.64,
                "coordinates": {
                  "aY": 24.96582866474624,
                  "aZ": -29.96422021710513,
                  "pfxX": 7.212239900414731,
                  "pfxZ": 1.4393354456721061,
                  "pX": 0.4664292843447433,
                  "pZ": 1.7938502895996842,
                  "vX0": -6.2249385342058545,
                  "vY0": -123.14210728494396,
                  "vZ0": -3.123117134238324,
                  "x": 99.22,
                  "y": 190.35,
                  "x0": 2.092785254601791,
                  "y0": 50.00164369105653,
                  "z0": 5.619482247469497,
                  "aX": 11.051243363702369
                },
                "breaks": {
                  "breakAngle": 18.0,
                  "breakLength": 8.4,
                  "breakY": 24.0,
                  "spinRate": 1381,
                  "spinDirection": 116
                },
                "zone": 9,
                "typeConfidence": 0.89,
                "plateTime": 0.44518804947316504,
                "extension": 6.251284415159399
              },
              "hitData": {
                "launchSpeed": 103.8,
                "launchAngle": -1.0,
                "totalDistance": 40.0,
                "trajectory": "ground_ball",
                "hardness": "medium",
                "location": "8",
                "coordinates": { "coordX": 123.91, "coordY": 90.78 }
              },
              "index": 5,
              "playId": "ffc38158-8d73-4fea-99a5-5dc7a8e2da1b",
              "pitchNumber": 6,
              "startTime": "2022-11-02T00:34:15.718Z",
              "endTime": "2022-11-02T00:34:27.758Z",
              "isPitch": true,
              "type": "pitch"
            }
          ],
          "playEndTime": "2022-11-02T00:34:27.758Z",
          "atBatIndex": 11
        },
        {
          "result": {
            "type": "atBat",
            "event": "Strikeout",
            "eventType": "strikeout",
            "description": "Chas McCormick called out on strikes.",
            "rbi": 0,
            "awayScore": 0,
            "homeScore": 2,
            "isOut": true
          },
          "about": {
            "atBatIndex": 12,
            "halfInning": "top",
            "isTopInning": true,
            "inning": 2,
            "startTime": "2022-11-02T00:35:33.719Z",
            "endTime": "2022-11-02T00:37:19.991Z",
            "isComplete": true,
            "isScoringPlay": false,
            "hasReview": false,
            "hasOut": true,
            "captivatingIndex": 14
          },
          "count": { "balls": 2, "strikes": 3, "outs": 3 },
          "matchup": {
            "batter": {
              "id": 676801,
              "fullName": "Chas McCormick",
              "link": "/api/v1/people/676801"
            },
            "batSide": { "code": "R", "description": "Right" },
            "pitcher": {
              "id": 624133,
              "fullName": "Ranger Suarez",
              "link": "/api/v1/people/624133"
            },
            "pitchHand": { "code": "L", "description": "Left" },
            "batterHotColdZones": [],
            "pitcherHotColdZones": [],
            "splits": {
              "batter": "vs_LHP",
              "pitcher": "vs_RHB",
              "menOnBase": "Empty"
            }
          },
          "pitchIndex": [0, 1, 2, 3, 4, 5],
          "actionIndex": [],
          "runnerIndex": [0],
          "runners": [
            {
              "movement": {
                "originBase": null,
                "start": null,
                "end": null,
                "outBase": "1B",
                "isOut": true,
                "outNumber": 3
              },
              "details": {
                "event": "Strikeout",
                "eventType": "strikeout",
                "movementReason": null,
                "runner": {
                  "id": 676801,
                  "fullName": "Chas McCormick",
                  "link": "/api/v1/people/676801"
                },
                "responsiblePitcher": null,
                "isScoringEvent": false,
                "rbi": false,
                "earned": false,
                "teamUnearned": false,
                "playIndex": 5
              },
              "credits": [
                {
                  "player": { "id": 592663, "link": "/api/v1/people/592663" },
                  "position": {
                    "code": "2",
                    "name": "Catcher",
                    "type": "Catcher",
                    "abbreviation": "C"
                  },
                  "credit": "f_putout"
                }
              ]
            }
          ],
          "playEvents": [
            {
              "details": {
                "description": "Pickoff Attempt 1B",
                "code": "1",
                "isOut": false,
                "hasReview": false,
                "fromCatcher": false,
                "disengagementNum": 1
              },
              "count": { "balls": 0, "strikes": 0, "outs": 2 },
              "index": 0,
              "playId": "adc02201-ad52-44af-aa07-2e6091fe5fae",
              "startTime": "2022-11-02T00:35:13.484Z",
              "endTime": "2022-11-02T00:35:17.757Z",
              "isPitch": false,
              "type": "pickoff"
            },
            {
              "details": {
                "call": { "code": "B", "description": "Ball" },
                "description": "Ball",
                "code": "B",
                "ballColor": "rgba(39, 161, 39, 1.0)",
                "trailColor": "rgba(188, 0, 33, 1.0)",
                "isInPlay": false,
                "isStrike": false,
                "isBall": true,
                "type": { "code": "FF", "description": "Four-Seam Fastball" },
                "isOut": false,
                "hasReview": false,
                "disengagementNum": 1
              },
              "count": { "balls": 1, "strikes": 0, "outs": 2 },
              "pitchData": {
                "startSpeed": 94.8,
                "endSpeed": 86.5,
                "strikeZoneTop": 3.28312223727399,
                "strikeZoneBottom": 1.5871349971842,
                "coordinates": {
                  "aY": 30.949671094307785,
                  "aZ": -19.490784386877962,
                  "pfxX": 6.043668337084989,
                  "pfxZ": 6.603645488824947,
                  "pX": -0.49883081485387026,
                  "pZ": 3.624654801842343,
                  "vX0": -8.554729680363387,
                  "vY0": -137.7684066805913,
                  "vZ0": -2.4409206995987143,
                  "x": 136.01,
                  "y": 140.91,
                  "x0": 1.863021971657551,
                  "y0": 50.000395575036805,
                  "z0": 5.841280888149553,
                  "aX": 11.603382456356332
                },
                "breaks": {
                  "breakAngle": 26.4,
                  "breakLength": 4.8,
                  "breakY": 24.0,
                  "spinRate": 2143,
                  "spinDirection": 137
                },
                "zone": 11,
                "typeConfidence": 0.95,
                "plateTime": 0.39775724957610326,
                "extension": 6.143849463532153
              },
              "index": 1,
              "playId": "10952b4d-993d-4485-aa56-527bcded6f9d",
              "pitchNumber": 1,
              "startTime": "2022-11-02T00:35:35.917Z",
              "endTime": "2022-11-02T00:35:40.464Z",
              "isPitch": true,
              "type": "pitch"
            },
            {
              "details": {
                "call": { "code": "C", "description": "Called Strike" },
                "description": "Called Strike",
                "code": "C",
                "ballColor": "rgba(170, 21, 11, 1.0)",
                "trailColor": "rgba(152, 0, 101, 1.0)",
                "isInPlay": false,
                "isStrike": true,
                "isBall": false,
                "type": { "code": "FC", "description": "Cutter" },
                "isOut": false,
                "hasReview": false,
                "disengagementNum": 1
              },
              "count": { "balls": 1, "strikes": 1, "outs": 2 },
              "pitchData": {
                "startSpeed": 89.5,
                "endSpeed": 82.1,
                "strikeZoneTop": 3.28269659778966,
                "strikeZoneBottom": 1.60952811036437,
                "coordinates": {
                  "aY": 27.905304232564376,
                  "aZ": -30.0720703766468,
                  "pfxX": 0.24624431177196193,
                  "pfxZ": 1.2282905519635907,
                  "pX": -1.1082560250997524,
                  "pZ": 2.450520637622344,
                  "vX0": -7.6900690480234495,
                  "vY0": -130.099018712635,
                  "vZ0": -2.9732335882857077,
                  "x": 159.24,
                  "y": 172.62,
                  "x0": 1.856849823129639,
                  "y0": 50.0021031259181,
                  "z0": 5.893093817744982,
                  "aX": 0.4219403719145896
                },
                "breaks": {
                  "breakAngle": 2.4,
                  "breakLength": 7.2,
                  "breakY": 24.0,
                  "spinRate": 2163,
                  "spinDirection": 170
                },
                "zone": 11,
                "typeConfidence": 0.92,
                "plateTime": 0.421392853431914,
                "extension": 6.261322512760069
              },
              "index": 2,
              "playId": "6f2f2cf7-8c0d-4d94-8702-87a1aca9a530",
              "pitchNumber": 2,
              "startTime": "2022-11-02T00:35:57.021Z",
              "endTime": "2022-11-02T00:36:00.340Z",
              "isPitch": true,
              "type": "pitch"
            },
            {
              "details": {
                "call": { "code": "S", "description": "Swinging Strike" },
                "description": "Swinging Strike",
                "code": "S",
                "ballColor": "rgba(170, 21, 11, 1.0)",
                "trailColor": "rgba(188, 0, 33, 1.0)",
                "isInPlay": false,
                "isStrike": true,
                "isBall": false,
                "type": { "code": "FF", "description": "Four-Seam Fastball" },
                "isOut": false,
                "hasReview": false,
                "disengagementNum": 1
              },
              "count": { "balls": 1, "strikes": 2, "outs": 2 },
              "pitchData": {
                "startSpeed": 95.1,
                "endSpeed": 86.8,
                "strikeZoneTop": 3.21,
                "strikeZoneBottom": 1.54,
                "coordinates": {
                  "aY": 30.9322427695917,
                  "aZ": -17.482549228072767,
                  "pfxX": 5.685450181906521,
                  "pfxZ": 7.6087311253806575,
                  "pX": -0.7955012130709086,
                  "pZ": 3.0087725393321114,
                  "vX0": -9.485149457818528,
                  "vY0": -138.12051591674825,
                  "vZ0": -4.183310072104115,
                  "x": 147.32,
                  "y": 157.54,
                  "x0": 1.9453926847226324,
                  "y0": 50.00476266923308,
                  "z0": 5.71968630612442,
                  "aX": 10.981239382512074
                },
                "breaks": {
                  "breakAngle": 26.4,
                  "breakLength": 4.8,
                  "breakY": 24.0,
                  "spinRate": 2138,
                  "spinDirection": 133
                },
                "zone": 1,
                "typeConfidence": 0.97,
                "plateTime": 0.3966590877749039,
                "extension": 6.261177552097849
              },
              "index": 3,
              "playId": "8a4960f5-d7ac-4ec9-81a7-7c3a4aec7b1c",
              "pitchNumber": 3,
              "startTime": "2022-11-02T00:36:24.164Z",
              "endTime": "2022-11-02T00:36:27.361Z",
              "isPitch": true,
              "type": "pitch"
            },
            {
              "details": {
                "call": { "code": "B", "description": "Ball" },
                "description": "Ball",
                "code": "B",
                "ballColor": "rgba(39, 161, 39, 1.0)",
                "trailColor": "rgba(188, 0, 33, 1.0)",
                "isInPlay": false,
                "isStrike": false,
                "isBall": true,
                "type": { "code": "FF", "description": "Four-Seam Fastball" },
                "isOut": false,
                "hasReview": false,
                "disengagementNum": 1
              },
              "count": { "balls": 2, "strikes": 2, "outs": 2 },
              "pitchData": {
                "startSpeed": 95.0,
                "endSpeed": 86.4,
                "strikeZoneTop": 3.25730531812071,
                "strikeZoneBottom": 1.53738978984294,
                "coordinates": {
                  "aY": 31.97787372680628,
                  "aZ": -18.652198820416494,
                  "pfxX": 6.407633485624375,
                  "pfxZ": 7.041202145072269,
                  "pX": -0.45996534258039506,
                  "pZ": 3.5829595799196863,
                  "vX0": -9.042900147110592,
                  "vY0": -138.02487259579075,
                  "vZ0": -2.45471947277292,
                  "x": 134.53,
                  "y": 142.04,
                  "x0": 2.032990568675544,
                  "y0": 50.00539803661824,
                  "z0": 5.746108454360017,
                  "aX": 12.3110282237973
                },
                "breaks": {
                  "breakAngle": 27.6,
                  "breakLength": 4.8,
                  "breakY": 24.0,
                  "spinRate": 2040,
                  "spinDirection": 129
                },
                "zone": 11,
                "typeConfidence": 0.93,
                "plateTime": 0.3974889851861301,
                "extension": 6.01445379048313
              },
              "index": 4,
              "playId": "75104d67-f3e2-45b0-a830-d9a16bed06b2",
              "pitchNumber": 4,
              "startTime": "2022-11-02T00:36:51.574Z",
              "endTime": "2022-11-02T00:36:55.684Z",
              "isPitch": true,
              "type": "pitch"
            },
            {
              "details": {
                "call": { "code": "C", "description": "Called Strike" },
                "description": "Called Strike",
                "code": "C",
                "ballColor": "rgba(170, 21, 11, 1.0)",
                "trailColor": "rgba(50, 0, 221, 1.0)",
                "isInPlay": false,
                "isStrike": true,
                "isBall": false,
                "type": { "code": "SI", "description": "Sinker" },
                "isOut": true,
                "hasReview": false
              },
              "count": { "balls": 2, "strikes": 3, "outs": 2 },
              "pitchData": {
                "startSpeed": 95.1,
                "endSpeed": 86.6,
                "strikeZoneTop": 3.25246500997336,
                "strikeZoneBottom": 1.61333545957376,
                "coordinates": {
                  "aY": 32.2977466753679,
                  "aZ": -25.33354318885764,
                  "pfxX": 10.920334406735345,
                  "pfxZ": 3.567076327753795,
                  "pX": -1.0052470582218653,
                  "pZ": 2.0791797180937857,
                  "vX0": -11.314503877090974,
                  "vY0": -137.97768813193017,
                  "vZ0": -5.360866070235451,
                  "x": 155.32,
                  "y": 182.64,
                  "x0": 1.74076954754011,
                  "y0": 50.001437130392205,
                  "z0": 5.766769771994691,
                  "aX": 20.936894583996434
                },
                "breaks": {
                  "breakAngle": 34.8,
                  "breakLength": 7.2,
                  "breakY": 24.0,
                  "spinRate": 2087,
                  "spinDirection": 135
                },
                "zone": 13,
                "typeConfidence": 0.92,
                "plateTime": 0.39781618970235266,
                "extension": 6.2619251844718296
              },
              "index": 5,
              "playId": "15842c0d-f4d3-4b9a-a98d-f70f19c8c96c",
              "pitchNumber": 5,
              "startTime": "2022-11-02T00:37:13.539Z",
              "endTime": "2022-11-02T00:37:19.991Z",
              "isPitch": true,
              "type": "pitch"
            }
          ],
          "playEndTime": "2022-11-02T00:37:19.991Z",
          "atBatIndex": 12
        },
        {
          "result": {
            "type": "atBat",
            "event": "Home Run",
            "eventType": "home_run",
            "description": "Alec Bohm homers (1) on a line drive to left center field.",
            "rbi": 1,
            "awayScore": 0,
            "homeScore": 3,
            "isOut": false
          },
          "about": {
            "atBatIndex": 13,
            "halfInning": "bottom",
            "isTopInning": false,
            "inning": 2,
            "startTime": "2022-11-02T00:40:14.061Z",
            "endTime": "2022-11-02T00:40:56.347Z",
            "isComplete": true,
            "isScoringPlay": true,
            "hasReview": false,
            "hasOut": false,
            "captivatingIndex": 75
          },
          "count": { "balls": 0, "strikes": 0, "outs": 0 },
          "matchup": {
            "batter": {
              "id": 664761,
              "fullName": "Alec Bohm",
              "link": "/api/v1/people/664761"
            },
            "batSide": { "code": "R", "description": "Right" },
            "pitcher": {
              "id": 621121,
              "fullName": "Lance McCullers Jr.",
              "link": "/api/v1/people/621121"
            },
            "pitchHand": { "code": "R", "description": "Right" },
            "batterHotColdZones": [],
            "pitcherHotColdZones": [],
            "splits": {
              "batter": "vs_RHP",
              "pitcher": "vs_RHB",
              "menOnBase": "Empty"
            }
          },
          "pitchIndex": [0],
          "actionIndex": [],
          "runnerIndex": [0],
          "runners": [
            {
              "movement": {
                "originBase": null,
                "start": null,
                "end": "score",
                "outBase": null,
                "isOut": false,
                "outNumber": null
              },
              "details": {
                "event": "Home Run",
                "eventType": "home_run",
                "movementReason": null,
                "runner": {
                  "id": 664761,
                  "fullName": "Alec Bohm",
                  "link": "/api/v1/people/664761"
                },
                "responsiblePitcher": {
                  "id": 621121,
                  "link": "/api/v1/people/621121"
                },
                "isScoringEvent": true,
                "rbi": true,
                "earned": true,
                "teamUnearned": false,
                "playIndex": 0
              },
              "credits": []
            }
          ],
          "playEvents": [
            {
              "details": {
                "call": { "code": "E", "description": "In play, run(s)" },
                "description": "In play, run(s)",
                "code": "E",
                "ballColor": "rgba(26, 86, 190, 1.0)",
                "trailColor": "rgba(50, 0, 221, 1.0)",
                "isInPlay": true,
                "isStrike": false,
                "isBall": false,
                "type": { "code": "SI", "description": "Sinker" },
                "isOut": false,
                "hasReview": false
              },
              "count": { "balls": 0, "strikes": 0, "outs": 0 },
              "pitchData": {
                "startSpeed": 93.2,
                "endSpeed": 85.7,
                "strikeZoneTop": 3.46,
                "strikeZoneBottom": 1.55,
                "coordinates": {
                  "aY": 28.63985106620659,
                  "aZ": -29.864973097057074,
                  "pfxX": -10.47920621624578,
                  "pfxZ": 1.23469024788632,
                  "pX": -0.5441021617828773,
                  "pZ": 2.4391278001711623,
                  "vX0": 5.598272433076951,
                  "vY0": -135.6726688041637,
                  "vZ0": -1.900924291285397,
                  "x": 137.74,
                  "y": 172.92,
                  "x0": -1.268657725350187,
                  "y0": 50.00379704804346,
                  "z0": 5.222698609125795,
                  "aX": -19.610005417356014
                },
                "breaks": {
                  "breakAngle": 31.2,
                  "breakLength": 7.2,
                  "breakY": 24.0,
                  "spinRate": 2090,
                  "spinDirection": 242
                },
                "zone": 4,
                "typeConfidence": 0.9,
                "plateTime": 0.40314257589118796,
                "extension": 5.767079417282829
              },
              "hitData": {
                "launchSpeed": 109.2,
                "launchAngle": 17.0,
                "totalDistance": 373.0,
                "trajectory": "line_drive",
                "hardness": "medium",
                "location": "78",
                "coordinates": { "coordX": 51.84, "coordY": 67.63 }
              },
              "index": 0,
              "playId": "c10eb3bb-1daa-4446-8d2b-413c0053ec2c",
              "pitchNumber": 1,
              "startTime": "2022-11-02T00:40:32.739Z",
              "endTime": "2022-11-02T00:40:56.347Z",
              "isPitch": true,
              "type": "pitch"
            }
          ],
          "playEndTime": "2022-11-02T00:40:56.347Z",
          "atBatIndex": 13
        },
        {
          "result": {
            "type": "atBat",
            "event": "Strikeout",
            "eventType": "strikeout",
            "description": "Bryson Stott called out on strikes.",
            "rbi": 0,
            "awayScore": 0,
            "homeScore": 3,
            "isOut": true
          },
          "about": {
            "atBatIndex": 14,
            "halfInning": "bottom",
            "isTopInning": false,
            "inning": 2,
            "startTime": "2022-11-02T00:40:59.951Z",
            "endTime": "2022-11-02T00:43:01.240Z",
            "isComplete": true,
            "isScoringPlay": false,
            "hasReview": false,
            "hasOut": true,
            "captivatingIndex": 14
          },
          "count": { "balls": 2, "strikes": 3, "outs": 1 },
          "matchup": {
            "batter": {
              "id": 681082,
              "fullName": "Bryson Stott",
              "link": "/api/v1/people/681082"
            },
            "batSide": { "code": "L", "description": "Left" },
            "pitcher": {
              "id": 621121,
              "fullName": "Lance McCullers Jr.",
              "link": "/api/v1/people/621121"
            },
            "pitchHand": { "code": "R", "description": "Right" },
            "batterHotColdZones": [],
            "pitcherHotColdZones": [],
            "splits": {
              "batter": "vs_RHP",
              "pitcher": "vs_LHB",
              "menOnBase": "Empty"
            }
          },
          "pitchIndex": [0, 1, 2, 3, 4],
          "actionIndex": [],
          "runnerIndex": [0],
          "runners": [
            {
              "movement": {
                "originBase": null,
                "start": null,
                "end": null,
                "outBase": "1B",
                "isOut": true,
                "outNumber": 1
              },
              "details": {
                "event": "Strikeout",
                "eventType": "strikeout",
                "movementReason": null,
                "runner": {
                  "id": 681082,
                  "fullName": "Bryson Stott",
                  "link": "/api/v1/people/681082"
                },
                "responsiblePitcher": null,
                "isScoringEvent": false,
                "rbi": false,
                "earned": false,
                "teamUnearned": false,
                "playIndex": 4
              },
              "credits": [
                {
                  "player": { "id": 455117, "link": "/api/v1/people/455117" },
                  "position": {
                    "code": "2",
                    "name": "Catcher",
                    "type": "Catcher",
                    "abbreviation": "C"
                  },
                  "credit": "f_putout"
                }
              ]
            }
          ],
          "playEvents": [
            {
              "details": {
                "call": { "code": "B", "description": "Ball" },
                "description": "Ball",
                "code": "B",
                "ballColor": "rgba(39, 161, 39, 1.0)",
                "trailColor": "rgba(152, 0, 101, 1.0)",
                "isInPlay": false,
                "isStrike": false,
                "isBall": true,
                "type": { "code": "FC", "description": "Cutter" },
                "isOut": false,
                "hasReview": false
              },
              "count": { "balls": 1, "strikes": 0, "outs": 0 },
              "pitchData": {
                "startSpeed": 87.2,
                "endSpeed": 80.5,
                "strikeZoneTop": 3.17983186060471,
                "strikeZoneBottom": 1.4774246966977,
                "coordinates": {
                  "aY": 24.037764492702067,
                  "aZ": -27.442584087413298,
                  "pfxX": 1.7177551679089218,
                  "pfxZ": 2.8643090350029254,
                  "pX": -1.2800922835671376,
                  "pZ": 3.6777901885385504,
                  "vX0": 0.16305498853103398,
                  "vY0": -127.17327076069883,
                  "vZ0": 0.8018683617333864,
                  "x": 165.79,
                  "y": 139.48,
                  "x0": -1.5682829278075925,
                  "y0": 50.00178732460762,
                  "z0": 5.521162396645531,
                  "aX": 2.8369847341631043
                },
                "breaks": {
                  "breakAngle": 6.0,
                  "breakLength": 7.2,
                  "breakY": 24.0,
                  "spinRate": 2488,
                  "spinDirection": 152
                },
                "zone": 11,
                "typeConfidence": 0.92,
                "plateTime": 0.429327458111179,
                "extension": 5.309996109330954
              },
              "index": 0,
              "playId": "c3116929-1f59-4a44-8d58-15fd6842b184",
              "pitchNumber": 1,
              "startTime": "2022-11-02T00:41:40.028Z",
              "endTime": "2022-11-02T00:41:43.028Z",
              "isPitch": true,
              "type": "pitch"
            },
            {
              "details": {
                "call": { "code": "F", "description": "Foul" },
                "description": "Foul",
                "code": "F",
                "ballColor": "rgba(170, 21, 11, 1.0)",
                "trailColor": "rgba(50, 0, 221, 1.0)",
                "isInPlay": false,
                "isStrike": true,
                "isBall": false,
                "type": { "code": "SI", "description": "Sinker" },
                "isOut": false,
                "hasReview": false
              },
              "count": { "balls": 1, "strikes": 1, "outs": 0 },
              "pitchData": {
                "startSpeed": 92.8,
                "endSpeed": 85.5,
                "strikeZoneTop": 3.23,
                "strikeZoneBottom": 1.48,
                "coordinates": {
                  "aY": 27.37628906179871,
                  "aZ": -25.840073855458048,
                  "pfxX": -7.581285497665813,
                  "pfxZ": 3.403543439820413,
                  "pX": 0.030031779055011126,
                  "pZ": 2.1975675315997267,
                  "vX0": 6.4684784101315715,
                  "vY0": -135.05029008674987,
                  "vZ0": -3.016247971414126,
                  "x": 115.86,
                  "y": 179.45,
                  "x0": -1.402570778252869,
                  "y0": 50.00148890507927,
                  "z0": 5.131755713245448,
                  "aX": -14.106405863065703
                },
                "breaks": {
                  "breakAngle": 26.4,
                  "breakLength": 6.0,
                  "breakY": 24.0,
                  "spinRate": 2125,
                  "spinDirection": 242
                },
                "zone": 5,
                "typeConfidence": 0.9,
                "plateTime": 0.4044223055645162,
                "extension": 5.962680879338079
              },
              "index": 1,
              "playId": "1f06eb08-3bec-458a-ad52-a9630633b9e4",
              "pitchNumber": 2,
              "startTime": "2022-11-02T00:41:58.205Z",
              "endTime": "2022-11-02T00:42:01.330Z",
              "isPitch": true,
              "type": "pitch"
            },
            {
              "details": {
                "call": { "code": "B", "description": "Ball" },
                "description": "Ball",
                "code": "B",
                "ballColor": "rgba(39, 161, 39, 1.0)",
                "trailColor": "rgba(0, 0, 254, 1.0)",
                "isInPlay": false,
                "isStrike": false,
                "isBall": true,
                "type": { "code": "SL", "description": "Slider" },
                "isOut": false,
                "hasReview": false
              },
              "count": { "balls": 2, "strikes": 1, "outs": 0 },
              "pitchData": {
                "startSpeed": 81.7,
                "endSpeed": 74.3,
                "strikeZoneTop": 3.17983186060471,
                "strikeZoneBottom": 1.4774246966977,
                "coordinates": {
                  "aY": 24.72974595812589,
                  "aZ": -29.67479738255218,
                  "pfxX": 13.039002927429852,
                  "pfxZ": 1.7651096109102085,
                  "pX": -1.1476493395576028,
                  "pZ": 3.7223484431900737,
                  "vX0": -2.4260652467670387,
                  "vY0": -118.90006537438231,
                  "vZ0": 2.7423139165830994,
                  "x": 160.75,
                  "y": 138.28,
                  "x0": -1.8017835865370835,
                  "y0": 50.00548279300147,
                  "z0": 5.262821998510216,
                  "aX": 18.501863121691315
                },
                "breaks": {
                  "breakAngle": 31.2,
                  "breakLength": 9.6,
                  "breakY": 24.0,
                  "spinRate": 2962,
                  "spinDirection": 71
                },
                "zone": 11,
                "typeConfidence": 0.9,
                "plateTime": 0.46227801934574186,
                "extension": 5.549457841482264
              },
              "index": 2,
              "playId": "0679bda9-3389-436b-82f8-edeae10e563e",
              "pitchNumber": 3,
              "startTime": "2022-11-02T00:42:24.220Z",
              "endTime": "2022-11-02T00:42:27.789Z",
              "isPitch": true,
              "type": "pitch"
            },
            {
              "details": {
                "call": { "code": "C", "description": "Called Strike" },
                "description": "Called Strike",
                "code": "C",
                "ballColor": "rgba(170, 21, 11, 1.0)",
                "trailColor": "rgba(0, 0, 254, 1.0)",
                "isInPlay": false,
                "isStrike": true,
                "isBall": false,
                "type": { "code": "SL", "description": "Slider" },
                "isOut": false,
                "hasReview": false
              },
              "count": { "balls": 2, "strikes": 2, "outs": 0 },
              "pitchData": {
                "startSpeed": 82.4,
                "endSpeed": 75.1,
                "strikeZoneTop": 3.17983186060471,
                "strikeZoneBottom": 1.4774246966977,
                "coordinates": {
                  "aY": 25.25673080419914,
                  "aZ": -29.833117027190106,
                  "pfxX": 11.390658593520206,
                  "pfxZ": 1.6209596009711245,
                  "pX": -0.6903836357606834,
                  "pZ": 2.4300014295546446,
                  "vX0": -0.8840264672634445,
                  "vY0": -119.90025798393391,
                  "vZ0": 0.03509003454630788,
                  "x": 143.32,
                  "y": 173.17,
                  "x0": -1.7926937379498313,
                  "y0": 50.0005322277306,
                  "z0": 5.0986102256950625,
                  "aX": 16.42322251287149
                },
                "breaks": {
                  "breakAngle": 28.8,
                  "breakLength": 9.6,
                  "breakY": 24.0,
                  "spinRate": 2918,
                  "spinDirection": 72
                },
                "zone": 4,
                "typeConfidence": 0.91,
                "plateTime": 0.45850090802379473,
                "extension": 5.583566514011902
              },
              "index": 3,
              "playId": "f3660e71-99f7-47e4-a10e-4d659b238e34",
              "pitchNumber": 4,
              "startTime": "2022-11-02T00:42:40.539Z",
              "endTime": "2022-11-02T00:42:44.158Z",
              "isPitch": true,
              "type": "pitch"
            },
            {
              "details": {
                "call": { "code": "C", "description": "Called Strike" },
                "description": "Called Strike",
                "code": "C",
                "ballColor": "rgba(170, 21, 11, 1.0)",
                "trailColor": "rgba(0, 0, 254, 1.0)",
                "isInPlay": false,
                "isStrike": true,
                "isBall": false,
                "type": { "code": "SL", "description": "Slider" },
                "isOut": true,
                "hasReview": false
              },
              "count": { "balls": 2, "strikes": 3, "outs": 0 },
              "pitchData": {
                "startSpeed": 82.9,
                "endSpeed": 75.9,
                "strikeZoneTop": 3.17983186060471,
                "strikeZoneBottom": 1.4774246966977,
                "coordinates": {
                  "aY": 24.4774887191917,
                  "aZ": -26.666120950969756,
                  "pfxX": 11.054651836985853,
                  "pfxZ": 3.742663877727547,
                  "pX": -0.6091830683794496,
                  "pZ": 2.0212597628346716,
                  "vX0": -0.6201416539452239,
                  "vY0": -120.7652659826802,
                  "vZ0": -1.3462465134892736,
                  "x": 140.22,
                  "y": 184.21,
                  "x0": -1.7835846757956852,
                  "y0": 50.001165991923635,
                  "z0": 4.941138762914815,
                  "aX": 16.25436389203596
                },
                "breaks": {
                  "breakAngle": 31.2,
                  "breakLength": 8.4,
                  "breakY": 24.0,
                  "spinRate": 2944,
                  "spinDirection": 77
                },
                "zone": 4,
                "typeConfidence": 0.91,
                "plateTime": 0.45430813031582584,
                "extension": 5.773211047811869
              },
              "index": 4,
              "playId": "080b6a2c-fa7a-4415-9154-b954980059ed",
              "pitchNumber": 5,
              "startTime": "2022-11-02T00:42:57.036Z",
              "endTime": "2022-11-02T00:43:01.240Z",
              "isPitch": true,
              "type": "pitch"
            }
          ],
          "playEndTime": "2022-11-02T00:43:01.240Z",
          "atBatIndex": 14
        },
        {
          "result": {
            "type": "atBat",
            "event": "Strikeout",
            "eventType": "strikeout",
            "description": "Jean Segura strikes out swinging.",
            "rbi": 0,
            "awayScore": 0,
            "homeScore": 3,
            "isOut": true
          },
          "about": {
            "atBatIndex": 15,
            "halfInning": "bottom",
            "isTopInning": false,
            "inning": 2,
            "startTime": "2022-11-02T00:43:20.615Z",
            "endTime": "2022-11-02T00:44:44.433Z",
            "isComplete": true,
            "isScoringPlay": false,
            "hasReview": false,
            "hasOut": true,
            "captivatingIndex": 14
          },
          "count": { "balls": 2, "strikes": 3, "outs": 2 },
          "matchup": {
            "batter": {
              "id": 516416,
              "fullName": "Jean Segura",
              "link": "/api/v1/people/516416"
            },
            "batSide": { "code": "R", "description": "Right" },
            "pitcher": {
              "id": 621121,
              "fullName": "Lance McCullers Jr.",
              "link": "/api/v1/people/621121"
            },
            "pitchHand": { "code": "R", "description": "Right" },
            "batterHotColdZones": [],
            "pitcherHotColdZones": [],
            "splits": {
              "batter": "vs_RHP",
              "pitcher": "vs_RHB",
              "menOnBase": "Empty"
            }
          },
          "pitchIndex": [0, 1, 2, 3, 4],
          "actionIndex": [],
          "runnerIndex": [0],
          "runners": [
            {
              "movement": {
                "originBase": null,
                "start": null,
                "end": null,
                "outBase": "1B",
                "isOut": true,
                "outNumber": 2
              },
              "details": {
                "event": "Strikeout",
                "eventType": "strikeout",
                "movementReason": null,
                "runner": {
                  "id": 516416,
                  "fullName": "Jean Segura",
                  "link": "/api/v1/people/516416"
                },
                "responsiblePitcher": null,
                "isScoringEvent": false,
                "rbi": false,
                "earned": false,
                "teamUnearned": false,
                "playIndex": 4
              },
              "credits": [
                {
                  "player": { "id": 455117, "link": "/api/v1/people/455117" },
                  "position": {
                    "code": "2",
                    "name": "Catcher",
                    "type": "Catcher",
                    "abbreviation": "C"
                  },
                  "credit": "f_putout"
                }
              ]
            }
          ],
          "playEvents": [
            {
              "details": {
                "call": { "code": "S", "description": "Swinging Strike" },
                "description": "Swinging Strike",
                "code": "S",
                "ballColor": "rgba(170, 21, 11, 1.0)",
                "trailColor": "rgba(0, 0, 254, 1.0)",
                "isInPlay": false,
                "isStrike": true,
                "isBall": false,
                "type": { "code": "SL", "description": "Slider" },
                "isOut": false,
                "hasReview": false
              },
              "count": { "balls": 0, "strikes": 1, "outs": 1 },
              "pitchData": {
                "startSpeed": 83.7,
                "endSpeed": 76.5,
                "strikeZoneTop": 3.08,
                "strikeZoneBottom": 1.44,
                "coordinates": {
                  "aY": 25.83111323663814,
                  "aZ": -26.436181649747933,
                  "pfxX": 10.335759119194208,
                  "pfxZ": 3.84607601943281,
                  "pX": 1.230939552195678,
                  "pZ": 1.8645928629352404,
                  "vX0": 3.4579731674679675,
                  "vY0": -121.84205455140315,
                  "vZ0": -1.9579753283312815,
                  "x": 70.08,
                  "y": 188.44,
                  "x0": -1.552344028769244,
                  "y0": 50.00011049404027,
                  "z0": 4.982041594329766,
                  "aX": 15.405342485961654
                },
                "breaks": {
                  "breakAngle": 31.2,
                  "breakLength": 8.4,
                  "breakY": 24.0,
                  "spinRate": 2962,
                  "spinDirection": 81
                },
                "zone": 14,
                "typeConfidence": 0.91,
                "plateTime": 0.45099272540720037,
                "extension": 5.813734408015225
              },
              "index": 0,
              "playId": "91699e29-e842-404f-83c5-b54fabc1444e",
              "pitchNumber": 1,
              "startTime": "2022-11-02T00:43:27.683Z",
              "endTime": "2022-11-02T00:43:30.884Z",
              "isPitch": true,
              "type": "pitch"
            },
            {
              "details": {
                "call": { "code": "B", "description": "Ball" },
                "description": "Ball",
                "code": "B",
                "ballColor": "rgba(39, 161, 39, 1.0)",
                "trailColor": "rgba(0, 0, 254, 1.0)",
                "isInPlay": false,
                "isStrike": false,
                "isBall": true,
                "type": { "code": "SL", "description": "Slider" },
                "isOut": false,
                "hasReview": false
              },
              "count": { "balls": 1, "strikes": 1, "outs": 1 },
              "pitchData": {
                "startSpeed": 82.3,
                "endSpeed": 75.1,
                "strikeZoneTop": 3.10232486977765,
                "strikeZoneBottom": 1.48320544155643,
                "coordinates": {
                  "aY": 26.659316097173107,
                  "aZ": -27.74129514834601,
                  "pfxX": 12.563824896843599,
                  "pfxZ": 3.099023032236819,
                  "pX": 1.1568950891528353,
                  "pZ": 0.524017610349541,
                  "vX0": 2.743767656944917,
                  "vY0": -119.79135683506853,
                  "vZ0": -4.235723179344696,
                  "x": 72.9,
                  "y": 224.63,
                  "x0": -1.6390067187652273,
                  "y0": 50.00286532769162,
                  "z0": 4.841679414770147,
                  "aX": 17.95952857509394
                },
                "breaks": {
                  "breakAngle": 32.4,
                  "breakLength": 9.6,
                  "breakY": 24.0,
                  "spinRate": 2994,
                  "spinDirection": 84
                },
                "zone": 14,
                "typeConfidence": 0.92,
                "plateTime": 0.46012175650096765,
                "extension": 5.7762213582155315
              },
              "index": 1,
              "playId": "b586de00-14be-46bc-bca1-0da72f0578fe",
              "pitchNumber": 2,
              "startTime": "2022-11-02T00:43:42.376Z",
              "endTime": "2022-11-02T00:43:45.570Z",
              "isPitch": true,
              "type": "pitch"
            },
            {
              "details": {
                "call": { "code": "F", "description": "Foul" },
                "description": "Foul",
                "code": "F",
                "ballColor": "rgba(170, 21, 11, 1.0)",
                "trailColor": "rgba(50, 0, 221, 1.0)",
                "isInPlay": false,
                "isStrike": true,
                "isBall": false,
                "type": { "code": "SI", "description": "Sinker" },
                "isOut": false,
                "hasReview": false
              },
              "count": { "balls": 1, "strikes": 2, "outs": 1 },
              "pitchData": {
                "startSpeed": 92.4,
                "endSpeed": 85.2,
                "strikeZoneTop": 3.08,
                "strikeZoneBottom": 1.44,
                "coordinates": {
                  "aY": 27.423990544622978,
                  "aZ": -28.860403970876586,
                  "pfxX": -4.5413172858177635,
                  "pfxZ": 1.7938624082394519,
                  "pX": -0.6977447661170499,
                  "pZ": 2.8917985946149436,
                  "vX0": 3.78209627922154,
                  "vY0": -134.67819174369524,
                  "vZ0": -0.5730973153162132,
                  "x": 143.6,
                  "y": 160.7,
                  "x0": -1.5256360458582332,
                  "y0": 50.00544235054385,
                  "z0": 5.136769648948238,
                  "aX": -8.399522607834879
                },
                "breaks": {
                  "breakAngle": 14.4,
                  "breakLength": 6.0,
                  "breakY": 24.0,
                  "spinRate": 2178,
                  "spinDirection": 238
                },
                "zone": 1,
                "typeConfidence": 0.88,
                "plateTime": 0.4056596639806642,
                "extension": 5.794632458591045
              },
              "index": 2,
              "playId": "0242813d-601b-4c38-845f-bbafda3ec806",
              "pitchNumber": 3,
              "startTime": "2022-11-02T00:43:57.680Z",
              "endTime": "2022-11-02T00:44:01.110Z",
              "isPitch": true,
              "type": "pitch"
            },
            {
              "details": {
                "call": { "code": "B", "description": "Ball" },
                "description": "Ball",
                "code": "B",
                "ballColor": "rgba(39, 161, 39, 1.0)",
                "trailColor": "rgba(0, 0, 254, 1.0)",
                "isInPlay": false,
                "isStrike": false,
                "isBall": true,
                "type": { "code": "SL", "description": "Slider" },
                "isOut": false,
                "hasReview": false
              },
              "count": { "balls": 2, "strikes": 2, "outs": 1 },
              "pitchData": {
                "startSpeed": 84.4,
                "endSpeed": 77.3,
                "strikeZoneTop": 3.12816421820366,
                "strikeZoneBottom": 1.48320544155643,
                "coordinates": {
                  "aY": 26.051985825764156,
                  "aZ": -27.039584575103593,
                  "pfxX": 9.93328442426149,
                  "pfxZ": 3.3792745250712377,
                  "pX": 0.8422172539280457,
                  "pZ": 1.2741171224939734,
                  "vX0": 2.9688676292542775,
                  "vY0": -122.90273771151607,
                  "vZ0": -3.0499987770345864,
                  "x": 84.9,
                  "y": 204.38,
                  "x0": -1.673968959396692,
                  "y0": 50.001843089994665,
                  "z0": 4.845897220458201,
                  "aX": 15.08012061281039
                },
                "breaks": {
                  "breakAngle": 30.0,
                  "breakLength": 8.4,
                  "breakY": 24.0,
                  "spinRate": 2987,
                  "spinDirection": 75
                },
                "zone": 14,
                "typeConfidence": 0.91,
                "plateTime": 0.44693877358387724,
                "extension": 5.896370092494933
              },
              "index": 3,
              "playId": "da98493d-a1c7-4d59-83fa-30c0e0e78764",
              "pitchNumber": 4,
              "startTime": "2022-11-02T00:44:23.424Z",
              "endTime": "2022-11-02T00:44:27.551Z",
              "isPitch": true,
              "type": "pitch"
            },
            {
              "details": {
                "call": { "code": "S", "description": "Swinging Strike" },
                "description": "Swinging Strike",
                "code": "S",
                "ballColor": "rgba(170, 21, 11, 1.0)",
                "trailColor": "rgba(0, 0, 254, 1.0)",
                "isInPlay": false,
                "isStrike": true,
                "isBall": false,
                "type": { "code": "SL", "description": "Slider" },
                "isOut": true,
                "hasReview": false
              },
              "count": { "balls": 2, "strikes": 3, "outs": 1 },
              "pitchData": {
                "startSpeed": 82.4,
                "endSpeed": 75.1,
                "strikeZoneTop": 3.08,
                "strikeZoneBottom": 1.44,
                "coordinates": {
                  "aY": 25.78103180726988,
                  "aZ": -30.697211795882428,
                  "pfxX": 11.855788473033666,
                  "pfxZ": 1.0249519381660184,
                  "pX": -0.711471017144126,
                  "pZ": 1.7312867946255242,
                  "vX0": -1.2886391918600946,
                  "vY0": -120.02241858980892,
                  "vZ0": -1.2123575535783115,
                  "x": 144.12,
                  "y": 192.04,
                  "x0": -1.7021416155183169,
                  "y0": 50.00238624590582,
                  "z0": 5.00609723764854,
                  "aX": 17.09324821324896
                },
                "breaks": {
                  "breakAngle": 28.8,
                  "breakLength": 9.6,
                  "breakY": 24.0,
                  "spinRate": 3025,
                  "spinDirection": 75
                },
                "zone": 7,
                "typeConfidence": 0.9,
                "plateTime": 0.4584207823179738,
                "extension": 5.89660111993193
              },
              "index": 4,
              "playId": "76ef6c0a-34c9-4d7c-bb06-11177989c440",
              "pitchNumber": 5,
              "startTime": "2022-11-02T00:44:40.404Z",
              "endTime": "2022-11-02T00:44:44.433Z",
              "isPitch": true,
              "type": "pitch"
            }
          ],
          "playEndTime": "2022-11-02T00:44:44.433Z",
          "atBatIndex": 15
        },
        {
          "result": {
            "type": "atBat",
            "event": "Home Run",
            "eventType": "home_run",
            "description": "Umpire reviewed (home run), call on the field was upheld: Brandon Marsh homers (2) on a fly ball to right center field.",
            "rbi": 1,
            "awayScore": 0,
            "homeScore": 4,
            "isOut": false
          },
          "about": {
            "atBatIndex": 16,
            "halfInning": "bottom",
            "isTopInning": false,
            "inning": 2,
            "startTime": "2022-11-02T00:45:09.770Z",
            "endTime": "2022-11-02T00:46:35.118Z",
            "isComplete": true,
            "isScoringPlay": true,
            "hasReview": true,
            "hasOut": false,
            "captivatingIndex": 38
          },
          "count": { "balls": 2, "strikes": 0, "outs": 2 },
          "matchup": {
            "batter": {
              "id": 669016,
              "fullName": "Brandon Marsh",
              "link": "/api/v1/people/669016"
            },
            "batSide": { "code": "L", "description": "Left" },
            "pitcher": {
              "id": 621121,
              "fullName": "Lance McCullers Jr.",
              "link": "/api/v1/people/621121"
            },
            "pitchHand": { "code": "R", "description": "Right" },
            "batterHotColdZones": [],
            "pitcherHotColdZones": [],
            "splits": {
              "batter": "vs_RHP",
              "pitcher": "vs_LHB",
              "menOnBase": "Empty"
            }
          },
          "pitchIndex": [0, 1, 2],
          "actionIndex": [],
          "runnerIndex": [0],
          "runners": [
            {
              "movement": {
                "originBase": null,
                "start": null,
                "end": "score",
                "outBase": null,
                "isOut": false,
                "outNumber": null
              },
              "details": {
                "event": "Home Run",
                "eventType": "home_run",
                "movementReason": null,
                "runner": {
                  "id": 669016,
                  "fullName": "Brandon Marsh",
                  "link": "/api/v1/people/669016"
                },
                "responsiblePitcher": {
                  "id": 621121,
                  "link": "/api/v1/people/621121"
                },
                "isScoringEvent": true,
                "rbi": true,
                "earned": true,
                "teamUnearned": false,
                "playIndex": 2
              },
              "credits": []
            }
          ],
          "playEvents": [
            {
              "details": {
                "call": { "code": "B", "description": "Ball" },
                "description": "Ball",
                "code": "B",
                "ballColor": "rgba(39, 161, 39, 1.0)",
                "trailColor": "rgba(0, 85, 254, 1.0)",
                "isInPlay": false,
                "isStrike": false,
                "isBall": true,
                "type": { "code": "CH", "description": "Changeup" },
                "isOut": false,
                "hasReview": false
              },
              "count": { "balls": 1, "strikes": 0, "outs": 2 },
              "pitchData": {
                "startSpeed": 87.1,
                "endSpeed": 80.5,
                "strikeZoneTop": 3.17983186060471,
                "strikeZoneBottom": 1.50919153250672,
                "coordinates": {
                  "aY": 24.74273229542144,
                  "aZ": -35.255942230317075,
                  "pfxX": -10.243327414051102,
                  "pfxZ": -1.8888354398128655,
                  "pX": 0.09254498893769911,
                  "pZ": 0.933709512180138,
                  "vX0": 6.706181339859457,
                  "vY0": -126.6691952712932,
                  "vZ0": -3.5385456012056467,
                  "x": 113.47,
                  "y": 213.57,
                  "x0": -1.2521629873983628,
                  "y0": 50.00351180671273,
                  "z0": 5.154106833005035,
                  "aX": -16.724116422494717
                },
                "breaks": {
                  "breakAngle": 22.8,
                  "breakLength": 9.6,
                  "breakY": 24.0,
                  "spinRate": 1750,
                  "spinDirection": 268
                },
                "zone": 14,
                "typeConfidence": 0.9,
                "plateTime": 0.4316429525576462,
                "extension": 5.539634440670672
              },
              "index": 0,
              "playId": "d1447c30-ec40-4a76-aa18-4002f2d57a89",
              "pitchNumber": 1,
              "startTime": "2022-11-02T00:45:18.614Z",
              "endTime": "2022-11-02T00:45:22.148Z",
              "isPitch": true,
              "type": "pitch"
            },
            {
              "details": {
                "call": { "code": "B", "description": "Ball" },
                "description": "Ball",
                "code": "B",
                "ballColor": "rgba(39, 161, 39, 1.0)",
                "trailColor": "rgba(0, 0, 254, 1.0)",
                "isInPlay": false,
                "isStrike": false,
                "isBall": true,
                "type": { "code": "SL", "description": "Slider" },
                "isOut": false,
                "hasReview": false
              },
              "count": { "balls": 2, "strikes": 0, "outs": 2 },
              "pitchData": {
                "startSpeed": 84.8,
                "endSpeed": 77.8,
                "strikeZoneTop": 3.10232486977765,
                "strikeZoneBottom": 1.43122601346257,
                "coordinates": {
                  "aY": 26.54648639049583,
                  "aZ": -30.123060496950817,
                  "pfxX": 10.655250834300535,
                  "pfxZ": 1.3447591769360412,
                  "pX": 1.5998293803654655,
                  "pZ": 0.8899879947184349,
                  "vX0": 4.234622563820154,
                  "vY0": -123.35045832887043,
                  "vZ0": -3.5103831673867063,
                  "x": 56.02,
                  "y": 214.75,
                  "x0": -1.5280101941768482,
                  "y0": 50.004740592869524,
                  "z0": 4.895391780817911,
                  "aX": 16.27594958702993
                },
                "breaks": {
                  "breakAngle": 28.8,
                  "breakLength": 9.6,
                  "breakY": 24.0,
                  "spinRate": 3079,
                  "spinDirection": 62
                },
                "zone": 14,
                "typeConfidence": 0.92,
                "plateTime": 0.4455383150289167,
                "extension": 5.806273822168336
              },
              "index": 1,
              "playId": "95d86db0-4051-4d8c-8a98-420bcb7d562c",
              "pitchNumber": 2,
              "startTime": "2022-11-02T00:45:37.299Z",
              "endTime": "2022-11-02T00:45:41.805Z",
              "isPitch": true,
              "type": "pitch"
            },
            {
              "details": {
                "call": { "code": "E", "description": "In play, run(s)" },
                "description": "In play, run(s)",
                "code": "E",
                "ballColor": "rgba(26, 86, 190, 1.0)",
                "trailColor": "rgba(0, 0, 254, 1.0)",
                "isInPlay": true,
                "isStrike": false,
                "isBall": false,
                "type": { "code": "SL", "description": "Slider" },
                "isOut": false,
                "hasReview": false
              },
              "count": { "balls": 2, "strikes": 0, "outs": 2 },
              "pitchData": {
                "startSpeed": 83.7,
                "endSpeed": 77.0,
                "strikeZoneTop": 3.06,
                "strikeZoneBottom": 1.44,
                "coordinates": {
                  "aY": 23.56905516562689,
                  "aZ": -30.340413489327727,
                  "pfxX": 6.654349874563623,
                  "pfxZ": 1.2201294252542674,
                  "pX": 0.609481098930798,
                  "pZ": 2.7382479405044435,
                  "vX0": 3.0431277100038345,
                  "vY0": -121.91105937420944,
                  "vZ0": 0.7766234391295086,
                  "x": 93.77,
                  "y": 164.85,
                  "x0": -1.5190361509952701,
                  "y0": 50.00571870559747,
                  "z0": 5.030748307415798,
                  "aX": 10.03532599244552
                },
                "breaks": {
                  "breakAngle": 19.2,
                  "breakLength": 8.4,
                  "breakY": 24.0,
                  "spinRate": 2850,
                  "spinDirection": 78
                },
                "zone": 3,
                "typeConfidence": 0.9,
                "plateTime": 0.44897856453117235,
                "extension": 5.88503043970423
              },
              "hitData": {
                "launchSpeed": 96.2,
                "launchAngle": 39.0,
                "totalDistance": 358.0,
                "trajectory": "fly_ball",
                "hardness": "medium",
                "location": "89",
                "coordinates": { "coordX": 190.86, "coordY": 69.73 }
              },
              "index": 2,
              "playId": "583c034c-b364-4d3e-a711-a973f0db1ce0",
              "pitchNumber": 3,
              "startTime": "2022-11-02T00:46:10.541Z",
              "endTime": "2022-11-02T00:46:35.118Z",
              "isPitch": true,
              "type": "pitch"
            }
          ],
          "reviewDetails": {
            "isOverturned": false,
            "inProgress": false,
            "reviewType": "NH"
          },
          "playEndTime": "2022-11-02T00:46:35.118Z",
          "atBatIndex": 16
        },
        {
          "result": {
            "type": "atBat",
            "event": "Groundout",
            "eventType": "field_out",
            "description": "Kyle Schwarber grounds out, first baseman Yuli Gurriel to pitcher Lance McCullers Jr.",
            "rbi": 0,
            "awayScore": 0,
            "homeScore": 4,
            "isOut": true
          },
          "about": {
            "atBatIndex": 17,
            "halfInning": "bottom",
            "isTopInning": false,
            "inning": 2,
            "startTime": "2022-11-02T00:46:54.218Z",
            "endTime": "2022-11-02T00:52:17.678Z",
            "isComplete": true,
            "isScoringPlay": false,
            "hasReview": false,
            "hasOut": true,
            "captivatingIndex": 0
          },
          "count": { "balls": 2, "strikes": 2, "outs": 3 },
          "matchup": {
            "batter": {
              "id": 656941,
              "fullName": "Kyle Schwarber",
              "link": "/api/v1/people/656941"
            },
            "batSide": { "code": "L", "description": "Left" },
            "pitcher": {
              "id": 621121,
              "fullName": "Lance McCullers Jr.",
              "link": "/api/v1/people/621121"
            },
            "pitchHand": { "code": "R", "description": "Right" },
            "batterHotColdZones": [],
            "pitcherHotColdZones": [],
            "splits": {
              "batter": "vs_RHP",
              "pitcher": "vs_LHB",
              "menOnBase": "Empty"
            }
          },
          "pitchIndex": [0, 1, 2, 3, 4, 5, 6],
          "actionIndex": [],
          "runnerIndex": [0],
          "runners": [
            {
              "movement": {
                "originBase": null,
                "start": null,
                "end": null,
                "outBase": "1B",
                "isOut": true,
                "outNumber": 3
              },
              "details": {
                "event": "Groundout",
                "eventType": "field_out",
                "movementReason": null,
                "runner": {
                  "id": 656941,
                  "fullName": "Kyle Schwarber",
                  "link": "/api/v1/people/656941"
                },
                "responsiblePitcher": null,
                "isScoringEvent": false,
                "rbi": false,
                "earned": false,
                "teamUnearned": false,
                "playIndex": 6
              },
              "credits": [
                {
                  "player": { "id": 493329, "link": "/api/v1/people/493329" },
                  "position": {
                    "code": "3",
                    "name": "First Base",
                    "type": "Infielder",
                    "abbreviation": "1B"
                  },
                  "credit": "f_assist"
                },
                {
                  "player": { "id": 621121, "link": "/api/v1/people/621121" },
                  "position": {
                    "code": "1",
                    "name": "Pitcher",
                    "type": "Pitcher",
                    "abbreviation": "P"
                  },
                  "credit": "f_putout"
                }
              ]
            }
          ],
          "playEvents": [
            {
              "details": {
                "call": { "code": "B", "description": "Ball" },
                "description": "Ball",
                "code": "B",
                "ballColor": "rgba(39, 161, 39, 1.0)",
                "trailColor": "rgba(0, 85, 254, 1.0)",
                "isInPlay": false,
                "isStrike": false,
                "isBall": true,
                "type": { "code": "CH", "description": "Changeup" },
                "isOut": false,
                "hasReview": false
              },
              "count": { "balls": 1, "strikes": 0, "outs": 2 },
              "pitchData": {
                "startSpeed": 86.5,
                "endSpeed": 79.6,
                "strikeZoneTop": 3.36054995147353,
                "strikeZoneBottom": 1.55737682215299,
                "coordinates": {
                  "aY": 25.625453792065517,
                  "aZ": -34.120910379869535,
                  "pfxX": -9.687826415983146,
                  "pfxZ": -1.2131284071316806,
                  "pX": -1.1085379977848093,
                  "pZ": 1.9699386144672681,
                  "vX0": 3.8060480072220555,
                  "vY0": -125.96034407628845,
                  "vZ0": -1.5207553605457291,
                  "x": 159.25,
                  "y": 185.59,
                  "x0": -1.380674800534289,
                  "y0": 50.0019260002595,
                  "z0": 5.340769005155103,
                  "aX": -15.563506675930634
                },
                "breaks": {
                  "breakAngle": 22.8,
                  "breakLength": 9.6,
                  "breakY": 24.0,
                  "spinRate": 1551,
                  "spinDirection": 266
                },
                "zone": 13,
                "typeConfidence": 0.9,
                "plateTime": 0.4348744554582349,
                "extension": 5.415509462252326
              },
              "index": 0,
              "playId": "a2a9729b-c591-4449-9f21-296836f368f9",
              "pitchNumber": 1,
              "startTime": "2022-11-02T00:49:15.998Z",
              "endTime": "2022-11-02T00:49:20.101Z",
              "isPitch": true,
              "type": "pitch"
            },
            {
              "details": {
                "call": { "code": "C", "description": "Called Strike" },
                "description": "Called Strike",
                "code": "C",
                "ballColor": "rgba(170, 21, 11, 1.0)",
                "trailColor": "rgba(0, 85, 254, 1.0)",
                "isInPlay": false,
                "isStrike": true,
                "isBall": false,
                "type": { "code": "CH", "description": "Changeup" },
                "isOut": false,
                "hasReview": false
              },
              "count": { "balls": 1, "strikes": 1, "outs": 2 },
              "pitchData": {
                "startSpeed": 86.5,
                "endSpeed": 79.6,
                "strikeZoneTop": 3.30893533219692,
                "strikeZoneBottom": 1.55737682215299,
                "coordinates": {
                  "aY": 24.428691735913926,
                  "aZ": -33.16956108548227,
                  "pfxX": -10.647169870005882,
                  "pfxZ": -0.6188290685148736,
                  "pX": 0.549197300708278,
                  "pZ": 2.9002022413514057,
                  "vX0": 7.7154599723759745,
                  "vY0": -125.81240259137375,
                  "vZ0": 0.2991106738333533,
                  "x": 96.07,
                  "y": 160.47,
                  "x0": -1.1669654806816243,
                  "y0": 50.00150238658221,
                  "z0": 5.457920637115319,
                  "aX": -17.145676472513223
                },
                "breaks": {
                  "breakAngle": 25.2,
                  "breakLength": 9.6,
                  "breakY": 24.0,
                  "spinRate": 1747,
                  "spinDirection": 261
                },
                "zone": 3,
                "typeConfidence": 0.9,
                "plateTime": 0.4345929442514631,
                "extension": 5.556775758983754
              },
              "index": 1,
              "playId": "a105ba96-f462-4ea3-9208-2101816049e9",
              "pitchNumber": 2,
              "startTime": "2022-11-02T00:49:33.939Z",
              "endTime": "2022-11-02T00:49:37.499Z",
              "isPitch": true,
              "type": "pitch"
            },
            {
              "details": {
                "call": { "code": "C", "description": "Called Strike" },
                "description": "Called Strike",
                "code": "C",
                "ballColor": "rgba(170, 21, 11, 1.0)",
                "trailColor": "rgba(153, 171, 0, 1.0)",
                "isInPlay": false,
                "isStrike": true,
                "isBall": false,
                "type": { "code": "KC", "description": "Knuckle Curve" },
                "isOut": false,
                "hasReview": false
              },
              "count": { "balls": 1, "strikes": 2, "outs": 2 },
              "pitchData": {
                "startSpeed": 82.3,
                "endSpeed": 75.6,
                "strikeZoneTop": 3.30893533219692,
                "strikeZoneBottom": 1.55737682215299,
                "coordinates": {
                  "aY": 23.735885406318108,
                  "aZ": -37.65273316304994,
                  "pfxX": 8.468439362094138,
                  "pfxZ": -3.776430825577842,
                  "pX": -0.5464097140486064,
                  "pZ": 2.505214873956826,
                  "vX0": -0.3807792168803871,
                  "vY0": -119.82381716207236,
                  "vZ0": 1.1009167736229786,
                  "x": 137.83,
                  "y": 171.14,
                  "x0": -1.4850364704606787,
                  "y0": 50.00402593334473,
                  "z0": 5.41109030477763,
                  "aX": 12.281177796428711
                },
                "breaks": {
                  "breakAngle": 18.0,
                  "breakLength": 10.8,
                  "breakY": 24.0,
                  "spinRate": 2954,
                  "spinDirection": 53
                },
                "zone": 4,
                "typeConfidence": 0.9,
                "plateTime": 0.4575870569605516,
                "extension": 5.716050574625147
              },
              "index": 2,
              "playId": "d3d0d461-adb7-47f3-b8ee-ef76c362a150",
              "pitchNumber": 3,
              "startTime": "2022-11-02T00:49:55.483Z",
              "endTime": "2022-11-02T00:49:59.006Z",
              "isPitch": true,
              "type": "pitch"
            },
            {
              "details": {
                "call": { "code": "B", "description": "Ball" },
                "description": "Ball",
                "code": "B",
                "ballColor": "rgba(39, 161, 39, 1.0)",
                "trailColor": "rgba(152, 0, 101, 1.0)",
                "isInPlay": false,
                "isStrike": false,
                "isBall": true,
                "type": { "code": "FC", "description": "Cutter" },
                "isOut": false,
                "hasReview": false
              },
              "count": { "balls": 2, "strikes": 2, "outs": 2 },
              "pitchData": {
                "startSpeed": 87.3,
                "endSpeed": 80.5,
                "strikeZoneTop": 3.25730531812071,
                "strikeZoneBottom": 1.50919153250672,
                "coordinates": {
                  "aY": 24.09496911793719,
                  "aZ": -30.960700380926518,
                  "pfxX": 3.989032957537149,
                  "pfxZ": 0.7364045273473359,
                  "pX": -0.07163974229398215,
                  "pZ": 4.4103475226736615,
                  "vX0": 1.9605769091740428,
                  "vY0": -127.11353391284449,
                  "vZ0": 3.081619570294645,
                  "x": 119.73,
                  "y": 119.7,
                  "x0": -1.3693029842456392,
                  "y0": 50.00356973418779,
                  "z0": 5.62818978844143,
                  "aX": 6.5798250653002635
                },
                "breaks": {
                  "breakAngle": 13.2,
                  "breakLength": 7.2,
                  "breakY": 24.0,
                  "spinRate": 2608,
                  "spinDirection": 105
                },
                "zone": 11,
                "typeConfidence": 0.91,
                "plateTime": 0.4295897449025614,
                "extension": 5.765687236290957
              },
              "index": 3,
              "playId": "4a69276b-6391-4336-b7dd-2289d11ffc57",
              "pitchNumber": 4,
              "startTime": "2022-11-02T00:50:35.767Z",
              "endTime": "2022-11-02T00:50:38.781Z",
              "isPitch": true,
              "type": "pitch"
            },
            {
              "details": {
                "call": { "code": "F", "description": "Foul" },
                "description": "Foul",
                "code": "F",
                "ballColor": "rgba(170, 21, 11, 1.0)",
                "trailColor": "rgba(0, 0, 254, 1.0)",
                "isInPlay": false,
                "isStrike": true,
                "isBall": false,
                "type": { "code": "SL", "description": "Slider" },
                "isOut": false,
                "hasReview": false
              },
              "count": { "balls": 2, "strikes": 2, "outs": 2 },
              "pitchData": {
                "startSpeed": 85.4,
                "endSpeed": 78.2,
                "strikeZoneTop": 3.28,
                "strikeZoneBottom": 1.56,
                "coordinates": {
                  "aY": 26.005128226215017,
                  "aZ": -29.004120105089545,
                  "pfxX": 8.546228992040694,
                  "pfxZ": 2.0313846998075658,
                  "pX": 0.11366427539283906,
                  "pZ": 2.272845011907338,
                  "vX0": 1.5082213022325142,
                  "vY0": -124.3920186106265,
                  "vZ0": -0.8335027485650572,
                  "x": 112.67,
                  "y": 177.41,
                  "x0": -1.6110837146588088,
                  "y0": 50.0022350498984,
                  "z0": 5.026594462666093,
                  "aX": 13.3312792923139
                },
                "breaks": {
                  "breakAngle": 25.2,
                  "breakLength": 8.4,
                  "breakY": 24.0,
                  "spinRate": 2907,
                  "spinDirection": 71
                },
                "zone": 5,
                "typeConfidence": 0.91,
                "plateTime": 0.44108594946488777,
                "extension": 5.694270214188182
              },
              "index": 4,
              "playId": "ca70217b-292a-4551-9c38-ae2868233582",
              "pitchNumber": 5,
              "startTime": "2022-11-02T00:51:08.693Z",
              "endTime": "2022-11-02T00:51:11.703Z",
              "isPitch": true,
              "type": "pitch"
            },
            {
              "details": {
                "call": { "code": "F", "description": "Foul" },
                "description": "Foul",
                "code": "F",
                "ballColor": "rgba(170, 21, 11, 1.0)",
                "trailColor": "rgba(0, 85, 254, 1.0)",
                "isInPlay": false,
                "isStrike": true,
                "isBall": false,
                "type": { "code": "CH", "description": "Changeup" },
                "isOut": false,
                "hasReview": false
              },
              "count": { "balls": 2, "strikes": 2, "outs": 2 },
              "pitchData": {
                "startSpeed": 87.7,
                "endSpeed": 80.3,
                "strikeZoneTop": 3.28,
                "strikeZoneBottom": 1.56,
                "coordinates": {
                  "aY": 27.55869699256493,
                  "aZ": -34.55542419340344,
                  "pfxX": -11.078603983379477,
                  "pfxZ": -1.4574817997159535,
                  "pX": 0.1911631358507162,
                  "pZ": 1.1800555398207018,
                  "vX0": 7.195903020836106,
                  "vY0": -127.50895625880412,
                  "vZ0": -3.0023036430491388,
                  "x": 109.71,
                  "y": 206.92,
                  "x0": -1.2360900885113524,
                  "y0": 50.00049097886959,
                  "z0": 5.1144170472990105,
                  "aX": -18.140198495133408
                },
                "breaks": {
                  "breakAngle": 25.2,
                  "breakLength": 9.6,
                  "breakY": 24.0,
                  "spinRate": 1666,
                  "spinDirection": 270
                },
                "zone": 14,
                "typeConfidence": 0.91,
                "plateTime": 0.43045747196349415,
                "extension": 5.837717038377411
              },
              "index": 5,
              "playId": "1e725872-f92f-4f83-92bc-166f9fee2119",
              "pitchNumber": 6,
              "startTime": "2022-11-02T00:51:35.843Z",
              "endTime": "2022-11-02T00:51:40.267Z",
              "isPitch": true,
              "type": "pitch"
            },
            {
              "details": {
                "call": { "code": "X", "description": "In play, out(s)" },
                "description": "In play, out(s)",
                "code": "X",
                "ballColor": "rgba(26, 86, 190, 1.0)",
                "trailColor": "rgba(153, 171, 0, 1.0)",
                "isInPlay": true,
                "isStrike": false,
                "isBall": false,
                "type": { "code": "KC", "description": "Knuckle Curve" },
                "isOut": true,
                "hasReview": false
              },
              "count": { "balls": 2, "strikes": 2, "outs": 2 },
              "pitchData": {
                "startSpeed": 84.1,
                "endSpeed": 77.5,
                "strikeZoneTop": 3.28,
                "strikeZoneBottom": 1.56,
                "coordinates": {
                  "aY": 25.038305999521373,
                  "aZ": -40.7309375237136,
                  "pfxX": 6.827054250028651,
                  "pfxZ": -5.648929888569019,
                  "pX": -0.1476881901428466,
                  "pZ": 1.447462690627584,
                  "vX0": 1.1352310207197718,
                  "vY0": -122.48500815417007,
                  "vZ0": -0.9593518380111347,
                  "x": 122.63,
                  "y": 199.7,
                  "x0": -1.5044237344480196,
                  "y0": 50.00436071087736,
                  "z0": 5.338432159494021,
                  "aX": 10.335553232347118
                },
                "breaks": {
                  "breakAngle": 14.4,
                  "breakLength": 10.8,
                  "breakY": 24.0,
                  "spinRate": 2954,
                  "spinDirection": 57
                },
                "zone": 8,
                "typeConfidence": 0.91,
                "plateTime": 0.44781533166483634,
                "extension": 5.712380045476828
              },
              "hitData": {
                "launchSpeed": 88.8,
                "launchAngle": -28.0,
                "totalDistance": 4.0,
                "trajectory": "ground_ball",
                "hardness": "medium",
                "location": "3",
                "coordinates": { "coordX": 159.62, "coordY": 167.8 }
              },
              "index": 6,
              "playId": "2540d3dd-dcb3-4b70-b272-5dd547c58f4a",
              "pitchNumber": 7,
              "startTime": "2022-11-02T00:52:08.376Z",
              "endTime": "2022-11-02T00:52:17.678Z",
              "isPitch": true,
              "type": "pitch"
            }
          ],
          "playEndTime": "2022-11-02T00:52:17.678Z",
          "atBatIndex": 17
        },
        {
          "result": {
            "type": "atBat",
            "event": "Strikeout",
            "eventType": "strikeout",
            "description": "Martin Maldonado called out on strikes.",
            "rbi": 0,
            "awayScore": 0,
            "homeScore": 4,
            "isOut": true
          },
          "about": {
            "atBatIndex": 18,
            "halfInning": "top",
            "isTopInning": true,
            "inning": 3,
            "startTime": "2022-11-02T00:55:03.129Z",
            "endTime": "2022-11-02T00:57:17.720Z",
            "isComplete": true,
            "isScoringPlay": false,
            "hasReview": false,
            "hasOut": true,
            "captivatingIndex": 14
          },
          "count": { "balls": 3, "strikes": 3, "outs": 1 },
          "matchup": {
            "batter": {
              "id": 455117,
              "fullName": "Martin Maldonado",
              "link": "/api/v1/people/455117"
            },
            "batSide": { "code": "R", "description": "Right" },
            "pitcher": {
              "id": 624133,
              "fullName": "Ranger Suarez",
              "link": "/api/v1/people/624133"
            },
            "pitchHand": { "code": "L", "description": "Left" },
            "batterHotColdZones": [],
            "pitcherHotColdZones": [],
            "splits": {
              "batter": "vs_LHP",
              "pitcher": "vs_RHB",
              "menOnBase": "Empty"
            }
          },
          "pitchIndex": [0, 1, 2, 3, 4, 5],
          "actionIndex": [],
          "runnerIndex": [0],
          "runners": [
            {
              "movement": {
                "originBase": null,
                "start": null,
                "end": null,
                "outBase": "1B",
                "isOut": true,
                "outNumber": 1
              },
              "details": {
                "event": "Strikeout",
                "eventType": "strikeout",
                "movementReason": null,
                "runner": {
                  "id": 455117,
                  "fullName": "Martin Maldonado",
                  "link": "/api/v1/people/455117"
                },
                "responsiblePitcher": null,
                "isScoringEvent": false,
                "rbi": false,
                "earned": false,
                "teamUnearned": false,
                "playIndex": 5
              },
              "credits": [
                {
                  "player": { "id": 592663, "link": "/api/v1/people/592663" },
                  "position": {
                    "code": "2",
                    "name": "Catcher",
                    "type": "Catcher",
                    "abbreviation": "C"
                  },
                  "credit": "f_putout"
                }
              ]
            }
          ],
          "playEvents": [
            {
              "details": {
                "call": { "code": "B", "description": "Ball" },
                "description": "Ball",
                "code": "B",
                "ballColor": "rgba(39, 161, 39, 1.0)",
                "trailColor": "rgba(50, 0, 221, 1.0)",
                "isInPlay": false,
                "isStrike": false,
                "isBall": true,
                "type": { "code": "SI", "description": "Sinker" },
                "isOut": false,
                "hasReview": false
              },
              "count": { "balls": 1, "strikes": 0, "outs": 0 },
              "pitchData": {
                "startSpeed": 92.3,
                "endSpeed": 84.1,
                "strikeZoneTop": 3.33474457841092,
                "strikeZoneBottom": 1.50919153250672,
                "coordinates": {
                  "aY": 30.951434379813627,
                  "aZ": -27.248494145302715,
                  "pfxX": 10.214102830671301,
                  "pfxZ": 2.7143211646925653,
                  "pX": 1.3684198784441974,
                  "pZ": 2.2630125490138484,
                  "vX0": -5.334169275636263,
                  "vY0": -134.28183302242965,
                  "vZ0": -3.8940737540205603,
                  "x": 64.84,
                  "y": 177.68,
                  "x0": 2.0609591343814557,
                  "y0": 50.00247856277847,
                  "z0": 5.686064067310534,
                  "aX": 18.52363283913864
                },
                "breaks": {
                  "breakAngle": 31.2,
                  "breakLength": 7.2,
                  "breakY": 24.0,
                  "spinRate": 1876,
                  "spinDirection": 128
                },
                "zone": 14,
                "typeConfidence": 0.92,
                "plateTime": 0.408973627572613,
                "extension": 6.061116155451694
              },
              "index": 0,
              "playId": "2b855380-decc-4517-b67d-fb4d6fd85ac0",
              "pitchNumber": 1,
              "startTime": "2022-11-02T00:55:37.562Z",
              "endTime": "2022-11-02T00:55:41.240Z",
              "isPitch": true,
              "type": "pitch"
            },
            {
              "details": {
                "call": { "code": "B", "description": "Ball" },
                "description": "Ball",
                "code": "B",
                "ballColor": "rgba(39, 161, 39, 1.0)",
                "trailColor": "rgba(0, 34, 255, 1.0)",
                "isInPlay": false,
                "isStrike": false,
                "isBall": true,
                "type": { "code": "CU", "description": "Curveball" },
                "isOut": false,
                "hasReview": false
              },
              "count": { "balls": 2, "strikes": 0, "outs": 0 },
              "pitchData": {
                "startSpeed": 78.2,
                "endSpeed": 72.1,
                "strikeZoneTop": 3.36054995147353,
                "strikeZoneBottom": 1.52739572277693,
                "coordinates": {
                  "aY": 20.411184306921786,
                  "aZ": -38.910269050718775,
                  "pfxX": -5.573677202201572,
                  "pfxZ": -5.114786915974637,
                  "pX": 1.6009618353272368,
                  "pZ": 4.018235530648115,
                  "vX0": 0.6435801623566573,
                  "vY0": -113.87485115786875,
                  "vZ0": 3.8252993610415893,
                  "x": 55.98,
                  "y": 130.29,
                  "x0": 2.039460353993531,
                  "y0": 50.00414816781767,
                  "z0": 6.159629506619426,
                  "aX": -7.338749875097189
                },
                "breaks": {
                  "breakAngle": 10.8,
                  "breakLength": 12.0,
                  "breakY": 24.0,
                  "spinRate": 2285,
                  "spinDirection": 304
                },
                "zone": 12,
                "typeConfidence": 0.86,
                "plateTime": 0.4805326157297296,
                "extension": 5.992425878473136
              },
              "index": 1,
              "playId": "a770e804-8811-4c03-ab39-43e60a1ab37f",
              "pitchNumber": 2,
              "startTime": "2022-11-02T00:55:52.797Z",
              "endTime": "2022-11-02T00:55:55.935Z",
              "isPitch": true,
              "type": "pitch"
            },
            {
              "details": {
                "call": { "code": "B", "description": "Ball" },
                "description": "Ball",
                "code": "B",
                "ballColor": "rgba(39, 161, 39, 1.0)",
                "trailColor": "rgba(188, 0, 33, 1.0)",
                "isInPlay": false,
                "isStrike": false,
                "isBall": true,
                "type": { "code": "FF", "description": "Four-Seam Fastball" },
                "isOut": false,
                "hasReview": false
              },
              "count": { "balls": 3, "strikes": 0, "outs": 0 },
              "pitchData": {
                "startSpeed": 94.7,
                "endSpeed": 86.9,
                "strikeZoneTop": 3.43794258793256,
                "strikeZoneBottom": 1.56115633660037,
                "coordinates": {
                  "aY": 30.159684904863404,
                  "aZ": -18.409099201849113,
                  "pfxX": 5.057357603819857,
                  "pfxZ": 7.168304968833479,
                  "pX": -0.3851347152417332,
                  "pZ": 1.3712658943271065,
                  "vX0": -7.952761835510537,
                  "vY0": -137.5799885631979,
                  "vZ0": -8.28937994105905,
                  "x": 131.68,
                  "y": 201.76,
                  "x0": 1.884109196865569,
                  "y0": 50.00030833979534,
                  "z0": 5.667970383489086,
                  "aX": 9.707236321005045
                },
                "breaks": {
                  "breakAngle": 21.6,
                  "breakLength": 4.8,
                  "breakY": 24.0,
                  "spinRate": 1838,
                  "spinDirection": 129
                },
                "zone": 13,
                "typeConfidence": 0.96,
                "plateTime": 0.3979308100794108,
                "extension": 6.142915688675433
              },
              "index": 2,
              "playId": "aeab9624-a6b5-44d0-9785-ed27a4d018bc",
              "pitchNumber": 3,
              "startTime": "2022-11-02T00:56:10.286Z",
              "endTime": "2022-11-02T00:56:14.111Z",
              "isPitch": true,
              "type": "pitch"
            },
            {
              "details": {
                "call": { "code": "C", "description": "Called Strike" },
                "description": "Called Strike",
                "code": "C",
                "ballColor": "rgba(170, 21, 11, 1.0)",
                "trailColor": "rgba(50, 0, 221, 1.0)",
                "isInPlay": false,
                "isStrike": true,
                "isBall": false,
                "type": { "code": "SI", "description": "Sinker" },
                "isOut": false,
                "hasReview": false
              },
              "count": { "balls": 3, "strikes": 1, "outs": 0 },
              "pitchData": {
                "startSpeed": 93.2,
                "endSpeed": 85.0,
                "strikeZoneTop": 3.28312223727399,
                "strikeZoneBottom": 1.45721692642514,
                "coordinates": {
                  "aY": 30.686329497724802,
                  "aZ": -24.249794704036418,
                  "pfxX": 9.49205921724003,
                  "pfxZ": 4.2853833624405375,
                  "pX": -0.1819767246888798,
                  "pZ": 2.158242923675813,
                  "vX0": -8.672399307873778,
                  "vY0": -135.4018863710502,
                  "vZ0": -5.04759782595648,
                  "x": 123.94,
                  "y": 180.51,
                  "x0": 1.8355279655583643,
                  "y0": 50.004066260637586,
                  "z0": 5.7524730566791895,
                  "aX": 17.55503261966745
                },
                "breaks": {
                  "breakAngle": 31.2,
                  "breakLength": 6.0,
                  "breakY": 24.0,
                  "spinRate": 1990,
                  "spinDirection": 133
                },
                "zone": 5,
                "typeConfidence": 0.91,
                "plateTime": 0.4051588242826716,
                "extension": 6.166428354781339
              },
              "index": 3,
              "playId": "2002a197-a2a7-42b0-8bf7-9f518add57b7",
              "pitchNumber": 4,
              "startTime": "2022-11-02T00:56:26.569Z",
              "endTime": "2022-11-02T00:56:30.109Z",
              "isPitch": true,
              "type": "pitch"
            },
            {
              "details": {
                "call": { "code": "C", "description": "Called Strike" },
                "description": "Called Strike",
                "code": "C",
                "ballColor": "rgba(170, 21, 11, 1.0)",
                "trailColor": "rgba(188, 0, 33, 1.0)",
                "isInPlay": false,
                "isStrike": true,
                "isBall": false,
                "type": { "code": "FF", "description": "Four-Seam Fastball" },
                "isOut": false,
                "hasReview": false
              },
              "count": { "balls": 3, "strikes": 2, "outs": 0 },
              "pitchData": {
                "startSpeed": 94.0,
                "endSpeed": 86.1,
                "strikeZoneTop": 3.41214898057973,
                "strikeZoneBottom": 1.5871349971842,
                "coordinates": {
                  "aY": 29.765095057686505,
                  "aZ": -17.93061837534705,
                  "pfxX": 5.02930099168279,
                  "pfxZ": 7.52039602880073,
                  "pX": -0.6320824514510408,
                  "pZ": 2.3403745317504154,
                  "vX0": -8.252919363746416,
                  "vY0": -136.64503424829013,
                  "vZ0": -5.992321909955894,
                  "x": 141.09,
                  "y": 175.59,
                  "x0": 1.7721119638156744,
                  "y0": 50.000923587761704,
                  "z0": 5.791311697815729,
                  "aX": 9.52274218379789
                },
                "breaks": {
                  "breakAngle": 21.6,
                  "breakLength": 4.8,
                  "breakY": 24.0,
                  "spinRate": 1957,
                  "spinDirection": 129
                },
                "zone": 4,
                "typeConfidence": 0.96,
                "plateTime": 0.400662390944571,
                "extension": 6.006182228000516
              },
              "index": 4,
              "playId": "a4dab492-edff-44ad-ac5d-3ca31ea2eb6b",
              "pitchNumber": 5,
              "startTime": "2022-11-02T00:56:46.494Z",
              "endTime": "2022-11-02T00:56:49.826Z",
              "isPitch": true,
              "type": "pitch"
            },
            {
              "details": {
                "call": { "code": "C", "description": "Called Strike" },
                "description": "Called Strike",
                "code": "C",
                "ballColor": "rgba(170, 21, 11, 1.0)",
                "trailColor": "rgba(50, 0, 221, 1.0)",
                "isInPlay": false,
                "isStrike": true,
                "isBall": false,
                "type": { "code": "SI", "description": "Sinker" },
                "isOut": true,
                "hasReview": false
              },
              "count": { "balls": 3, "strikes": 3, "outs": 0 },
              "pitchData": {
                "startSpeed": 95.1,
                "endSpeed": 86.6,
                "strikeZoneTop": 3.386351426984,
                "strikeZoneBottom": 1.56115633660037,
                "coordinates": {
                  "aY": 31.95729605147549,
                  "aZ": -22.799831369445435,
                  "pfxX": 9.513650815521215,
                  "pfxZ": 4.879028723501502,
                  "pX": -0.6993010151936615,
                  "pZ": 2.517351442992309,
                  "vX0": -9.464231217453076,
                  "vY0": -138.05496538745533,
                  "vZ0": -4.895431247631188,
                  "x": 143.66,
                  "y": 170.81,
                  "x0": 1.5443043479890168,
                  "y0": 50.005968614300045,
                  "z0": 5.857034733929199,
                  "aX": 18.289683394668643
                },
                "breaks": {
                  "breakAngle": 33.6,
                  "breakLength": 6.0,
                  "breakY": 24.0,
                  "spinRate": 1984,
                  "spinDirection": 135
                },
                "zone": 4,
                "typeConfidence": 0.92,
                "plateTime": 0.3974012987882043,
                "extension": 6.161899933815555
              },
              "index": 5,
              "playId": "6b6e82d5-1fb2-474e-907c-e5fa08a37cb7",
              "pitchNumber": 6,
              "startTime": "2022-11-02T00:57:13.656Z",
              "endTime": "2022-11-02T00:57:17.720Z",
              "isPitch": true,
              "type": "pitch"
            }
          ],
          "playEndTime": "2022-11-02T00:57:17.720Z",
          "atBatIndex": 18
        },
        {
          "result": {
            "type": "atBat",
            "event": "Lineout",
            "eventType": "field_out",
            "description": "Jose Altuve lines out, pitcher Ranger Suarez to first baseman Rhys Hoskins.",
            "rbi": 0,
            "awayScore": 0,
            "homeScore": 4,
            "isOut": true
          },
          "about": {
            "atBatIndex": 19,
            "halfInning": "top",
            "isTopInning": true,
            "inning": 3,
            "startTime": "2022-11-02T00:57:24.396Z",
            "endTime": "2022-11-02T00:58:52.403Z",
            "isComplete": true,
            "isScoringPlay": false,
            "hasReview": false,
            "hasOut": true,
            "captivatingIndex": 0
          },
          "count": { "balls": 1, "strikes": 2, "outs": 2 },
          "matchup": {
            "batter": {
              "id": 514888,
              "fullName": "Jose Altuve",
              "link": "/api/v1/people/514888"
            },
            "batSide": { "code": "R", "description": "Right" },
            "pitcher": {
              "id": 624133,
              "fullName": "Ranger Suarez",
              "link": "/api/v1/people/624133"
            },
            "pitchHand": { "code": "L", "description": "Left" },
            "batterHotColdZones": [],
            "pitcherHotColdZones": [],
            "splits": {
              "batter": "vs_LHP",
              "pitcher": "vs_RHB",
              "menOnBase": "Empty"
            }
          },
          "pitchIndex": [0, 1, 2, 3],
          "actionIndex": [],
          "runnerIndex": [0],
          "runners": [
            {
              "movement": {
                "originBase": null,
                "start": null,
                "end": null,
                "outBase": "1B",
                "isOut": true,
                "outNumber": 2
              },
              "details": {
                "event": "Lineout",
                "eventType": "field_out",
                "movementReason": null,
                "runner": {
                  "id": 514888,
                  "fullName": "Jose Altuve",
                  "link": "/api/v1/people/514888"
                },
                "responsiblePitcher": null,
                "isScoringEvent": false,
                "rbi": false,
                "earned": false,
                "teamUnearned": false,
                "playIndex": 3
              },
              "credits": [
                {
                  "player": { "id": 624133, "link": "/api/v1/people/624133" },
                  "position": {
                    "code": "1",
                    "name": "Pitcher",
                    "type": "Pitcher",
                    "abbreviation": "P"
                  },
                  "credit": "f_assist"
                },
                {
                  "player": { "id": 656555, "link": "/api/v1/people/656555" },
                  "position": {
                    "code": "3",
                    "name": "First Base",
                    "type": "Infielder",
                    "abbreviation": "1B"
                  },
                  "credit": "f_putout"
                }
              ]
            }
          ],
          "playEvents": [
            {
              "details": {
                "call": { "code": "B", "description": "Ball" },
                "description": "Ball",
                "code": "B",
                "ballColor": "rgba(39, 161, 39, 1.0)",
                "trailColor": "rgba(152, 0, 101, 1.0)",
                "isInPlay": false,
                "isStrike": false,
                "isBall": true,
                "type": { "code": "FC", "description": "Cutter" },
                "isOut": false,
                "hasReview": false
              },
              "count": { "balls": 1, "strikes": 0, "outs": 1 },
              "pitchData": {
                "startSpeed": 88.2,
                "endSpeed": 81.1,
                "strikeZoneTop": 2.94116269367735,
                "strikeZoneBottom": 1.32973357668169,
                "coordinates": {
                  "aY": 26.415545435022104,
                  "aZ": -24.855082349421224,
                  "pfxX": -2.471388232050377,
                  "pfxZ": 4.379106160218332,
                  "pX": 0.7942256142131373,
                  "pZ": 2.1532275158382617,
                  "vX0": -2.3171165159600067,
                  "vY0": -128.44095785615144,
                  "vZ0": -4.3296010872177,
                  "x": 86.73,
                  "y": 180.64,
                  "x0": 2.0289354247777878,
                  "y0": 50.0039763231829,
                  "z0": 5.7917752722270865,
                  "aX": -4.1325288358970065
                },
                "breaks": {
                  "breakAngle": 9.6,
                  "breakLength": 6.0,
                  "breakY": 24.0,
                  "spinRate": 2122,
                  "spinDirection": 159
                },
                "zone": 6,
                "typeConfidence": 0.89,
                "plateTime": 0.42631805664283995,
                "extension": 6.107771466211196
              },
              "index": 0,
              "playId": "e70c80d0-8553-409a-8783-52e5930bde6b",
              "pitchNumber": 1,
              "startTime": "2022-11-02T00:57:46.102Z",
              "endTime": "2022-11-02T00:57:51.032Z",
              "isPitch": true,
              "type": "pitch"
            },
            {
              "details": {
                "call": { "code": "C", "description": "Called Strike" },
                "description": "Called Strike",
                "code": "C",
                "ballColor": "rgba(170, 21, 11, 1.0)",
                "trailColor": "rgba(0, 34, 255, 1.0)",
                "isInPlay": false,
                "isStrike": true,
                "isBall": false,
                "type": { "code": "CU", "description": "Curveball" },
                "isOut": false,
                "hasReview": false
              },
              "count": { "balls": 1, "strikes": 1, "outs": 1 },
              "pitchData": {
                "startSpeed": 78.7,
                "endSpeed": 72.6,
                "strikeZoneTop": 2.92134856895108,
                "strikeZoneBottom": 1.27523166067853,
                "coordinates": {
                  "aY": 21.51158666376438,
                  "aZ": -38.35477528221209,
                  "pfxX": -4.491110700126299,
                  "pfxZ": -4.662093966981274,
                  "pX": -0.5066097956103389,
                  "pZ": 2.213358582480199,
                  "vX0": -3.778746545940178,
                  "vY0": -114.51893881138555,
                  "vZ0": 0.008944755211627076,
                  "x": 136.31,
                  "y": 179.02,
                  "x0": 1.7494038040841944,
                  "y0": 50.00315554217884,
                  "z0": 5.9669836437570565,
                  "aX": -5.953408939017162
                },
                "breaks": {
                  "breakAngle": 9.6,
                  "breakLength": 12.0,
                  "breakY": 24.0,
                  "spinRate": 2290,
                  "spinDirection": 306
                },
                "zone": 4,
                "typeConfidence": 0.86,
                "plateTime": 0.4786267372902544,
                "extension": 6.3132384541009925
              },
              "index": 1,
              "playId": "5350f46b-9f78-4617-a568-fdab98f325df",
              "pitchNumber": 2,
              "startTime": "2022-11-02T00:58:04.394Z",
              "endTime": "2022-11-02T00:58:07.724Z",
              "isPitch": true,
              "type": "pitch"
            },
            {
              "details": {
                "call": { "code": "F", "description": "Foul" },
                "description": "Foul",
                "code": "F",
                "ballColor": "rgba(170, 21, 11, 1.0)",
                "trailColor": "rgba(188, 0, 33, 1.0)",
                "isInPlay": false,
                "isStrike": true,
                "isBall": false,
                "type": { "code": "FF", "description": "Four-Seam Fastball" },
                "isOut": false,
                "hasReview": false
              },
              "count": { "balls": 1, "strikes": 2, "outs": 1 },
              "pitchData": {
                "startSpeed": 94.7,
                "endSpeed": 86.6,
                "strikeZoneTop": 2.84,
                "strikeZoneBottom": 1.3,
                "coordinates": {
                  "aY": 30.79909429753807,
                  "aZ": -19.359098267367937,
                  "pfxX": 4.911417072378917,
                  "pfxZ": 6.6802048247808266,
                  "pX": -0.36129648394871317,
                  "pZ": 2.7856864234202545,
                  "vX0": -7.822915937019049,
                  "vY0": -137.68209106201968,
                  "vZ0": -4.382918426666458,
                  "x": 130.77,
                  "y": 163.57,
                  "x0": 1.8797898745320345,
                  "y0": 50.003833683169894,
                  "z0": 5.709855300872425,
                  "aX": 9.423353848200005
                },
                "breaks": {
                  "breakAngle": 20.4,
                  "breakLength": 4.8,
                  "breakY": 24.0,
                  "spinRate": 2019,
                  "spinDirection": 128
                },
                "zone": 1,
                "typeConfidence": 0.96,
                "plateTime": 0.39795301119559534,
                "extension": 6.037963599839008
              },
              "index": 2,
              "playId": "e77980b4-cc50-43da-b584-44a34aded4d5",
              "pitchNumber": 3,
              "startTime": "2022-11-02T00:58:20.775Z",
              "endTime": "2022-11-02T00:58:24.338Z",
              "isPitch": true,
              "type": "pitch"
            },
            {
              "details": {
                "call": { "code": "X", "description": "In play, out(s)" },
                "description": "In play, out(s)",
                "code": "X",
                "ballColor": "rgba(26, 86, 190, 1.0)",
                "trailColor": "rgba(0, 34, 255, 1.0)",
                "isInPlay": true,
                "isStrike": false,
                "isBall": false,
                "type": { "code": "CU", "description": "Curveball" },
                "isOut": true,
                "hasReview": false
              },
              "count": { "balls": 1, "strikes": 2, "outs": 1 },
              "pitchData": {
                "startSpeed": 78.9,
                "endSpeed": 72.3,
                "strikeZoneTop": 2.84,
                "strikeZoneBottom": 1.3,
                "coordinates": {
                  "aY": 23.751802701382744,
                  "aZ": -40.66210613975962,
                  "pfxX": -6.3293786062766575,
                  "pfxZ": -6.439441238586642,
                  "pX": 0.2294210706841861,
                  "pZ": 1.94399892403225,
                  "vX0": -1.7196708822306406,
                  "vY0": -114.84708986725545,
                  "vZ0": -0.018667640011242437,
                  "x": 108.26,
                  "y": 186.29,
                  "x0": 1.8122773887447547,
                  "y0": 50.000416186620576,
                  "z0": 5.948647645838233,
                  "aX": -8.347601657712392
                },
                "breaks": {
                  "breakAngle": 12.0,
                  "breakLength": 13.2,
                  "breakY": 24.0,
                  "spinRate": 2238,
                  "spinDirection": 309
                },
                "zone": 5,
                "typeConfidence": 0.78,
                "plateTime": 0.47921007235099866,
                "extension": 6.178403890267316
              },
              "hitData": {
                "launchSpeed": 90.5,
                "launchAngle": 7.0,
                "totalDistance": 108.0,
                "trajectory": "line_drive",
                "hardness": "medium",
                "location": "1",
                "coordinates": { "coordX": 127.69, "coordY": 182.5 }
              },
              "index": 3,
              "playId": "87ca3ee4-c5bf-4e79-bc83-2281ecd00632",
              "pitchNumber": 4,
              "startTime": "2022-11-02T00:58:46.398Z",
              "endTime": "2022-11-02T00:58:52.403Z",
              "isPitch": true,
              "type": "pitch"
            }
          ],
          "playEndTime": "2022-11-02T00:58:52.403Z",
          "atBatIndex": 19
        },
        {
          "result": {
            "type": "atBat",
            "event": "Groundout",
            "eventType": "field_out",
            "description": "Jeremy Pena grounds out, third baseman Alec Bohm to first baseman Rhys Hoskins.",
            "rbi": 0,
            "awayScore": 0,
            "homeScore": 4,
            "isOut": true
          },
          "about": {
            "atBatIndex": 20,
            "halfInning": "top",
            "isTopInning": true,
            "inning": 3,
            "startTime": "2022-11-02T00:59:05.056Z",
            "endTime": "2022-11-02T01:00:06.128Z",
            "isComplete": true,
            "isScoringPlay": false,
            "hasReview": false,
            "hasOut": true,
            "captivatingIndex": 0
          },
          "count": { "balls": 1, "strikes": 1, "outs": 3 },
          "matchup": {
            "batter": {
              "id": 665161,
              "fullName": "Jeremy Pena",
              "link": "/api/v1/people/665161"
            },
            "batSide": { "code": "R", "description": "Right" },
            "pitcher": {
              "id": 624133,
              "fullName": "Ranger Suarez",
              "link": "/api/v1/people/624133"
            },
            "pitchHand": { "code": "L", "description": "Left" },
            "batterHotColdZones": [],
            "pitcherHotColdZones": [],
            "splits": {
              "batter": "vs_LHP",
              "pitcher": "vs_RHB",
              "menOnBase": "Empty"
            }
          },
          "pitchIndex": [0, 1, 2],
          "actionIndex": [],
          "runnerIndex": [0],
          "runners": [
            {
              "movement": {
                "originBase": null,
                "start": null,
                "end": null,
                "outBase": "1B",
                "isOut": true,
                "outNumber": 3
              },
              "details": {
                "event": "Groundout",
                "eventType": "field_out",
                "movementReason": null,
                "runner": {
                  "id": 665161,
                  "fullName": "Jeremy Pena",
                  "link": "/api/v1/people/665161"
                },
                "responsiblePitcher": null,
                "isScoringEvent": false,
                "rbi": false,
                "earned": false,
                "teamUnearned": false,
                "playIndex": 2
              },
              "credits": [
                {
                  "player": { "id": 664761, "link": "/api/v1/people/664761" },
                  "position": {
                    "code": "5",
                    "name": "Third Base",
                    "type": "Infielder",
                    "abbreviation": "3B"
                  },
                  "credit": "f_assist"
                },
                {
                  "player": { "id": 656555, "link": "/api/v1/people/656555" },
                  "position": {
                    "code": "3",
                    "name": "First Base",
                    "type": "Infielder",
                    "abbreviation": "1B"
                  },
                  "credit": "f_putout"
                }
              ]
            }
          ],
          "playEvents": [
            {
              "details": {
                "call": { "code": "B", "description": "Ball" },
                "description": "Ball",
                "code": "B",
                "ballColor": "rgba(39, 161, 39, 1.0)",
                "trailColor": "rgba(0, 85, 254, 1.0)",
                "isInPlay": false,
                "isStrike": false,
                "isBall": true,
                "type": { "code": "CH", "description": "Changeup" },
                "isOut": false,
                "hasReview": false
              },
              "count": { "balls": 1, "strikes": 0, "outs": 2 },
              "pitchData": {
                "startSpeed": 85.9,
                "endSpeed": 78.4,
                "strikeZoneTop": 3.61838530920212,
                "strikeZoneBottom": 1.7689133355097,
                "coordinates": {
                  "aY": 26.74947922837057,
                  "aZ": -27.409837872166385,
                  "pfxX": 7.972809182006516,
                  "pfxZ": 3.0324764995510503,
                  "pX": 1.6766153115147735,
                  "pZ": 2.717386588244882,
                  "vX0": -3.356553422161444,
                  "vY0": -125.04453201341502,
                  "vZ0": -1.8066103148945518,
                  "x": 53.09,
                  "y": 165.41,
                  "x0": 2.005244422426251,
                  "y0": 50.005593809023466,
                  "z0": 5.712259469904714,
                  "aX": 12.54556337643146
                },
                "breaks": {
                  "breakAngle": 22.8,
                  "breakLength": 8.4,
                  "breakY": 24.0,
                  "spinRate": 1445,
                  "spinDirection": 123
                },
                "zone": 12,
                "typeConfidence": 0.86,
                "plateTime": 0.43911820728637796,
                "extension": 6.018475330340588
              },
              "index": 0,
              "playId": "23d18e5c-25ec-4649-8282-2422586686be",
              "pitchNumber": 1,
              "startTime": "2022-11-02T00:59:28.405Z",
              "endTime": "2022-11-02T00:59:31.701Z",
              "isPitch": true,
              "type": "pitch"
            },
            {
              "details": {
                "call": { "code": "S", "description": "Swinging Strike" },
                "description": "Swinging Strike",
                "code": "S",
                "ballColor": "rgba(170, 21, 11, 1.0)",
                "trailColor": "rgba(0, 85, 254, 1.0)",
                "isInPlay": false,
                "isStrike": true,
                "isBall": false,
                "type": { "code": "CH", "description": "Changeup" },
                "isOut": false,
                "hasReview": false
              },
              "count": { "balls": 1, "strikes": 1, "outs": 2 },
              "pitchData": {
                "startSpeed": 85.9,
                "endSpeed": 78.5,
                "strikeZoneTop": 3.63,
                "strikeZoneBottom": 1.75,
                "coordinates": {
                  "aY": 26.786023602790603,
                  "aZ": -26.696192187795532,
                  "pfxX": 8.063575329937096,
                  "pfxZ": 3.4910141506441876,
                  "pX": 0.6056236512555709,
                  "pZ": 1.5489806381619484,
                  "vX0": -5.650026984165705,
                  "vY0": -124.89479511289719,
                  "vZ0": -4.790617795040172,
                  "x": 93.92,
                  "y": 196.96,
                  "x0": 1.8574013742294713,
                  "y0": 50.00314612973032,
                  "z0": 5.705974458004549,
                  "aX": 12.650808396974286
                },
                "breaks": {
                  "breakAngle": 22.8,
                  "breakLength": 7.2,
                  "breakY": 24.0,
                  "spinRate": 1384,
                  "spinDirection": 121
                },
                "zone": 14,
                "typeConfidence": 0.87,
                "plateTime": 0.43971918968673096,
                "extension": 6.259681010411258
              },
              "index": 1,
              "playId": "6685302c-9743-4f7f-9de4-0a843965f8f2",
              "pitchNumber": 2,
              "startTime": "2022-11-02T00:59:40.503Z",
              "endTime": "2022-11-02T00:59:43.691Z",
              "isPitch": true,
              "type": "pitch"
            },
            {
              "details": {
                "call": { "code": "X", "description": "In play, out(s)" },
                "description": "In play, out(s)",
                "code": "X",
                "ballColor": "rgba(26, 86, 190, 1.0)",
                "trailColor": "rgba(0, 85, 254, 1.0)",
                "isInPlay": true,
                "isStrike": false,
                "isBall": false,
                "type": { "code": "CH", "description": "Changeup" },
                "isOut": true,
                "hasReview": false
              },
              "count": { "balls": 1, "strikes": 1, "outs": 2 },
              "pitchData": {
                "startSpeed": 85.6,
                "endSpeed": 78.5,
                "strikeZoneTop": 3.63,
                "strikeZoneBottom": 1.75,
                "coordinates": {
                  "aY": 24.98105788628775,
                  "aZ": -24.221991240162545,
                  "pfxX": 6.252135662997206,
                  "pfxZ": 5.0659254528910544,
                  "pX": 0.20101972660177408,
                  "pZ": 2.1935640024714083,
                  "vX0": -6.008523690561363,
                  "vY0": -124.47271011384181,
                  "vZ0": -3.447381507906641,
                  "x": 109.34,
                  "y": 179.55,
                  "x0": 1.833904146106427,
                  "y0": 50.00086702111713,
                  "z0": 5.601951739576353,
                  "aX": 9.809790160963514
                },
                "breaks": {
                  "breakAngle": 19.2,
                  "breakLength": 7.2,
                  "breakY": 24.0,
                  "spinRate": 1404,
                  "spinDirection": 119
                },
                "zone": 8,
                "typeConfidence": 0.9,
                "plateTime": 0.44003970752737587,
                "extension": 6.096040761897041
              },
              "hitData": {
                "launchSpeed": 96.7,
                "launchAngle": -6.0,
                "totalDistance": 20.0,
                "trajectory": "ground_ball",
                "hardness": "medium",
                "location": "5",
                "coordinates": { "coordX": 102.34, "coordY": 161.21 }
              },
              "index": 2,
              "playId": "a9de0aa2-f8cb-4235-b166-39c43c482d25",
              "pitchNumber": 3,
              "startTime": "2022-11-02T00:59:57.379Z",
              "endTime": "2022-11-02T01:00:06.128Z",
              "isPitch": true,
              "type": "pitch"
            }
          ],
          "playEndTime": "2022-11-02T01:00:06.128Z",
          "atBatIndex": 20
        },
        {
          "result": {
            "type": "atBat",
            "event": "Strikeout",
            "eventType": "strikeout",
            "description": "Rhys Hoskins strikes out swinging.",
            "rbi": 0,
            "awayScore": 0,
            "homeScore": 4,
            "isOut": true
          },
          "about": {
            "atBatIndex": 21,
            "halfInning": "bottom",
            "isTopInning": false,
            "inning": 3,
            "startTime": "2022-11-02T01:03:18.723Z",
            "endTime": "2022-11-02T01:04:34.732Z",
            "isComplete": true,
            "isScoringPlay": false,
            "hasReview": false,
            "hasOut": true,
            "captivatingIndex": 14
          },
          "count": { "balls": 0, "strikes": 3, "outs": 1 },
          "matchup": {
            "batter": {
              "id": 656555,
              "fullName": "Rhys Hoskins",
              "link": "/api/v1/people/656555"
            },
            "batSide": { "code": "R", "description": "Right" },
            "pitcher": {
              "id": 621121,
              "fullName": "Lance McCullers Jr.",
              "link": "/api/v1/people/621121"
            },
            "pitchHand": { "code": "R", "description": "Right" },
            "batterHotColdZones": [],
            "pitcherHotColdZones": [],
            "splits": {
              "batter": "vs_RHP",
              "pitcher": "vs_RHB",
              "menOnBase": "Empty"
            }
          },
          "pitchIndex": [0, 1, 2, 3],
          "actionIndex": [],
          "runnerIndex": [0],
          "runners": [
            {
              "movement": {
                "originBase": null,
                "start": null,
                "end": null,
                "outBase": "1B",
                "isOut": true,
                "outNumber": 1
              },
              "details": {
                "event": "Strikeout",
                "eventType": "strikeout",
                "movementReason": null,
                "runner": {
                  "id": 656555,
                  "fullName": "Rhys Hoskins",
                  "link": "/api/v1/people/656555"
                },
                "responsiblePitcher": null,
                "isScoringEvent": false,
                "rbi": false,
                "earned": false,
                "teamUnearned": false,
                "playIndex": 3
              },
              "credits": [
                {
                  "player": { "id": 455117, "link": "/api/v1/people/455117" },
                  "position": {
                    "code": "2",
                    "name": "Catcher",
                    "type": "Catcher",
                    "abbreviation": "C"
                  },
                  "credit": "f_putout"
                }
              ]
            }
          ],
          "playEvents": [
            {
              "details": {
                "call": { "code": "C", "description": "Called Strike" },
                "description": "Called Strike",
                "code": "C",
                "ballColor": "rgba(170, 21, 11, 1.0)",
                "trailColor": "rgba(0, 0, 254, 1.0)",
                "isInPlay": false,
                "isStrike": true,
                "isBall": false,
                "type": { "code": "SL", "description": "Slider" },
                "isOut": false,
                "hasReview": false
              },
              "count": { "balls": 0, "strikes": 1, "outs": 0 },
              "pitchData": {
                "startSpeed": 84.3,
                "endSpeed": 77.1,
                "strikeZoneTop": 3.61838530920212,
                "strikeZoneBottom": 1.74295292927551,
                "coordinates": {
                  "aY": 25.51743204563235,
                  "aZ": -26.80316234077242,
                  "pfxX": 8.306781115951338,
                  "pfxZ": 3.535595873000082,
                  "pX": 0.5318170178478965,
                  "pZ": 2.5474230968739042,
                  "vX0": 2.533113526991468,
                  "vY0": -122.76383093333628,
                  "vZ0": -0.49840575542502014,
                  "x": 96.73,
                  "y": 170.0,
                  "x0": -1.593757779996165,
                  "y0": 50.00058373164046,
                  "z0": 5.0451776831403325,
                  "aX": 12.60911204884027
                },
                "breaks": {
                  "breakAngle": 26.4,
                  "breakLength": 8.4,
                  "breakY": 24.0,
                  "spinRate": 2818,
                  "spinDirection": 82
                },
                "zone": 6,
                "typeConfidence": 0.91,
                "plateTime": 0.4470745217182919,
                "extension": 5.8622066793423375
              },
              "index": 0,
              "playId": "f41730c5-436f-45c7-a4b8-06ad2e3c8f46",
              "pitchNumber": 1,
              "startTime": "2022-11-02T01:03:36.756Z",
              "endTime": "2022-11-02T01:03:39.911Z",
              "isPitch": true,
              "type": "pitch"
            },
            {
              "details": {
                "call": { "code": "S", "description": "Swinging Strike" },
                "description": "Swinging Strike",
                "code": "S",
                "ballColor": "rgba(170, 21, 11, 1.0)",
                "trailColor": "rgba(0, 85, 254, 1.0)",
                "isInPlay": false,
                "isStrike": true,
                "isBall": false,
                "type": { "code": "CH", "description": "Changeup" },
                "isOut": false,
                "hasReview": false
              },
              "count": { "balls": 0, "strikes": 2, "outs": 0 },
              "pitchData": {
                "startSpeed": 86.4,
                "endSpeed": 79.4,
                "strikeZoneTop": 3.63,
                "strikeZoneBottom": 1.71,
                "coordinates": {
                  "aY": 25.72310655218559,
                  "aZ": -34.976600633762494,
                  "pfxX": -8.609484035326528,
                  "pfxZ": -1.7527183754288007,
                  "pX": -0.9840520449226252,
                  "pZ": 1.808476701538412,
                  "vX0": 3.720554186411733,
                  "vY0": -125.74479348926288,
                  "vZ0": -1.273000591359869,
                  "x": 154.51,
                  "y": 189.95,
                  "x0": -1.3650859125456358,
                  "y0": 50.00189165650693,
                  "z0": 5.161409651247118,
                  "aX": -13.773234741442044
                },
                "breaks": {
                  "breakAngle": 20.4,
                  "breakLength": 9.6,
                  "breakY": 24.0,
                  "spinRate": 1671,
                  "spinDirection": 261
                },
                "zone": 13,
                "typeConfidence": 0.9,
                "plateTime": 0.4357414362542271,
                "extension": 5.624252537176534
              },
              "index": 1,
              "playId": "14bd11e5-493f-4bb4-ae9b-833592d04fc5",
              "pitchNumber": 2,
              "startTime": "2022-11-02T01:03:50.383Z",
              "endTime": "2022-11-02T01:03:53.383Z",
              "isPitch": true,
              "type": "pitch"
            },
            {
              "details": {
                "call": { "code": "F", "description": "Foul" },
                "description": "Foul",
                "code": "F",
                "ballColor": "rgba(170, 21, 11, 1.0)",
                "trailColor": "rgba(0, 0, 254, 1.0)",
                "isInPlay": false,
                "isStrike": true,
                "isBall": false,
                "type": { "code": "SL", "description": "Slider" },
                "isOut": false,
                "hasReview": false
              },
              "count": { "balls": 0, "strikes": 2, "outs": 0 },
              "pitchData": {
                "startSpeed": 85.3,
                "endSpeed": 78.1,
                "strikeZoneTop": 3.63,
                "strikeZoneBottom": 1.71,
                "coordinates": {
                  "aY": 26.35974643188814,
                  "aZ": -27.267805958356163,
                  "pfxX": 9.569055346092965,
                  "pfxZ": 3.155700511580047,
                  "pX": 0.66344435747696,
                  "pZ": 2.0801219910016737,
                  "vX0": 2.5420374828520793,
                  "vY0": -124.22912849480655,
                  "vZ0": -1.5846504041042824,
                  "x": 91.71,
                  "y": 182.62,
                  "x0": -1.6174130217867517,
                  "y0": 50.00030246409071,
                  "z0": 5.00660278293862,
                  "aX": 14.858113037550277
                },
                "breaks": {
                  "breakAngle": 28.8,
                  "breakLength": 8.4,
                  "breakY": 24.0,
                  "spinRate": 2914,
                  "spinDirection": 76
                },
                "zone": 9,
                "typeConfidence": 0.91,
                "plateTime": 0.4419688411288649,
                "extension": 5.754636354571967
              },
              "index": 2,
              "playId": "d1cfc6b3-9ab9-4f46-8a17-561bd3e30700",
              "pitchNumber": 3,
              "startTime": "2022-11-02T01:04:07.576Z",
              "endTime": "2022-11-02T01:04:11.192Z",
              "isPitch": true,
              "type": "pitch"
            },
            {
              "details": {
                "call": { "code": "S", "description": "Swinging Strike" },
                "description": "Swinging Strike",
                "code": "S",
                "ballColor": "rgba(170, 21, 11, 1.0)",
                "trailColor": "rgba(0, 85, 254, 1.0)",
                "isInPlay": false,
                "isStrike": true,
                "isBall": false,
                "type": { "code": "CH", "description": "Changeup" },
                "isOut": true,
                "hasReview": false
              },
              "count": { "balls": 0, "strikes": 3, "outs": 0 },
              "pitchData": {
                "startSpeed": 87.8,
                "endSpeed": 80.7,
                "strikeZoneTop": 3.63,
                "strikeZoneBottom": 1.71,
                "coordinates": {
                  "aY": 26.71878204858633,
                  "aZ": -35.13781719364093,
                  "pfxX": -10.601130659306348,
                  "pfxZ": -1.7939970758232802,
                  "pX": -0.5347649458757613,
                  "pZ": 1.0457456566047472,
                  "vX0": 5.5497520038632056,
                  "vY0": -127.73181091515282,
                  "vZ0": -3.1567100834948216,
                  "x": 137.38,
                  "y": 210.54,
                  "x0": -1.3601328540065496,
                  "y0": 50.00585161548156,
                  "z0": 5.0653209627289515,
                  "aX": -17.490955522747782
                },
                "breaks": {
                  "breakAngle": 25.2,
                  "breakLength": 9.6,
                  "breakY": 24.0,
                  "spinRate": 1763,
                  "spinDirection": 271
                },
                "zone": 13,
                "typeConfidence": 0.91,
                "plateTime": 0.4290820274146405,
                "extension": 5.53006754914657
              },
              "index": 3,
              "playId": "af60f58c-73d9-4dbb-931d-5e8df0484dee",
              "pitchNumber": 4,
              "startTime": "2022-11-02T01:04:30.691Z",
              "endTime": "2022-11-02T01:04:34.732Z",
              "isPitch": true,
              "type": "pitch"
            }
          ],
          "playEndTime": "2022-11-02T01:04:34.732Z",
          "atBatIndex": 21
        },
        {
          "result": {
            "type": "atBat",
            "event": "Strikeout",
            "eventType": "strikeout",
            "description": "J.T. Realmuto strikes out swinging.",
            "rbi": 0,
            "awayScore": 0,
            "homeScore": 4,
            "isOut": true
          },
          "about": {
            "atBatIndex": 22,
            "halfInning": "bottom",
            "isTopInning": false,
            "inning": 3,
            "startTime": "2022-11-02T01:04:48.723Z",
            "endTime": "2022-11-02T01:06:11.042Z",
            "isComplete": true,
            "isScoringPlay": false,
            "hasReview": false,
            "hasOut": true,
            "captivatingIndex": 14
          },
          "count": { "balls": 1, "strikes": 3, "outs": 2 },
          "matchup": {
            "batter": {
              "id": 592663,
              "fullName": "J.T. Realmuto",
              "link": "/api/v1/people/592663"
            },
            "batSide": { "code": "R", "description": "Right" },
            "pitcher": {
              "id": 621121,
              "fullName": "Lance McCullers Jr.",
              "link": "/api/v1/people/621121"
            },
            "pitchHand": { "code": "R", "description": "Right" },
            "batterHotColdZones": [],
            "pitcherHotColdZones": [],
            "splits": {
              "batter": "vs_RHP",
              "pitcher": "vs_RHB",
              "menOnBase": "Empty"
            }
          },
          "pitchIndex": [0, 1, 2, 3],
          "actionIndex": [],
          "runnerIndex": [0],
          "runners": [
            {
              "movement": {
                "originBase": null,
                "start": null,
                "end": null,
                "outBase": "1B",
                "isOut": true,
                "outNumber": 2
              },
              "details": {
                "event": "Strikeout",
                "eventType": "strikeout",
                "movementReason": null,
                "runner": {
                  "id": 592663,
                  "fullName": "J.T. Realmuto",
                  "link": "/api/v1/people/592663"
                },
                "responsiblePitcher": null,
                "isScoringEvent": false,
                "rbi": false,
                "earned": false,
                "teamUnearned": false,
                "playIndex": 3
              },
              "credits": [
                {
                  "player": { "id": 455117, "link": "/api/v1/people/455117" },
                  "position": {
                    "code": "2",
                    "name": "Catcher",
                    "type": "Catcher",
                    "abbreviation": "C"
                  },
                  "credit": "f_putout"
                }
              ]
            }
          ],
          "playEvents": [
            {
              "details": {
                "call": { "code": "F", "description": "Foul" },
                "description": "Foul",
                "code": "F",
                "ballColor": "rgba(170, 21, 11, 1.0)",
                "trailColor": "rgba(0, 0, 254, 1.0)",
                "isInPlay": false,
                "isStrike": true,
                "isBall": false,
                "type": { "code": "SL", "description": "Slider" },
                "isOut": false,
                "hasReview": false
              },
              "count": { "balls": 0, "strikes": 1, "outs": 1 },
              "pitchData": {
                "startSpeed": 85.2,
                "endSpeed": 78.1,
                "strikeZoneTop": 3.63,
                "strikeZoneBottom": 1.69,
                "coordinates": {
                  "aY": 25.04997722850145,
                  "aZ": -27.036206679416352,
                  "pfxX": 8.39728535769364,
                  "pfxZ": 3.2951238425644735,
                  "pX": -0.14582762867743343,
                  "pZ": 2.9987029677175836,
                  "vX0": 0.9616680650380838,
                  "vY0": -124.15293045895002,
                  "vZ0": 0.39521831642815364,
                  "x": 122.56,
                  "y": 157.82,
                  "x0": -1.6292030008107168,
                  "y0": 50.00376193185601,
                  "z0": 5.089080293552756,
                  "aX": 13.098073727545549
                },
                "breaks": {
                  "breakAngle": 26.4,
                  "breakLength": 8.4,
                  "breakY": 24.0,
                  "spinRate": 2937,
                  "spinDirection": 90
                },
                "zone": 5,
                "typeConfidence": 0.91,
                "plateTime": 0.44130823114237305,
                "extension": 5.809541983519987
              },
              "index": 0,
              "playId": "1d8f17d0-a9b7-43ad-bf82-281677c39246",
              "pitchNumber": 1,
              "startTime": "2022-11-02T01:05:09.105Z",
              "endTime": "2022-11-02T01:05:12.637Z",
              "isPitch": true,
              "type": "pitch"
            },
            {
              "details": {
                "call": { "code": "B", "description": "Ball" },
                "description": "Ball",
                "code": "B",
                "ballColor": "rgba(39, 161, 39, 1.0)",
                "trailColor": "rgba(0, 0, 254, 1.0)",
                "isInPlay": false,
                "isStrike": false,
                "isBall": true,
                "type": { "code": "SL", "description": "Slider" },
                "isOut": false,
                "hasReview": false
              },
              "count": { "balls": 1, "strikes": 1, "outs": 1 },
              "pitchData": {
                "startSpeed": 85.3,
                "endSpeed": 77.9,
                "strikeZoneTop": 3.62642747133816,
                "strikeZoneBottom": 1.74295292927551,
                "coordinates": {
                  "aY": 27.611481600779026,
                  "aZ": -27.771607551457997,
                  "pfxX": 6.150054653938247,
                  "pfxZ": 2.8659596403746708,
                  "pX": 1.56882624246659,
                  "pZ": 0.35926774831582725,
                  "vX0": 5.7136271757995845,
                  "vY0": -123.93686981195329,
                  "vZ0": -5.0787917546025465,
                  "x": 57.2,
                  "y": 229.08,
                  "x0": -1.575947245398792,
                  "y0": 50.00485636848705,
                  "z0": 4.7893567336150245,
                  "aX": 9.448810233447043
                },
                "breaks": {
                  "breakAngle": 20.4,
                  "breakLength": 8.4,
                  "breakY": 24.0,
                  "spinRate": 3046,
                  "spinDirection": 72
                },
                "zone": 14,
                "typeConfidence": 0.9,
                "plateTime": 0.44405136034976334,
                "extension": 5.835412509406669
              },
              "index": 1,
              "playId": "ca47f672-8c6b-4603-8648-1b29c8faf561",
              "pitchNumber": 2,
              "startTime": "2022-11-02T01:05:28.637Z",
              "endTime": "2022-11-02T01:05:31.637Z",
              "isPitch": true,
              "type": "pitch"
            },
            {
              "details": {
                "call": { "code": "F", "description": "Foul" },
                "description": "Foul",
                "code": "F",
                "ballColor": "rgba(170, 21, 11, 1.0)",
                "trailColor": "rgba(50, 0, 221, 1.0)",
                "isInPlay": false,
                "isStrike": true,
                "isBall": false,
                "type": { "code": "SI", "description": "Sinker" },
                "isOut": false,
                "hasReview": false
              },
              "count": { "balls": 1, "strikes": 2, "outs": 1 },
              "pitchData": {
                "startSpeed": 94.7,
                "endSpeed": 86.5,
                "strikeZoneTop": 3.63,
                "strikeZoneBottom": 1.69,
                "coordinates": {
                  "aY": 31.618446670554274,
                  "aZ": -29.623033560640785,
                  "pfxX": -9.07174423384224,
                  "pfxZ": 1.3285229105123548,
                  "pX": -0.08192811812167382,
                  "pZ": 2.1563128930212443,
                  "vX0": 6.4309354841389315,
                  "vY0": -137.7967032665299,
                  "vZ0": -2.5431172522713883,
                  "x": 120.12,
                  "y": 180.56,
                  "x0": -1.2715470143445562,
                  "y0": 50.00040666691938,
                  "z0": 5.09969511573298,
                  "aX": -17.382272985453895
                },
                "breaks": {
                  "breakAngle": 27.6,
                  "breakLength": 7.2,
                  "breakY": 24.0,
                  "spinRate": 2196,
                  "spinDirection": 238
                },
                "zone": 8,
                "typeConfidence": 0.9,
                "plateTime": 0.39802735184042826,
                "extension": 5.891510800539394
              },
              "index": 2,
              "playId": "df0f1416-9797-4cca-8108-f50716a8eebc",
              "pitchNumber": 3,
              "startTime": "2022-11-02T01:05:46.120Z",
              "endTime": "2022-11-02T01:05:49.132Z",
              "isPitch": true,
              "type": "pitch"
            },
            {
              "details": {
                "call": { "code": "S", "description": "Swinging Strike" },
                "description": "Swinging Strike",
                "code": "S",
                "ballColor": "rgba(170, 21, 11, 1.0)",
                "trailColor": "rgba(0, 85, 254, 1.0)",
                "isInPlay": false,
                "isStrike": true,
                "isBall": false,
                "type": { "code": "CH", "description": "Changeup" },
                "isOut": true,
                "hasReview": false
              },
              "count": { "balls": 1, "strikes": 3, "outs": 1 },
              "pitchData": {
                "startSpeed": 87.8,
                "endSpeed": 80.0,
                "strikeZoneTop": 3.63,
                "strikeZoneBottom": 1.69,
                "coordinates": {
                  "aY": 29.302719570919223,
                  "aZ": -34.081263859916454,
                  "pfxX": -10.838135919353787,
                  "pfxZ": -1.1734503312768023,
                  "pX": -1.3032436801676643,
                  "pZ": 0.9660801832003407,
                  "vX0": 3.7828343948609042,
                  "vY0": -127.7220995621708,
                  "vZ0": -3.258652401570658,
                  "x": 166.68,
                  "y": 212.7,
                  "x0": -1.4061668837070829,
                  "y0": 50.00024389550656,
                  "z0": 4.97275844129476,
                  "aX": -17.68431034296602
                },
                "breaks": {
                  "breakAngle": 26.4,
                  "breakLength": 9.6,
                  "breakY": 24.0,
                  "spinRate": 1759,
                  "spinDirection": 267
                },
                "zone": 13,
                "typeConfidence": 0.91,
                "plateTime": 0.4308711563109364,
                "extension": 5.639582862696596
              },
              "index": 3,
              "playId": "6a51c5b9-bc7d-46eb-81e3-5bfaaf814d27",
              "pitchNumber": 4,
              "startTime": "2022-11-02T01:06:07.193Z",
              "endTime": "2022-11-02T01:06:11.042Z",
              "isPitch": true,
              "type": "pitch"
            }
          ],
          "playEndTime": "2022-11-02T01:06:11.042Z",
          "atBatIndex": 22
        },
        {
          "result": {
            "type": "atBat",
            "event": "Groundout",
            "eventType": "field_out",
            "description": "Bryce Harper grounds out, second baseman Jose Altuve to first baseman Yuli Gurriel.",
            "rbi": 0,
            "awayScore": 0,
            "homeScore": 4,
            "isOut": true
          },
          "about": {
            "atBatIndex": 23,
            "halfInning": "bottom",
            "isTopInning": false,
            "inning": 3,
            "startTime": "2022-11-02T01:06:35.259Z",
            "endTime": "2022-11-02T01:07:57.240Z",
            "isComplete": true,
            "isScoringPlay": false,
            "hasReview": false,
            "hasOut": true,
            "captivatingIndex": 0
          },
          "count": { "balls": 1, "strikes": 1, "outs": 3 },
          "matchup": {
            "batter": {
              "id": 547180,
              "fullName": "Bryce Harper",
              "link": "/api/v1/people/547180"
            },
            "batSide": { "code": "L", "description": "Left" },
            "pitcher": {
              "id": 621121,
              "fullName": "Lance McCullers Jr.",
              "link": "/api/v1/people/621121"
            },
            "pitchHand": { "code": "R", "description": "Right" },
            "batterHotColdZones": [],
            "pitcherHotColdZones": [],
            "splits": {
              "batter": "vs_RHP",
              "pitcher": "vs_LHB",
              "menOnBase": "Empty"
            }
          },
          "pitchIndex": [0, 1, 2],
          "actionIndex": [],
          "runnerIndex": [0],
          "runners": [
            {
              "movement": {
                "originBase": null,
                "start": null,
                "end": null,
                "outBase": "1B",
                "isOut": true,
                "outNumber": 3
              },
              "details": {
                "event": "Groundout",
                "eventType": "field_out",
                "movementReason": null,
                "runner": {
                  "id": 547180,
                  "fullName": "Bryce Harper",
                  "link": "/api/v1/people/547180"
                },
                "responsiblePitcher": null,
                "isScoringEvent": false,
                "rbi": false,
                "earned": false,
                "teamUnearned": false,
                "playIndex": 2
              },
              "credits": [
                {
                  "player": { "id": 514888, "link": "/api/v1/people/514888" },
                  "position": {
                    "code": "4",
                    "name": "Second Base",
                    "type": "Infielder",
                    "abbreviation": "2B"
                  },
                  "credit": "f_assist"
                },
                {
                  "player": { "id": 493329, "link": "/api/v1/people/493329" },
                  "position": {
                    "code": "3",
                    "name": "First Base",
                    "type": "Infielder",
                    "abbreviation": "1B"
                  },
                  "credit": "f_putout"
                }
              ]
            }
          ],
          "playEvents": [
            {
              "details": {
                "call": { "code": "S", "description": "Swinging Strike" },
                "description": "Swinging Strike",
                "code": "S",
                "ballColor": "rgba(170, 21, 11, 1.0)",
                "trailColor": "rgba(152, 0, 101, 1.0)",
                "isInPlay": false,
                "isStrike": true,
                "isBall": false,
                "type": { "code": "FC", "description": "Cutter" },
                "isOut": false,
                "hasReview": false
              },
              "count": { "balls": 0, "strikes": 1, "outs": 2 },
              "pitchData": {
                "startSpeed": 89.3,
                "endSpeed": 82.3,
                "strikeZoneTop": 3.25,
                "strikeZoneBottom": 1.61,
                "coordinates": {
                  "aY": 25.933928630506745,
                  "aZ": -27.329197946021797,
                  "pfxX": 1.929062864078758,
                  "pfxZ": 2.803841406366953,
                  "pX": -0.5726473181814825,
                  "pZ": 3.2488551429750165,
                  "vX0": 1.9384640949852636,
                  "vY0": -130.1900510970395,
                  "vZ0": -0.007246755725051401,
                  "x": 138.83,
                  "y": 151.06,
                  "x0": -1.5759166182396975,
                  "y0": 50.000380137190824,
                  "z0": 5.310815634670079,
                  "aX": 3.328238636235143
                },
                "breaks": {
                  "breakAngle": 7.2,
                  "breakLength": 6.0,
                  "breakY": 24.0,
                  "spinRate": 2586,
                  "spinDirection": 146
                },
                "zone": 1,
                "typeConfidence": 0.92,
                "plateTime": 0.41984374529996593,
                "extension": 5.853677015272347
              },
              "index": 0,
              "playId": "036900c0-e4b7-4d05-8448-dc4038df18e1",
              "pitchNumber": 1,
              "startTime": "2022-11-02T01:06:48.533Z",
              "endTime": "2022-11-02T01:06:51.533Z",
              "isPitch": true,
              "type": "pitch"
            },
            {
              "details": {
                "call": { "code": "B", "description": "Ball" },
                "description": "Ball",
                "code": "B",
                "ballColor": "rgba(39, 161, 39, 1.0)",
                "trailColor": "rgba(152, 0, 101, 1.0)",
                "isInPlay": false,
                "isStrike": false,
                "isBall": true,
                "type": { "code": "FC", "description": "Cutter" },
                "isOut": false,
                "hasReview": false
              },
              "count": { "balls": 1, "strikes": 1, "outs": 2 },
              "pitchData": {
                "startSpeed": 89.1,
                "endSpeed": 81.8,
                "strikeZoneTop": 3.30893533219692,
                "strikeZoneBottom": 1.63908470424893,
                "coordinates": {
                  "aY": 25.9885413884492,
                  "aZ": -28.9892771020367,
                  "pfxX": 0.6928640753376101,
                  "pfxZ": 1.8618925415596568,
                  "pX": 0.8037755105733945,
                  "pZ": 4.097484981621597,
                  "vX0": 5.492290370637009,
                  "vY0": -129.68889933692552,
                  "vZ0": 2.3823173777294833,
                  "x": 86.36,
                  "y": 128.15,
                  "x0": -1.4275475500555097,
                  "y0": 50.00332452806859,
                  "z0": 5.371609497049773,
                  "aX": 1.1845732159375408
                },
                "breaks": {
                  "breakAngle": 4.8,
                  "breakLength": 7.2,
                  "breakY": 24.0,
                  "spinRate": 2670,
                  "spinDirection": 99
                },
                "zone": 12,
                "typeConfidence": 0.88,
                "plateTime": 0.4216248550493238,
                "extension": 5.726765630337274
              },
              "index": 1,
              "playId": "302cc999-c2a2-46ab-8ee5-7e1c3d8b8f30",
              "pitchNumber": 2,
              "startTime": "2022-11-02T01:07:08.670Z",
              "endTime": "2022-11-02T01:07:12.083Z",
              "isPitch": true,
              "type": "pitch"
            },
            {
              "details": {
                "call": { "code": "X", "description": "In play, out(s)" },
                "description": "In play, out(s)",
                "code": "X",
                "ballColor": "rgba(26, 86, 190, 1.0)",
                "trailColor": "rgba(0, 85, 254, 1.0)",
                "isInPlay": true,
                "isStrike": false,
                "isBall": false,
                "type": { "code": "CH", "description": "Changeup" },
                "isOut": true,
                "hasReview": false
              },
              "count": { "balls": 1, "strikes": 1, "outs": 2 },
              "pitchData": {
                "startSpeed": 87.9,
                "endSpeed": 80.4,
                "strikeZoneTop": 3.25,
                "strikeZoneBottom": 1.61,
                "coordinates": {
                  "aY": 26.986647233239196,
                  "aZ": -33.42454345715031,
                  "pfxX": -9.848748831573207,
                  "pfxZ": -0.7564312502470081,
                  "pX": -0.5363701661773942,
                  "pZ": 2.476468242911456,
                  "vX0": 5.813282356330822,
                  "vY0": -127.85351778764723,
                  "vZ0": -0.24187945294256674,
                  "x": 137.45,
                  "y": 171.92,
                  "x0": -1.56297282077482,
                  "y0": 50.00331174401325,
                  "z0": 5.20104201342384,
                  "aX": -16.264046194346292
                },
                "breaks": {
                  "breakAngle": 24.0,
                  "breakLength": 9.6,
                  "breakY": 24.0,
                  "spinRate": 1827,
                  "spinDirection": 265
                },
                "zone": 4,
                "typeConfidence": 0.9,
                "plateTime": 0.42882137108264784,
                "extension": 5.685029363631406
              },
              "hitData": {
                "launchSpeed": 90.3,
                "launchAngle": 6.0,
                "totalDistance": 94.0,
                "trajectory": "ground_ball",
                "hardness": "medium",
                "location": "4",
                "coordinates": { "coordX": 161.15, "coordY": 138.91 }
              },
              "index": 2,
              "playId": "92c53411-a3e6-4f5c-bbc9-308e800a0ba5",
              "pitchNumber": 3,
              "startTime": "2022-11-02T01:07:50.009Z",
              "endTime": "2022-11-02T01:07:57.240Z",
              "isPitch": true,
              "type": "pitch"
            }
          ],
          "playEndTime": "2022-11-02T01:07:57.240Z",
          "atBatIndex": 23
        },
        {
          "result": {
            "type": "atBat",
            "event": "Groundout",
            "eventType": "field_out",
            "description": "Yordan Alvarez grounds out to first baseman Rhys Hoskins.",
            "rbi": 0,
            "awayScore": 0,
            "homeScore": 4,
            "isOut": true
          },
          "about": {
            "atBatIndex": 24,
            "halfInning": "top",
            "isTopInning": true,
            "inning": 4,
            "startTime": "2022-11-02T01:11:10.902Z",
            "endTime": "2022-11-02T01:13:17.063Z",
            "isComplete": true,
            "isScoringPlay": false,
            "hasReview": false,
            "hasOut": true,
            "captivatingIndex": 0
          },
          "count": { "balls": 3, "strikes": 2, "outs": 1 },
          "matchup": {
            "batter": {
              "id": 670541,
              "fullName": "Yordan Alvarez",
              "link": "/api/v1/people/670541"
            },
            "batSide": { "code": "L", "description": "Left" },
            "pitcher": {
              "id": 624133,
              "fullName": "Ranger Suarez",
              "link": "/api/v1/people/624133"
            },
            "pitchHand": { "code": "L", "description": "Left" },
            "batterHotColdZones": [],
            "pitcherHotColdZones": [],
            "splits": {
              "batter": "vs_LHP",
              "pitcher": "vs_LHB",
              "menOnBase": "Empty"
            }
          },
          "pitchIndex": [0, 1, 2, 3, 4, 5],
          "actionIndex": [],
          "runnerIndex": [0],
          "runners": [
            {
              "movement": {
                "originBase": null,
                "start": null,
                "end": null,
                "outBase": "1B",
                "isOut": true,
                "outNumber": 1
              },
              "details": {
                "event": "Groundout",
                "eventType": "field_out",
                "movementReason": null,
                "runner": {
                  "id": 670541,
                  "fullName": "Yordan Alvarez",
                  "link": "/api/v1/people/670541"
                },
                "responsiblePitcher": null,
                "isScoringEvent": false,
                "rbi": false,
                "earned": false,
                "teamUnearned": false,
                "playIndex": 5
              },
              "credits": [
                {
                  "player": { "id": 656555, "link": "/api/v1/people/656555" },
                  "position": {
                    "code": "3",
                    "name": "First Base",
                    "type": "Infielder",
                    "abbreviation": "1B"
                  },
                  "credit": "f_putout"
                }
              ]
            }
          ],
          "playEvents": [
            {
              "details": {
                "call": { "code": "F", "description": "Foul" },
                "description": "Foul",
                "code": "F",
                "ballColor": "rgba(170, 21, 11, 1.0)",
                "trailColor": "rgba(152, 0, 101, 1.0)",
                "isInPlay": false,
                "isStrike": true,
                "isBall": false,
                "type": { "code": "FC", "description": "Cutter" },
                "isOut": false,
                "hasReview": false
              },
              "count": { "balls": 0, "strikes": 1, "outs": 0 },
              "pitchData": {
                "startSpeed": 83.7,
                "endSpeed": 77.4,
                "strikeZoneTop": 3.48,
                "strikeZoneBottom": 1.73,
                "coordinates": {
                  "aY": 23.36525177967074,
                  "aZ": -31.209760747317986,
                  "pfxX": -2.0302392187794003,
                  "pfxZ": 0.639868627960861,
                  "pX": -0.6365172148748316,
                  "pZ": 1.3447538619455162,
                  "vX0": -5.331481445821487,
                  "vY0": -121.78640464720817,
                  "vZ0": -4.180662668776825,
                  "x": 141.26,
                  "y": 202.47,
                  "x0": 1.8426168383578305,
                  "y0": 50.003537364860684,
                  "z0": 5.775855667299614,
                  "aX": -3.0559858541170475
                },
                "breaks": {
                  "breakAngle": 7.2,
                  "breakLength": 8.4,
                  "breakY": 24.0,
                  "spinRate": 2183,
                  "spinDirection": 234
                },
                "zone": 13,
                "typeConfidence": 2.0,
                "plateTime": 0.44932231605993644,
                "extension": 6.175744779525554
              },
              "index": 0,
              "playId": "1ece2d01-0105-4d42-bdfa-a3fcaaae8aaa",
              "pitchNumber": 1,
              "startTime": "2022-11-02T01:11:25.460Z",
              "endTime": "2022-11-02T01:11:28.921Z",
              "isPitch": true,
              "type": "pitch"
            },
            {
              "details": {
                "call": { "code": "F", "description": "Foul" },
                "description": "Foul",
                "code": "F",
                "ballColor": "rgba(170, 21, 11, 1.0)",
                "trailColor": "rgba(50, 0, 221, 1.0)",
                "isInPlay": false,
                "isStrike": true,
                "isBall": false,
                "type": { "code": "SI", "description": "Sinker" },
                "isOut": false,
                "hasReview": false
              },
              "count": { "balls": 0, "strikes": 2, "outs": 0 },
              "pitchData": {
                "startSpeed": 93.3,
                "endSpeed": 85.0,
                "strikeZoneTop": 3.48,
                "strikeZoneBottom": 1.73,
                "coordinates": {
                  "aY": 31.52583734705276,
                  "aZ": -24.795863924234993,
                  "pfxX": 9.331993984030468,
                  "pfxZ": 3.987658455783225,
                  "pX": 0.7477934651318854,
                  "pZ": 2.1820478983435545,
                  "vX0": -6.251197543028421,
                  "vY0": -135.61695009144475,
                  "vZ0": -4.952825969414193,
                  "x": 88.5,
                  "y": 179.86,
                  "x0": 1.8782035136769832,
                  "y0": 50.00412516784231,
                  "z0": 5.776662206796977,
                  "aX": 17.266866958599255
                },
                "breaks": {
                  "breakAngle": 31.2,
                  "breakLength": 7.2,
                  "breakY": 24.0,
                  "spinRate": 2021,
                  "spinDirection": 134
                },
                "zone": 9,
                "typeConfidence": 0.91,
                "plateTime": 0.40493781286010133,
                "extension": 6.113225177482859
              },
              "index": 1,
              "playId": "c0ea2ac5-b40c-4424-9498-3a5ce36c5d03",
              "pitchNumber": 2,
              "startTime": "2022-11-02T01:11:43.468Z",
              "endTime": "2022-11-02T01:11:46.713Z",
              "isPitch": true,
              "type": "pitch"
            },
            {
              "details": {
                "call": { "code": "B", "description": "Ball" },
                "description": "Ball",
                "code": "B",
                "ballColor": "rgba(39, 161, 39, 1.0)",
                "trailColor": "rgba(50, 0, 221, 1.0)",
                "isInPlay": false,
                "isStrike": false,
                "isBall": true,
                "type": { "code": "SI", "description": "Sinker" },
                "isOut": false,
                "hasReview": false
              },
              "count": { "balls": 1, "strikes": 2, "outs": 0 },
              "pitchData": {
                "startSpeed": 93.0,
                "endSpeed": 84.7,
                "strikeZoneTop": 3.54107706971731,
                "strikeZoneBottom": 1.71698983696302,
                "coordinates": {
                  "aY": 31.32116565480867,
                  "aZ": -25.746904696106473,
                  "pfxX": 10.003520304326585,
                  "pfxZ": 3.4927394142547037,
                  "pX": 1.2788228013414655,
                  "pZ": 2.7536574399696585,
                  "vX0": -5.068871426624591,
                  "vY0": -135.23506853030264,
                  "vZ0": -3.5983846479939987,
                  "x": 68.25,
                  "y": 164.43,
                  "x0": 1.8845457996804147,
                  "y0": 50.00224093813052,
                  "z0": 5.921266396007144,
                  "aX": 18.405018325240214
                },
                "breaks": {
                  "breakAngle": 33.6,
                  "breakLength": 7.2,
                  "breakY": 24.0,
                  "spinRate": 1879,
                  "spinDirection": 136
                },
                "zone": 12,
                "typeConfidence": 0.92,
                "plateTime": 0.40605670794806237,
                "extension": 6.113724266385421
              },
              "index": 2,
              "playId": "9ac08688-a946-4f82-a225-563022ed658c",
              "pitchNumber": 3,
              "startTime": "2022-11-02T01:12:10.071Z",
              "endTime": "2022-11-02T01:12:13.666Z",
              "isPitch": true,
              "type": "pitch"
            },
            {
              "details": {
                "call": { "code": "B", "description": "Ball" },
                "description": "Ball",
                "code": "B",
                "ballColor": "rgba(39, 161, 39, 1.0)",
                "trailColor": "rgba(0, 85, 254, 1.0)",
                "isInPlay": false,
                "isStrike": false,
                "isBall": true,
                "type": { "code": "CH", "description": "Changeup" },
                "isOut": false,
                "hasReview": false
              },
              "count": { "balls": 2, "strikes": 2, "outs": 0 },
              "pitchData": {
                "startSpeed": 86.9,
                "endSpeed": 79.5,
                "strikeZoneTop": 3.54107706971731,
                "strikeZoneBottom": 1.72727857072049,
                "coordinates": {
                  "aY": 27.284286392893765,
                  "aZ": -28.84950315415951,
                  "pfxX": 9.198929124492718,
                  "pfxZ": 2.074580625604261,
                  "pX": 0.3915434848296189,
                  "pZ": 0.9238119161060867,
                  "vX0": -6.6269552206054865,
                  "vY0": -126.23334066216555,
                  "vZ0": -5.922342779443013,
                  "x": 102.08,
                  "y": 213.84,
                  "x0": 1.864328843756025,
                  "y0": 50.00401254077825,
                  "z0": 5.642408856804769,
                  "aX": 14.748648850933524
                },
                "breaks": {
                  "breakAngle": 24.0,
                  "breakLength": 8.4,
                  "breakY": 24.0,
                  "spinRate": 1357,
                  "spinDirection": 119
                },
                "zone": 14,
                "typeConfidence": 0.63,
                "plateTime": 0.43500435560604744,
                "extension": 6.128877698052431
              },
              "index": 3,
              "playId": "5757065c-056a-41f8-8d9c-6141ef08dc89",
              "pitchNumber": 4,
              "startTime": "2022-11-02T01:12:30.794Z",
              "endTime": "2022-11-02T01:12:33.857Z",
              "isPitch": true,
              "type": "pitch"
            },
            {
              "details": {
                "call": { "code": "B", "description": "Ball" },
                "description": "Ball",
                "code": "B",
                "ballColor": "rgba(39, 161, 39, 1.0)",
                "trailColor": "rgba(152, 0, 101, 1.0)",
                "isInPlay": false,
                "isStrike": false,
                "isBall": true,
                "type": { "code": "FC", "description": "Cutter" },
                "isOut": false,
                "hasReview": false
              },
              "count": { "balls": 3, "strikes": 2, "outs": 0 },
              "pitchData": {
                "startSpeed": 88.1,
                "endSpeed": 80.8,
                "strikeZoneTop": 3.54107706971731,
                "strikeZoneBottom": 1.71698983696302,
                "coordinates": {
                  "aY": 28.142384398523962,
                  "aZ": -28.615933942997206,
                  "pfxX": -3.463692646395643,
                  "pfxZ": 2.159805021758231,
                  "pX": -2.6095693182316495,
                  "pZ": 1.5280592996046418,
                  "vX0": -9.477069203597791,
                  "vY0": -127.93979327383157,
                  "vZ0": -5.04356505796675,
                  "x": 216.47,
                  "y": 197.52,
                  "x0": 1.6029795277844472,
                  "y0": 50.00070204510813,
                  "z0": 5.786708582698606,
                  "aX": -5.700147709215475
                },
                "breaks": {
                  "breakAngle": 14.4,
                  "breakLength": 7.2,
                  "breakY": 24.0,
                  "spinRate": 2176,
                  "spinDirection": 208
                },
                "zone": 13,
                "typeConfidence": 0.86,
                "plateTime": 0.42928240890195823,
                "extension": 6.290366013255279
              },
              "index": 4,
              "playId": "0ae7bfc2-c5fa-4519-8684-2ec72d73775b",
              "pitchNumber": 5,
              "startTime": "2022-11-02T01:12:48.016Z",
              "endTime": "2022-11-02T01:12:51.016Z",
              "isPitch": true,
              "type": "pitch"
            },
            {
              "details": {
                "call": { "code": "X", "description": "In play, out(s)" },
                "description": "In play, out(s)",
                "code": "X",
                "ballColor": "rgba(26, 86, 190, 1.0)",
                "trailColor": "rgba(50, 0, 221, 1.0)",
                "isInPlay": true,
                "isStrike": false,
                "isBall": false,
                "type": { "code": "SI", "description": "Sinker" },
                "isOut": true,
                "hasReview": false
              },
              "count": { "balls": 3, "strikes": 2, "outs": 0 },
              "pitchData": {
                "startSpeed": 94.5,
                "endSpeed": 85.9,
                "strikeZoneTop": 3.48,
                "strikeZoneBottom": 1.73,
                "coordinates": {
                  "aY": 32.64366502655933,
                  "aZ": -28.49862734834529,
                  "pfxX": 11.66419023586529,
                  "pfxZ": 1.9497428026669086,
                  "pX": -0.8681202144390698,
                  "pZ": 1.4541248450392448,
                  "vX0": -11.010328766375007,
                  "vY0": -136.96386834177056,
                  "vZ0": -5.87511434290889,
                  "x": 150.09,
                  "y": 199.52,
                  "x0": 1.705101550164241,
                  "y0": 50.002654983840586,
                  "z0": 5.5974938022639655,
                  "aX": 21.973433495120563
                },
                "breaks": {
                  "breakAngle": 33.6,
                  "breakLength": 7.2,
                  "breakY": 24.0,
                  "spinRate": 2022,
                  "spinDirection": 134
                },
                "zone": 13,
                "typeConfidence": 0.92,
                "plateTime": 0.4012090719502788,
                "extension": 6.294941345042104
              },
              "hitData": {
                "launchAngle": -54.0,
                "totalDistance": 1.0,
                "trajectory": "ground_ball",
                "hardness": "medium",
                "location": "3",
                "coordinates": { "coordX": 153.03, "coordY": 168.82 }
              },
              "index": 5,
              "playId": "b892f82a-2345-44b0-96f4-67109fd18396",
              "pitchNumber": 6,
              "startTime": "2022-11-02T01:13:10.045Z",
              "endTime": "2022-11-02T01:13:17.063Z",
              "isPitch": true,
              "type": "pitch"
            }
          ],
          "playEndTime": "2022-11-02T01:13:17.063Z",
          "atBatIndex": 24
        },
        {
          "result": {
            "type": "atBat",
            "event": "Groundout",
            "eventType": "field_out",
            "description": "Alex Bregman grounds out, first baseman Rhys Hoskins to pitcher Ranger Suarez.",
            "rbi": 0,
            "awayScore": 0,
            "homeScore": 4,
            "isOut": true
          },
          "about": {
            "atBatIndex": 25,
            "halfInning": "top",
            "isTopInning": true,
            "inning": 4,
            "startTime": "2022-11-02T01:13:28.666Z",
            "endTime": "2022-11-02T01:15:15.291Z",
            "isComplete": true,
            "isScoringPlay": false,
            "hasReview": false,
            "hasOut": true,
            "captivatingIndex": 0
          },
          "count": { "balls": 2, "strikes": 2, "outs": 2 },
          "matchup": {
            "batter": {
              "id": 608324,
              "fullName": "Alex Bregman",
              "link": "/api/v1/people/608324"
            },
            "batSide": { "code": "R", "description": "Right" },
            "pitcher": {
              "id": 624133,
              "fullName": "Ranger Suarez",
              "link": "/api/v1/people/624133"
            },
            "pitchHand": { "code": "L", "description": "Left" },
            "batterHotColdZones": [],
            "pitcherHotColdZones": [],
            "splits": {
              "batter": "vs_LHP",
              "pitcher": "vs_RHB",
              "menOnBase": "Empty"
            }
          },
          "pitchIndex": [0, 1, 2, 3, 4],
          "actionIndex": [],
          "runnerIndex": [0],
          "runners": [
            {
              "movement": {
                "originBase": null,
                "start": null,
                "end": null,
                "outBase": "1B",
                "isOut": true,
                "outNumber": 2
              },
              "details": {
                "event": "Groundout",
                "eventType": "field_out",
                "movementReason": null,
                "runner": {
                  "id": 608324,
                  "fullName": "Alex Bregman",
                  "link": "/api/v1/people/608324"
                },
                "responsiblePitcher": null,
                "isScoringEvent": false,
                "rbi": false,
                "earned": false,
                "teamUnearned": false,
                "playIndex": 4
              },
              "credits": [
                {
                  "player": { "id": 656555, "link": "/api/v1/people/656555" },
                  "position": {
                    "code": "3",
                    "name": "First Base",
                    "type": "Infielder",
                    "abbreviation": "1B"
                  },
                  "credit": "f_assist"
                },
                {
                  "player": { "id": 624133, "link": "/api/v1/people/624133" },
                  "position": {
                    "code": "1",
                    "name": "Pitcher",
                    "type": "Pitcher",
                    "abbreviation": "P"
                  },
                  "credit": "f_putout"
                }
              ]
            }
          ],
          "playEvents": [
            {
              "details": {
                "call": { "code": "S", "description": "Swinging Strike" },
                "description": "Swinging Strike",
                "code": "S",
                "ballColor": "rgba(170, 21, 11, 1.0)",
                "trailColor": "rgba(152, 0, 101, 1.0)",
                "isInPlay": false,
                "isStrike": true,
                "isBall": false,
                "type": { "code": "FC", "description": "Cutter" },
                "isOut": false,
                "hasReview": false
              },
              "count": { "balls": 0, "strikes": 1, "outs": 1 },
              "pitchData": {
                "startSpeed": 86.0,
                "endSpeed": 78.6,
                "strikeZoneTop": 3.16,
                "strikeZoneBottom": 1.51,
                "coordinates": {
                  "aY": 26.39151366456177,
                  "aZ": -27.368347155024644,
                  "pfxX": -0.31030212867294305,
                  "pfxZ": 3.0378767316664046,
                  "pX": 0.5378385026212521,
                  "pZ": 3.070505860528149,
                  "vX0": -3.4016431426367806,
                  "vY0": -125.2884332658506,
                  "vZ0": -1.4111893965168725,
                  "x": 96.5,
                  "y": 155.88,
                  "x0": 1.956054356670011,
                  "y0": 50.00357596454402,
                  "z0": 5.887320383183942,
                  "aX": -0.49081254928244666
                },
                "breaks": {
                  "breakAngle": 2.4,
                  "breakLength": 7.2,
                  "breakY": 24.0,
                  "spinRate": 2132,
                  "spinDirection": 233
                },
                "zone": 3,
                "typeConfidence": 0.61,
                "plateTime": 0.43793423735040804,
                "extension": 6.228000885674107
              },
              "index": 0,
              "playId": "64632636-9748-4bf0-b738-b9b5d3085167",
              "pitchNumber": 1,
              "startTime": "2022-11-02T01:13:48.939Z",
              "endTime": "2022-11-02T01:13:52.580Z",
              "isPitch": true,
              "type": "pitch"
            },
            {
              "details": {
                "call": { "code": "F", "description": "Foul" },
                "description": "Foul",
                "code": "F",
                "ballColor": "rgba(170, 21, 11, 1.0)",
                "trailColor": "rgba(50, 0, 221, 1.0)",
                "isInPlay": false,
                "isStrike": true,
                "isBall": false,
                "type": { "code": "SI", "description": "Sinker" },
                "isOut": false,
                "hasReview": false
              },
              "count": { "balls": 0, "strikes": 2, "outs": 1 },
              "pitchData": {
                "startSpeed": 93.7,
                "endSpeed": 84.6,
                "strikeZoneTop": 3.16,
                "strikeZoneBottom": 1.51,
                "coordinates": {
                  "aY": 34.03162069703285,
                  "aZ": -27.748517009482605,
                  "pfxX": 11.329701964951177,
                  "pfxZ": 2.391114800752767,
                  "pX": 0.21354178391742593,
                  "pZ": 2.7035622558223915,
                  "vX0": -8.0994020250501,
                  "vY0": -136.10725598348748,
                  "vZ0": -3.124948896251232,
                  "x": 108.86,
                  "y": 165.78,
                  "x0": 1.778581607303291,
                  "y0": 50.00057608766592,
                  "z0": 5.819622785412432,
                  "aX": 20.937122476113156
                },
                "breaks": {
                  "breakAngle": 33.6,
                  "breakLength": 7.2,
                  "breakY": 24.0,
                  "spinRate": 1984,
                  "spinDirection": 143
                },
                "zone": 2,
                "typeConfidence": 0.92,
                "plateTime": 0.404745777670219,
                "extension": 6.059749854331706
              },
              "index": 1,
              "playId": "639cbf59-4b00-412b-bcc3-2fbee6c341ff",
              "pitchNumber": 2,
              "startTime": "2022-11-02T01:14:02.819Z",
              "endTime": "2022-11-02T01:14:06.845Z",
              "isPitch": true,
              "type": "pitch"
            },
            {
              "details": {
                "call": { "code": "B", "description": "Ball" },
                "description": "Ball",
                "code": "B",
                "ballColor": "rgba(39, 161, 39, 1.0)",
                "trailColor": "rgba(0, 85, 254, 1.0)",
                "isInPlay": false,
                "isStrike": false,
                "isBall": true,
                "type": { "code": "CH", "description": "Changeup" },
                "isOut": false,
                "hasReview": false
              },
              "count": { "balls": 1, "strikes": 2, "outs": 1 },
              "pitchData": {
                "startSpeed": 82.4,
                "endSpeed": 75.6,
                "strikeZoneTop": 3.3475195679151,
                "strikeZoneBottom": 1.60002542559414,
                "coordinates": {
                  "aY": 22.814369965353325,
                  "aZ": -28.68006570425584,
                  "pfxX": 5.317466864529395,
                  "pfxZ": 2.389443276265613,
                  "pX": 2.3401367967764495,
                  "pZ": 4.189117967889763,
                  "vX0": -0.8956341698353554,
                  "vY0": -120.05201621753879,
                  "vZ0": 2.0982963008694826,
                  "x": 27.8,
                  "y": 125.67,
                  "x0": 2.0266704419013832,
                  "y0": 50.00240382965026,
                  "z0": 5.8530477571846315,
                  "aX": 7.776802486219468
                },
                "breaks": {
                  "breakAngle": 15.6,
                  "breakLength": 8.4,
                  "breakY": 24.0,
                  "spinRate": 1312,
                  "spinDirection": 118
                },
                "zone": 12,
                "typeConfidence": 0.89,
                "plateTime": 0.4558922052579595,
                "extension": 5.989373070234759
              },
              "index": 2,
              "playId": "1fb3dab2-0acf-4686-a3de-ce69c634c3e4",
              "pitchNumber": 3,
              "startTime": "2022-11-02T01:14:24.636Z",
              "endTime": "2022-11-02T01:14:27.636Z",
              "isPitch": true,
              "type": "pitch"
            },
            {
              "details": {
                "call": { "code": "B", "description": "Ball" },
                "description": "Ball",
                "code": "B",
                "ballColor": "rgba(39, 161, 39, 1.0)",
                "trailColor": "rgba(0, 85, 254, 1.0)",
                "isInPlay": false,
                "isStrike": false,
                "isBall": true,
                "type": { "code": "CH", "description": "Changeup" },
                "isOut": false,
                "hasReview": false
              },
              "count": { "balls": 2, "strikes": 2, "outs": 1 },
              "pitchData": {
                "startSpeed": 84.6,
                "endSpeed": 77.7,
                "strikeZoneTop": 3.32171281178989,
                "strikeZoneBottom": 1.60002542559414,
                "coordinates": {
                  "aY": 25.320179944535536,
                  "aZ": -28.57982654651704,
                  "pfxX": 8.011890004965704,
                  "pfxZ": 2.3513292945295263,
                  "pX": 0.7219890416425359,
                  "pZ": 0.7531389655033588,
                  "vX0": -5.362907570726232,
                  "vY0": -122.99395742075905,
                  "vZ0": -5.703246333251506,
                  "x": 89.48,
                  "y": 218.45,
                  "x0": 1.8942722673353611,
                  "y0": 50.00011017583899,
                  "z0": 5.537763512720929,
                  "aX": 12.22324000561546
                },
                "breaks": {
                  "breakAngle": 20.4,
                  "breakLength": 8.4,
                  "breakY": 24.0,
                  "spinRate": 1308,
                  "spinDirection": 120
                },
                "zone": 14,
                "typeConfidence": 0.9,
                "plateTime": 0.4460301803581146,
                "extension": 6.116019594358856
              },
              "index": 3,
              "playId": "8ad374a3-9556-40c6-b4e5-94a7c2e71b7e",
              "pitchNumber": 4,
              "startTime": "2022-11-02T01:14:46.749Z",
              "endTime": "2022-11-02T01:14:49.752Z",
              "isPitch": true,
              "type": "pitch"
            },
            {
              "details": {
                "call": { "code": "X", "description": "In play, out(s)" },
                "description": "In play, out(s)",
                "code": "X",
                "ballColor": "rgba(26, 86, 190, 1.0)",
                "trailColor": "rgba(152, 0, 101, 1.0)",
                "isInPlay": true,
                "isStrike": false,
                "isBall": false,
                "type": { "code": "FC", "description": "Cutter" },
                "isOut": true,
                "hasReview": false
              },
              "count": { "balls": 2, "strikes": 2, "outs": 1 },
              "pitchData": {
                "startSpeed": 89.6,
                "endSpeed": 82.6,
                "strikeZoneTop": 3.16,
                "strikeZoneBottom": 1.51,
                "coordinates": {
                  "aY": 26.687171306130264,
                  "aZ": -26.815164781512745,
                  "pfxX": -0.7228865396916456,
                  "pfxZ": 3.0997177700346894,
                  "pX": 0.05952201760798332,
                  "pZ": 1.578421404509541,
                  "vX0": -4.735029551160114,
                  "vY0": -130.3986067907758,
                  "vZ0": -5.390872284529775,
                  "x": 114.73,
                  "y": 196.16,
                  "x0": 1.9905369697631656,
                  "y0": 50.00036103514053,
                  "z0": 5.688296802390875,
                  "aX": -1.2472906471555345
                },
                "breaks": {
                  "breakAngle": 4.8,
                  "breakLength": 6.0,
                  "breakY": 24.0,
                  "spinRate": 2093,
                  "spinDirection": 149
                },
                "zone": 8,
                "typeConfidence": 0.92,
                "plateTime": 0.4195882667641593,
                "extension": 6.146745439950203
              },
              "hitData": {
                "launchSpeed": 89.9,
                "launchAngle": -33.0,
                "totalDistance": 2.0,
                "trajectory": "ground_ball",
                "hardness": "medium",
                "location": "3",
                "coordinates": { "coordX": 161.15, "coordY": 170.84 }
              },
              "index": 4,
              "playId": "4d0d0827-9ff0-4bf2-bdc5-62336c4dd10e",
              "pitchNumber": 5,
              "startTime": "2022-11-02T01:15:06.789Z",
              "endTime": "2022-11-02T01:15:15.291Z",
              "isPitch": true,
              "type": "pitch"
            }
          ],
          "playEndTime": "2022-11-02T01:15:15.291Z",
          "atBatIndex": 25
        },
        {
          "result": {
            "type": "atBat",
            "event": "Flyout",
            "eventType": "field_out",
            "description": "Kyle Tucker flies out to center fielder Brandon Marsh.",
            "rbi": 0,
            "awayScore": 0,
            "homeScore": 4,
            "isOut": true
          },
          "about": {
            "atBatIndex": 26,
            "halfInning": "top",
            "isTopInning": true,
            "inning": 4,
            "startTime": "2022-11-02T01:15:27.952Z",
            "endTime": "2022-11-02T01:16:23.673Z",
            "isComplete": true,
            "isScoringPlay": false,
            "hasReview": false,
            "hasOut": true,
            "captivatingIndex": 0
          },
          "count": { "balls": 0, "strikes": 1, "outs": 3 },
          "matchup": {
            "batter": {
              "id": 663656,
              "fullName": "Kyle Tucker",
              "link": "/api/v1/people/663656"
            },
            "batSide": { "code": "L", "description": "Left" },
            "pitcher": {
              "id": 624133,
              "fullName": "Ranger Suarez",
              "link": "/api/v1/people/624133"
            },
            "pitchHand": { "code": "L", "description": "Left" },
            "batterHotColdZones": [],
            "pitcherHotColdZones": [],
            "splits": {
              "batter": "vs_LHP",
              "pitcher": "vs_LHB",
              "menOnBase": "Empty"
            }
          },
          "pitchIndex": [0, 1],
          "actionIndex": [],
          "runnerIndex": [0],
          "runners": [
            {
              "movement": {
                "originBase": null,
                "start": null,
                "end": null,
                "outBase": "1B",
                "isOut": true,
                "outNumber": 3
              },
              "details": {
                "event": "Flyout",
                "eventType": "field_out",
                "movementReason": null,
                "runner": {
                  "id": 663656,
                  "fullName": "Kyle Tucker",
                  "link": "/api/v1/people/663656"
                },
                "responsiblePitcher": null,
                "isScoringEvent": false,
                "rbi": false,
                "earned": false,
                "teamUnearned": false,
                "playIndex": 1
              },
              "credits": [
                {
                  "player": { "id": 669016, "link": "/api/v1/people/669016" },
                  "position": {
                    "code": "8",
                    "name": "Outfielder",
                    "type": "Outfielder",
                    "abbreviation": "CF"
                  },
                  "credit": "f_putout"
                }
              ]
            }
          ],
          "playEvents": [
            {
              "details": {
                "call": { "code": "C", "description": "Called Strike" },
                "description": "Called Strike",
                "code": "C",
                "ballColor": "rgba(170, 21, 11, 1.0)",
                "trailColor": "rgba(50, 0, 221, 1.0)",
                "isInPlay": false,
                "isStrike": true,
                "isBall": false,
                "type": { "code": "SI", "description": "Sinker" },
                "isOut": false,
                "hasReview": false
              },
              "count": { "balls": 0, "strikes": 1, "outs": 2 },
              "pitchData": {
                "startSpeed": 94.6,
                "endSpeed": 86.1,
                "strikeZoneTop": 3.57960263905346,
                "strikeZoneBottom": 1.57404861035727,
                "coordinates": {
                  "aY": 31.571677753961627,
                  "aZ": -24.68141767356544,
                  "pfxX": 10.839109585321243,
                  "pfxZ": 3.9394482087720935,
                  "pX": -0.7738038982148894,
                  "pZ": 2.571414925742419,
                  "vX0": -10.545308960919463,
                  "vY0": -137.29531859420922,
                  "vZ0": -3.9336955921655967,
                  "x": 146.5,
                  "y": 169.35,
                  "x0": 1.716312908132247,
                  "y0": 50.00147052160941,
                  "z0": 5.710746737604175,
                  "aX": 20.606303519836853
                },
                "breaks": {
                  "breakAngle": 36.0,
                  "breakLength": 7.2,
                  "breakY": 24.0,
                  "spinRate": 1979,
                  "spinDirection": 133
                },
                "zone": 4,
                "typeConfidence": 0.92,
                "plateTime": 0.399580350080353,
                "extension": 6.174581552346331
              },
              "index": 0,
              "playId": "d145d6d1-8f5d-4418-989b-c9b821df2f94",
              "pitchNumber": 1,
              "startTime": "2022-11-02T01:15:58.365Z",
              "endTime": "2022-11-02T01:16:02.073Z",
              "isPitch": true,
              "type": "pitch"
            },
            {
              "details": {
                "call": { "code": "X", "description": "In play, out(s)" },
                "description": "In play, out(s)",
                "code": "X",
                "ballColor": "rgba(26, 86, 190, 1.0)",
                "trailColor": "rgba(152, 0, 101, 1.0)",
                "isInPlay": true,
                "isStrike": false,
                "isBall": false,
                "type": { "code": "FC", "description": "Cutter" },
                "isOut": true,
                "hasReview": false
              },
              "count": { "balls": 0, "strikes": 1, "outs": 2 },
              "pitchData": {
                "startSpeed": 86.8,
                "endSpeed": 80.0,
                "strikeZoneTop": 3.64,
                "strikeZoneBottom": 1.74,
                "coordinates": {
                  "aY": 25.5668131799934,
                  "aZ": -30.3991548956279,
                  "pfxX": 0.9667089190251715,
                  "pfxZ": 1.097607804197005,
                  "pX": 0.1762770793689126,
                  "pZ": 1.5630829643255624,
                  "vX0": -4.4037658478516715,
                  "vY0": -126.34506895046256,
                  "vZ0": -4.479844155662242,
                  "x": 110.28,
                  "y": 196.58,
                  "x0": 1.8156957517645194,
                  "y0": 50.002520150682905,
                  "z0": 5.800027339730085,
                  "aX": 1.5640161824535845
                },
                "breaks": {
                  "breakAngle": 1.2,
                  "breakLength": 8.4,
                  "breakY": 24.0,
                  "spinRate": 2009,
                  "spinDirection": 147
                },
                "zone": 14,
                "typeConfidence": 0.84,
                "plateTime": 0.4333997609708704,
                "extension": 6.199955190747314
              },
              "hitData": {
                "launchSpeed": 99.9,
                "launchAngle": 24.0,
                "totalDistance": 362.0,
                "trajectory": "fly_ball",
                "hardness": "medium",
                "location": "8",
                "coordinates": { "coordX": 87.72, "coordY": 58.14 }
              },
              "index": 1,
              "playId": "964ad969-1df3-4b2e-86ab-5ce86913887e",
              "pitchNumber": 2,
              "startTime": "2022-11-02T01:16:14.689Z",
              "endTime": "2022-11-02T01:16:23.673Z",
              "isPitch": true,
              "type": "pitch"
            }
          ],
          "playEndTime": "2022-11-02T01:16:23.673Z",
          "atBatIndex": 26
        },
        {
          "result": {
            "type": "atBat",
            "event": "Groundout",
            "eventType": "field_out",
            "description": "Nick Castellanos grounds out softly, shortstop Jeremy Pena to first baseman Yuli Gurriel.",
            "rbi": 0,
            "awayScore": 0,
            "homeScore": 4,
            "isOut": true
          },
          "about": {
            "atBatIndex": 27,
            "halfInning": "bottom",
            "isTopInning": false,
            "inning": 4,
            "startTime": "2022-11-02T01:19:08.128Z",
            "endTime": "2022-11-02T01:20:52.414Z",
            "isComplete": true,
            "isScoringPlay": false,
            "hasReview": false,
            "hasOut": true,
            "captivatingIndex": 0
          },
          "count": { "balls": 1, "strikes": 2, "outs": 1 },
          "matchup": {
            "batter": {
              "id": 592206,
              "fullName": "Nick Castellanos",
              "link": "/api/v1/people/592206"
            },
            "batSide": { "code": "R", "description": "Right" },
            "pitcher": {
              "id": 621121,
              "fullName": "Lance McCullers Jr.",
              "link": "/api/v1/people/621121"
            },
            "pitchHand": { "code": "R", "description": "Right" },
            "batterHotColdZones": [],
            "pitcherHotColdZones": [],
            "splits": {
              "batter": "vs_RHP",
              "pitcher": "vs_RHB",
              "menOnBase": "Empty"
            }
          },
          "pitchIndex": [0, 1, 2, 3, 4],
          "actionIndex": [],
          "runnerIndex": [0],
          "runners": [
            {
              "movement": {
                "originBase": null,
                "start": null,
                "end": null,
                "outBase": "1B",
                "isOut": true,
                "outNumber": 1
              },
              "details": {
                "event": "Groundout",
                "eventType": "field_out",
                "movementReason": null,
                "runner": {
                  "id": 592206,
                  "fullName": "Nick Castellanos",
                  "link": "/api/v1/people/592206"
                },
                "responsiblePitcher": null,
                "isScoringEvent": false,
                "rbi": false,
                "earned": false,
                "teamUnearned": false,
                "playIndex": 4
              },
              "credits": [
                {
                  "player": { "id": 665161, "link": "/api/v1/people/665161" },
                  "position": {
                    "code": "6",
                    "name": "Shortstop",
                    "type": "Infielder",
                    "abbreviation": "SS"
                  },
                  "credit": "f_assist"
                },
                {
                  "player": { "id": 493329, "link": "/api/v1/people/493329" },
                  "position": {
                    "code": "3",
                    "name": "First Base",
                    "type": "Infielder",
                    "abbreviation": "1B"
                  },
                  "credit": "f_putout"
                }
              ]
            }
          ],
          "playEvents": [
            {
              "details": {
                "call": { "code": "B", "description": "Ball" },
                "description": "Ball",
                "code": "B",
                "ballColor": "rgba(39, 161, 39, 1.0)",
                "trailColor": "rgba(50, 0, 221, 1.0)",
                "isInPlay": false,
                "isStrike": false,
                "isBall": true,
                "type": { "code": "SI", "description": "Sinker" },
                "isOut": false,
                "hasReview": false
              },
              "count": { "balls": 1, "strikes": 0, "outs": 0 },
              "pitchData": {
                "startSpeed": 93.1,
                "endSpeed": 85.9,
                "strikeZoneTop": 3.57960263905346,
                "strikeZoneBottom": 1.70390700555157,
                "coordinates": {
                  "aY": 27.310824159825984,
                  "aZ": -27.526183604465405,
                  "pfxX": -9.11601542129756,
                  "pfxZ": 2.486870499982029,
                  "pX": 1.4463633720141904,
                  "pZ": 1.7737791454168668,
                  "vX0": 9.82700286513412,
                  "vY0": -135.2857201554771,
                  "vZ0": -3.8592404484243183,
                  "x": 61.87,
                  "y": 190.89,
                  "x0": -1.035044302642801,
                  "y0": 50.00208669012046,
                  "z0": 5.130677963485651,
                  "aX": -17.032103561893262
                },
                "breaks": {
                  "breakAngle": 27.6,
                  "breakLength": 7.2,
                  "breakY": 24.0,
                  "spinRate": 2004,
                  "spinDirection": 246
                },
                "zone": 14,
                "typeConfidence": 0.9,
                "plateTime": 0.4036421826875958,
                "extension": 5.927966321041554
              },
              "index": 0,
              "playId": "49ec6cc4-74a8-47fb-a097-54c7a9aa11d8",
              "pitchNumber": 1,
              "startTime": "2022-11-02T01:19:33.251Z",
              "endTime": "2022-11-02T01:19:36.808Z",
              "isPitch": true,
              "type": "pitch"
            },
            {
              "details": {
                "call": { "code": "S", "description": "Swinging Strike" },
                "description": "Swinging Strike",
                "code": "S",
                "ballColor": "rgba(170, 21, 11, 1.0)",
                "trailColor": "rgba(0, 0, 254, 1.0)",
                "isInPlay": false,
                "isStrike": true,
                "isBall": false,
                "type": { "code": "SL", "description": "Slider" },
                "isOut": false,
                "hasReview": false
              },
              "count": { "balls": 1, "strikes": 1, "outs": 0 },
              "pitchData": {
                "startSpeed": 84.8,
                "endSpeed": 78.0,
                "strikeZoneTop": 3.69,
                "strikeZoneBottom": 1.8,
                "coordinates": {
                  "aY": 24.58352576118803,
                  "aZ": -28.31103841730756,
                  "pfxX": 9.141971134656519,
                  "pfxZ": 2.498069077700527,
                  "pX": 0.7019122594354282,
                  "pZ": 2.1508517712712227,
                  "vX0": 2.6852225304897903,
                  "vY0": -123.50043898696059,
                  "vZ0": -1.21537056430504,
                  "x": 90.24,
                  "y": 180.71,
                  "x0": -1.586969998301018,
                  "y0": 50.0013572322269,
                  "z0": 5.030470092770093,
                  "aX": 14.119550957385796
                },
                "breaks": {
                  "breakAngle": 27.6,
                  "breakLength": 8.4,
                  "breakY": 24.0,
                  "spinRate": 2820,
                  "spinDirection": 72
                },
                "zone": 9,
                "typeConfidence": 0.91,
                "plateTime": 0.44349824335992105,
                "extension": 5.875715205332251
              },
              "index": 1,
              "playId": "e4418282-e359-46c9-b8fc-b047d261a77a",
              "pitchNumber": 2,
              "startTime": "2022-11-02T01:19:45.098Z",
              "endTime": "2022-11-02T01:19:48.301Z",
              "isPitch": true,
              "type": "pitch"
            },
            {
              "details": {
                "call": { "code": "S", "description": "Swinging Strike" },
                "description": "Swinging Strike",
                "code": "S",
                "ballColor": "rgba(170, 21, 11, 1.0)",
                "trailColor": "rgba(0, 0, 254, 1.0)",
                "isInPlay": false,
                "isStrike": true,
                "isBall": false,
                "type": { "code": "SL", "description": "Slider" },
                "isOut": false,
                "hasReview": false
              },
              "count": { "balls": 1, "strikes": 2, "outs": 0 },
              "pitchData": {
                "startSpeed": 84.6,
                "endSpeed": 78.0,
                "strikeZoneTop": 3.69,
                "strikeZoneBottom": 1.8,
                "coordinates": {
                  "aY": 23.449096650276324,
                  "aZ": -25.175006023637945,
                  "pfxX": 8.704761910212023,
                  "pfxZ": 4.529602038356073,
                  "pX": 0.7775784002947786,
                  "pZ": 2.6862828186198695,
                  "vX0": 2.7675343064955396,
                  "vY0": -123.25167611677863,
                  "vZ0": -0.5020438720561957,
                  "x": 87.36,
                  "y": 166.25,
                  "x0": -1.4895653431228013,
                  "y0": 50.00423149275545,
                  "z0": 5.010214056557901,
                  "aX": 13.453180697742638
                },
                "breaks": {
                  "breakAngle": 28.8,
                  "breakLength": 7.2,
                  "breakY": 24.0,
                  "spinRate": 2901,
                  "spinDirection": 76
                },
                "zone": 6,
                "typeConfidence": 0.91,
                "plateTime": 0.4436298541349184,
                "extension": 5.84438888479764
              },
              "index": 2,
              "playId": "8fe129f5-9d0b-4f91-9288-a3e24d5edc93",
              "pitchNumber": 3,
              "startTime": "2022-11-02T01:20:03.460Z",
              "endTime": "2022-11-02T01:20:06.460Z",
              "isPitch": true,
              "type": "pitch"
            },
            {
              "details": {
                "call": { "code": "F", "description": "Foul" },
                "description": "Foul",
                "code": "F",
                "ballColor": "rgba(170, 21, 11, 1.0)",
                "trailColor": "rgba(0, 85, 254, 1.0)",
                "isInPlay": false,
                "isStrike": true,
                "isBall": false,
                "type": { "code": "CH", "description": "Changeup" },
                "isOut": false,
                "hasReview": false
              },
              "count": { "balls": 1, "strikes": 2, "outs": 0 },
              "pitchData": {
                "startSpeed": 87.4,
                "endSpeed": 81.0,
                "strikeZoneTop": 3.69,
                "strikeZoneBottom": 1.8,
                "coordinates": {
                  "aY": 24.359453900103,
                  "aZ": -34.33486853100439,
                  "pfxX": -9.319804387304147,
                  "pfxZ": -1.3069862470589246,
                  "pX": -0.4452637162387316,
                  "pZ": 1.2194979957269012,
                  "vX0": 5.37706943020703,
                  "vY0": -127.25586644048984,
                  "vZ0": -2.8992265962119452,
                  "x": 133.97,
                  "y": 205.85,
                  "x0": -1.3669585426320192,
                  "y0": 50.00338611718625,
                  "z0": 5.0738711753027586,
                  "aX": -15.395734058320643
                },
                "breaks": {
                  "breakAngle": 22.8,
                  "breakLength": 9.6,
                  "breakY": 24.0,
                  "spinRate": 1686,
                  "spinDirection": 269
                },
                "zone": 13,
                "typeConfidence": 0.91,
                "plateTime": 0.4292290340999618,
                "extension": 5.7088253169320495
              },
              "index": 3,
              "playId": "d60f3a82-e3dd-4952-9d1d-e01c2f7267a4",
              "pitchNumber": 4,
              "startTime": "2022-11-02T01:20:21.660Z",
              "endTime": "2022-11-02T01:20:25.489Z",
              "isPitch": true,
              "type": "pitch"
            },
            {
              "details": {
                "call": { "code": "X", "description": "In play, out(s)" },
                "description": "In play, out(s)",
                "code": "X",
                "ballColor": "rgba(26, 86, 190, 1.0)",
                "trailColor": "rgba(0, 0, 254, 1.0)",
                "isInPlay": true,
                "isStrike": false,
                "isBall": false,
                "type": { "code": "SL", "description": "Slider" },
                "isOut": true,
                "hasReview": false
              },
              "count": { "balls": 1, "strikes": 2, "outs": 0 },
              "pitchData": {
                "startSpeed": 85.1,
                "endSpeed": 77.4,
                "strikeZoneTop": 3.69,
                "strikeZoneBottom": 1.8,
                "coordinates": {
                  "aY": 27.37754847095725,
                  "aZ": -25.212326624746414,
                  "pfxX": 8.265415058868141,
                  "pfxZ": 4.531769165350282,
                  "pX": 0.1914750711196511,
                  "pZ": 2.262907332453218,
                  "vX0": 1.5879212305547383,
                  "vY0": -123.89216371833432,
                  "vZ0": -1.2849691369753689,
                  "x": 109.7,
                  "y": 177.68,
                  "x0": -1.5328112227918773,
                  "y0": 50.00553341466369,
                  "z0": 4.918211167357244,
                  "aX": 12.703417498175856
                },
                "breaks": {
                  "breakAngle": 27.6,
                  "breakLength": 7.2,
                  "breakY": 24.0,
                  "spinRate": 2876,
                  "spinDirection": 81
                },
                "zone": 8,
                "typeConfidence": 0.9,
                "plateTime": 0.44404529719443264,
                "extension": 5.702722646479522
              },
              "hitData": {
                "launchSpeed": 54.7,
                "launchAngle": -4.0,
                "totalDistance": 22.0,
                "trajectory": "ground_ball",
                "hardness": "soft",
                "location": "6",
                "coordinates": { "coordX": 116.53, "coordY": 154.12 }
              },
              "index": 4,
              "playId": "b098fcad-d010-4f3e-9fde-f0ac08f5c010",
              "pitchNumber": 5,
              "startTime": "2022-11-02T01:20:44.352Z",
              "endTime": "2022-11-02T01:20:52.414Z",
              "isPitch": true,
              "type": "pitch"
            }
          ],
          "playEndTime": "2022-11-02T01:20:52.414Z",
          "atBatIndex": 27
        },
        {
          "result": {
            "type": "atBat",
            "event": "Flyout",
            "eventType": "field_out",
            "description": "Alec Bohm flies out to center fielder Chas McCormick.",
            "rbi": 0,
            "awayScore": 0,
            "homeScore": 4,
            "isOut": true
          },
          "about": {
            "atBatIndex": 28,
            "halfInning": "bottom",
            "isTopInning": false,
            "inning": 4,
            "startTime": "2022-11-02T01:21:12.197Z",
            "endTime": "2022-11-02T01:21:49.724Z",
            "isComplete": true,
            "isScoringPlay": false,
            "hasReview": false,
            "hasOut": true,
            "captivatingIndex": 0
          },
          "count": { "balls": 1, "strikes": 0, "outs": 2 },
          "matchup": {
            "batter": {
              "id": 664761,
              "fullName": "Alec Bohm",
              "link": "/api/v1/people/664761"
            },
            "batSide": { "code": "R", "description": "Right" },
            "pitcher": {
              "id": 621121,
              "fullName": "Lance McCullers Jr.",
              "link": "/api/v1/people/621121"
            },
            "pitchHand": { "code": "R", "description": "Right" },
            "batterHotColdZones": [],
            "pitcherHotColdZones": [],
            "splits": {
              "batter": "vs_RHP",
              "pitcher": "vs_RHB",
              "menOnBase": "Empty"
            }
          },
          "pitchIndex": [0, 1],
          "actionIndex": [],
          "runnerIndex": [0],
          "runners": [
            {
              "movement": {
                "originBase": null,
                "start": null,
                "end": null,
                "outBase": "1B",
                "isOut": true,
                "outNumber": 2
              },
              "details": {
                "event": "Flyout",
                "eventType": "field_out",
                "movementReason": null,
                "runner": {
                  "id": 664761,
                  "fullName": "Alec Bohm",
                  "link": "/api/v1/people/664761"
                },
                "responsiblePitcher": null,
                "isScoringEvent": false,
                "rbi": false,
                "earned": false,
                "teamUnearned": false,
                "playIndex": 1
              },
              "credits": [
                {
                  "player": { "id": 676801, "link": "/api/v1/people/676801" },
                  "position": {
                    "code": "8",
                    "name": "Outfielder",
                    "type": "Outfielder",
                    "abbreviation": "CF"
                  },
                  "credit": "f_putout"
                }
              ]
            }
          ],
          "playEvents": [
            {
              "details": {
                "call": { "code": "B", "description": "Ball" },
                "description": "Ball",
                "code": "B",
                "ballColor": "rgba(39, 161, 39, 1.0)",
                "trailColor": "rgba(0, 0, 254, 1.0)",
                "isInPlay": false,
                "isStrike": false,
                "isBall": true,
                "type": { "code": "SL", "description": "Slider" },
                "isOut": false,
                "hasReview": false
              },
              "count": { "balls": 1, "strikes": 0, "outs": 1 },
              "pitchData": {
                "startSpeed": 86.2,
                "endSpeed": 79.1,
                "strikeZoneTop": 3.42491642998784,
                "strikeZoneBottom": 1.54728672114035,
                "coordinates": {
                  "aY": 26.40509507752438,
                  "aZ": -26.38094255166619,
                  "pfxX": 8.887488654463091,
                  "pfxZ": 3.654983933417025,
                  "pX": 2.0127560592204925,
                  "pZ": 1.807296993550005,
                  "vX0": 5.4427962136619366,
                  "vY0": -125.41974320731204,
                  "vZ0": -2.456697905571609,
                  "x": 40.28,
                  "y": 189.98,
                  "x0": -1.343604358770038,
                  "y0": 50.005619585679305,
                  "z0": 4.960774245716609,
                  "aX": 14.097435825152326
                },
                "breaks": {
                  "breakAngle": 28.8,
                  "breakLength": 8.4,
                  "breakY": 24.0,
                  "spinRate": 2939,
                  "spinDirection": 65
                },
                "zone": 14,
                "typeConfidence": 0.91,
                "plateTime": 0.43745179602277906,
                "extension": 6.028555225773258
              },
              "index": 0,
              "playId": "9aad2d8c-0d44-4de7-acb2-420f15025f76",
              "pitchNumber": 1,
              "startTime": "2022-11-02T01:21:27.110Z",
              "endTime": "2022-11-02T01:21:30.110Z",
              "isPitch": true,
              "type": "pitch"
            },
            {
              "details": {
                "call": { "code": "X", "description": "In play, out(s)" },
                "description": "In play, out(s)",
                "code": "X",
                "ballColor": "rgba(26, 86, 190, 1.0)",
                "trailColor": "rgba(0, 0, 254, 1.0)",
                "isInPlay": true,
                "isStrike": false,
                "isBall": false,
                "type": { "code": "SL", "description": "Slider" },
                "isOut": true,
                "hasReview": false
              },
              "count": { "balls": 1, "strikes": 0, "outs": 1 },
              "pitchData": {
                "startSpeed": 84.6,
                "endSpeed": 77.2,
                "strikeZoneTop": 3.46,
                "strikeZoneBottom": 1.55,
                "coordinates": {
                  "aY": 26.62193335865645,
                  "aZ": -27.706876332839403,
                  "pfxX": 10.637234701489596,
                  "pfxZ": 2.9346909939531463,
                  "pX": 0.9077604453795771,
                  "pZ": 1.9758205335877144,
                  "vX0": 2.4505920723176033,
                  "vY0": -123.1399672871081,
                  "vZ0": -1.4760072306552798,
                  "x": 82.4,
                  "y": 185.43,
                  "x0": -1.4838545156488112,
                  "y0": 50.00071122188386,
                  "z0": 4.948060814291612,
                  "aX": 16.178050578178166
                },
                "breaks": {
                  "breakAngle": 31.2,
                  "breakLength": 8.4,
                  "breakY": 24.0,
                  "spinRate": 2973,
                  "spinDirection": 75
                },
                "zone": 14,
                "typeConfidence": 0.91,
                "plateTime": 0.4464305156433004,
                "extension": 6.019043701719648
              },
              "hitData": {
                "launchSpeed": 85.0,
                "launchAngle": 29.0,
                "totalDistance": 316.0,
                "trajectory": "fly_ball",
                "hardness": "medium",
                "location": "8",
                "coordinates": { "coordX": 118.02, "coordY": 72.85 }
              },
              "index": 1,
              "playId": "9c3ffa26-69d1-4255-8b97-8343a27de3f4",
              "pitchNumber": 2,
              "startTime": "2022-11-02T01:21:40.513Z",
              "endTime": "2022-11-02T01:21:49.724Z",
              "isPitch": true,
              "type": "pitch"
            }
          ],
          "playEndTime": "2022-11-02T01:21:49.724Z",
          "atBatIndex": 28
        },
        {
          "result": {
            "type": "atBat",
            "event": "Groundout",
            "eventType": "field_out",
            "description": "Bryson Stott grounds out, first baseman Yuli Gurriel to pitcher Lance McCullers Jr.",
            "rbi": 0,
            "awayScore": 0,
            "homeScore": 4,
            "isOut": true
          },
          "about": {
            "atBatIndex": 29,
            "halfInning": "bottom",
            "isTopInning": false,
            "inning": 4,
            "startTime": "2022-11-02T01:22:01.644Z",
            "endTime": "2022-11-02T01:22:42.758Z",
            "isComplete": true,
            "isScoringPlay": false,
            "hasReview": false,
            "hasOut": true,
            "captivatingIndex": 0
          },
          "count": { "balls": 0, "strikes": 1, "outs": 3 },
          "matchup": {
            "batter": {
              "id": 681082,
              "fullName": "Bryson Stott",
              "link": "/api/v1/people/681082"
            },
            "batSide": { "code": "L", "description": "Left" },
            "pitcher": {
              "id": 621121,
              "fullName": "Lance McCullers Jr.",
              "link": "/api/v1/people/621121"
            },
            "pitchHand": { "code": "R", "description": "Right" },
            "batterHotColdZones": [],
            "pitcherHotColdZones": [],
            "splits": {
              "batter": "vs_RHP",
              "pitcher": "vs_LHB",
              "menOnBase": "Empty"
            }
          },
          "pitchIndex": [0, 1],
          "actionIndex": [],
          "runnerIndex": [0],
          "runners": [
            {
              "movement": {
                "originBase": null,
                "start": null,
                "end": null,
                "outBase": "1B",
                "isOut": true,
                "outNumber": 3
              },
              "details": {
                "event": "Groundout",
                "eventType": "field_out",
                "movementReason": null,
                "runner": {
                  "id": 681082,
                  "fullName": "Bryson Stott",
                  "link": "/api/v1/people/681082"
                },
                "responsiblePitcher": null,
                "isScoringEvent": false,
                "rbi": false,
                "earned": false,
                "teamUnearned": false,
                "playIndex": 1
              },
              "credits": [
                {
                  "player": { "id": 493329, "link": "/api/v1/people/493329" },
                  "position": {
                    "code": "3",
                    "name": "First Base",
                    "type": "Infielder",
                    "abbreviation": "1B"
                  },
                  "credit": "f_assist"
                },
                {
                  "player": { "id": 621121, "link": "/api/v1/people/621121" },
                  "position": {
                    "code": "1",
                    "name": "Pitcher",
                    "type": "Pitcher",
                    "abbreviation": "P"
                  },
                  "credit": "f_putout"
                }
              ]
            }
          ],
          "playEvents": [
            {
              "details": {
                "call": { "code": "C", "description": "Called Strike" },
                "description": "Called Strike",
                "code": "C",
                "ballColor": "rgba(170, 21, 11, 1.0)",
                "trailColor": "rgba(152, 0, 101, 1.0)",
                "isInPlay": false,
                "isStrike": true,
                "isBall": false,
                "type": { "code": "FC", "description": "Cutter" },
                "isOut": false,
                "hasReview": false
              },
              "count": { "balls": 0, "strikes": 1, "outs": 2 },
              "pitchData": {
                "startSpeed": 88.5,
                "endSpeed": 81.5,
                "strikeZoneTop": 3.1926216151308,
                "strikeZoneBottom": 1.47011645497276,
                "coordinates": {
                  "aY": 25.97024059345271,
                  "aZ": -29.783311102839885,
                  "pfxX": 1.5286707341920431,
                  "pfxZ": 1.4154760333479004,
                  "pX": 0.5739777974474796,
                  "pZ": 2.46710787295898,
                  "vX0": 4.615047984658267,
                  "vY0": -128.89427077351624,
                  "vZ0": -1.361944931317977,
                  "x": 95.12,
                  "y": 172.17,
                  "x0": -1.4359409718760692,
                  "y0": 50.00332772322962,
                  "z0": 5.295240159678565,
                  "aX": 2.579059551106365
                },
                "breaks": {
                  "breakAngle": 6.0,
                  "breakLength": 7.2,
                  "breakY": 24.0,
                  "spinRate": 2623,
                  "spinDirection": 138
                },
                "zone": 6,
                "typeConfidence": 0.91,
                "plateTime": 0.4244283993923985,
                "extension": 5.8899239040566345
              },
              "index": 0,
              "playId": "45b5da12-98e9-4c7d-a599-72a792236d6a",
              "pitchNumber": 1,
              "startTime": "2022-11-02T01:22:21.437Z",
              "endTime": "2022-11-02T01:22:25.034Z",
              "isPitch": true,
              "type": "pitch"
            },
            {
              "details": {
                "call": { "code": "X", "description": "In play, out(s)" },
                "description": "In play, out(s)",
                "code": "X",
                "ballColor": "rgba(26, 86, 190, 1.0)",
                "trailColor": "rgba(0, 85, 254, 1.0)",
                "isInPlay": true,
                "isStrike": false,
                "isBall": false,
                "type": { "code": "CH", "description": "Changeup" },
                "isOut": true,
                "hasReview": false
              },
              "count": { "balls": 0, "strikes": 1, "outs": 2 },
              "pitchData": {
                "startSpeed": 87.5,
                "endSpeed": 80.6,
                "strikeZoneTop": 3.23,
                "strikeZoneBottom": 1.48,
                "coordinates": {
                  "aY": 25.529696223166457,
                  "aZ": -33.750034435231456,
                  "pfxX": -10.280566720705908,
                  "pfxZ": -0.9591789294383375,
                  "pX": -0.32854886628010554,
                  "pZ": 1.3724127304150278,
                  "vX0": 6.292926619410598,
                  "vY0": -127.32964151521715,
                  "vZ0": -2.379299101240658,
                  "x": 129.52,
                  "y": 201.72,
                  "x0": -1.4931970274460362,
                  "y0": 50.00252881161075,
                  "z0": 4.98298022960936,
                  "aX": -16.922865781962592
                },
                "breaks": {
                  "breakAngle": 25.2,
                  "breakLength": 9.6,
                  "breakY": 24.0,
                  "spinRate": 1736,
                  "spinDirection": 272
                },
                "zone": 7,
                "typeConfidence": 0.91,
                "plateTime": 0.42976796026125896,
                "extension": 5.678642495762083
              },
              "hitData": {
                "launchSpeed": 84.5,
                "launchAngle": -18.0,
                "totalDistance": 6.0,
                "trajectory": "ground_ball",
                "hardness": "medium",
                "location": "3",
                "coordinates": { "coordX": 153.54, "coordY": 165.78 }
              },
              "index": 1,
              "playId": "55ea728d-8f09-40d4-8aaa-5c43e860c1ce",
              "pitchNumber": 2,
              "startTime": "2022-11-02T01:22:35.813Z",
              "endTime": "2022-11-02T01:22:42.758Z",
              "isPitch": true,
              "type": "pitch"
            }
          ],
          "playEndTime": "2022-11-02T01:22:42.758Z",
          "atBatIndex": 29
        },
        {
          "result": {
            "type": "atBat",
            "event": "Groundout",
            "eventType": "field_out",
            "description": "Yuli Gurriel grounds out, second baseman Jean Segura to first baseman Rhys Hoskins.",
            "rbi": 0,
            "awayScore": 0,
            "homeScore": 4,
            "isOut": true
          },
          "about": {
            "atBatIndex": 30,
            "halfInning": "top",
            "isTopInning": true,
            "inning": 5,
            "startTime": "2022-11-02T01:25:21.200Z",
            "endTime": "2022-11-02T01:26:35.337Z",
            "isComplete": true,
            "isScoringPlay": false,
            "hasReview": false,
            "hasOut": true,
            "captivatingIndex": 0
          },
          "count": { "balls": 0, "strikes": 1, "outs": 1 },
          "matchup": {
            "batter": {
              "id": 493329,
              "fullName": "Yuli Gurriel",
              "link": "/api/v1/people/493329"
            },
            "batSide": { "code": "R", "description": "Right" },
            "pitcher": {
              "id": 624133,
              "fullName": "Ranger Suarez",
              "link": "/api/v1/people/624133"
            },
            "pitchHand": { "code": "L", "description": "Left" },
            "batterHotColdZones": [],
            "pitcherHotColdZones": [],
            "splits": {
              "batter": "vs_LHP",
              "pitcher": "vs_RHB",
              "menOnBase": "Empty"
            }
          },
          "pitchIndex": [0, 1],
          "actionIndex": [],
          "runnerIndex": [0],
          "runners": [
            {
              "movement": {
                "originBase": null,
                "start": null,
                "end": null,
                "outBase": "1B",
                "isOut": true,
                "outNumber": 1
              },
              "details": {
                "event": "Groundout",
                "eventType": "field_out",
                "movementReason": null,
                "runner": {
                  "id": 493329,
                  "fullName": "Yuli Gurriel",
                  "link": "/api/v1/people/493329"
                },
                "responsiblePitcher": null,
                "isScoringEvent": false,
                "rbi": false,
                "earned": false,
                "teamUnearned": false,
                "playIndex": 1
              },
              "credits": [
                {
                  "player": { "id": 516416, "link": "/api/v1/people/516416" },
                  "position": {
                    "code": "4",
                    "name": "Second Base",
                    "type": "Infielder",
                    "abbreviation": "2B"
                  },
                  "credit": "f_assist"
                },
                {
                  "player": { "id": 656555, "link": "/api/v1/people/656555" },
                  "position": {
                    "code": "3",
                    "name": "First Base",
                    "type": "Infielder",
                    "abbreviation": "1B"
                  },
                  "credit": "f_putout"
                }
              ]
            }
          ],
          "playEvents": [
            {
              "details": {
                "call": { "code": "F", "description": "Foul" },
                "description": "Foul",
                "code": "F",
                "ballColor": "rgba(170, 21, 11, 1.0)",
                "trailColor": "rgba(50, 0, 221, 1.0)",
                "isInPlay": false,
                "isStrike": true,
                "isBall": false,
                "type": { "code": "SI", "description": "Sinker" },
                "isOut": false,
                "hasReview": false
              },
              "count": { "balls": 0, "strikes": 1, "outs": 0 },
              "pitchData": {
                "startSpeed": 92.9,
                "endSpeed": 84.3,
                "strikeZoneTop": 3.39,
                "strikeZoneBottom": 1.64,
                "coordinates": {
                  "aY": 32.47669687902967,
                  "aZ": -24.72725093001993,
                  "pfxX": 9.918780884226068,
                  "pfxZ": 4.076295587936358,
                  "pX": 1.1979294075539297,
                  "pZ": 2.067709866362863,
                  "vX0": -5.520462194158074,
                  "vY0": -135.0970598576021,
                  "vZ0": -5.048677786828729,
                  "x": 71.34,
                  "y": 182.95,
                  "x0": 1.9911338240800398,
                  "y0": 50.00489732672894,
                  "z0": 5.723779431737895,
                  "aX": 18.133371325295435
                },
                "breaks": {
                  "breakAngle": 33.6,
                  "breakLength": 7.2,
                  "breakY": 24.0,
                  "spinRate": 2009,
                  "spinDirection": 135
                },
                "zone": 14,
                "typeConfidence": 0.92,
                "plateTime": 0.4071594774369154,
                "extension": 6.040673963199725
              },
              "index": 0,
              "playId": "bfad7634-c9d3-4c01-af82-41e9933a2ef4",
              "pitchNumber": 1,
              "startTime": "2022-11-02T01:26:06.448Z",
              "endTime": "2022-11-02T01:26:09.633Z",
              "isPitch": true,
              "type": "pitch"
            },
            {
              "details": {
                "call": { "code": "X", "description": "In play, out(s)" },
                "description": "In play, out(s)",
                "code": "X",
                "ballColor": "rgba(26, 86, 190, 1.0)",
                "trailColor": "rgba(188, 0, 33, 1.0)",
                "isInPlay": true,
                "isStrike": false,
                "isBall": false,
                "type": { "code": "FF", "description": "Four-Seam Fastball" },
                "isOut": true,
                "hasReview": false
              },
              "count": { "balls": 0, "strikes": 1, "outs": 0 },
              "pitchData": {
                "startSpeed": 94.0,
                "endSpeed": 85.8,
                "strikeZoneTop": 3.39,
                "strikeZoneBottom": 1.64,
                "coordinates": {
                  "aY": 30.340474042955208,
                  "aZ": -18.776815786074966,
                  "pfxX": 5.338367876201886,
                  "pfxZ": 7.09732486301867,
                  "pX": -0.4685512567671981,
                  "pZ": 3.2687105126525666,
                  "vX0": -8.304478852181786,
                  "vY0": -136.58193140440997,
                  "vZ0": -3.271433320471244,
                  "x": 134.86,
                  "y": 150.52,
                  "x0": 1.9190635610250417,
                  "y0": 50.002962851790876,
                  "z0": 5.774760579303123,
                  "aX": 10.077639160752867
                },
                "breaks": {
                  "breakAngle": 22.8,
                  "breakLength": 4.8,
                  "breakY": 24.0,
                  "spinRate": 1940,
                  "spinDirection": 126
                },
                "zone": 1,
                "typeConfidence": 0.96,
                "plateTime": 0.40117633172667055,
                "extension": 6.009915253140764
              },
              "hitData": {
                "launchSpeed": 85.9,
                "launchAngle": -6.0,
                "totalDistance": 26.0,
                "trajectory": "ground_ball",
                "hardness": "medium",
                "location": "4",
                "coordinates": { "coordX": 146.95, "coordY": 150.06 }
              },
              "index": 1,
              "playId": "be4e2bee-9903-4a61-a91a-540000daf1f2",
              "pitchNumber": 2,
              "startTime": "2022-11-02T01:26:27.338Z",
              "endTime": "2022-11-02T01:26:35.337Z",
              "isPitch": true,
              "type": "pitch"
            }
          ],
          "playEndTime": "2022-11-02T01:26:35.337Z",
          "atBatIndex": 30
        },
        {
          "result": {
            "type": "atBat",
            "event": "Strikeout",
            "eventType": "strikeout",
            "description": "David Hensley strikes out swinging.",
            "rbi": 0,
            "awayScore": 0,
            "homeScore": 4,
            "isOut": true
          },
          "about": {
            "atBatIndex": 31,
            "halfInning": "top",
            "isTopInning": true,
            "inning": 5,
            "startTime": "2022-11-02T01:26:46.151Z",
            "endTime": "2022-11-02T01:27:50.813Z",
            "isComplete": true,
            "isScoringPlay": false,
            "hasReview": false,
            "hasOut": true,
            "captivatingIndex": 14
          },
          "count": { "balls": 0, "strikes": 3, "outs": 2 },
          "matchup": {
            "batter": {
              "id": 682073,
              "fullName": "David Hensley",
              "link": "/api/v1/people/682073"
            },
            "batSide": { "code": "R", "description": "Right" },
            "pitcher": {
              "id": 624133,
              "fullName": "Ranger Suarez",
              "link": "/api/v1/people/624133"
            },
            "pitchHand": { "code": "L", "description": "Left" },
            "batterHotColdZones": [],
            "pitcherHotColdZones": [],
            "splits": {
              "batter": "vs_LHP",
              "pitcher": "vs_RHB",
              "menOnBase": "Empty"
            }
          },
          "pitchIndex": [0, 1, 2],
          "actionIndex": [],
          "runnerIndex": [0],
          "runners": [
            {
              "movement": {
                "originBase": null,
                "start": null,
                "end": null,
                "outBase": "1B",
                "isOut": true,
                "outNumber": 2
              },
              "details": {
                "event": "Strikeout",
                "eventType": "strikeout",
                "movementReason": null,
                "runner": {
                  "id": 682073,
                  "fullName": "David Hensley",
                  "link": "/api/v1/people/682073"
                },
                "responsiblePitcher": null,
                "isScoringEvent": false,
                "rbi": false,
                "earned": false,
                "teamUnearned": false,
                "playIndex": 2
              },
              "credits": [
                {
                  "player": { "id": 592663, "link": "/api/v1/people/592663" },
                  "position": {
                    "code": "2",
                    "name": "Catcher",
                    "type": "Catcher",
                    "abbreviation": "C"
                  },
                  "credit": "f_putout"
                }
              ]
            }
          ],
          "playEvents": [
            {
              "details": {
                "call": { "code": "C", "description": "Called Strike" },
                "description": "Called Strike",
                "code": "C",
                "ballColor": "rgba(170, 21, 11, 1.0)",
                "trailColor": "rgba(152, 0, 101, 1.0)",
                "isInPlay": false,
                "isStrike": true,
                "isBall": false,
                "type": { "code": "FC", "description": "Cutter" },
                "isOut": false,
                "hasReview": false
              },
              "count": { "balls": 0, "strikes": 1, "outs": 1 },
              "pitchData": {
                "startSpeed": 85.8,
                "endSpeed": 78.2,
                "strikeZoneTop": 3.55252094576434,
                "strikeZoneBottom": 1.70347426253633,
                "coordinates": {
                  "aY": 27.7370989714954,
                  "aZ": -30.697392911961263,
                  "pfxX": -1.7011251807341683,
                  "pfxZ": 0.9492848802900387,
                  "pX": 0.8605238539520705,
                  "pZ": 2.1507343111953725,
                  "vX0": -2.3996206646261022,
                  "vY0": -124.87796543865555,
                  "vZ0": -2.6308597070917568,
                  "x": 84.2,
                  "y": 180.71,
                  "x0": 2.059068355780562,
                  "y0": 50.00499018326598,
                  "z0": 5.771453388932178,
                  "aX": -2.6575466540982413
                },
                "breaks": {
                  "breakAngle": 6.0,
                  "breakLength": 8.4,
                  "breakY": 24.0,
                  "spinRate": 2011,
                  "spinDirection": 210
                },
                "zone": 14,
                "typeConfidence": 0.54,
                "plateTime": 0.4404761996365343,
                "extension": 6.071276102184426
              },
              "index": 0,
              "playId": "09c88b46-8ab1-4605-91db-5ebb24026dba",
              "pitchNumber": 1,
              "startTime": "2022-11-02T01:27:11.178Z",
              "endTime": "2022-11-02T01:27:14.432Z",
              "isPitch": true,
              "type": "pitch"
            },
            {
              "details": {
                "call": { "code": "F", "description": "Foul" },
                "description": "Foul",
                "code": "F",
                "ballColor": "rgba(170, 21, 11, 1.0)",
                "trailColor": "rgba(188, 0, 33, 1.0)",
                "isInPlay": false,
                "isStrike": true,
                "isBall": false,
                "type": { "code": "FF", "description": "Four-Seam Fastball" },
                "isOut": false,
                "hasReview": false
              },
              "count": { "balls": 0, "strikes": 2, "outs": 1 },
              "pitchData": {
                "startSpeed": 93.4,
                "endSpeed": 85.4,
                "strikeZoneTop": 3.4,
                "strikeZoneBottom": 1.64,
                "coordinates": {
                  "aY": 29.60070260723104,
                  "aZ": -17.20013613347113,
                  "pfxX": 4.705409620835324,
                  "pfxZ": 8.01161875012728,
                  "pX": -0.03536482504215762,
                  "pZ": 3.283440471878648,
                  "vX0": -6.807609932504825,
                  "vY0": -135.8236165139615,
                  "vZ0": -3.366712154810811,
                  "x": 118.35,
                  "y": 150.13,
                  "x0": 1.8915802193835753,
                  "y0": 50.00552446340189,
                  "z0": 5.7344166148102875,
                  "aX": 8.798205630778618
                },
                "breaks": {
                  "breakAngle": 22.8,
                  "breakLength": 4.8,
                  "breakY": 24.0,
                  "spinRate": 1963,
                  "spinDirection": 124
                },
                "zone": 2,
                "typeConfidence": 0.96,
                "plateTime": 0.4031910701481789,
                "extension": 6.358621814828464
              },
              "index": 1,
              "playId": "43f3c6b7-0bf1-4867-9e7d-aae14a6144ac",
              "pitchNumber": 2,
              "startTime": "2022-11-02T01:27:23.735Z",
              "endTime": "2022-11-02T01:27:27.311Z",
              "isPitch": true,
              "type": "pitch"
            },
            {
              "details": {
                "call": { "code": "S", "description": "Swinging Strike" },
                "description": "Swinging Strike",
                "code": "S",
                "ballColor": "rgba(170, 21, 11, 1.0)",
                "trailColor": "rgba(0, 34, 255, 1.0)",
                "isInPlay": false,
                "isStrike": true,
                "isBall": false,
                "type": { "code": "CU", "description": "Curveball" },
                "isOut": true,
                "hasReview": false
              },
              "count": { "balls": 0, "strikes": 3, "outs": 1 },
              "pitchData": {
                "startSpeed": 77.2,
                "endSpeed": 71.0,
                "strikeZoneTop": 3.4,
                "strikeZoneBottom": 1.64,
                "coordinates": {
                  "aY": 22.56747501153353,
                  "aZ": -39.460880899721154,
                  "pfxX": -5.068579469835674,
                  "pfxZ": -5.770246422326199,
                  "pX": -1.0287297414182985,
                  "pZ": 1.3083609691746334,
                  "vX0": -4.439932439849614,
                  "vY0": -112.3428740571607,
                  "vZ0": -0.8810797136627708,
                  "x": 156.21,
                  "y": 203.45,
                  "x0": 1.6400855238990202,
                  "y0": 50.00155667659787,
                  "z0": 5.757804097820179,
                  "aX": -6.402269832660096
                },
                "breaks": {
                  "breakAngle": 9.6,
                  "breakLength": 13.2,
                  "breakY": 24.0,
                  "spinRate": 2201,
                  "spinDirection": 308
                },
                "zone": 13,
                "typeConfidence": 0.89,
                "plateTime": 0.489740508062416,
                "extension": 6.238104684658153
              },
              "index": 2,
              "playId": "0d55034f-0e03-41d3-828f-702754e6fc75",
              "pitchNumber": 3,
              "startTime": "2022-11-02T01:27:46.661Z",
              "endTime": "2022-11-02T01:27:50.813Z",
              "isPitch": true,
              "type": "pitch"
            }
          ],
          "playEndTime": "2022-11-02T01:27:50.813Z",
          "atBatIndex": 31
        },
        {
          "result": {
            "type": "atBat",
            "event": "Walk",
            "eventType": "walk",
            "description": "Chas McCormick walks.",
            "rbi": 0,
            "awayScore": 0,
            "homeScore": 4,
            "isOut": false
          },
          "about": {
            "atBatIndex": 32,
            "halfInning": "top",
            "isTopInning": true,
            "inning": 5,
            "startTime": "2022-11-02T01:28:03.251Z",
            "endTime": "2022-11-02T01:30:41.162Z",
            "isComplete": true,
            "isScoringPlay": false,
            "hasReview": false,
            "hasOut": false,
            "captivatingIndex": 0
          },
          "count": { "balls": 4, "strikes": 2, "outs": 2 },
          "matchup": {
            "batter": {
              "id": 676801,
              "fullName": "Chas McCormick",
              "link": "/api/v1/people/676801"
            },
            "batSide": { "code": "R", "description": "Right" },
            "pitcher": {
              "id": 624133,
              "fullName": "Ranger Suarez",
              "link": "/api/v1/people/624133"
            },
            "pitchHand": { "code": "L", "description": "Left" },
            "postOnFirst": {
              "id": 676801,
              "fullName": "Chas McCormick",
              "link": "/api/v1/people/676801"
            },
            "batterHotColdZones": [],
            "pitcherHotColdZones": [],
            "splits": {
              "batter": "vs_LHP",
              "pitcher": "vs_RHB",
              "menOnBase": "Men_On"
            }
          },
          "pitchIndex": [0, 1, 2, 3, 4, 5, 6],
          "actionIndex": [],
          "runnerIndex": [0],
          "runners": [
            {
              "movement": {
                "originBase": null,
                "start": null,
                "end": "1B",
                "outBase": null,
                "isOut": false,
                "outNumber": null
              },
              "details": {
                "event": "Walk",
                "eventType": "walk",
                "movementReason": null,
                "runner": {
                  "id": 676801,
                  "fullName": "Chas McCormick",
                  "link": "/api/v1/people/676801"
                },
                "responsiblePitcher": null,
                "isScoringEvent": false,
                "rbi": false,
                "earned": false,
                "teamUnearned": false,
                "playIndex": 6
              },
              "credits": []
            }
          ],
          "playEvents": [
            {
              "details": {
                "call": { "code": "C", "description": "Called Strike" },
                "description": "Called Strike",
                "code": "C",
                "ballColor": "rgba(170, 21, 11, 1.0)",
                "trailColor": "rgba(188, 0, 33, 1.0)",
                "isInPlay": false,
                "isStrike": true,
                "isBall": false,
                "type": { "code": "FF", "description": "Four-Seam Fastball" },
                "isOut": false,
                "hasReview": false
              },
              "count": { "balls": 0, "strikes": 1, "outs": 2 },
              "pitchData": {
                "startSpeed": 94.9,
                "endSpeed": 87.0,
                "strikeZoneTop": 3.32184043792005,
                "strikeZoneBottom": 1.60012338062716,
                "coordinates": {
                  "aY": 30.034177167211876,
                  "aZ": -17.845340312208542,
                  "pfxX": 4.560905165206167,
                  "pfxZ": 7.404229482459254,
                  "pX": 0.591817745183996,
                  "pZ": 2.739196346707059,
                  "vX0": -5.312294373464963,
                  "vY0": -138.08641115430925,
                  "vZ0": -4.787945929491199,
                  "x": 94.44,
                  "y": 164.82,
                  "x0": 1.9457499074106879,
                  "y0": 50.00598331927605,
                  "z0": 5.69196282218417,
                  "aX": 8.831284231417317
                },
                "breaks": {
                  "breakAngle": 22.8,
                  "breakLength": 4.8,
                  "breakY": 24.0,
                  "spinRate": 2001,
                  "spinDirection": 126
                },
                "zone": 6,
                "typeConfidence": 0.96,
                "plateTime": 0.39627833138877255,
                "extension": 6.038514767430729
              },
              "index": 0,
              "playId": "1f4aed18-610f-4710-a100-c63d87dae8d5",
              "pitchNumber": 1,
              "startTime": "2022-11-02T01:28:22.010Z",
              "endTime": "2022-11-02T01:28:25.733Z",
              "isPitch": true,
              "type": "pitch"
            },
            {
              "details": {
                "call": { "code": "S", "description": "Swinging Strike" },
                "description": "Swinging Strike",
                "code": "S",
                "ballColor": "rgba(170, 21, 11, 1.0)",
                "trailColor": "rgba(0, 34, 255, 1.0)",
                "isInPlay": false,
                "isStrike": true,
                "isBall": false,
                "type": { "code": "CU", "description": "Curveball" },
                "isOut": false,
                "hasReview": false
              },
              "count": { "balls": 0, "strikes": 2, "outs": 2 },
              "pitchData": {
                "startSpeed": 78.1,
                "endSpeed": 71.9,
                "strikeZoneTop": 3.21,
                "strikeZoneBottom": 1.54,
                "coordinates": {
                  "aY": 22.288918295241388,
                  "aZ": -40.803837738350595,
                  "pfxX": -6.080890662116573,
                  "pfxZ": -6.639571085299861,
                  "pX": 0.7530336208180541,
                  "pZ": 1.6989877664575868,
                  "vX0": -1.0087968397058151,
                  "vY0": -113.70997988294216,
                  "vZ0": -0.12755198658180533,
                  "x": 88.3,
                  "y": 192.91,
                  "x0": 1.9928191756060571,
                  "y0": 50.00221657891586,
                  "z0": 5.829281472324538,
                  "aX": -7.903827058399367
                },
                "breaks": {
                  "breakAngle": 10.8,
                  "breakLength": 13.2,
                  "breakY": 24.0,
                  "spinRate": 2321,
                  "spinDirection": 314
                },
                "zone": 9,
                "typeConfidence": 0.86,
                "plateTime": 0.48304460537023797,
                "extension": 6.0425346791155885
              },
              "index": 1,
              "playId": "4f6e907e-f772-4af9-a5f1-78b15e7e6ccd",
              "pitchNumber": 2,
              "startTime": "2022-11-02T01:28:37.476Z",
              "endTime": "2022-11-02T01:28:41.152Z",
              "isPitch": true,
              "type": "pitch"
            },
            {
              "details": {
                "call": { "code": "B", "description": "Ball" },
                "description": "Ball",
                "code": "B",
                "ballColor": "rgba(39, 161, 39, 1.0)",
                "trailColor": "rgba(0, 34, 255, 1.0)",
                "isInPlay": false,
                "isStrike": false,
                "isBall": true,
                "type": { "code": "CU", "description": "Curveball" },
                "isOut": false,
                "hasReview": false
              },
              "count": { "balls": 1, "strikes": 2, "outs": 2 },
              "pitchData": {
                "startSpeed": 77.7,
                "endSpeed": 72.0,
                "strikeZoneTop": 3.24439543211572,
                "strikeZoneBottom": 1.5221836606874,
                "coordinates": {
                  "aY": 22.029230068339864,
                  "aZ": -40.05851860226063,
                  "pfxX": -6.045529485634611,
                  "pfxZ": -6.131553479411657,
                  "pX": -0.21221465963010228,
                  "pZ": 0.40505302296862317,
                  "vX0": -2.813379531599096,
                  "vY0": -113.14430133836946,
                  "vZ0": -2.916819640252419,
                  "x": 125.09,
                  "y": 227.84,
                  "x0": 1.8353916083967787,
                  "y0": 50.000626567680406,
                  "z0": 5.753289587557353,
                  "aX": -7.779597032811368
                },
                "breaks": {
                  "breakAngle": 10.8,
                  "breakLength": 13.2,
                  "breakY": 24.0,
                  "spinRate": 2304,
                  "spinDirection": 309
                },
                "zone": 13,
                "typeConfidence": 0.88,
                "plateTime": 0.48543661787512216,
                "extension": 6.36055721178502
              },
              "index": 2,
              "playId": "b5b41bad-efb2-4c11-9927-784db8c29653",
              "pitchNumber": 3,
              "startTime": "2022-11-02T01:28:58.415Z",
              "endTime": "2022-11-02T01:29:01.415Z",
              "isPitch": true,
              "type": "pitch"
            },
            {
              "details": {
                "call": { "code": "B", "description": "Ball" },
                "description": "Ball",
                "code": "B",
                "ballColor": "rgba(39, 161, 39, 1.0)",
                "trailColor": "rgba(0, 85, 254, 1.0)",
                "isInPlay": false,
                "isStrike": false,
                "isBall": true,
                "type": { "code": "CH", "description": "Changeup" },
                "isOut": false,
                "hasReview": false
              },
              "count": { "balls": 2, "strikes": 2, "outs": 2 },
              "pitchData": {
                "startSpeed": 85.9,
                "endSpeed": 78.5,
                "strikeZoneTop": 3.27021425419505,
                "strikeZoneBottom": 1.54816606601887,
                "coordinates": {
                  "aY": 26.479408157917025,
                  "aZ": -27.435880399347436,
                  "pfxX": 7.803808749259776,
                  "pfxZ": 3.007542925971304,
                  "pX": 1.421029638887855,
                  "pZ": 2.3432289311095946,
                  "vX0": -3.5591764359874074,
                  "vY0": -125.01114790958763,
                  "vZ0": -2.7388227723563756,
                  "x": 62.83,
                  "y": 175.51,
                  "x0": 1.8535958772402288,
                  "y0": 50.001055573420274,
                  "z0": 5.7178765139187435,
                  "aX": 12.282996617872149
                },
                "breaks": {
                  "breakAngle": 22.8,
                  "breakLength": 8.4,
                  "breakY": 24.0,
                  "spinRate": 1307,
                  "spinDirection": 123
                },
                "zone": 14,
                "typeConfidence": 0.86,
                "plateTime": 0.4390630621519338,
                "extension": 6.1166941623463025
              },
              "index": 3,
              "playId": "81b07d33-6dd3-43c3-8690-4e56bd805551",
              "pitchNumber": 4,
              "startTime": "2022-11-02T01:29:24.742Z",
              "endTime": "2022-11-02T01:29:28.083Z",
              "isPitch": true,
              "type": "pitch"
            },
            {
              "details": {
                "call": { "code": "F", "description": "Foul" },
                "description": "Foul",
                "code": "F",
                "ballColor": "rgba(170, 21, 11, 1.0)",
                "trailColor": "rgba(0, 34, 255, 1.0)",
                "isInPlay": false,
                "isStrike": true,
                "isBall": false,
                "type": { "code": "CU", "description": "Curveball" },
                "isOut": false,
                "hasReview": false
              },
              "count": { "balls": 2, "strikes": 2, "outs": 2 },
              "pitchData": {
                "startSpeed": 78.5,
                "endSpeed": 72.4,
                "strikeZoneTop": 3.21,
                "strikeZoneBottom": 1.54,
                "coordinates": {
                  "aY": 22.05562548870883,
                  "aZ": -38.35138966049409,
                  "pfxX": -5.056951018941163,
                  "pfxZ": -4.688047816076739,
                  "pX": -0.6469180186254173,
                  "pZ": 1.7124271830447422,
                  "vX0": -4.2379768790538375,
                  "vY0": -114.28486355603282,
                  "vZ0": -0.48621814965874344,
                  "x": 141.66,
                  "y": 192.54,
                  "x0": 1.8920842150498192,
                  "y0": 50.00519515358872,
                  "z0": 5.711039912250642,
                  "aX": -6.656574510911147
                },
                "breaks": {
                  "breakAngle": 10.8,
                  "breakLength": 12.0,
                  "breakY": 24.0,
                  "spinRate": 2310,
                  "spinDirection": 306
                },
                "zone": 7,
                "typeConfidence": 0.85,
                "plateTime": 0.4801876075016063,
                "extension": 6.1097224841611855
              },
              "index": 4,
              "playId": "d6d0c9d8-7ab4-45e1-ab9f-41f7c7fb7d92",
              "pitchNumber": 5,
              "startTime": "2022-11-02T01:29:50.518Z",
              "endTime": "2022-11-02T01:29:54.103Z",
              "isPitch": true,
              "type": "pitch"
            },
            {
              "details": {
                "call": { "code": "B", "description": "Ball" },
                "description": "Ball",
                "code": "B",
                "ballColor": "rgba(39, 161, 39, 1.0)",
                "trailColor": "rgba(50, 0, 221, 1.0)",
                "isInPlay": false,
                "isStrike": false,
                "isBall": true,
                "type": { "code": "SI", "description": "Sinker" },
                "isOut": false,
                "hasReview": false
              },
              "count": { "balls": 3, "strikes": 2, "outs": 2 },
              "pitchData": {
                "startSpeed": 93.8,
                "endSpeed": 85.0,
                "strikeZoneTop": 3.27021425419505,
                "strikeZoneBottom": 1.57414598141484,
                "coordinates": {
                  "aY": 32.44406931523805,
                  "aZ": -25.397855417974245,
                  "pfxX": 10.580858595775236,
                  "pfxZ": 3.6554316109979457,
                  "pX": -2.2014970221243537,
                  "pZ": 2.186900602758558,
                  "vX0": -13.265115509445554,
                  "vY0": -135.90155820529793,
                  "vZ0": -4.797272845816682,
                  "x": 200.92,
                  "y": 179.73,
                  "x0": 1.390112564165216,
                  "y0": 50.001834782725886,
                  "z0": 5.760492739196905,
                  "aX": 19.603035410166175
                },
                "breaks": {
                  "breakAngle": 32.4,
                  "breakLength": 7.2,
                  "breakY": 24.0,
                  "spinRate": 1966,
                  "spinDirection": 138
                },
                "zone": 13,
                "typeConfidence": 0.92,
                "plateTime": 0.40452835207121796,
                "extension": 6.33727614664324
              },
              "index": 5,
              "playId": "d9de1a86-fb87-4f0c-b9f5-95efdcdc383a",
              "pitchNumber": 6,
              "startTime": "2022-11-02T01:30:16.507Z",
              "endTime": "2022-11-02T01:30:20.430Z",
              "isPitch": true,
              "type": "pitch"
            },
            {
              "details": {
                "call": { "code": "B", "description": "Ball" },
                "description": "Ball",
                "code": "B",
                "ballColor": "rgba(39, 161, 39, 1.0)",
                "trailColor": "rgba(152, 0, 101, 1.0)",
                "isInPlay": false,
                "isStrike": false,
                "isBall": true,
                "type": { "code": "FC", "description": "Cutter" },
                "isOut": false,
                "hasReview": false
              },
              "count": { "balls": 4, "strikes": 2, "outs": 2 },
              "pitchData": {
                "startSpeed": 89.1,
                "endSpeed": 81.9,
                "strikeZoneTop": 3.27021425419505,
                "strikeZoneBottom": 1.57414598141484,
                "coordinates": {
                  "aY": 27.493110960902786,
                  "aZ": -24.551734454593902,
                  "pfxX": -2.98831414861109,
                  "pfxZ": 4.490678709037429,
                  "pX": -0.8502595567204397,
                  "pZ": 1.3976665203899066,
                  "vX0": -6.0848116940132275,
                  "vY0": -129.53570031502608,
                  "vZ0": -6.248835532903962,
                  "x": 149.41,
                  "y": 201.04,
                  "x0": 1.918901393070723,
                  "y0": 50.001887054472895,
                  "z0": 5.722841101772131,
                  "aX": -5.067277004017802
                },
                "breaks": {
                  "breakAngle": 13.2,
                  "breakLength": 6.0,
                  "breakY": 24.0,
                  "spinRate": 2116,
                  "spinDirection": 155
                },
                "zone": 13,
                "typeConfidence": 0.91,
                "plateTime": 0.4231326256139081,
                "extension": 6.158048062539152
              },
              "index": 6,
              "playId": "16716a31-427f-4d72-a6d9-c16ad92a2dc6",
              "pitchNumber": 7,
              "startTime": "2022-11-02T01:30:35.134Z",
              "endTime": "2022-11-02T01:30:41.162Z",
              "isPitch": true,
              "type": "pitch"
            }
          ],
          "playEndTime": "2022-11-02T01:30:41.162Z",
          "atBatIndex": 32
        },
        {
          "result": {
            "type": "atBat",
            "event": "Single",
            "eventType": "single",
            "description": "Martin Maldonado singles on a sharp ground ball to center fielder Brandon Marsh.   Chas McCormick to 2nd.",
            "rbi": 0,
            "awayScore": 0,
            "homeScore": 4,
            "isOut": false
          },
          "about": {
            "atBatIndex": 33,
            "halfInning": "top",
            "isTopInning": true,
            "inning": 5,
            "startTime": "2022-11-02T01:30:52.715Z",
            "endTime": "2022-11-02T01:33:02.958Z",
            "isComplete": true,
            "isScoringPlay": false,
            "hasReview": false,
            "hasOut": false,
            "captivatingIndex": 33
          },
          "count": { "balls": 2, "strikes": 1, "outs": 2 },
          "matchup": {
            "batter": {
              "id": 455117,
              "fullName": "Martin Maldonado",
              "link": "/api/v1/people/455117"
            },
            "batSide": { "code": "R", "description": "Right" },
            "pitcher": {
              "id": 624133,
              "fullName": "Ranger Suarez",
              "link": "/api/v1/people/624133"
            },
            "pitchHand": { "code": "L", "description": "Left" },
            "postOnFirst": {
              "id": 455117,
              "fullName": "Martin Maldonado",
              "link": "/api/v1/people/455117"
            },
            "postOnSecond": {
              "id": 676801,
              "fullName": "Chas McCormick",
              "link": "/api/v1/people/676801"
            },
            "batterHotColdZones": [],
            "pitcherHotColdZones": [],
            "splits": {
              "batter": "vs_LHP",
              "pitcher": "vs_RHB",
              "menOnBase": "RISP"
            }
          },
          "pitchIndex": [0, 1, 2, 3, 4],
          "actionIndex": [],
          "runnerIndex": [0, 1],
          "runners": [
            {
              "movement": {
                "originBase": null,
                "start": null,
                "end": "1B",
                "outBase": null,
                "isOut": false,
                "outNumber": null
              },
              "details": {
                "event": "Single",
                "eventType": "single",
                "movementReason": null,
                "runner": {
                  "id": 455117,
                  "fullName": "Martin Maldonado",
                  "link": "/api/v1/people/455117"
                },
                "responsiblePitcher": null,
                "isScoringEvent": false,
                "rbi": false,
                "earned": false,
                "teamUnearned": false,
                "playIndex": 4
              },
              "credits": [
                {
                  "player": { "id": 669016, "link": "/api/v1/people/669016" },
                  "position": {
                    "code": "8",
                    "name": "Outfielder",
                    "type": "Outfielder",
                    "abbreviation": "CF"
                  },
                  "credit": "f_fielded_ball"
                }
              ]
            },
            {
              "movement": {
                "originBase": "1B",
                "start": "1B",
                "end": "2B",
                "outBase": null,
                "isOut": false,
                "outNumber": null
              },
              "details": {
                "event": "Single",
                "eventType": "single",
                "movementReason": "r_adv_force",
                "runner": {
                  "id": 676801,
                  "fullName": "Chas McCormick",
                  "link": "/api/v1/people/676801"
                },
                "responsiblePitcher": null,
                "isScoringEvent": false,
                "rbi": false,
                "earned": false,
                "teamUnearned": false,
                "playIndex": 4
              },
              "credits": []
            }
          ],
          "playEvents": [
            {
              "details": {
                "call": { "code": "C", "description": "Called Strike" },
                "description": "Called Strike",
                "code": "C",
                "ballColor": "rgba(170, 21, 11, 1.0)",
                "trailColor": "rgba(0, 34, 255, 1.0)",
                "isInPlay": false,
                "isStrike": true,
                "isBall": false,
                "type": { "code": "CU", "description": "Curveball" },
                "isOut": false,
                "hasReview": false
              },
              "count": { "balls": 0, "strikes": 1, "outs": 2 },
              "pitchData": {
                "startSpeed": 79.2,
                "endSpeed": 72.6,
                "strikeZoneTop": 3.26662074276381,
                "strikeZoneBottom": 1.5221836606874,
                "coordinates": {
                  "aY": 23.908840972966185,
                  "aZ": -41.25341794094848,
                  "pfxX": -6.068173768633853,
                  "pfxZ": -6.834965868715308,
                  "pX": -0.09465383078315433,
                  "pZ": 1.5203131247123336,
                  "vX0": -2.655797108933006,
                  "vY0": -115.21271247435806,
                  "vZ0": -0.5907735492570564,
                  "x": 120.61,
                  "y": 197.73,
                  "x0": 1.866005496308085,
                  "y0": 50.00519501329978,
                  "z0": 5.810364664944466,
                  "aX": -8.056201356718665
                },
                "breaks": {
                  "breakAngle": 12.0,
                  "breakLength": 13.2,
                  "breakY": 24.0,
                  "spinRate": 2296,
                  "spinDirection": 312
                },
                "zone": 8,
                "typeConfidence": 0.74,
                "plateTime": 0.4777018827673394,
                "extension": 6.357597641949258
              },
              "index": 0,
              "playId": "4dca4683-9f25-4b79-92fd-a639f4636b5f",
              "pitchNumber": 1,
              "startTime": "2022-11-02T01:31:17.352Z",
              "endTime": "2022-11-02T01:31:20.771Z",
              "isPitch": true,
              "type": "pitch"
            },
            {
              "details": {
                "description": "Pickoff Attempt 1B",
                "code": "1",
                "isOut": false,
                "hasReview": false,
                "fromCatcher": false,
                "disengagementNum": 1
              },
              "count": { "balls": 0, "strikes": 1, "outs": 2 },
              "index": 1,
              "playId": "eec9a819-074e-457b-98d5-77b755737341",
              "startTime": "2022-11-02T01:31:38.916Z",
              "endTime": "2022-11-02T01:31:42.993Z",
              "isPitch": false,
              "type": "pickoff"
            },
            {
              "details": {
                "call": { "code": "B", "description": "Ball" },
                "description": "Ball",
                "code": "B",
                "ballColor": "rgba(39, 161, 39, 1.0)",
                "trailColor": "rgba(0, 85, 254, 1.0)",
                "isInPlay": false,
                "isStrike": false,
                "isBall": true,
                "type": { "code": "CH", "description": "Changeup" },
                "isOut": false,
                "hasReview": false,
                "disengagementNum": 1
              },
              "count": { "balls": 1, "strikes": 1, "outs": 2 },
              "pitchData": {
                "startSpeed": 87.6,
                "endSpeed": 79.6,
                "strikeZoneTop": 3.26662074276381,
                "strikeZoneBottom": 1.5221836606874,
                "coordinates": {
                  "aY": 28.15945183804722,
                  "aZ": -21.948892376956447,
                  "pfxX": 9.480983388242205,
                  "pfxZ": 6.324323015148709,
                  "pX": -0.8853265020357695,
                  "pZ": 0.9970713719361975,
                  "vX0": -9.80820988457466,
                  "vY0": -126.94850181023276,
                  "vZ0": -6.796095551134608,
                  "x": 150.75,
                  "y": 211.86,
                  "x0": 1.8130852988486768,
                  "y0": 50.00599945686646,
                  "z0": 5.479449962830354,
                  "aX": 15.339381879700168
                },
                "breaks": {
                  "breakAngle": 30.0,
                  "breakLength": 7.2,
                  "breakY": 24.0,
                  "spinRate": 1743,
                  "spinDirection": 127
                },
                "zone": 13,
                "typeConfidence": 0.72,
                "plateTime": 0.4329419503209664,
                "extension": 6.290121922928161
              },
              "index": 2,
              "playId": "db8c40be-547a-4131-9ac2-3f5d28358bb1",
              "pitchNumber": 2,
              "startTime": "2022-11-02T01:31:58.772Z",
              "endTime": "2022-11-02T01:32:02.109Z",
              "isPitch": true,
              "type": "pitch"
            },
            {
              "details": {
                "call": { "code": "B", "description": "Ball" },
                "description": "Ball",
                "code": "B",
                "ballColor": "rgba(39, 161, 39, 1.0)",
                "trailColor": "rgba(0, 85, 254, 1.0)",
                "isInPlay": false,
                "isStrike": false,
                "isBall": true,
                "type": { "code": "CH", "description": "Changeup" },
                "isOut": false,
                "hasReview": false,
                "disengagementNum": 1
              },
              "count": { "balls": 2, "strikes": 1, "outs": 2 },
              "pitchData": {
                "startSpeed": 85.0,
                "endSpeed": 77.2,
                "strikeZoneTop": 3.21857282259159,
                "strikeZoneBottom": 1.5221836606874,
                "coordinates": {
                  "aY": 26.80808943021718,
                  "aZ": -25.947073341314486,
                  "pfxX": 9.042713835901061,
                  "pfxZ": 4.057439917482844,
                  "pX": 1.6293672621327144,
                  "pZ": 3.3168167079093007,
                  "vX0": -3.825705071806289,
                  "vY0": -123.73165141322052,
                  "vZ0": -0.5271741265505121,
                  "x": 54.89,
                  "y": 149.23,
                  "x0": 2.028476655484004,
                  "y0": 50.006080773280516,
                  "z0": 5.724447763157338,
                  "aX": 13.894527833100884
                },
                "breaks": {
                  "breakAngle": 26.4,
                  "breakLength": 7.2,
                  "breakY": 24.0,
                  "spinRate": 1826,
                  "spinDirection": 128
                },
                "zone": 12,
                "typeConfidence": 0.9,
                "plateTime": 0.44424855151900067,
                "extension": 6.006054185247102
              },
              "index": 3,
              "playId": "80ee0476-6122-4a87-b5b6-55b697215cc9",
              "pitchNumber": 3,
              "startTime": "2022-11-02T01:32:18.675Z",
              "endTime": "2022-11-02T01:32:24.253Z",
              "isPitch": true,
              "type": "pitch"
            },
            {
              "details": {
                "call": { "code": "D", "description": "In play, no out" },
                "description": "In play, no out",
                "code": "D",
                "ballColor": "rgba(26, 86, 190, 1.0)",
                "trailColor": "rgba(50, 0, 221, 1.0)",
                "isInPlay": true,
                "isStrike": false,
                "isBall": false,
                "type": { "code": "SI", "description": "Sinker" },
                "isOut": false,
                "hasReview": false,
                "disengagementNum": 1
              },
              "count": { "balls": 2, "strikes": 1, "outs": 2 },
              "pitchData": {
                "startSpeed": 94.7,
                "endSpeed": 86.3,
                "strikeZoneTop": 3.27,
                "strikeZoneBottom": 1.53,
                "coordinates": {
                  "aY": 32.63018837732112,
                  "aZ": -28.077409282176763,
                  "pfxX": 10.787762467250845,
                  "pfxZ": 2.1521854226408523,
                  "pX": 0.37454730078450504,
                  "pZ": 1.736054793129889,
                  "vX0": -7.876522119501658,
                  "vY0": -137.63841573183475,
                  "vZ0": -5.445392160126919,
                  "x": 102.72,
                  "y": 191.91,
                  "x0": 1.8823014597030332,
                  "y0": 50.004073358516095,
                  "z0": 5.65918639368645,
                  "aX": 20.54853362509814
                },
                "breaks": {
                  "breakAngle": 32.4,
                  "breakLength": 7.2,
                  "breakY": 24.0,
                  "spinRate": 2092,
                  "spinDirection": 133
                },
                "zone": 9,
                "typeConfidence": 0.92,
                "plateTime": 0.3990622307533389,
                "extension": 6.109391479825728
              },
              "hitData": {
                "launchSpeed": 106.6,
                "launchAngle": -4.0,
                "totalDistance": 23.0,
                "trajectory": "ground_ball",
                "hardness": "hard",
                "location": "8",
                "coordinates": { "coordX": 118.05, "coordY": 92.77 }
              },
              "index": 4,
              "playId": "9c30bff6-9de3-462f-ac65-c83f08662197",
              "pitchNumber": 4,
              "startTime": "2022-11-02T01:32:49.918Z",
              "endTime": "2022-11-02T01:33:02.958Z",
              "isPitch": true,
              "type": "pitch"
            }
          ],
          "playEndTime": "2022-11-02T01:33:02.958Z",
          "atBatIndex": 33
        },
        {
          "result": {
            "type": "atBat",
            "event": "Pop Out",
            "eventType": "field_out",
            "description": "Jose Altuve pops out softly to first baseman Rhys Hoskins in foul territory.",
            "rbi": 0,
            "awayScore": 0,
            "homeScore": 4,
            "isOut": true
          },
          "about": {
            "atBatIndex": 34,
            "halfInning": "top",
            "isTopInning": true,
            "inning": 5,
            "startTime": "2022-11-02T01:34:24.738Z",
            "endTime": "2022-11-02T01:34:53.365Z",
            "isComplete": true,
            "isScoringPlay": false,
            "hasReview": false,
            "hasOut": true,
            "captivatingIndex": 0
          },
          "count": { "balls": 1, "strikes": 0, "outs": 3 },
          "matchup": {
            "batter": {
              "id": 514888,
              "fullName": "Jose Altuve",
              "link": "/api/v1/people/514888"
            },
            "batSide": { "code": "R", "description": "Right" },
            "pitcher": {
              "id": 624133,
              "fullName": "Ranger Suarez",
              "link": "/api/v1/people/624133"
            },
            "pitchHand": { "code": "L", "description": "Left" },
            "batterHotColdZones": [],
            "pitcherHotColdZones": [],
            "splits": {
              "batter": "vs_LHP",
              "pitcher": "vs_RHB",
              "menOnBase": "Empty"
            }
          },
          "pitchIndex": [1, 2],
          "actionIndex": [0],
          "runnerIndex": [0],
          "runners": [
            {
              "movement": {
                "originBase": null,
                "start": null,
                "end": null,
                "outBase": "1B",
                "isOut": true,
                "outNumber": 3
              },
              "details": {
                "event": "Pop Out",
                "eventType": "field_out",
                "movementReason": null,
                "runner": {
                  "id": 514888,
                  "fullName": "Jose Altuve",
                  "link": "/api/v1/people/514888"
                },
                "responsiblePitcher": null,
                "isScoringEvent": false,
                "rbi": false,
                "earned": false,
                "teamUnearned": false,
                "playIndex": 2
              },
              "credits": [
                {
                  "player": { "id": 656555, "link": "/api/v1/people/656555" },
                  "position": {
                    "code": "3",
                    "name": "First Base",
                    "type": "Infielder",
                    "abbreviation": "1B"
                  },
                  "credit": "f_putout"
                }
              ]
            }
          ],
          "playEvents": [
            {
              "details": {
                "description": "Mound visit.",
                "event": "Game Advisory",
                "eventType": "game_advisory",
                "awayScore": 0,
                "homeScore": 4,
                "isScoringPlay": false,
                "isOut": false,
                "hasReview": false
              },
              "count": { "balls": 0, "strikes": 0, "outs": 2 },
              "index": 0,
              "startTime": "2022-11-02T01:33:15.900Z",
              "endTime": "2022-11-02T01:34:27.046Z",
              "isPitch": false,
              "type": "action",
              "player": { "id": 514888, "link": "/api/v1/people/514888" }
            },
            {
              "details": {
                "call": { "code": "B", "description": "Ball" },
                "description": "Ball",
                "code": "B",
                "ballColor": "rgba(39, 161, 39, 1.0)",
                "trailColor": "rgba(188, 0, 33, 1.0)",
                "isInPlay": false,
                "isStrike": false,
                "isBall": true,
                "type": { "code": "FF", "description": "Four-Seam Fastball" },
                "isOut": false,
                "hasReview": false
              },
              "count": { "balls": 1, "strikes": 0, "outs": 2 },
              "pitchData": {
                "startSpeed": 94.9,
                "endSpeed": 86.9,
                "strikeZoneTop": 2.98600296825499,
                "strikeZoneBottom": 1.2975312148034,
                "coordinates": {
                  "aY": 29.986009316940333,
                  "aZ": -18.464980496178114,
                  "pfxX": 4.417572011738986,
                  "pfxZ": 7.107259939114206,
                  "pX": -1.4966057288121009,
                  "pZ": 3.2502142061598387,
                  "vX0": -10.203043564595474,
                  "vY0": -137.83482974596157,
                  "vZ0": -3.4012257344833383,
                  "x": 174.05,
                  "y": 151.02,
                  "x0": 1.6752196446903844,
                  "y0": 50.00032423683664,
                  "z0": 5.743409785520047,
                  "aX": 8.518954123949694
                },
                "breaks": {
                  "breakAngle": 18.0,
                  "breakLength": 4.8,
                  "breakY": 24.0,
                  "spinRate": 2068,
                  "spinDirection": 124
                },
                "zone": 11,
                "typeConfidence": 0.95,
                "plateTime": 0.3970421334746459,
                "extension": 6.166009450775658
              },
              "index": 1,
              "playId": "2c44c5c8-ae60-4fae-a90b-009ba9754a6d",
              "pitchNumber": 1,
              "startTime": "2022-11-02T01:34:27.046Z",
              "endTime": "2022-11-02T01:34:31.063Z",
              "isPitch": true,
              "type": "pitch"
            },
            {
              "details": {
                "call": { "code": "X", "description": "In play, out(s)" },
                "description": "In play, out(s)",
                "code": "X",
                "ballColor": "rgba(26, 86, 190, 1.0)",
                "trailColor": "rgba(188, 0, 33, 1.0)",
                "isInPlay": true,
                "isStrike": false,
                "isBall": false,
                "type": { "code": "FF", "description": "Four-Seam Fastball" },
                "isOut": true,
                "hasReview": false
              },
              "count": { "balls": 1, "strikes": 0, "outs": 2 },
              "pitchData": {
                "startSpeed": 94.9,
                "endSpeed": 86.6,
                "strikeZoneTop": 2.84,
                "strikeZoneBottom": 1.3,
                "coordinates": {
                  "aY": 30.96649902525317,
                  "aZ": -18.793573207559394,
                  "pfxX": 5.38591994382407,
                  "pfxZ": 6.969979221835107,
                  "pX": -1.1627004182287648,
                  "pZ": 2.492253102143982,
                  "vX0": -9.948469679471335,
                  "vY0": -137.75304108096284,
                  "vZ0": -5.119290475930285,
                  "x": 161.32,
                  "y": 171.49,
                  "x0": 1.797837544974117,
                  "y0": 50.0012242173684,
                  "z0": 5.647575458162648,
                  "aX": 10.337733935271743
                },
                "breaks": {
                  "breakAngle": 22.8,
                  "breakLength": 4.8,
                  "breakY": 24.0,
                  "spinRate": 2036,
                  "spinDirection": 136
                },
                "zone": 11,
                "typeConfidence": 0.97,
                "plateTime": 0.3978114611761341,
                "extension": 6.34009713299753
              },
              "hitData": {
                "launchSpeed": 52.5,
                "launchAngle": 73.0,
                "totalDistance": 71.0,
                "trajectory": "popup",
                "hardness": "soft",
                "location": "3",
                "coordinates": { "coordX": 149.73, "coordY": 187.03 }
              },
              "index": 2,
              "playId": "e6c7b3ac-8658-46e2-bc9b-42e4e80014a2",
              "pitchNumber": 2,
              "startTime": "2022-11-02T01:34:45.893Z",
              "endTime": "2022-11-02T01:34:53.365Z",
              "isPitch": true,
              "type": "pitch"
            }
          ],
          "playEndTime": "2022-11-02T01:34:53.365Z",
          "atBatIndex": 34
        },
        {
          "result": {
            "type": "atBat",
            "event": "Groundout",
            "eventType": "field_out",
            "description": "Jean Segura grounds out, third baseman Alex Bregman to first baseman Yuli Gurriel.",
            "rbi": 0,
            "awayScore": 0,
            "homeScore": 4,
            "isOut": true
          },
          "about": {
            "atBatIndex": 35,
            "halfInning": "bottom",
            "isTopInning": false,
            "inning": 5,
            "startTime": "2022-11-02T01:37:51.924Z",
            "endTime": "2022-11-02T01:39:10.118Z",
            "isComplete": true,
            "isScoringPlay": false,
            "hasReview": false,
            "hasOut": true,
            "captivatingIndex": 0
          },
          "count": { "balls": 0, "strikes": 1, "outs": 1 },
          "matchup": {
            "batter": {
              "id": 516416,
              "fullName": "Jean Segura",
              "link": "/api/v1/people/516416"
            },
            "batSide": { "code": "R", "description": "Right" },
            "pitcher": {
              "id": 621121,
              "fullName": "Lance McCullers Jr.",
              "link": "/api/v1/people/621121"
            },
            "pitchHand": { "code": "R", "description": "Right" },
            "batterHotColdZones": [],
            "pitcherHotColdZones": [],
            "splits": {
              "batter": "vs_RHP",
              "pitcher": "vs_RHB",
              "menOnBase": "Empty"
            }
          },
          "pitchIndex": [0, 1],
          "actionIndex": [],
          "runnerIndex": [0],
          "runners": [
            {
              "movement": {
                "originBase": null,
                "start": null,
                "end": null,
                "outBase": "1B",
                "isOut": true,
                "outNumber": 1
              },
              "details": {
                "event": "Groundout",
                "eventType": "field_out",
                "movementReason": null,
                "runner": {
                  "id": 516416,
                  "fullName": "Jean Segura",
                  "link": "/api/v1/people/516416"
                },
                "responsiblePitcher": null,
                "isScoringEvent": false,
                "rbi": false,
                "earned": false,
                "teamUnearned": false,
                "playIndex": 1
              },
              "credits": [
                {
                  "player": { "id": 608324, "link": "/api/v1/people/608324" },
                  "position": {
                    "code": "5",
                    "name": "Third Base",
                    "type": "Infielder",
                    "abbreviation": "3B"
                  },
                  "credit": "f_assist"
                },
                {
                  "player": { "id": 493329, "link": "/api/v1/people/493329" },
                  "position": {
                    "code": "3",
                    "name": "First Base",
                    "type": "Infielder",
                    "abbreviation": "1B"
                  },
                  "credit": "f_putout"
                }
              ]
            }
          ],
          "playEvents": [
            {
              "details": {
                "call": { "code": "F", "description": "Foul" },
                "description": "Foul",
                "code": "F",
                "ballColor": "rgba(170, 21, 11, 1.0)",
                "trailColor": "rgba(50, 0, 221, 1.0)",
                "isInPlay": false,
                "isStrike": true,
                "isBall": false,
                "type": { "code": "SI", "description": "Sinker" },
                "isOut": false,
                "hasReview": false
              },
              "count": { "balls": 0, "strikes": 1, "outs": 0 },
              "pitchData": {
                "startSpeed": 92.6,
                "endSpeed": 85.1,
                "strikeZoneTop": 3.08,
                "strikeZoneBottom": 1.44,
                "coordinates": {
                  "aY": 28.816655305760698,
                  "aZ": -27.782022877417337,
                  "pfxX": -8.81193229204567,
                  "pfxZ": 2.381884982045486,
                  "pX": -1.18468668643673,
                  "pZ": 1.8306181729507873,
                  "vX0": 3.8558784591808033,
                  "vY0": -134.8727569037273,
                  "vZ0": -3.3653599346968033,
                  "x": 162.16,
                  "y": 189.35,
                  "x0": -1.486398123301157,
                  "y0": 50.00575972953186,
                  "z0": 5.049888375199824,
                  "aX": -16.26746161221112
                },
                "breaks": {
                  "breakAngle": 28.8,
                  "breakLength": 7.2,
                  "breakY": 24.0,
                  "spinRate": 2121,
                  "spinDirection": 246
                },
                "zone": 13,
                "typeConfidence": 0.9,
                "plateTime": 0.4058105629088744,
                "extension": 5.833533334387155
              },
              "index": 0,
              "playId": "95852670-1170-4890-968e-042291dc2f34",
              "pitchNumber": 1,
              "startTime": "2022-11-02T01:38:18.573Z",
              "endTime": "2022-11-02T01:38:22.109Z",
              "isPitch": true,
              "type": "pitch"
            },
            {
              "details": {
                "call": { "code": "X", "description": "In play, out(s)" },
                "description": "In play, out(s)",
                "code": "X",
                "ballColor": "rgba(26, 86, 190, 1.0)",
                "trailColor": "rgba(0, 85, 254, 1.0)",
                "isInPlay": true,
                "isStrike": false,
                "isBall": false,
                "type": { "code": "CH", "description": "Changeup" },
                "isOut": true,
                "hasReview": false
              },
              "count": { "balls": 0, "strikes": 1, "outs": 0 },
              "pitchData": {
                "startSpeed": 85.9,
                "endSpeed": 78.8,
                "strikeZoneTop": 3.08,
                "strikeZoneBottom": 1.44,
                "coordinates": {
                  "aY": 25.259609496433814,
                  "aZ": -37.935612768044116,
                  "pfxX": -8.479315651871186,
                  "pfxZ": -3.642984217586722,
                  "pX": -1.057229685175249,
                  "pZ": 2.747143507045248,
                  "vX0": 3.699950357177529,
                  "vY0": -124.98937294810621,
                  "vZ0": 1.41140511342749,
                  "x": 157.3,
                  "y": 164.61,
                  "x0": -1.4553307963014102,
                  "y0": 50.002325084929474,
                  "z0": 5.29089988744625,
                  "aX": -13.41167521868565
                },
                "breaks": {
                  "breakAngle": 19.2,
                  "breakLength": 9.6,
                  "breakY": 24.0,
                  "spinRate": 1647,
                  "spinDirection": 272
                },
                "zone": 11,
                "typeConfidence": 0.9,
                "plateTime": 0.4382700207755277,
                "extension": 5.366180653806145
              },
              "hitData": {
                "launchSpeed": 47.2,
                "launchAngle": -48.0,
                "totalDistance": 5.0,
                "trajectory": "ground_ball",
                "hardness": "medium",
                "location": "5",
                "coordinates": { "coordX": 107.39, "coordY": 165.61 }
              },
              "index": 1,
              "playId": "07fc9968-2431-4ceb-8cb0-4816993d7772",
              "pitchNumber": 2,
              "startTime": "2022-11-02T01:39:02.085Z",
              "endTime": "2022-11-02T01:39:10.118Z",
              "isPitch": true,
              "type": "pitch"
            }
          ],
          "playEndTime": "2022-11-02T01:39:10.118Z",
          "atBatIndex": 35
        },
        {
          "result": {
            "type": "atBat",
            "event": "Single",
            "eventType": "single",
            "description": "Brandon Marsh singles on a line drive to right fielder Kyle Tucker.",
            "rbi": 0,
            "awayScore": 0,
            "homeScore": 4,
            "isOut": false
          },
          "about": {
            "atBatIndex": 36,
            "halfInning": "bottom",
            "isTopInning": false,
            "inning": 5,
            "startTime": "2022-11-02T01:39:29.886Z",
            "endTime": "2022-11-02T01:40:32.765Z",
            "isComplete": true,
            "isScoringPlay": false,
            "hasReview": false,
            "hasOut": false,
            "captivatingIndex": 33
          },
          "count": { "balls": 1, "strikes": 1, "outs": 1 },
          "matchup": {
            "batter": {
              "id": 669016,
              "fullName": "Brandon Marsh",
              "link": "/api/v1/people/669016"
            },
            "batSide": { "code": "L", "description": "Left" },
            "pitcher": {
              "id": 621121,
              "fullName": "Lance McCullers Jr.",
              "link": "/api/v1/people/621121"
            },
            "pitchHand": { "code": "R", "description": "Right" },
            "postOnFirst": {
              "id": 669016,
              "fullName": "Brandon Marsh",
              "link": "/api/v1/people/669016"
            },
            "batterHotColdZones": [],
            "pitcherHotColdZones": [],
            "splits": {
              "batter": "vs_RHP",
              "pitcher": "vs_LHB",
              "menOnBase": "Men_On"
            }
          },
          "pitchIndex": [0, 1, 2],
          "actionIndex": [],
          "runnerIndex": [0],
          "runners": [
            {
              "movement": {
                "originBase": null,
                "start": null,
                "end": "1B",
                "outBase": null,
                "isOut": false,
                "outNumber": null
              },
              "details": {
                "event": "Single",
                "eventType": "single",
                "movementReason": null,
                "runner": {
                  "id": 669016,
                  "fullName": "Brandon Marsh",
                  "link": "/api/v1/people/669016"
                },
                "responsiblePitcher": null,
                "isScoringEvent": false,
                "rbi": false,
                "earned": false,
                "teamUnearned": false,
                "playIndex": 2
              },
              "credits": [
                {
                  "player": { "id": 663656, "link": "/api/v1/people/663656" },
                  "position": {
                    "code": "9",
                    "name": "Outfielder",
                    "type": "Outfielder",
                    "abbreviation": "RF"
                  },
                  "credit": "f_fielded_ball"
                }
              ]
            }
          ],
          "playEvents": [
            {
              "details": {
                "call": { "code": "B", "description": "Ball" },
                "description": "Ball",
                "code": "B",
                "ballColor": "rgba(39, 161, 39, 1.0)",
                "trailColor": "rgba(152, 0, 101, 1.0)",
                "isInPlay": false,
                "isStrike": false,
                "isBall": true,
                "type": { "code": "FC", "description": "Cutter" },
                "isOut": false,
                "hasReview": false
              },
              "count": { "balls": 1, "strikes": 0, "outs": 1 },
              "pitchData": {
                "startSpeed": 89.2,
                "endSpeed": 82.1,
                "strikeZoneTop": 3.08940382457472,
                "strikeZoneBottom": 1.43744872524691,
                "coordinates": {
                  "aY": 25.399138153429693,
                  "aZ": -24.97294028662822,
                  "pfxX": 0.20635245542014014,
                  "pfxZ": 4.177877317321542,
                  "pX": -0.5419958424096486,
                  "pZ": 4.013653339757887,
                  "vX0": 2.387911664312385,
                  "vY0": -129.9728376340481,
                  "vZ0": 1.2668204346403082,
                  "x": 137.66,
                  "y": 130.41,
                  "x0": -1.4966672195483426,
                  "y0": 50.001580694384536,
                  "z0": 5.406528747383775,
                  "aX": 0.3552196321676433
                },
                "breaks": {
                  "breakAngle": 2.4,
                  "breakLength": 6.0,
                  "breakY": 24.0,
                  "spinRate": 2419,
                  "spinDirection": 198
                },
                "zone": 11,
                "typeConfidence": 0.89,
                "plateTime": 0.42026426357081403,
                "extension": 5.709845883265457
              },
              "index": 0,
              "playId": "9671a334-0d5d-49ae-b25a-25e21c6e6f20",
              "pitchNumber": 1,
              "startTime": "2022-11-02T01:39:44.118Z",
              "endTime": "2022-11-02T01:39:47.118Z",
              "isPitch": true,
              "type": "pitch"
            },
            {
              "details": {
                "call": { "code": "C", "description": "Called Strike" },
                "description": "Called Strike",
                "code": "C",
                "ballColor": "rgba(170, 21, 11, 1.0)",
                "trailColor": "rgba(0, 85, 254, 1.0)",
                "isInPlay": false,
                "isStrike": true,
                "isBall": false,
                "type": { "code": "CH", "description": "Changeup" },
                "isOut": false,
                "hasReview": false
              },
              "count": { "balls": 1, "strikes": 1, "outs": 1 },
              "pitchData": {
                "startSpeed": 85.6,
                "endSpeed": 78.8,
                "strikeZoneTop": 3.0635590076661,
                "strikeZoneBottom": 1.43744872524691,
                "coordinates": {
                  "aY": 24.62632770760744,
                  "aZ": -35.101753901275,
                  "pfxX": -10.567393709138074,
                  "pfxZ": -1.8573477665900366,
                  "pX": -0.4042705050171856,
                  "pZ": 2.2122323597696125,
                  "vX0": 5.999262505738297,
                  "vY0": -124.5760766890589,
                  "vZ0": -0.4607679352874514,
                  "x": 132.41,
                  "y": 179.05,
                  "x0": -1.4685815907441049,
                  "y0": 50.004139683473575,
                  "z0": 5.296895610331792,
                  "aX": -16.63900819910235
                },
                "breaks": {
                  "breakAngle": 24.0,
                  "breakLength": 9.6,
                  "breakY": 24.0,
                  "spinRate": 1632,
                  "spinDirection": 271
                },
                "zone": 4,
                "typeConfidence": 0.9,
                "plateTime": 0.43939305294325326,
                "extension": 5.554176894126556
              },
              "index": 1,
              "playId": "4df0a310-e74d-4c23-826a-966c4e9f4557",
              "pitchNumber": 2,
              "startTime": "2022-11-02T01:40:00.720Z",
              "endTime": "2022-11-02T01:40:04.221Z",
              "isPitch": true,
              "type": "pitch"
            },
            {
              "details": {
                "call": { "code": "D", "description": "In play, no out" },
                "description": "In play, no out",
                "code": "D",
                "ballColor": "rgba(26, 86, 190, 1.0)",
                "trailColor": "rgba(0, 85, 254, 1.0)",
                "isInPlay": true,
                "isStrike": false,
                "isBall": false,
                "type": { "code": "CH", "description": "Changeup" },
                "isOut": false,
                "hasReview": false
              },
              "count": { "balls": 1, "strikes": 1, "outs": 1 },
              "pitchData": {
                "startSpeed": 85.5,
                "endSpeed": 78.6,
                "strikeZoneTop": 3.06,
                "strikeZoneBottom": 1.44,
                "coordinates": {
                  "aY": 24.74645083831152,
                  "aZ": -35.490688637747816,
                  "pfxX": -10.406372292356135,
                  "pfxZ": -2.106826808501024,
                  "pX": -0.3884633732083697,
                  "pZ": 2.3276231123199898,
                  "vX0": 5.9833209373132865,
                  "vY0": -124.47584892903963,
                  "vZ0": 0.1620292495898541,
                  "x": 131.81,
                  "y": 175.93,
                  "x0": -1.469990869747698,
                  "y0": 50.00529319829808,
                  "z0": 5.197583332890644,
                  "aX": -16.349105606163295
                },
                "breaks": {
                  "breakAngle": 22.8,
                  "breakLength": 9.6,
                  "breakY": 24.0,
                  "spinRate": 1729,
                  "spinDirection": 268
                },
                "zone": 4,
                "typeConfidence": 0.9,
                "plateTime": 0.4398414075060426,
                "extension": 5.439388737362553
              },
              "hitData": {
                "launchSpeed": 73.6,
                "launchAngle": 19.0,
                "totalDistance": 170.0,
                "trajectory": "line_drive",
                "hardness": "medium",
                "location": "9",
                "coordinates": { "coordX": 192.62, "coordY": 122.31 }
              },
              "index": 2,
              "playId": "e31a76e7-b984-4a7c-b405-8620c6e20985",
              "pitchNumber": 3,
              "startTime": "2022-11-02T01:40:19.749Z",
              "endTime": "2022-11-02T01:40:32.765Z",
              "isPitch": true,
              "type": "pitch"
            }
          ],
          "playEndTime": "2022-11-02T01:40:32.765Z",
          "atBatIndex": 36
        },
        {
          "result": {
            "type": "atBat",
            "event": "Home Run",
            "eventType": "home_run",
            "description": "Kyle Schwarber homers (4) on a fly ball to center field.   Brandon Marsh scores.",
            "rbi": 2,
            "awayScore": 0,
            "homeScore": 6,
            "isOut": false
          },
          "about": {
            "atBatIndex": 37,
            "halfInning": "bottom",
            "isTopInning": false,
            "inning": 5,
            "startTime": "2022-11-02T01:40:47.658Z",
            "endTime": "2022-11-02T01:43:40.054Z",
            "isComplete": true,
            "isScoringPlay": true,
            "hasReview": false,
            "hasOut": false,
            "captivatingIndex": 38
          },
          "count": { "balls": 1, "strikes": 2, "outs": 1 },
          "matchup": {
            "batter": {
              "id": 656941,
              "fullName": "Kyle Schwarber",
              "link": "/api/v1/people/656941"
            },
            "batSide": { "code": "L", "description": "Left" },
            "pitcher": {
              "id": 621121,
              "fullName": "Lance McCullers Jr.",
              "link": "/api/v1/people/621121"
            },
            "pitchHand": { "code": "R", "description": "Right" },
            "batterHotColdZones": [],
            "pitcherHotColdZones": [],
            "splits": {
              "batter": "vs_RHP",
              "pitcher": "vs_LHB",
              "menOnBase": "Empty"
            }
          },
          "pitchIndex": [0, 1, 2, 3, 4],
          "actionIndex": [],
          "runnerIndex": [0, 1],
          "runners": [
            {
              "movement": {
                "originBase": null,
                "start": null,
                "end": "score",
                "outBase": null,
                "isOut": false,
                "outNumber": null
              },
              "details": {
                "event": "Home Run",
                "eventType": "home_run",
                "movementReason": null,
                "runner": {
                  "id": 656941,
                  "fullName": "Kyle Schwarber",
                  "link": "/api/v1/people/656941"
                },
                "responsiblePitcher": {
                  "id": 621121,
                  "link": "/api/v1/people/621121"
                },
                "isScoringEvent": true,
                "rbi": true,
                "earned": true,
                "teamUnearned": false,
                "playIndex": 4
              },
              "credits": []
            },
            {
              "movement": {
                "originBase": "1B",
                "start": "1B",
                "end": "score",
                "outBase": null,
                "isOut": false,
                "outNumber": null
              },
              "details": {
                "event": "Home Run",
                "eventType": "home_run",
                "movementReason": "r_adv_force",
                "runner": {
                  "id": 669016,
                  "fullName": "Brandon Marsh",
                  "link": "/api/v1/people/669016"
                },
                "responsiblePitcher": {
                  "id": 621121,
                  "link": "/api/v1/people/621121"
                },
                "isScoringEvent": true,
                "rbi": true,
                "earned": true,
                "teamUnearned": false,
                "playIndex": 4
              },
              "credits": []
            }
          ],
          "playEvents": [
            {
              "details": {
                "call": { "code": "C", "description": "Called Strike" },
                "description": "Called Strike",
                "code": "C",
                "ballColor": "rgba(170, 21, 11, 1.0)",
                "trailColor": "rgba(0, 85, 254, 1.0)",
                "isInPlay": false,
                "isStrike": true,
                "isBall": false,
                "type": { "code": "CH", "description": "Changeup" },
                "isOut": false,
                "hasReview": false
              },
              "count": { "balls": 0, "strikes": 1, "outs": 1 },
              "pitchData": {
                "startSpeed": 86.5,
                "endSpeed": 79.6,
                "strikeZoneTop": 3.11524500201871,
                "strikeZoneBottom": 1.5221836606874,
                "coordinates": {
                  "aY": 25.612289242338697,
                  "aZ": -34.75714182622712,
                  "pfxX": -9.570538264528246,
                  "pfxZ": -1.6092668298743318,
                  "pX": -0.4987967446784167,
                  "pZ": 1.5153017920090066,
                  "vX0": 5.456795461553487,
                  "vY0": -125.93363710025898,
                  "vZ0": -1.9933924934755354,
                  "x": 136.01,
                  "y": 197.87,
                  "x0": -1.4504761446101277,
                  "y0": 50.00267192384467,
                  "z0": 5.1290525960402515,
                  "aX": -15.369552875470527
                },
                "breaks": {
                  "breakAngle": 21.6,
                  "breakLength": 9.6,
                  "breakY": 24.0,
                  "spinRate": 1629,
                  "spinDirection": 266
                },
                "zone": 7,
                "typeConfidence": 0.9,
                "plateTime": 0.4349665616071423,
                "extension": 5.651533211377127
              },
              "index": 0,
              "playId": "b576ce5b-be76-4b35-b56a-f5e627d3121d",
              "pitchNumber": 1,
              "startTime": "2022-11-02T01:41:18.599Z",
              "endTime": "2022-11-02T01:41:22.206Z",
              "isPitch": true,
              "type": "pitch"
            },
            {
              "details": {
                "call": { "code": "B", "description": "Ball" },
                "description": "Ball",
                "code": "B",
                "ballColor": "rgba(39, 161, 39, 1.0)",
                "trailColor": "rgba(0, 85, 254, 1.0)",
                "isInPlay": false,
                "isStrike": false,
                "isBall": true,
                "type": { "code": "CH", "description": "Changeup" },
                "isOut": false,
                "hasReview": false
              },
              "count": { "balls": 1, "strikes": 1, "outs": 1 },
              "pitchData": {
                "startSpeed": 86.9,
                "endSpeed": 79.9,
                "strikeZoneTop": 3.11524500201871,
                "strikeZoneBottom": 1.5221836606874,
                "coordinates": {
                  "aY": 26.083946337459363,
                  "aZ": -36.44842653437022,
                  "pfxX": -10.083964363469924,
                  "pfxZ": -2.649415155175857,
                  "pX": 0.6231410414829044,
                  "pZ": 0.8192505353201142,
                  "vX0": 8.253122911657625,
                  "vY0": -126.2550264948351,
                  "vZ0": -3.0970080909056943,
                  "x": 93.25,
                  "y": 216.66,
                  "x0": -1.3804642140473644,
                  "y0": 50.005213440906076,
                  "z0": 4.999913531991476,
                  "aX": -16.256552953073054
                },
                "breaks": {
                  "breakAngle": 21.6,
                  "breakLength": 9.6,
                  "breakY": 24.0,
                  "spinRate": 1717,
                  "spinDirection": 271
                },
                "zone": 14,
                "typeConfidence": 0.9,
                "plateTime": 0.4341019371623047,
                "extension": 5.649358838133669
              },
              "index": 1,
              "playId": "a5ee31f1-ce6a-4b9d-b2f8-7fdae8f0595c",
              "pitchNumber": 2,
              "startTime": "2022-11-02T01:41:42.506Z",
              "endTime": "2022-11-02T01:41:45.506Z",
              "isPitch": true,
              "type": "pitch"
            },
            {
              "details": {
                "call": { "code": "F", "description": "Foul" },
                "description": "Foul",
                "code": "F",
                "ballColor": "rgba(170, 21, 11, 1.0)",
                "trailColor": "rgba(153, 171, 0, 1.0)",
                "isInPlay": false,
                "isStrike": true,
                "isBall": false,
                "type": { "code": "KC", "description": "Knuckle Curve" },
                "isOut": false,
                "hasReview": false
              },
              "count": { "balls": 1, "strikes": 2, "outs": 1 },
              "pitchData": {
                "startSpeed": 84.5,
                "endSpeed": 77.4,
                "strikeZoneTop": 3.28,
                "strikeZoneBottom": 1.56,
                "coordinates": {
                  "aY": 26.826112224751306,
                  "aZ": -42.89622065168219,
                  "pfxX": 6.114636091686663,
                  "pfxZ": -7.063568144588486,
                  "pX": 0.37817595191252235,
                  "pZ": 1.7960640185757908,
                  "vX0": 2.5216504097124472,
                  "vY0": -123.07004175581434,
                  "vZ0": 0.05280354232464135,
                  "x": 102.58,
                  "y": 190.29,
                  "x0": -1.4572884711583762,
                  "y0": 50.002732747107814,
                  "z0": 5.439473104217096,
                  "aX": 9.280797181128843
                },
                "breaks": {
                  "breakAngle": 13.2,
                  "breakLength": 12.0,
                  "breakY": 24.0,
                  "spinRate": 3074,
                  "spinDirection": 42
                },
                "zone": 9,
                "typeConfidence": 0.91,
                "plateTime": 0.44685900557079794,
                "extension": 5.932576466367698
              },
              "index": 2,
              "playId": "1c82a110-470e-4b8f-b033-ab613180b89b",
              "pitchNumber": 3,
              "startTime": "2022-11-02T01:42:07.490Z",
              "endTime": "2022-11-02T01:42:10.646Z",
              "isPitch": true,
              "type": "pitch"
            },
            {
              "details": {
                "call": { "code": "F", "description": "Foul" },
                "description": "Foul",
                "code": "F",
                "ballColor": "rgba(170, 21, 11, 1.0)",
                "trailColor": "rgba(153, 171, 0, 1.0)",
                "isInPlay": false,
                "isStrike": true,
                "isBall": false,
                "type": { "code": "KC", "description": "Knuckle Curve" },
                "isOut": false,
                "hasReview": false
              },
              "count": { "balls": 1, "strikes": 2, "outs": 1 },
              "pitchData": {
                "startSpeed": 83.8,
                "endSpeed": 76.7,
                "strikeZoneTop": 3.28,
                "strikeZoneBottom": 1.56,
                "coordinates": {
                  "aY": 26.637334360032106,
                  "aZ": -41.567601715748104,
                  "pfxX": 7.738264085184149,
                  "pfxZ": -6.309733877855485,
                  "pX": 0.2991697496491511,
                  "pZ": 1.7927722686527552,
                  "vX0": 2.062742455718062,
                  "vY0": -122.01946187647535,
                  "vZ0": 0.06264883935075516,
                  "x": 105.6,
                  "y": 190.38,
                  "x0": -1.5644770892086954,
                  "y0": 50.00046316611055,
                  "z0": 5.3836325246701415,
                  "aX": 11.528246890910758
                },
                "breaks": {
                  "breakAngle": 15.6,
                  "breakLength": 12.0,
                  "breakY": 24.0,
                  "spinRate": 2865,
                  "spinDirection": 56
                },
                "zone": 9,
                "typeConfidence": 0.9,
                "plateTime": 0.4509222930719847,
                "extension": 6.009302968235631
              },
              "index": 3,
              "playId": "9e5a0890-f5f3-4925-8994-3756de7b5768",
              "pitchNumber": 4,
              "startTime": "2022-11-02T01:42:42.536Z",
              "endTime": "2022-11-02T01:42:45.557Z",
              "isPitch": true,
              "type": "pitch"
            },
            {
              "details": {
                "call": { "code": "E", "description": "In play, run(s)" },
                "description": "In play, run(s)",
                "code": "E",
                "ballColor": "rgba(26, 86, 190, 1.0)",
                "trailColor": "rgba(0, 85, 254, 1.0)",
                "isInPlay": true,
                "isStrike": false,
                "isBall": false,
                "type": { "code": "CH", "description": "Changeup" },
                "isOut": false,
                "hasReview": false
              },
              "count": { "balls": 1, "strikes": 2, "outs": 1 },
              "pitchData": {
                "startSpeed": 87.9,
                "endSpeed": 80.9,
                "strikeZoneTop": 3.28,
                "strikeZoneBottom": 1.56,
                "coordinates": {
                  "aY": 25.739260750237168,
                  "aZ": -35.194684044330955,
                  "pfxX": -8.965854379666766,
                  "pfxZ": -1.8193164938272162,
                  "pX": -0.4495481565776354,
                  "pZ": 2.032874644815686,
                  "vX0": 5.579462663301229,
                  "vY0": -127.94097416339726,
                  "vZ0": -0.9305321557092472,
                  "x": 134.14,
                  "y": 183.89,
                  "x0": -1.4908075730927681,
                  "y0": 50.00139171132365,
                  "z0": 5.15302422241455,
                  "aX": -14.90201721101662
                },
                "breaks": {
                  "breakAngle": 21.6,
                  "breakLength": 9.6,
                  "breakY": 24.0,
                  "spinRate": 1647,
                  "spinDirection": 272
                },
                "zone": 7,
                "typeConfidence": 0.91,
                "plateTime": 0.4276794525042127,
                "extension": 5.703817901131649
              },
              "hitData": {
                "launchSpeed": 113.2,
                "launchAngle": 27.0,
                "totalDistance": 443.0,
                "trajectory": "fly_ball",
                "hardness": "medium",
                "location": "8",
                "coordinates": { "coordX": 118.22, "coordY": 19.44 }
              },
              "index": 4,
              "playId": "581e84fe-077c-4529-b4c6-538ff30597ed",
              "pitchNumber": 5,
              "startTime": "2022-11-02T01:43:12.443Z",
              "endTime": "2022-11-02T01:43:40.054Z",
              "isPitch": true,
              "type": "pitch"
            }
          ],
          "playEndTime": "2022-11-02T01:43:40.054Z",
          "atBatIndex": 37
        },
        {
          "result": {
            "type": "atBat",
            "event": "Home Run",
            "eventType": "home_run",
            "description": "Rhys Hoskins homers (6) on a fly ball to left field.",
            "rbi": 1,
            "awayScore": 0,
            "homeScore": 7,
            "isOut": false
          },
          "about": {
            "atBatIndex": 38,
            "halfInning": "bottom",
            "isTopInning": false,
            "inning": 5,
            "startTime": "2022-11-02T01:44:51.385Z",
            "endTime": "2022-11-02T01:46:29.489Z",
            "isComplete": true,
            "isScoringPlay": true,
            "hasReview": false,
            "hasOut": false,
            "captivatingIndex": 38
          },
          "count": { "balls": 2, "strikes": 2, "outs": 1 },
          "matchup": {
            "batter": {
              "id": 656555,
              "fullName": "Rhys Hoskins",
              "link": "/api/v1/people/656555"
            },
            "batSide": { "code": "R", "description": "Right" },
            "pitcher": {
              "id": 621121,
              "fullName": "Lance McCullers Jr.",
              "link": "/api/v1/people/621121"
            },
            "pitchHand": { "code": "R", "description": "Right" },
            "batterHotColdZones": [],
            "pitcherHotColdZones": [],
            "splits": {
              "batter": "vs_RHP",
              "pitcher": "vs_RHB",
              "menOnBase": "Empty"
            }
          },
          "pitchIndex": [1, 2, 3, 4, 5],
          "actionIndex": [0],
          "runnerIndex": [0],
          "runners": [
            {
              "movement": {
                "originBase": null,
                "start": null,
                "end": "score",
                "outBase": null,
                "isOut": false,
                "outNumber": null
              },
              "details": {
                "event": "Home Run",
                "eventType": "home_run",
                "movementReason": null,
                "runner": {
                  "id": 656555,
                  "fullName": "Rhys Hoskins",
                  "link": "/api/v1/people/656555"
                },
                "responsiblePitcher": {
                  "id": 621121,
                  "link": "/api/v1/people/621121"
                },
                "isScoringEvent": true,
                "rbi": true,
                "earned": true,
                "teamUnearned": false,
                "playIndex": 5
              },
              "credits": []
            }
          ],
          "playEvents": [
            {
              "details": {
                "description": "Mound visit.",
                "event": "Game Advisory",
                "eventType": "game_advisory",
                "awayScore": 0,
                "homeScore": 6,
                "isScoringPlay": false,
                "isOut": false,
                "hasReview": false
              },
              "count": { "balls": 0, "strikes": 0, "outs": 1 },
              "index": 0,
              "startTime": "2022-11-02T01:44:11.778Z",
              "endTime": "2022-11-02T01:44:53.685Z",
              "isPitch": false,
              "type": "action",
              "player": { "id": 656555, "link": "/api/v1/people/656555" }
            },
            {
              "details": {
                "call": { "code": "C", "description": "Called Strike" },
                "description": "Called Strike",
                "code": "C",
                "ballColor": "rgba(170, 21, 11, 1.0)",
                "trailColor": "rgba(0, 0, 254, 1.0)",
                "isInPlay": false,
                "isStrike": true,
                "isBall": false,
                "type": { "code": "SL", "description": "Slider" },
                "isOut": false,
                "hasReview": false
              },
              "count": { "balls": 0, "strikes": 1, "outs": 1 },
              "pitchData": {
                "startSpeed": 83.9,
                "endSpeed": 76.6,
                "strikeZoneTop": 3.65702549878348,
                "strikeZoneBottom": 1.70400729166789,
                "coordinates": {
                  "aY": 25.91385008354802,
                  "aZ": -28.05211968233708,
                  "pfxX": 9.834337674493124,
                  "pfxZ": 2.755813414743246,
                  "pX": 0.8028396336973915,
                  "pZ": 2.4292449636875757,
                  "vX0": 2.586752871069233,
                  "vY0": -122.10700602610004,
                  "vZ0": -0.6890808390811416,
                  "x": 86.4,
                  "y": 173.19,
                  "x0": -1.550067393465494,
                  "y0": 50.004768603585404,
                  "z0": 5.14646334498816,
                  "aX": 14.728556361903312
                },
                "breaks": {
                  "breakAngle": 28.8,
                  "breakLength": 8.4,
                  "breakY": 24.0,
                  "spinRate": 2906,
                  "spinDirection": 72
                },
                "zone": 6,
                "typeConfidence": 0.91,
                "plateTime": 0.4500011408717772,
                "extension": 5.933987115211894
              },
              "index": 1,
              "playId": "5c6814c7-64a2-4576-a516-b58db1fba699",
              "pitchNumber": 1,
              "startTime": "2022-11-02T01:44:53.685Z",
              "endTime": "2022-11-02T01:44:57.032Z",
              "isPitch": true,
              "type": "pitch"
            },
            {
              "details": {
                "call": { "code": "B", "description": "Ball" },
                "description": "Ball",
                "code": "B",
                "ballColor": "rgba(39, 161, 39, 1.0)",
                "trailColor": "rgba(0, 0, 254, 1.0)",
                "isInPlay": false,
                "isStrike": false,
                "isBall": true,
                "type": { "code": "SL", "description": "Slider" },
                "isOut": false,
                "hasReview": false
              },
              "count": { "balls": 1, "strikes": 1, "outs": 1 },
              "pitchData": {
                "startSpeed": 82.8,
                "endSpeed": 75.5,
                "strikeZoneTop": 3.65702549878348,
                "strikeZoneBottom": 1.70729023304057,
                "coordinates": {
                  "aY": 26.04300853070232,
                  "aZ": -28.986463107170227,
                  "pfxX": 10.001091881023541,
                  "pfxZ": 2.1976297335482746,
                  "pX": 1.4235074207901692,
                  "pZ": 2.1123578967748076,
                  "vX0": 3.971824186815029,
                  "vY0": -120.47641410049309,
                  "vZ0": -0.5007159741416944,
                  "x": 62.74,
                  "y": 181.75,
                  "x0": -1.5517952183446357,
                  "y0": 50.00456919556192,
                  "z0": 4.911862224865788,
                  "aX": 14.525223198089831
                },
                "breaks": {
                  "breakAngle": 27.6,
                  "breakLength": 9.6,
                  "breakY": 24.0,
                  "spinRate": 2952,
                  "spinDirection": 63
                },
                "zone": 14,
                "typeConfidence": 0.91,
                "plateTime": 0.4567507137298925,
                "extension": 5.695767157465102
              },
              "index": 2,
              "playId": "db001d22-62a0-4595-bad4-aa59932a32fc",
              "pitchNumber": 2,
              "startTime": "2022-11-02T01:45:05.108Z",
              "endTime": "2022-11-02T01:45:09.150Z",
              "isPitch": true,
              "type": "pitch"
            },
            {
              "details": {
                "call": { "code": "F", "description": "Foul" },
                "description": "Foul",
                "code": "F",
                "ballColor": "rgba(170, 21, 11, 1.0)",
                "trailColor": "rgba(0, 85, 254, 1.0)",
                "isInPlay": false,
                "isStrike": true,
                "isBall": false,
                "type": { "code": "CH", "description": "Changeup" },
                "isOut": false,
                "hasReview": false
              },
              "count": { "balls": 1, "strikes": 2, "outs": 1 },
              "pitchData": {
                "startSpeed": 85.6,
                "endSpeed": 78.5,
                "strikeZoneTop": 3.63,
                "strikeZoneBottom": 1.71,
                "coordinates": {
                  "aY": 25.7098968178024,
                  "aZ": -36.148763930724115,
                  "pfxX": -9.935750231292243,
                  "pfxZ": -2.534464523598971,
                  "pX": -0.19557010933397903,
                  "pZ": 1.5871873297732106,
                  "vX0": 6.249477531863535,
                  "vY0": -124.4921251235279,
                  "vZ0": -1.18320521078438,
                  "x": 124.45,
                  "y": 195.93,
                  "x0": -1.4514142981087415,
                  "y0": 50.005910357148785,
                  "z0": 5.069012688669436,
                  "aX": -15.550443128288874
                },
                "breaks": {
                  "breakAngle": 21.6,
                  "breakLength": 9.6,
                  "breakY": 24.0,
                  "spinRate": 1698,
                  "spinDirection": 272
                },
                "zone": 13,
                "typeConfidence": 0.9,
                "plateTime": 0.4404874324595123,
                "extension": 5.453015554723365
              },
              "index": 3,
              "playId": "d87d1bed-df47-482e-96ee-cc42efe46453",
              "pitchNumber": 3,
              "startTime": "2022-11-02T01:45:22.229Z",
              "endTime": "2022-11-02T01:45:25.500Z",
              "isPitch": true,
              "type": "pitch"
            },
            {
              "details": {
                "call": { "code": "B", "description": "Ball" },
                "description": "Ball",
                "code": "B",
                "ballColor": "rgba(39, 161, 39, 1.0)",
                "trailColor": "rgba(0, 85, 254, 1.0)",
                "isInPlay": false,
                "isStrike": false,
                "isBall": true,
                "type": { "code": "CH", "description": "Changeup" },
                "isOut": false,
                "hasReview": false
              },
              "count": { "balls": 2, "strikes": 2, "outs": 1 },
              "pitchData": {
                "startSpeed": 87.1,
                "endSpeed": 80.8,
                "strikeZoneTop": 3.65702549878348,
                "strikeZoneBottom": 1.65207052564424,
                "coordinates": {
                  "aY": 23.891177769089875,
                  "aZ": -36.33353016352474,
                  "pfxX": -10.901494802993877,
                  "pfxZ": -2.5442032363891536,
                  "pX": 1.8899205347864239,
                  "pZ": 0.06858766074268019,
                  "vX0": 11.360500533341497,
                  "vY0": -126.42051738795047,
                  "vZ0": -4.830939064539999,
                  "x": 44.96,
                  "y": 236.93,
                  "x0": -1.2292190870144835,
                  "y0": 50.0059915934986,
                  "z0": 4.895682418011066,
                  "aX": -17.7865076812667
                },
                "breaks": {
                  "breakAngle": 22.8,
                  "breakLength": 9.6,
                  "breakY": 24.0,
                  "spinRate": 1747,
                  "spinDirection": 270
                },
                "zone": 14,
                "typeConfidence": 0.9,
                "plateTime": 0.43196740080565244,
                "extension": 5.7626954060752285
              },
              "index": 4,
              "playId": "9e6019e8-1ada-4ee8-9217-2562aeff953c",
              "pitchNumber": 4,
              "startTime": "2022-11-02T01:45:46.125Z",
              "endTime": "2022-11-02T01:45:49.125Z",
              "isPitch": true,
              "type": "pitch"
            },
            {
              "details": {
                "call": { "code": "E", "description": "In play, run(s)" },
                "description": "In play, run(s)",
                "code": "E",
                "ballColor": "rgba(26, 86, 190, 1.0)",
                "trailColor": "rgba(0, 0, 254, 1.0)",
                "isInPlay": true,
                "isStrike": false,
                "isBall": false,
                "type": { "code": "SL", "description": "Slider" },
                "isOut": false,
                "hasReview": false
              },
              "count": { "balls": 2, "strikes": 2, "outs": 1 },
              "pitchData": {
                "startSpeed": 85.1,
                "endSpeed": 78.3,
                "strikeZoneTop": 3.63,
                "strikeZoneBottom": 1.71,
                "coordinates": {
                  "aY": 24.83701596222416,
                  "aZ": -28.38957334182498,
                  "pfxX": 6.179604215654531,
                  "pfxZ": 2.428630052750787,
                  "pX": 0.1957597292849837,
                  "pZ": 2.1099033745399005,
                  "vX0": 2.526644192838723,
                  "vY0": -124.03793358466123,
                  "vZ0": -1.0800840003496224,
                  "x": 109.54,
                  "y": 181.81,
                  "x0": -1.6388856828226241,
                  "y0": 50.00178633279964,
                  "z0": 4.91830265523328,
                  "aX": 9.627279919760513
                },
                "breaks": {
                  "breakAngle": 19.2,
                  "breakLength": 8.4,
                  "breakY": 24.0,
                  "spinRate": 2917,
                  "spinDirection": 78
                },
                "zone": 8,
                "typeConfidence": 0.9,
                "plateTime": 0.4415923884466588,
                "extension": 5.827341773239228
              },
              "hitData": {
                "launchSpeed": 105.2,
                "launchAngle": 22.0,
                "totalDistance": 374.0,
                "trajectory": "fly_ball",
                "hardness": "medium",
                "location": "7",
                "coordinates": { "coordX": 47.81, "coordY": 69.18 }
              },
              "index": 5,
              "playId": "460e6d49-8e7b-434f-8cb5-9ff1b1078b31",
              "pitchNumber": 5,
              "startTime": "2022-11-02T01:46:05.158Z",
              "endTime": "2022-11-02T01:46:29.489Z",
              "isPitch": true,
              "type": "pitch"
            }
          ],
          "playEndTime": "2022-11-02T01:46:29.489Z",
          "atBatIndex": 38
        },
        {
          "result": {
            "type": "atBat",
            "event": "Strikeout",
            "eventType": "strikeout",
            "description": "J.T. Realmuto strikes out swinging.",
            "rbi": 0,
            "awayScore": 0,
            "homeScore": 7,
            "isOut": true
          },
          "about": {
            "atBatIndex": 39,
            "halfInning": "bottom",
            "isTopInning": false,
            "inning": 5,
            "startTime": "2022-11-02T01:50:24.274Z",
            "endTime": "2022-11-02T01:51:35.551Z",
            "isComplete": true,
            "isScoringPlay": false,
            "hasReview": false,
            "hasOut": true,
            "captivatingIndex": 14
          },
          "count": { "balls": 1, "strikes": 3, "outs": 2 },
          "matchup": {
            "batter": {
              "id": 592663,
              "fullName": "J.T. Realmuto",
              "link": "/api/v1/people/592663"
            },
            "batSide": { "code": "R", "description": "Right" },
            "pitcher": {
              "id": 592773,
              "fullName": "Ryne Stanek",
              "link": "/api/v1/people/592773"
            },
            "pitchHand": { "code": "R", "description": "Right" },
            "batterHotColdZones": [],
            "pitcherHotColdZones": [],
            "splits": {
              "batter": "vs_RHP",
              "pitcher": "vs_RHB",
              "menOnBase": "Empty"
            }
          },
          "pitchIndex": [2, 3, 4, 5],
          "actionIndex": [0, 1],
          "runnerIndex": [0],
          "runners": [
            {
              "movement": {
                "originBase": null,
                "start": null,
                "end": null,
                "outBase": "1B",
                "isOut": true,
                "outNumber": 2
              },
              "details": {
                "event": "Strikeout",
                "eventType": "strikeout",
                "movementReason": null,
                "runner": {
                  "id": 592663,
                  "fullName": "J.T. Realmuto",
                  "link": "/api/v1/people/592663"
                },
                "responsiblePitcher": null,
                "isScoringEvent": false,
                "rbi": false,
                "earned": false,
                "teamUnearned": false,
                "playIndex": 5
              },
              "credits": [
                {
                  "player": { "id": 455117, "link": "/api/v1/people/455117" },
                  "position": {
                    "code": "2",
                    "name": "Catcher",
                    "type": "Catcher",
                    "abbreviation": "C"
                  },
                  "credit": "f_putout"
                }
              ]
            }
          ],
          "playEvents": [
            {
              "details": {
                "description": "Mound visit.",
                "event": "Game Advisory",
                "eventType": "game_advisory",
                "awayScore": 0,
                "homeScore": 7,
                "isScoringPlay": false,
                "isOut": false,
                "hasReview": false
              },
              "count": { "balls": 0, "strikes": 0, "outs": 1 },
              "index": 0,
              "startTime": "2022-11-02T01:46:53.718Z",
              "endTime": "2022-11-02T01:47:48.773Z",
              "isPitch": false,
              "type": "action",
              "player": { "id": 592663, "link": "/api/v1/people/592663" }
            },
            {
              "details": {
                "description": "Pitching Change: Ryne Stanek replaces Lance McCullers Jr.",
                "event": "Pitching Substitution",
                "eventType": "pitching_substitution",
                "awayScore": 0,
                "homeScore": 7,
                "isScoringPlay": false,
                "isOut": false,
                "hasReview": false
              },
              "count": { "balls": 0, "strikes": 0, "outs": 1 },
              "index": 1,
              "startTime": "2022-11-02T01:47:48.773Z",
              "endTime": "2022-11-02T01:50:26.512Z",
              "isPitch": false,
              "isSubstitution": true,
              "type": "action",
              "player": { "id": 592773, "link": "/api/v1/people/592773" },
              "position": {
                "code": "1",
                "name": "Pitcher",
                "type": "Pitcher",
                "abbreviation": "P"
              }
            },
            {
              "details": {
                "call": { "code": "C", "description": "Called Strike" },
                "description": "Called Strike",
                "code": "C",
                "ballColor": "rgba(170, 21, 11, 1.0)",
                "trailColor": "rgba(188, 0, 33, 1.0)",
                "isInPlay": false,
                "isStrike": true,
                "isBall": false,
                "type": { "code": "FF", "description": "Four-Seam Fastball" },
                "isOut": false,
                "hasReview": false
              },
              "count": { "balls": 0, "strikes": 1, "outs": 1 },
              "pitchData": {
                "startSpeed": 97.3,
                "endSpeed": 89.1,
                "strikeZoneTop": 3.65702549878348,
                "strikeZoneBottom": 1.60012338062716,
                "coordinates": {
                  "aY": 31.436557389298233,
                  "aZ": -9.940042047572442,
                  "pfxX": -5.493166580937935,
                  "pfxZ": 10.94863261455101,
                  "pX": 0.8138713289901728,
                  "pZ": 2.6151009983846074,
                  "vX0": 4.703360867315825,
                  "vY0": -141.41516362309483,
                  "vZ0": -8.698529300147666,
                  "x": 85.98,
                  "y": 168.17,
                  "x0": -0.15495591136431833,
                  "y0": 50.00583416452575,
                  "z0": 6.363921826499092,
                  "aX": -11.157891391949768
                },
                "breaks": {
                  "breakAngle": 40.8,
                  "breakLength": 3.6,
                  "breakY": 24.0,
                  "spinRate": 2091,
                  "spinDirection": 212
                },
                "zone": 6,
                "typeConfidence": 0.9,
                "plateTime": 0.3869299886180384,
                "extension": 5.809416289287513
              },
              "index": 2,
              "playId": "2e9e9add-dfe6-418f-ba9c-2b3d90a0e129",
              "pitchNumber": 1,
              "startTime": "2022-11-02T01:50:26.512Z",
              "endTime": "2022-11-02T01:50:29.512Z",
              "isPitch": true,
              "type": "pitch"
            },
            {
              "details": {
                "call": { "code": "B", "description": "Ball" },
                "description": "Ball",
                "code": "B",
                "ballColor": "rgba(39, 161, 39, 1.0)",
                "trailColor": "rgba(188, 0, 33, 1.0)",
                "isInPlay": false,
                "isStrike": false,
                "isBall": true,
                "type": { "code": "FF", "description": "Four-Seam Fastball" },
                "isOut": false,
                "hasReview": false
              },
              "count": { "balls": 1, "strikes": 1, "outs": 1 },
              "pitchData": {
                "startSpeed": 97.8,
                "endSpeed": 89.3,
                "strikeZoneTop": 3.60066345523228,
                "strikeZoneBottom": 1.60136241261251,
                "coordinates": {
                  "aY": 32.56835467672269,
                  "aZ": -11.098609433432042,
                  "pfxX": -6.8498034260581875,
                  "pfxZ": 10.293314200992645,
                  "pX": 0.7438072927597705,
                  "pZ": 3.309549355329455,
                  "vX0": 5.231726082432428,
                  "vY0": -142.1788671410112,
                  "vZ0": -6.657811113784431,
                  "x": 88.65,
                  "y": 149.42,
                  "x0": -0.23009716899355195,
                  "y0": 50.00308221258945,
                  "z0": 6.38577414257602,
                  "aX": -14.025400459482112
                },
                "breaks": {
                  "breakAngle": 45.6,
                  "breakLength": 3.6,
                  "breakY": 24.0,
                  "spinRate": 2293,
                  "spinDirection": 213
                },
                "zone": 3,
                "typeConfidence": 0.9,
                "plateTime": 0.38521700845197193,
                "extension": 5.914642722567107
              },
              "index": 3,
              "playId": "86a091a7-a7fb-4575-ae7e-f6c64537814f",
              "pitchNumber": 2,
              "startTime": "2022-11-02T01:50:47.505Z",
              "endTime": "2022-11-02T01:50:51.536Z",
              "isPitch": true,
              "type": "pitch"
            },
            {
              "details": {
                "call": { "code": "C", "description": "Called Strike" },
                "description": "Called Strike",
                "code": "C",
                "ballColor": "rgba(170, 21, 11, 1.0)",
                "trailColor": "rgba(0, 0, 254, 1.0)",
                "isInPlay": false,
                "isStrike": true,
                "isBall": false,
                "type": { "code": "SL", "description": "Slider" },
                "isOut": false,
                "hasReview": false
              },
              "count": { "balls": 1, "strikes": 2, "outs": 1 },
              "pitchData": {
                "startSpeed": 86.3,
                "endSpeed": 80.6,
                "strikeZoneTop": 3.55396433592532,
                "strikeZoneBottom": 1.65207052564424,
                "coordinates": {
                  "aY": 21.739921923122708,
                  "aZ": -33.39942137288286,
                  "pfxX": 0.8905351258603253,
                  "pfxZ": -0.7571483105468868,
                  "pX": -0.027482481060191705,
                  "pZ": 2.9710372091208757,
                  "vX0": 0.8696373742934298,
                  "vY0": -125.85268955185803,
                  "vZ0": -1.9976666472418052,
                  "x": 118.05,
                  "y": 158.56,
                  "x0": -0.4911728033855914,
                  "y0": 50.00007695667822,
                  "z0": 6.439809963985594,
                  "aX": 1.4505896049159017
                },
                "breaks": {
                  "breakAngle": 2.4,
                  "breakLength": 8.4,
                  "breakY": 24.0,
                  "spinRate": 2544,
                  "spinDirection": 38
                },
                "zone": 2,
                "typeConfidence": 0.9,
                "plateTime": 0.4326041551523847,
                "extension": 5.831294800686335
              },
              "index": 4,
              "playId": "bf291fb3-10b6-41cc-ab8e-3acd2c1a6374",
              "pitchNumber": 3,
              "startTime": "2022-11-02T01:51:08.032Z",
              "endTime": "2022-11-02T01:51:11.971Z",
              "isPitch": true,
              "type": "pitch"
            },
            {
              "details": {
                "call": { "code": "S", "description": "Swinging Strike" },
                "description": "Swinging Strike",
                "code": "S",
                "ballColor": "rgba(170, 21, 11, 1.0)",
                "trailColor": "rgba(119, 0, 152, 1.0)",
                "isInPlay": false,
                "isStrike": true,
                "isBall": false,
                "type": { "code": "FS", "description": "Splitter" },
                "isOut": true,
                "hasReview": false
              },
              "count": { "balls": 1, "strikes": 3, "outs": 1 },
              "pitchData": {
                "startSpeed": 87.7,
                "endSpeed": 81.1,
                "strikeZoneTop": 3.63,
                "strikeZoneBottom": 1.69,
                "coordinates": {
                  "aY": 25.18663046895575,
                  "aZ": -27.70057290917666,
                  "pfxX": -6.580529570384944,
                  "pfxZ": 2.6956869881550674,
                  "pX": 0.16677806671802836,
                  "pZ": 1.6240787701037789,
                  "vX0": 2.6636309359842176,
                  "vY0": -127.69255700384053,
                  "vZ0": -6.353394059865511,
                  "x": 110.64,
                  "y": 194.93,
                  "x0": -0.03233601411727426,
                  "y0": 50.00175950458086,
                  "z0": 6.310915699287955,
                  "aX": -10.915081740486047
                },
                "breaks": {
                  "breakAngle": 20.4,
                  "breakLength": 7.2,
                  "breakY": 24.0,
                  "spinRate": 1005,
                  "spinDirection": 234
                },
                "zone": 8,
                "typeConfidence": 0.9,
                "plateTime": 0.4281978984012791,
                "extension": 6.021402257990333
              },
              "index": 5,
              "playId": "c00c1cda-3543-48fa-850e-7691c3121674",
              "pitchNumber": 4,
              "startTime": "2022-11-02T01:51:31.533Z",
              "endTime": "2022-11-02T01:51:35.551Z",
              "isPitch": true,
              "type": "pitch"
            }
          ],
          "playEndTime": "2022-11-02T01:51:35.551Z",
          "atBatIndex": 39
        },
        {
          "result": {
            "type": "atBat",
            "event": "Strikeout",
            "eventType": "strikeout",
            "description": "Bryce Harper strikes out swinging.",
            "rbi": 0,
            "awayScore": 0,
            "homeScore": 7,
            "isOut": true
          },
          "about": {
            "atBatIndex": 40,
            "halfInning": "bottom",
            "isTopInning": false,
            "inning": 5,
            "startTime": "2022-11-02T01:51:42.240Z",
            "endTime": "2022-11-02T01:53:12.694Z",
            "isComplete": true,
            "isScoringPlay": false,
            "hasReview": false,
            "hasOut": true,
            "captivatingIndex": 14
          },
          "count": { "balls": 0, "strikes": 3, "outs": 3 },
          "matchup": {
            "batter": {
              "id": 547180,
              "fullName": "Bryce Harper",
              "link": "/api/v1/people/547180"
            },
            "batSide": { "code": "L", "description": "Left" },
            "pitcher": {
              "id": 592773,
              "fullName": "Ryne Stanek",
              "link": "/api/v1/people/592773"
            },
            "pitchHand": { "code": "R", "description": "Right" },
            "batterHotColdZones": [],
            "pitcherHotColdZones": [],
            "splits": {
              "batter": "vs_RHP",
              "pitcher": "vs_LHB",
              "menOnBase": "Empty"
            }
          },
          "pitchIndex": [0, 1, 2],
          "actionIndex": [],
          "runnerIndex": [0],
          "runners": [
            {
              "movement": {
                "originBase": null,
                "start": null,
                "end": null,
                "outBase": "1B",
                "isOut": true,
                "outNumber": 3
              },
              "details": {
                "event": "Strikeout",
                "eventType": "strikeout",
                "movementReason": null,
                "runner": {
                  "id": 547180,
                  "fullName": "Bryce Harper",
                  "link": "/api/v1/people/547180"
                },
                "responsiblePitcher": null,
                "isScoringEvent": false,
                "rbi": false,
                "earned": false,
                "teamUnearned": false,
                "playIndex": 2
              },
              "credits": [
                {
                  "player": { "id": 455117, "link": "/api/v1/people/455117" },
                  "position": {
                    "code": "2",
                    "name": "Catcher",
                    "type": "Catcher",
                    "abbreviation": "C"
                  },
                  "credit": "f_putout"
                }
              ]
            }
          ],
          "playEvents": [
            {
              "details": {
                "call": { "code": "S", "description": "Swinging Strike" },
                "description": "Swinging Strike",
                "code": "S",
                "ballColor": "rgba(170, 21, 11, 1.0)",
                "trailColor": "rgba(188, 0, 33, 1.0)",
                "isInPlay": false,
                "isStrike": true,
                "isBall": false,
                "type": { "code": "FF", "description": "Four-Seam Fastball" },
                "isOut": false,
                "hasReview": false
              },
              "count": { "balls": 0, "strikes": 1, "outs": 2 },
              "pitchData": {
                "startSpeed": 98.6,
                "endSpeed": 90.5,
                "strikeZoneTop": 3.25,
                "strikeZoneBottom": 1.61,
                "coordinates": {
                  "aY": 31.84394948707103,
                  "aZ": -10.4757610455922,
                  "pfxX": -5.9314342402378575,
                  "pfxZ": 10.349423649824232,
                  "pX": 0.388075332482993,
                  "pZ": 3.4008591482591335,
                  "vX0": 4.335203856352241,
                  "vY0": -143.55554125036144,
                  "vZ0": -6.268029954079317,
                  "x": 102.21,
                  "y": 146.96,
                  "x0": -0.36763211473949897,
                  "y0": 50.0012672521742,
                  "z0": 6.258137329411397,
                  "aX": -12.434053752355936
                },
                "breaks": {
                  "breakAngle": 44.4,
                  "breakLength": 3.6,
                  "breakY": 24.0,
                  "spinRate": 2209,
                  "spinDirection": 215
                },
                "zone": 12,
                "typeConfidence": 0.9,
                "plateTime": 0.3808978458348622,
                "extension": 6.019447706943174
              },
              "index": 0,
              "playId": "f3284d74-9703-4857-af41-49e995b45f59",
              "pitchNumber": 1,
              "startTime": "2022-11-02T01:52:15.940Z",
              "endTime": "2022-11-02T01:52:19.113Z",
              "isPitch": true,
              "type": "pitch"
            },
            {
              "details": {
                "call": { "code": "S", "description": "Swinging Strike" },
                "description": "Swinging Strike",
                "code": "S",
                "ballColor": "rgba(170, 21, 11, 1.0)",
                "trailColor": "rgba(188, 0, 33, 1.0)",
                "isInPlay": false,
                "isStrike": true,
                "isBall": false,
                "type": { "code": "FF", "description": "Four-Seam Fastball" },
                "isOut": false,
                "hasReview": false
              },
              "count": { "balls": 0, "strikes": 2, "outs": 2 },
              "pitchData": {
                "startSpeed": 98.4,
                "endSpeed": 90.0,
                "strikeZoneTop": 3.25,
                "strikeZoneBottom": 1.61,
                "coordinates": {
                  "aY": 33.10541544944637,
                  "aZ": -11.320339307925499,
                  "pfxX": -6.954284495275763,
                  "pfxZ": 10.031795882307906,
                  "pX": -0.08180740968411646,
                  "pZ": 3.534888974152563,
                  "vX0": 3.137820919917759,
                  "vY0": -143.26074628756578,
                  "vZ0": -6.277304911536847,
                  "x": 120.12,
                  "y": 143.34,
                  "x0": -0.2878955166437569,
                  "y0": 50.000160325386645,
                  "z0": 6.46198683335175,
                  "aX": -14.452206153447678
                },
                "breaks": {
                  "breakAngle": 46.8,
                  "breakLength": 3.6,
                  "breakY": 24.0,
                  "spinRate": 2340,
                  "spinDirection": 217
                },
                "zone": 11,
                "typeConfidence": 0.9,
                "plateTime": 0.3823246650532539,
                "extension": 5.7980147566594935
              },
              "index": 1,
              "playId": "fafa0b22-0e3f-46d1-bd83-c1b37d950761",
              "pitchNumber": 2,
              "startTime": "2022-11-02T01:52:41.926Z",
              "endTime": "2022-11-02T01:52:45.097Z",
              "isPitch": true,
              "type": "pitch"
            },
            {
              "details": {
                "call": { "code": "S", "description": "Swinging Strike" },
                "description": "Swinging Strike",
                "code": "S",
                "ballColor": "rgba(170, 21, 11, 1.0)",
                "trailColor": "rgba(188, 0, 33, 1.0)",
                "isInPlay": false,
                "isStrike": true,
                "isBall": false,
                "type": { "code": "FF", "description": "Four-Seam Fastball" },
                "isOut": true,
                "hasReview": false
              },
              "count": { "balls": 0, "strikes": 3, "outs": 2 },
              "pitchData": {
                "startSpeed": 97.8,
                "endSpeed": 89.7,
                "strikeZoneTop": 3.25,
                "strikeZoneBottom": 1.61,
                "coordinates": {
                  "aY": 31.83453551733222,
                  "aZ": -10.69148683615391,
                  "pfxX": -5.864584600170355,
                  "pfxZ": 10.44148867705515,
                  "pX": -0.5426498150690278,
                  "pZ": 2.563921521662924,
                  "vX0": 1.7098296418491072,
                  "vY0": -142.34088999633974,
                  "vZ0": -8.424162473050954,
                  "x": 137.68,
                  "y": 169.55,
                  "x0": -0.38805858304760815,
                  "y0": 50.00576490150511,
                  "z0": 6.234052093277955,
                  "aX": -12.068830189936035
                },
                "breaks": {
                  "breakAngle": 43.2,
                  "breakLength": 3.6,
                  "breakY": 24.0,
                  "spinRate": 2221,
                  "spinDirection": 216
                },
                "zone": 4,
                "typeConfidence": 0.9,
                "plateTime": 0.3843916853949705,
                "extension": 5.840473082272473
              },
              "index": 2,
              "playId": "9d9ded3e-69c9-431e-8cb6-007b32944e51",
              "pitchNumber": 3,
              "startTime": "2022-11-02T01:53:07.894Z",
              "endTime": "2022-11-02T01:53:12.694Z",
              "isPitch": true,
              "type": "pitch"
            }
          ],
          "playEndTime": "2022-11-02T01:53:12.694Z",
          "atBatIndex": 40
        },
        {
          "result": {
            "type": "atBat",
            "event": "Single",
            "eventType": "single",
            "description": "Jeremy Pena singles on a sharp line drive to left fielder Kyle Schwarber.",
            "rbi": 0,
            "awayScore": 0,
            "homeScore": 7,
            "isOut": false
          },
          "about": {
            "atBatIndex": 41,
            "halfInning": "top",
            "isTopInning": true,
            "inning": 6,
            "startTime": "2022-11-02T01:56:30.221Z",
            "endTime": "2022-11-02T01:57:54.185Z",
            "isComplete": true,
            "isScoringPlay": false,
            "hasReview": false,
            "hasOut": false,
            "captivatingIndex": 33
          },
          "count": { "balls": 0, "strikes": 2, "outs": 0 },
          "matchup": {
            "batter": {
              "id": 665161,
              "fullName": "Jeremy Pena",
              "link": "/api/v1/people/665161"
            },
            "batSide": { "code": "R", "description": "Right" },
            "pitcher": {
              "id": 641401,
              "fullName": "Connor Brogdon",
              "link": "/api/v1/people/641401"
            },
            "pitchHand": { "code": "R", "description": "Right" },
            "postOnFirst": {
              "id": 665161,
              "fullName": "Jeremy Pena",
              "link": "/api/v1/people/665161"
            },
            "batterHotColdZones": [],
            "pitcherHotColdZones": [],
            "splits": {
              "batter": "vs_RHP",
              "pitcher": "vs_RHB",
              "menOnBase": "Men_On"
            }
          },
          "pitchIndex": [1, 2, 3],
          "actionIndex": [0],
          "runnerIndex": [0],
          "runners": [
            {
              "movement": {
                "originBase": null,
                "start": null,
                "end": "1B",
                "outBase": null,
                "isOut": false,
                "outNumber": null
              },
              "details": {
                "event": "Single",
                "eventType": "single",
                "movementReason": null,
                "runner": {
                  "id": 665161,
                  "fullName": "Jeremy Pena",
                  "link": "/api/v1/people/665161"
                },
                "responsiblePitcher": null,
                "isScoringEvent": false,
                "rbi": false,
                "earned": false,
                "teamUnearned": false,
                "playIndex": 3
              },
              "credits": [
                {
                  "player": { "id": 656941, "link": "/api/v1/people/656941" },
                  "position": {
                    "code": "7",
                    "name": "Outfielder",
                    "type": "Outfielder",
                    "abbreviation": "LF"
                  },
                  "credit": "f_fielded_ball"
                }
              ]
            }
          ],
          "playEvents": [
            {
              "details": {
                "description": "Pitching Change: Connor Brogdon replaces Ranger Suarez.",
                "event": "Pitching Substitution",
                "eventType": "pitching_substitution",
                "awayScore": 0,
                "homeScore": 7,
                "isScoringPlay": false,
                "isOut": false,
                "hasReview": false
              },
              "count": { "balls": 0, "strikes": 0, "outs": 0 },
              "index": 0,
              "startTime": "2022-11-02T01:54:09.936Z",
              "endTime": "2022-11-02T01:56:32.544Z",
              "isPitch": false,
              "isSubstitution": true,
              "type": "action",
              "player": { "id": 641401, "link": "/api/v1/people/641401" },
              "position": {
                "code": "1",
                "name": "Pitcher",
                "type": "Pitcher",
                "abbreviation": "P"
              }
            },
            {
              "details": {
                "call": { "code": "L", "description": "Foul Bunt" },
                "description": "Foul Bunt",
                "code": "L",
                "ballColor": "rgba(170, 21, 11, 1.0)",
                "trailColor": "rgba(152, 0, 101, 1.0)",
                "isInPlay": false,
                "isStrike": true,
                "isBall": false,
                "type": { "code": "FC", "description": "Cutter" },
                "isOut": false,
                "hasReview": false
              },
              "count": { "balls": 0, "strikes": 1, "outs": 0 },
              "pitchData": {
                "startSpeed": 87.2,
                "endSpeed": 80.4,
                "strikeZoneTop": 3.63,
                "strikeZoneBottom": 1.75,
                "coordinates": {
                  "aY": 24.254625839013368,
                  "aZ": -22.552207383229767,
                  "pfxX": 1.6525889853552096,
                  "pfxZ": 5.843121826289067,
                  "pX": -0.9688350369513599,
                  "pZ": 3.9443049399761705,
                  "vX0": 3.2645211378394485,
                  "vY0": -127.06694103594116,
                  "vZ0": -0.5841581448133739,
                  "x": 153.93,
                  "y": 132.28,
                  "x0": -2.4813239418773745,
                  "y0": 50.00510365496237,
                  "z0": 5.957544427847672,
                  "aX": 2.7216764277066274
                },
                "breaks": {
                  "breakAngle": 8.4,
                  "breakLength": 6.0,
                  "breakY": 24.0,
                  "spinRate": 2459,
                  "spinDirection": 177
                },
                "zone": 11,
                "typeConfidence": 0.9,
                "plateTime": 0.4298687689969989,
                "extension": 6.874661286791395
              },
              "index": 1,
              "playId": "239d1f21-85e1-4bfb-9268-d4d5c7d97927",
              "pitchNumber": 1,
              "startTime": "2022-11-02T01:56:32.544Z",
              "endTime": "2022-11-02T01:56:37.540Z",
              "isPitch": true,
              "type": "pitch"
            },
            {
              "details": {
                "call": { "code": "F", "description": "Foul" },
                "description": "Foul",
                "code": "F",
                "ballColor": "rgba(170, 21, 11, 1.0)",
                "trailColor": "rgba(0, 85, 254, 1.0)",
                "isInPlay": false,
                "isStrike": true,
                "isBall": false,
                "type": { "code": "CH", "description": "Changeup" },
                "isOut": false,
                "hasReview": false
              },
              "count": { "balls": 0, "strikes": 2, "outs": 0 },
              "pitchData": {
                "startSpeed": 84.2,
                "endSpeed": 77.1,
                "strikeZoneTop": 3.63,
                "strikeZoneBottom": 1.75,
                "coordinates": {
                  "aY": 24.30944446119884,
                  "aZ": -26.104097318247966,
                  "pfxX": -11.220377088476056,
                  "pfxZ": 3.999152240808595,
                  "pX": -1.1469966575622252,
                  "pZ": 2.7873919206965123,
                  "vX0": 6.353613025264794,
                  "vY0": -122.48323402609081,
                  "vZ0": -1.8096065534697519,
                  "x": 160.72,
                  "y": 163.52,
                  "x0": -2.317483789556066,
                  "y0": 50.005218449855654,
                  "z0": 5.76919887789059,
                  "aX": -17.04158221751533
                },
                "breaks": {
                  "breakAngle": 31.2,
                  "breakLength": 8.4,
                  "breakY": 24.0,
                  "spinRate": 1955,
                  "spinDirection": 253
                },
                "zone": 11,
                "typeConfidence": 0.9,
                "plateTime": 0.44728452147007713,
                "extension": 6.971606920746424
              },
              "index": 2,
              "playId": "f898a5a8-4bbd-4499-a62f-d485185b8ad5",
              "pitchNumber": 2,
              "startTime": "2022-11-02T01:57:09.756Z",
              "endTime": "2022-11-02T01:57:12.801Z",
              "isPitch": true,
              "type": "pitch"
            },
            {
              "details": {
                "call": { "code": "D", "description": "In play, no out" },
                "description": "In play, no out",
                "code": "D",
                "ballColor": "rgba(26, 86, 190, 1.0)",
                "trailColor": "rgba(0, 85, 254, 1.0)",
                "isInPlay": true,
                "isStrike": false,
                "isBall": false,
                "type": { "code": "CH", "description": "Changeup" },
                "isOut": false,
                "hasReview": false
              },
              "count": { "balls": 0, "strikes": 2, "outs": 0 },
              "pitchData": {
                "startSpeed": 85.3,
                "endSpeed": 78.4,
                "strikeZoneTop": 3.63,
                "strikeZoneBottom": 1.75,
                "coordinates": {
                  "aY": 24.032984856454433,
                  "aZ": -27.750508726772903,
                  "pfxX": -10.338340308903677,
                  "pfxZ": 2.8349029151904066,
                  "pX": -4.941980510998474e-4,
                  "pZ": 2.6054678072428423,
                  "vX0": 8.437404022890105,
                  "vY0": -123.96692699340198,
                  "vZ0": -2.29280092300337,
                  "x": 117.02,
                  "y": 168.43,
                  "x0": -2.0995913916241196,
                  "y0": 50.00535196533241,
                  "z0": 5.851537606476046,
                  "aX": -16.145635911790418
                },
                "breaks": {
                  "breakAngle": 27.6,
                  "breakLength": 8.4,
                  "breakY": 24.0,
                  "spinRate": 1994,
                  "spinDirection": 247
                },
                "zone": 5,
                "typeConfidence": 0.9,
                "plateTime": 0.44130029131788895,
                "extension": 6.840835671209729
              },
              "hitData": {
                "launchSpeed": 101.9,
                "launchAngle": 11.0,
                "totalDistance": 172.0,
                "trajectory": "line_drive",
                "hardness": "hard",
                "location": "7",
                "coordinates": { "coordX": 66.03, "coordY": 102.28 }
              },
              "index": 3,
              "playId": "7b5f0522-1660-42b1-a969-f2a41f07313a",
              "pitchNumber": 3,
              "startTime": "2022-11-02T01:57:43.574Z",
              "endTime": "2022-11-02T01:57:54.185Z",
              "isPitch": true,
              "type": "pitch"
            }
          ],
          "playEndTime": "2022-11-02T01:57:54.185Z",
          "atBatIndex": 41
        },
        {
          "result": {
            "type": "atBat",
            "event": "Lineout",
            "eventType": "field_out",
            "description": "Yordan Alvarez lines out to right fielder Nick Castellanos.",
            "rbi": 0,
            "awayScore": 0,
            "homeScore": 7,
            "isOut": true
          },
          "about": {
            "atBatIndex": 42,
            "halfInning": "top",
            "isTopInning": true,
            "inning": 6,
            "startTime": "2022-11-02T01:58:01.988Z",
            "endTime": "2022-11-02T01:58:40.779Z",
            "isComplete": true,
            "isScoringPlay": false,
            "hasReview": false,
            "hasOut": true,
            "captivatingIndex": 0
          },
          "count": { "balls": 0, "strikes": 0, "outs": 1 },
          "matchup": {
            "batter": {
              "id": 670541,
              "fullName": "Yordan Alvarez",
              "link": "/api/v1/people/670541"
            },
            "batSide": { "code": "L", "description": "Left" },
            "pitcher": {
              "id": 641401,
              "fullName": "Connor Brogdon",
              "link": "/api/v1/people/641401"
            },
            "pitchHand": { "code": "R", "description": "Right" },
            "postOnFirst": {
              "id": 665161,
              "fullName": "Jeremy Pena",
              "link": "/api/v1/people/665161"
            },
            "batterHotColdZones": [],
            "pitcherHotColdZones": [],
            "splits": {
              "batter": "vs_RHP",
              "pitcher": "vs_LHB",
              "menOnBase": "Men_On"
            }
          },
          "pitchIndex": [0],
          "actionIndex": [],
          "runnerIndex": [0],
          "runners": [
            {
              "movement": {
                "originBase": null,
                "start": null,
                "end": null,
                "outBase": "1B",
                "isOut": true,
                "outNumber": 1
              },
              "details": {
                "event": "Lineout",
                "eventType": "field_out",
                "movementReason": null,
                "runner": {
                  "id": 670541,
                  "fullName": "Yordan Alvarez",
                  "link": "/api/v1/people/670541"
                },
                "responsiblePitcher": null,
                "isScoringEvent": false,
                "rbi": false,
                "earned": false,
                "teamUnearned": false,
                "playIndex": 0
              },
              "credits": [
                {
                  "player": { "id": 592206, "link": "/api/v1/people/592206" },
                  "position": {
                    "code": "9",
                    "name": "Outfielder",
                    "type": "Outfielder",
                    "abbreviation": "RF"
                  },
                  "credit": "f_putout"
                }
              ]
            }
          ],
          "playEvents": [
            {
              "details": {
                "call": { "code": "X", "description": "In play, out(s)" },
                "description": "In play, out(s)",
                "code": "X",
                "ballColor": "rgba(26, 86, 190, 1.0)",
                "trailColor": "rgba(0, 85, 254, 1.0)",
                "isInPlay": true,
                "isStrike": false,
                "isBall": false,
                "type": { "code": "CH", "description": "Changeup" },
                "isOut": true,
                "hasReview": false
              },
              "count": { "balls": 0, "strikes": 0, "outs": 0 },
              "pitchData": {
                "startSpeed": 84.6,
                "endSpeed": 77.7,
                "strikeZoneTop": 3.48,
                "strikeZoneBottom": 1.73,
                "coordinates": {
                  "aY": 23.804822029737252,
                  "aZ": -23.57241191619536,
                  "pfxX": -11.610601754960218,
                  "pfxZ": 5.622438586753405,
                  "pX": 0.42015237813593104,
                  "pZ": 1.6273621721917877,
                  "vX0": 10.072487303833498,
                  "vY0": -122.7632985956029,
                  "vZ0": -4.946690551633998,
                  "x": 100.98,
                  "y": 194.84,
                  "x0": -2.223162460839363,
                  "y0": 50.002276514471866,
                  "z0": 5.669477125211548,
                  "aX": -17.760458127564956
                },
                "breaks": {
                  "breakAngle": 33.6,
                  "breakLength": 7.2,
                  "breakY": 24.0,
                  "spinRate": 2142,
                  "spinDirection": 245
                },
                "zone": 9,
                "typeConfidence": 0.9,
                "plateTime": 0.4457969679679272,
                "extension": 6.928209688403098
              },
              "hitData": {
                "launchSpeed": 79.9,
                "launchAngle": 26.0,
                "totalDistance": 257.0,
                "trajectory": "line_drive",
                "hardness": "medium",
                "location": "9",
                "coordinates": { "coordX": 170.67, "coordY": 106.79 }
              },
              "index": 0,
              "playId": "33d72511-bb40-4210-9bbc-43c1f418a862",
              "pitchNumber": 1,
              "startTime": "2022-11-02T01:58:29.747Z",
              "endTime": "2022-11-02T01:58:40.779Z",
              "isPitch": true,
              "type": "pitch"
            }
          ],
          "playEndTime": "2022-11-02T01:58:40.779Z",
          "atBatIndex": 42
        },
        {
          "result": {
            "type": "atBat",
            "event": "Pop Out",
            "eventType": "field_out",
            "description": "Alex Bregman pops out to third baseman Alec Bohm.",
            "rbi": 0,
            "awayScore": 0,
            "homeScore": 7,
            "isOut": true
          },
          "about": {
            "atBatIndex": 43,
            "halfInning": "top",
            "isTopInning": true,
            "inning": 6,
            "startTime": "2022-11-02T01:58:51.607Z",
            "endTime": "2022-11-02T01:59:45.674Z",
            "isComplete": true,
            "isScoringPlay": false,
            "hasReview": false,
            "hasOut": true,
            "captivatingIndex": 0
          },
          "count": { "balls": 0, "strikes": 1, "outs": 2 },
          "matchup": {
            "batter": {
              "id": 608324,
              "fullName": "Alex Bregman",
              "link": "/api/v1/people/608324"
            },
            "batSide": { "code": "R", "description": "Right" },
            "pitcher": {
              "id": 641401,
              "fullName": "Connor Brogdon",
              "link": "/api/v1/people/641401"
            },
            "pitchHand": { "code": "R", "description": "Right" },
            "postOnFirst": {
              "id": 665161,
              "fullName": "Jeremy Pena",
              "link": "/api/v1/people/665161"
            },
            "batterHotColdZones": [],
            "pitcherHotColdZones": [],
            "splits": {
              "batter": "vs_RHP",
              "pitcher": "vs_RHB",
              "menOnBase": "Men_On"
            }
          },
          "pitchIndex": [0, 1],
          "actionIndex": [],
          "runnerIndex": [0],
          "runners": [
            {
              "movement": {
                "originBase": null,
                "start": null,
                "end": null,
                "outBase": "1B",
                "isOut": true,
                "outNumber": 2
              },
              "details": {
                "event": "Pop Out",
                "eventType": "field_out",
                "movementReason": null,
                "runner": {
                  "id": 608324,
                  "fullName": "Alex Bregman",
                  "link": "/api/v1/people/608324"
                },
                "responsiblePitcher": null,
                "isScoringEvent": false,
                "rbi": false,
                "earned": false,
                "teamUnearned": false,
                "playIndex": 1
              },
              "credits": [
                {
                  "player": { "id": 664761, "link": "/api/v1/people/664761" },
                  "position": {
                    "code": "5",
                    "name": "Third Base",
                    "type": "Infielder",
                    "abbreviation": "3B"
                  },
                  "credit": "f_putout"
                }
              ]
            }
          ],
          "playEvents": [
            {
              "details": {
                "call": { "code": "S", "description": "Swinging Strike" },
                "description": "Swinging Strike",
                "code": "S",
                "ballColor": "rgba(170, 21, 11, 1.0)",
                "trailColor": "rgba(188, 0, 33, 1.0)",
                "isInPlay": false,
                "isStrike": true,
                "isBall": false,
                "type": { "code": "FF", "description": "Four-Seam Fastball" },
                "isOut": false,
                "hasReview": false
              },
              "count": { "balls": 0, "strikes": 1, "outs": 1 },
              "pitchData": {
                "startSpeed": 94.7,
                "endSpeed": 86.4,
                "strikeZoneTop": 3.16,
                "strikeZoneBottom": 1.51,
                "coordinates": {
                  "aY": 30.861787778388873,
                  "aZ": -9.371715855140335,
                  "pfxX": -6.851409129207482,
                  "pfxZ": 11.910137932345211,
                  "pX": 0.033446997666233144,
                  "pZ": 2.763437944832485,
                  "vX0": 8.023326031116545,
                  "vY0": -137.5656634303633,
                  "vZ0": -6.875813497314234,
                  "x": 115.73,
                  "y": 164.17,
                  "x0": -2.0324054686263717,
                  "y0": 50.00078757603996,
                  "z0": 5.932455790636674,
                  "aX": -13.11504903752582
                },
                "breaks": {
                  "breakAngle": 45.6,
                  "breakLength": 3.6,
                  "breakY": 24.0,
                  "spinRate": 2322,
                  "spinDirection": 213
                },
                "zone": 2,
                "typeConfidence": 0.91,
                "plateTime": 0.39835290746355767,
                "extension": 6.998893067243172
              },
              "index": 0,
              "playId": "063caf13-34bc-4498-909c-03e0e044912d",
              "pitchNumber": 1,
              "startTime": "2022-11-02T01:59:15.210Z",
              "endTime": "2022-11-02T01:59:18.255Z",
              "isPitch": true,
              "type": "pitch"
            },
            {
              "details": {
                "call": { "code": "X", "description": "In play, out(s)" },
                "description": "In play, out(s)",
                "code": "X",
                "ballColor": "rgba(26, 86, 190, 1.0)",
                "trailColor": "rgba(152, 0, 101, 1.0)",
                "isInPlay": true,
                "isStrike": false,
                "isBall": false,
                "type": { "code": "FC", "description": "Cutter" },
                "isOut": true,
                "hasReview": false
              },
              "count": { "balls": 0, "strikes": 1, "outs": 1 },
              "pitchData": {
                "startSpeed": 88.7,
                "endSpeed": 81.5,
                "strikeZoneTop": 3.16,
                "strikeZoneBottom": 1.51,
                "coordinates": {
                  "aY": 26.341561033683632,
                  "aZ": -23.48946225278895,
                  "pfxX": -1.753663259521986,
                  "pfxZ": 5.126037475144052,
                  "pX": -0.788959373580092,
                  "pZ": 2.734579633416515,
                  "vX0": 4.570902085303969,
                  "vY0": -129.1525057976021,
                  "vZ0": -3.1529420155789283,
                  "x": 147.07,
                  "y": 164.95,
                  "x0": -2.3520488362271705,
                  "y0": 50.000416412329294,
                  "z0": 5.77329499932666,
                  "aX": -2.9697285706477445
                },
                "breaks": {
                  "breakAngle": 4.8,
                  "breakLength": 6.0,
                  "breakY": 24.0,
                  "spinRate": 2465,
                  "spinDirection": 191
                },
                "zone": 1,
                "typeConfidence": 0.9,
                "plateTime": 0.4237421717990997,
                "extension": 6.833133771842231
              },
              "hitData": {
                "launchSpeed": 59.5,
                "launchAngle": 56.0,
                "totalDistance": 153.0,
                "trajectory": "popup",
                "hardness": "medium",
                "location": "5",
                "coordinates": { "coordX": 83.84, "coordY": 156.73 }
              },
              "index": 1,
              "playId": "ab9708b5-3574-4693-920b-2107e0c3c8f6",
              "pitchNumber": 2,
              "startTime": "2022-11-02T01:59:36.639Z",
              "endTime": "2022-11-02T01:59:45.674Z",
              "isPitch": true,
              "type": "pitch"
            }
          ],
          "playEndTime": "2022-11-02T01:59:45.674Z",
          "atBatIndex": 43
        },
        {
          "result": {
            "type": "atBat",
            "event": "Strikeout",
            "eventType": "strikeout",
            "description": "Kyle Tucker strikes out swinging.",
            "rbi": 0,
            "awayScore": 0,
            "homeScore": 7,
            "isOut": true
          },
          "about": {
            "atBatIndex": 44,
            "halfInning": "top",
            "isTopInning": true,
            "inning": 6,
            "startTime": "2022-11-02T02:00:00.417Z",
            "endTime": "2022-11-02T02:03:43.495Z",
            "isComplete": true,
            "isScoringPlay": false,
            "hasReview": false,
            "hasOut": true,
            "captivatingIndex": 14
          },
          "count": { "balls": 1, "strikes": 3, "outs": 3 },
          "matchup": {
            "batter": {
              "id": 663656,
              "fullName": "Kyle Tucker",
              "link": "/api/v1/people/663656"
            },
            "batSide": { "code": "L", "description": "Left" },
            "pitcher": {
              "id": 641401,
              "fullName": "Connor Brogdon",
              "link": "/api/v1/people/641401"
            },
            "pitchHand": { "code": "R", "description": "Right" },
            "batterHotColdZones": [],
            "pitcherHotColdZones": [],
            "splits": {
              "batter": "vs_RHP",
              "pitcher": "vs_LHB",
              "menOnBase": "Empty"
            }
          },
          "pitchIndex": [0, 1, 2, 3, 4, 5, 6],
          "actionIndex": [],
          "runnerIndex": [0],
          "runners": [
            {
              "movement": {
                "originBase": null,
                "start": null,
                "end": null,
                "outBase": "1B",
                "isOut": true,
                "outNumber": 3
              },
              "details": {
                "event": "Strikeout",
                "eventType": "strikeout",
                "movementReason": null,
                "runner": {
                  "id": 663656,
                  "fullName": "Kyle Tucker",
                  "link": "/api/v1/people/663656"
                },
                "responsiblePitcher": null,
                "isScoringEvent": false,
                "rbi": false,
                "earned": false,
                "teamUnearned": false,
                "playIndex": 6
              },
              "credits": [
                {
                  "player": { "id": 592663, "link": "/api/v1/people/592663" },
                  "position": {
                    "code": "2",
                    "name": "Catcher",
                    "type": "Catcher",
                    "abbreviation": "C"
                  },
                  "credit": "f_putout"
                }
              ]
            }
          ],
          "playEvents": [
            {
              "details": {
                "call": { "code": "C", "description": "Called Strike" },
                "description": "Called Strike",
                "code": "C",
                "ballColor": "rgba(170, 21, 11, 1.0)",
                "trailColor": "rgba(152, 0, 101, 1.0)",
                "isInPlay": false,
                "isStrike": true,
                "isBall": false,
                "type": { "code": "FC", "description": "Cutter" },
                "isOut": false,
                "hasReview": false
              },
              "count": { "balls": 0, "strikes": 1, "outs": 2 },
              "pitchData": {
                "startSpeed": 87.2,
                "endSpeed": 80.1,
                "strikeZoneTop": 3.4250462790556,
                "strikeZoneBottom": 1.60012338062716,
                "coordinates": {
                  "aY": 25.3735376237542,
                  "aZ": -25.939528480858854,
                  "pfxX": -0.46175892262423424,
                  "pfxZ": 3.8192661116666056,
                  "pX": 0.4968646639423712,
                  "pZ": 3.2166889037685045,
                  "vX0": 7.376895566524926,
                  "vY0": -126.85615995118975,
                  "vZ0": -1.3128168168183314,
                  "x": 98.06,
                  "y": 151.93,
                  "x0": -2.38599329996425,
                  "y0": 50.00496084739068,
                  "z0": 5.804108842261907,
                  "aX": -0.7544747410541798
                },
                "breaks": {
                  "breakAngle": 1.2,
                  "breakLength": 6.0,
                  "breakY": 24.0,
                  "spinRate": 2460,
                  "spinDirection": 166
                },
                "zone": 3,
                "typeConfidence": 0.89,
                "plateTime": 0.4313823659526257,
                "extension": 6.852636913102366
              },
              "index": 0,
              "playId": "966c7ae2-3984-40f1-8c88-8f2d68b1ab45",
              "pitchNumber": 1,
              "startTime": "2022-11-02T02:00:28.440Z",
              "endTime": "2022-11-02T02:00:31.629Z",
              "isPitch": true,
              "type": "pitch"
            },
            {
              "details": {
                "call": { "code": "F", "description": "Foul" },
                "description": "Foul",
                "code": "F",
                "ballColor": "rgba(170, 21, 11, 1.0)",
                "trailColor": "rgba(188, 0, 33, 1.0)",
                "isInPlay": false,
                "isStrike": true,
                "isBall": false,
                "type": { "code": "FF", "description": "Four-Seam Fastball" },
                "isOut": false,
                "hasReview": false
              },
              "count": { "balls": 0, "strikes": 2, "outs": 2 },
              "pitchData": {
                "startSpeed": 95.4,
                "endSpeed": 87.0,
                "strikeZoneTop": 3.64,
                "strikeZoneBottom": 1.74,
                "coordinates": {
                  "aY": 31.667380115099974,
                  "aZ": -12.449498332971983,
                  "pfxX": -6.906142166505148,
                  "pfxZ": 10.12790354212874,
                  "pX": -0.7951013369004611,
                  "pZ": 3.5136414921104318,
                  "vX0": 6.258289879972441,
                  "vY0": -138.8153265773193,
                  "vZ0": -4.516361510358896,
                  "x": 147.31,
                  "y": 143.91,
                  "x0": -2.1837764828397423,
                  "y0": 50.00477589399868,
                  "z0": 5.9934628748578564,
                  "aX": -13.452409577782845
                },
                "breaks": {
                  "breakAngle": 42.0,
                  "breakLength": 3.6,
                  "breakY": 24.0,
                  "spinRate": 2342,
                  "spinDirection": 212
                },
                "zone": 1,
                "typeConfidence": 0.91,
                "plateTime": 0.3948942813188223,
                "extension": 6.7853116266783555
              },
              "index": 1,
              "playId": "721739d6-d220-4bae-b912-a44d42e8987c",
              "pitchNumber": 2,
              "startTime": "2022-11-02T02:00:50.603Z",
              "endTime": "2022-11-02T02:00:53.603Z",
              "isPitch": true,
              "type": "pitch"
            },
            {
              "details": {
                "call": { "code": "B", "description": "Ball" },
                "description": "Ball",
                "code": "B",
                "ballColor": "rgba(39, 161, 39, 1.0)",
                "trailColor": "rgba(0, 85, 254, 1.0)",
                "isInPlay": false,
                "isStrike": false,
                "isBall": true,
                "type": { "code": "CH", "description": "Changeup" },
                "isOut": false,
                "hasReview": false
              },
              "count": { "balls": 1, "strikes": 2, "outs": 2 },
              "pitchData": {
                "startSpeed": 84.7,
                "endSpeed": 77.7,
                "strikeZoneTop": 3.57973580581409,
                "strikeZoneBottom": 1.65207052564424,
                "coordinates": {
                  "aY": 25.110993678232827,
                  "aZ": -28.559391924611283,
                  "pfxX": -11.08675642487146,
                  "pfxZ": 2.3570934826896828,
                  "pX": -1.4482302125009745,
                  "pZ": 1.357073845238354,
                  "vX0": 5.916820048229344,
                  "vY0": -123.15417272488739,
                  "vZ0": -4.283159117125996,
                  "x": 172.2,
                  "y": 202.14,
                  "x0": -2.4451331202474607,
                  "y0": 50.001440694184225,
                  "z0": 5.542281359075214,
                  "aX": -16.9799720116918
                },
                "breaks": {
                  "breakAngle": 28.8,
                  "breakLength": 8.4,
                  "breakY": 24.0,
                  "spinRate": 2014,
                  "spinDirection": 254
                },
                "zone": 13,
                "typeConfidence": 0.9,
                "plateTime": 0.4452500113045681,
                "extension": 6.911255219179835
              },
              "index": 2,
              "playId": "6bb50649-dc34-46d8-83fa-c74a33737155",
              "pitchNumber": 3,
              "startTime": "2022-11-02T02:01:20.048Z",
              "endTime": "2022-11-02T02:01:23.415Z",
              "isPitch": true,
              "type": "pitch"
            },
            {
              "details": {
                "call": { "code": "F", "description": "Foul" },
                "description": "Foul",
                "code": "F",
                "ballColor": "rgba(170, 21, 11, 1.0)",
                "trailColor": "rgba(0, 85, 254, 1.0)",
                "isInPlay": false,
                "isStrike": true,
                "isBall": false,
                "type": { "code": "CH", "description": "Changeup" },
                "isOut": false,
                "hasReview": false
              },
              "count": { "balls": 1, "strikes": 2, "outs": 2 },
              "pitchData": {
                "startSpeed": 86.0,
                "endSpeed": 78.8,
                "strikeZoneTop": 3.64,
                "strikeZoneBottom": 1.74,
                "coordinates": {
                  "aY": 25.394927152341968,
                  "aZ": -24.35037147492884,
                  "pfxX": -10.638445269509784,
                  "pfxZ": 4.942630854594557,
                  "pX": -0.6885040206479569,
                  "pZ": 1.8805246243217806,
                  "vX0": 7.218771928253246,
                  "vY0": -125.02642107773539,
                  "vZ0": -4.471605629646852,
                  "x": 143.24,
                  "y": 188.01,
                  "x0": -2.232257346694588,
                  "y0": 50.00029336624212,
                  "z0": 5.692463256026186,
                  "aX": -16.826402640685224
                },
                "breaks": {
                  "breakAngle": 31.2,
                  "breakLength": 7.2,
                  "breakY": 24.0,
                  "spinRate": 2052,
                  "spinDirection": 244
                },
                "zone": 7,
                "typeConfidence": 0.89,
                "plateTime": 0.43822388649527255,
                "extension": 6.997450834064963
              },
              "index": 3,
              "playId": "2c3e5a94-1c20-432f-b71a-c427861d8bfb",
              "pitchNumber": 4,
              "startTime": "2022-11-02T02:01:45.432Z",
              "endTime": "2022-11-02T02:01:49.096Z",
              "isPitch": true,
              "type": "pitch"
            },
            {
              "details": {
                "call": { "code": "F", "description": "Foul" },
                "description": "Foul",
                "code": "F",
                "ballColor": "rgba(170, 21, 11, 1.0)",
                "trailColor": "rgba(188, 0, 33, 1.0)",
                "isInPlay": false,
                "isStrike": true,
                "isBall": false,
                "type": { "code": "FF", "description": "Four-Seam Fastball" },
                "isOut": false,
                "hasReview": false
              },
              "count": { "balls": 1, "strikes": 2, "outs": 2 },
              "pitchData": {
                "startSpeed": 96.7,
                "endSpeed": 88.6,
                "strikeZoneTop": 3.64,
                "strikeZoneBottom": 1.74,
                "coordinates": {
                  "aY": 30.724699997051605,
                  "aZ": -13.830215470636473,
                  "pfxX": -7.824641345185489,
                  "pfxZ": 9.120862327419069,
                  "pX": -0.48989579086456647,
                  "pZ": 3.2281479901734498,
                  "vX0": 7.738365649580492,
                  "vY0": -140.6311861227553,
                  "vZ0": -4.6631415205207905,
                  "x": 135.67,
                  "y": 151.62,
                  "x0": -2.255433792076402,
                  "y0": 50.00095424329578,
                  "z0": 5.7992802000421175,
                  "aX": -15.733040149141601
                },
                "breaks": {
                  "breakAngle": 43.2,
                  "breakLength": 3.6,
                  "breakY": 24.0,
                  "spinRate": 2248,
                  "spinDirection": 220
                },
                "zone": 1,
                "typeConfidence": 0.91,
                "plateTime": 0.388909624641836,
                "extension": 6.946743506660299
              },
              "index": 4,
              "playId": "2dfe1478-a062-4e16-bc1b-e5f32147628f",
              "pitchNumber": 5,
              "startTime": "2022-11-02T02:02:24.333Z",
              "endTime": "2022-11-02T02:02:27.979Z",
              "isPitch": true,
              "type": "pitch"
            },
            {
              "details": {
                "call": { "code": "F", "description": "Foul" },
                "description": "Foul",
                "code": "F",
                "ballColor": "rgba(170, 21, 11, 1.0)",
                "trailColor": "rgba(0, 85, 254, 1.0)",
                "isInPlay": false,
                "isStrike": true,
                "isBall": false,
                "type": { "code": "CH", "description": "Changeup" },
                "isOut": false,
                "hasReview": false
              },
              "count": { "balls": 1, "strikes": 2, "outs": 2 },
              "pitchData": {
                "startSpeed": 84.3,
                "endSpeed": 77.1,
                "strikeZoneTop": 3.64,
                "strikeZoneBottom": 1.74,
                "coordinates": {
                  "aY": 24.804766292133483,
                  "aZ": -28.70880322615089,
                  "pfxX": -10.105997985957854,
                  "pfxZ": 2.279118405521759,
                  "pX": -1.103223051476761,
                  "pZ": 2.624200111188762,
                  "vX0": 5.999024486111227,
                  "vY0": -122.61416009143092,
                  "vZ0": -1.3781916603259297,
                  "x": 159.05,
                  "y": 167.93,
                  "x0": -2.271739794112825,
                  "y0": 50.00070258949668,
                  "z0": 5.6488275004410395,
                  "aX": -15.347839263170835
                },
                "breaks": {
                  "breakAngle": 26.4,
                  "breakLength": 8.4,
                  "breakY": 24.0,
                  "spinRate": 1959,
                  "spinDirection": 253
                },
                "zone": 13,
                "typeConfidence": 0.9,
                "plateTime": 0.44713511608351375,
                "extension": 6.893607185201966
              },
              "index": 5,
              "playId": "eeae9128-1ca3-4f48-b8dc-013369a61db6",
              "pitchNumber": 6,
              "startTime": "2022-11-02T02:03:00.877Z",
              "endTime": "2022-11-02T02:03:04.094Z",
              "isPitch": true,
              "type": "pitch"
            },
            {
              "details": {
                "call": { "code": "S", "description": "Swinging Strike" },
                "description": "Swinging Strike",
                "code": "S",
                "ballColor": "rgba(170, 21, 11, 1.0)",
                "trailColor": "rgba(0, 85, 254, 1.0)",
                "isInPlay": false,
                "isStrike": true,
                "isBall": false,
                "type": { "code": "CH", "description": "Changeup" },
                "isOut": true,
                "hasReview": false
              },
              "count": { "balls": 1, "strikes": 3, "outs": 2 },
              "pitchData": {
                "startSpeed": 86.6,
                "endSpeed": 79.1,
                "strikeZoneTop": 3.64,
                "strikeZoneBottom": 1.74,
                "coordinates": {
                  "aY": 27.05477439235818,
                  "aZ": -27.96483910952915,
                  "pfxX": -11.859090509467569,
                  "pfxZ": 2.6475838553752737,
                  "pX": 0.08203124034056401,
                  "pZ": 1.1577438457207,
                  "vX0": 9.431810897671447,
                  "vY0": -125.70361927356288,
                  "vZ0": -5.335438644071209,
                  "x": 113.87,
                  "y": 207.52,
                  "x0": -2.1901664507682397,
                  "y0": 50.00301465044111,
                  "z0": 5.5966483117137305,
                  "aX": -18.853551215546894
                },
                "breaks": {
                  "breakAngle": 30.0,
                  "breakLength": 8.4,
                  "breakY": 24.0,
                  "spinRate": 2045,
                  "spinDirection": 251
                },
                "zone": 14,
                "typeConfidence": 0.89,
                "plateTime": 0.4368403946592605,
                "extension": 6.929409487955451
              },
              "index": 6,
              "playId": "4a8398a4-fd4a-42f5-984d-dd2464ef966e",
              "pitchNumber": 7,
              "startTime": "2022-11-02T02:03:38.708Z",
              "endTime": "2022-11-02T02:03:43.495Z",
              "isPitch": true,
              "type": "pitch"
            }
          ],
          "playEndTime": "2022-11-02T02:03:43.495Z",
          "atBatIndex": 44
        },
        {
          "result": {
            "type": "atBat",
            "event": "Single",
            "eventType": "single",
            "description": "Nick Castellanos singles on a ground ball to right fielder Kyle Tucker.",
            "rbi": 0,
            "awayScore": 0,
            "homeScore": 7,
            "isOut": false
          },
          "about": {
            "atBatIndex": 45,
            "halfInning": "bottom",
            "isTopInning": false,
            "inning": 6,
            "startTime": "2022-11-02T02:06:58.386Z",
            "endTime": "2022-11-02T02:07:33.555Z",
            "isComplete": true,
            "isScoringPlay": false,
            "hasReview": false,
            "hasOut": false,
            "captivatingIndex": 33
          },
          "count": { "balls": 0, "strikes": 1, "outs": 0 },
          "matchup": {
            "batter": {
              "id": 592206,
              "fullName": "Nick Castellanos",
              "link": "/api/v1/people/592206"
            },
            "batSide": { "code": "R", "description": "Right" },
            "pitcher": {
              "id": 664353,
              "fullName": "Jose Urquidy",
              "link": "/api/v1/people/664353"
            },
            "pitchHand": { "code": "R", "description": "Right" },
            "postOnFirst": {
              "id": 592206,
              "fullName": "Nick Castellanos",
              "link": "/api/v1/people/592206"
            },
            "batterHotColdZones": [],
            "pitcherHotColdZones": [],
            "splits": {
              "batter": "vs_RHP",
              "pitcher": "vs_RHB",
              "menOnBase": "Men_On"
            }
          },
          "pitchIndex": [1, 2],
          "actionIndex": [0],
          "runnerIndex": [0],
          "runners": [
            {
              "movement": {
                "originBase": null,
                "start": null,
                "end": "1B",
                "outBase": null,
                "isOut": false,
                "outNumber": null
              },
              "details": {
                "event": "Single",
                "eventType": "single",
                "movementReason": null,
                "runner": {
                  "id": 592206,
                  "fullName": "Nick Castellanos",
                  "link": "/api/v1/people/592206"
                },
                "responsiblePitcher": null,
                "isScoringEvent": false,
                "rbi": false,
                "earned": false,
                "teamUnearned": false,
                "playIndex": 2
              },
              "credits": [
                {
                  "player": { "id": 663656, "link": "/api/v1/people/663656" },
                  "position": {
                    "code": "9",
                    "name": "Outfielder",
                    "type": "Outfielder",
                    "abbreviation": "RF"
                  },
                  "credit": "f_fielded_ball"
                }
              ]
            }
          ],
          "playEvents": [
            {
              "details": {
                "description": "Pitching Change: Jose Urquidy replaces Ryne Stanek.",
                "event": "Pitching Substitution",
                "eventType": "pitching_substitution",
                "awayScore": 0,
                "homeScore": 7,
                "isScoringPlay": false,
                "isOut": false,
                "hasReview": false
              },
              "count": { "balls": 0, "strikes": 0, "outs": 0 },
              "index": 0,
              "startTime": "2022-11-02T02:04:50.602Z",
              "endTime": "2022-11-02T02:07:00.705Z",
              "isPitch": false,
              "isSubstitution": true,
              "type": "action",
              "player": { "id": 664353, "link": "/api/v1/people/664353" },
              "position": {
                "code": "1",
                "name": "Pitcher",
                "type": "Pitcher",
                "abbreviation": "P"
              }
            },
            {
              "details": {
                "call": { "code": "F", "description": "Foul" },
                "description": "Foul",
                "code": "F",
                "ballColor": "rgba(170, 21, 11, 1.0)",
                "trailColor": "rgba(188, 0, 33, 1.0)",
                "isInPlay": false,
                "isStrike": true,
                "isBall": false,
                "type": { "code": "FF", "description": "Four-Seam Fastball" },
                "isOut": false,
                "hasReview": false
              },
              "count": { "balls": 0, "strikes": 1, "outs": 0 },
              "pitchData": {
                "startSpeed": 94.3,
                "endSpeed": 86.6,
                "strikeZoneTop": 3.69,
                "strikeZoneBottom": 1.8,
                "coordinates": {
                  "aY": 29.27570310626793,
                  "aZ": -12.975880326714707,
                  "pfxX": -6.524319065812111,
                  "pfxZ": 10.022800214698368,
                  "pX": -0.01438011693929399,
                  "pZ": 3.0265358139592475,
                  "vX0": 4.748903716635246,
                  "vY0": -137.2587166096643,
                  "vZ0": -6.243442110929946,
                  "x": 117.55,
                  "y": 157.06,
                  "x0": -0.9159289532430207,
                  "y0": 50.00196924468628,
                  "z0": 6.207575186063371,
                  "aX": -12.49674014362427
                },
                "breaks": {
                  "breakAngle": 38.4,
                  "breakLength": 3.6,
                  "breakY": 24.0,
                  "spinRate": 2053,
                  "spinDirection": 211
                },
                "zone": 5,
                "typeConfidence": 0.91,
                "plateTime": 0.39844444768099274,
                "extension": 6.004270045088001
              },
              "index": 1,
              "playId": "b7c7c7ff-b5d5-429f-9bbe-efc1a73e5416",
              "pitchNumber": 1,
              "startTime": "2022-11-02T02:07:00.705Z",
              "endTime": "2022-11-02T02:07:03.961Z",
              "isPitch": true,
              "type": "pitch"
            },
            {
              "details": {
                "call": { "code": "D", "description": "In play, no out" },
                "description": "In play, no out",
                "code": "D",
                "ballColor": "rgba(26, 86, 190, 1.0)",
                "trailColor": "rgba(188, 0, 33, 1.0)",
                "isInPlay": true,
                "isStrike": false,
                "isBall": false,
                "type": { "code": "FF", "description": "Four-Seam Fastball" },
                "isOut": false,
                "hasReview": false
              },
              "count": { "balls": 0, "strikes": 1, "outs": 0 },
              "pitchData": {
                "startSpeed": 95.1,
                "endSpeed": 86.6,
                "strikeZoneTop": 3.69,
                "strikeZoneBottom": 1.8,
                "coordinates": {
                  "aY": 32.00054970263201,
                  "aZ": -11.619116481331421,
                  "pfxX": -6.3687724453459005,
                  "pfxZ": 10.636532219169968,
                  "pX": 0.30647604948564955,
                  "pZ": 3.4889357127662417,
                  "vX0": 5.123916663781643,
                  "vY0": -138.3919124386886,
                  "vZ0": -5.426324246783065,
                  "x": 105.32,
                  "y": 144.58,
                  "x0": -0.7451357395992186,
                  "y0": 50.00136480472364,
                  "z0": 6.259120777227254,
                  "aX": -12.305027495526948
                },
                "breaks": {
                  "breakAngle": 40.8,
                  "breakLength": 3.6,
                  "breakY": 24.0,
                  "spinRate": 2105,
                  "spinDirection": 207
                },
                "zone": 3,
                "typeConfidence": 0.91,
                "plateTime": 0.3963662886508903,
                "extension": 6.131612253899465
              },
              "hitData": {
                "launchSpeed": 88.5,
                "launchAngle": 4.0,
                "totalDistance": 91.0,
                "trajectory": "ground_ball",
                "hardness": "medium",
                "location": "9",
                "coordinates": { "coordX": 172.3, "coordY": 110.01 }
              },
              "index": 2,
              "playId": "f739a9ca-b367-4ea6-a49b-ea2f199e7479",
              "pitchNumber": 2,
              "startTime": "2022-11-02T02:07:20.679Z",
              "endTime": "2022-11-02T02:07:33.555Z",
              "isPitch": true,
              "type": "pitch"
            }
          ],
          "playEndTime": "2022-11-02T02:07:33.555Z",
          "atBatIndex": 45
        },
        {
          "result": {
            "type": "atBat",
            "event": "Walk",
            "eventType": "walk",
            "description": "Alec Bohm walks.   Nick Castellanos to 2nd.",
            "rbi": 0,
            "awayScore": 0,
            "homeScore": 7,
            "isOut": false
          },
          "about": {
            "atBatIndex": 46,
            "halfInning": "bottom",
            "isTopInning": false,
            "inning": 6,
            "startTime": "2022-11-02T02:07:39.674Z",
            "endTime": "2022-11-02T02:09:19.278Z",
            "isComplete": true,
            "isScoringPlay": false,
            "hasReview": false,
            "hasOut": false,
            "captivatingIndex": 0
          },
          "count": { "balls": 4, "strikes": 0, "outs": 0 },
          "matchup": {
            "batter": {
              "id": 664761,
              "fullName": "Alec Bohm",
              "link": "/api/v1/people/664761"
            },
            "batSide": { "code": "R", "description": "Right" },
            "pitcher": {
              "id": 664353,
              "fullName": "Jose Urquidy",
              "link": "/api/v1/people/664353"
            },
            "pitchHand": { "code": "R", "description": "Right" },
            "postOnFirst": {
              "id": 664761,
              "fullName": "Alec Bohm",
              "link": "/api/v1/people/664761"
            },
            "postOnSecond": {
              "id": 592206,
              "fullName": "Nick Castellanos",
              "link": "/api/v1/people/592206"
            },
            "batterHotColdZones": [],
            "pitcherHotColdZones": [],
            "splits": {
              "batter": "vs_RHP",
              "pitcher": "vs_RHB",
              "menOnBase": "RISP"
            }
          },
          "pitchIndex": [0, 1, 2, 3],
          "actionIndex": [],
          "runnerIndex": [0, 1],
          "runners": [
            {
              "movement": {
                "originBase": "1B",
                "start": "1B",
                "end": "2B",
                "outBase": null,
                "isOut": false,
                "outNumber": null
              },
              "details": {
                "event": "Walk",
                "eventType": "walk",
                "movementReason": "r_adv_force",
                "runner": {
                  "id": 592206,
                  "fullName": "Nick Castellanos",
                  "link": "/api/v1/people/592206"
                },
                "responsiblePitcher": null,
                "isScoringEvent": false,
                "rbi": false,
                "earned": false,
                "teamUnearned": false,
                "playIndex": 3
              },
              "credits": []
            },
            {
              "movement": {
                "originBase": null,
                "start": null,
                "end": "1B",
                "outBase": null,
                "isOut": false,
                "outNumber": null
              },
              "details": {
                "event": "Walk",
                "eventType": "walk",
                "movementReason": null,
                "runner": {
                  "id": 664761,
                  "fullName": "Alec Bohm",
                  "link": "/api/v1/people/664761"
                },
                "responsiblePitcher": null,
                "isScoringEvent": false,
                "rbi": false,
                "earned": false,
                "teamUnearned": false,
                "playIndex": 3
              },
              "credits": []
            }
          ],
          "playEvents": [
            {
              "details": {
                "call": { "code": "B", "description": "Ball" },
                "description": "Ball",
                "code": "B",
                "ballColor": "rgba(39, 161, 39, 1.0)",
                "trailColor": "rgba(188, 0, 33, 1.0)",
                "isInPlay": false,
                "isStrike": false,
                "isBall": true,
                "type": { "code": "FF", "description": "Four-Seam Fastball" },
                "isOut": false,
                "hasReview": false
              },
              "count": { "balls": 1, "strikes": 0, "outs": 0 },
              "pitchData": {
                "startSpeed": 94.5,
                "endSpeed": 86.7,
                "strikeZoneTop": 3.50240918220026,
                "strikeZoneBottom": 1.60012338062716,
                "coordinates": {
                  "aY": 29.387240536995094,
                  "aZ": -11.046356820843632,
                  "pfxX": -5.4867520247862736,
                  "pfxZ": 11.046850663054334,
                  "pX": 1.062076489565168,
                  "pZ": 1.9268246442367993,
                  "vX0": 6.918568423325575,
                  "vY0": -137.18801892029416,
                  "vZ0": -9.42792207308251,
                  "x": 76.52,
                  "y": 186.76,
                  "x0": -0.7756641362162559,
                  "y0": 50.004018783080134,
                  "z0": 6.1540398994398,
                  "aX": -10.495071782853561
                },
                "breaks": {
                  "breakAngle": 34.8,
                  "breakLength": 3.6,
                  "breakY": 24.0,
                  "spinRate": 2132,
                  "spinDirection": 206
                },
                "zone": 14,
                "typeConfidence": 0.91,
                "plateTime": 0.3987326307571264,
                "extension": 6.0559950212436995
              },
              "index": 0,
              "playId": "104c2727-1aa7-4169-933a-02bad6efcdb3",
              "pitchNumber": 1,
              "startTime": "2022-11-02T02:08:08.965Z",
              "endTime": "2022-11-02T02:08:12.657Z",
              "isPitch": true,
              "type": "pitch"
            },
            {
              "details": {
                "call": { "code": "B", "description": "Ball" },
                "description": "Ball",
                "code": "B",
                "ballColor": "rgba(39, 161, 39, 1.0)",
                "trailColor": "rgba(188, 0, 33, 1.0)",
                "isInPlay": false,
                "isStrike": false,
                "isBall": true,
                "type": { "code": "FF", "description": "Four-Seam Fastball" },
                "isOut": false,
                "hasReview": false
              },
              "count": { "balls": 2, "strikes": 0, "outs": 0 },
              "pitchData": {
                "startSpeed": 93.4,
                "endSpeed": 85.4,
                "strikeZoneTop": 3.47662554663393,
                "strikeZoneBottom": 1.54738349013392,
                "coordinates": {
                  "aY": 29.654477883836098,
                  "aZ": -11.274842724666819,
                  "pfxX": -5.645250447000352,
                  "pfxZ": 11.240115984457098,
                  "pX": 0.8496355839557697,
                  "pZ": 1.398417895763534,
                  "vX0": 6.4918775359234235,
                  "vY0": -135.4944198876942,
                  "vZ0": -10.29183375373538,
                  "x": 84.61,
                  "y": 201.02,
                  "x0": -0.8440943736738592,
                  "y0": 50.00064978986125,
                  "z0": 6.03422675671097,
                  "aX": -10.493900731743247
                },
                "breaks": {
                  "breakAngle": 33.6,
                  "breakLength": 3.6,
                  "breakY": 24.0,
                  "spinRate": 2063,
                  "spinDirection": 206
                },
                "zone": 14,
                "typeConfidence": 0.9,
                "plateTime": 0.40427202162465825,
                "extension": 6.16710896166922
              },
              "index": 1,
              "playId": "15a9cda1-d52e-4246-803f-dfa2c38a9c2c",
              "pitchNumber": 2,
              "startTime": "2022-11-02T02:08:30.509Z",
              "endTime": "2022-11-02T02:08:33.874Z",
              "isPitch": true,
              "type": "pitch"
            },
            {
              "details": {
                "call": { "code": "B", "description": "Ball" },
                "description": "Ball",
                "code": "B",
                "ballColor": "rgba(39, 161, 39, 1.0)",
                "trailColor": "rgba(0, 85, 254, 1.0)",
                "isInPlay": false,
                "isStrike": false,
                "isBall": true,
                "type": { "code": "CH", "description": "Changeup" },
                "isOut": false,
                "hasReview": false
              },
              "count": { "balls": 3, "strikes": 0, "outs": 0 },
              "pitchData": {
                "startSpeed": 86.5,
                "endSpeed": 79.3,
                "strikeZoneTop": 3.47662554663393,
                "strikeZoneBottom": 1.60012338062716,
                "coordinates": {
                  "aY": 25.956464457704044,
                  "aZ": -21.875526808580553,
                  "pfxX": -9.730420774526767,
                  "pfxZ": 6.4163958314974,
                  "pX": -1.0901928750441086,
                  "pZ": 2.3732949747478447,
                  "vX0": 3.2026201001926964,
                  "vY0": -125.9527251402003,
                  "vZ0": -4.75265844210744,
                  "x": 158.56,
                  "y": 174.7,
                  "x0": -1.1153412566012741,
                  "y0": 50.00020264990126,
                  "z0": 6.057190010687533,
                  "aX": -15.606167566091282
                },
                "breaks": {
                  "breakAngle": 33.6,
                  "breakLength": 7.2,
                  "breakY": 24.0,
                  "spinRate": 1990,
                  "spinDirection": 236
                },
                "zone": 13,
                "typeConfidence": 0.9,
                "plateTime": 0.43512462375573335,
                "extension": 6.023387710226186
              },
              "index": 2,
              "playId": "49c40cb2-4a99-4e01-b850-bb0f70d21bb9",
              "pitchNumber": 3,
              "startTime": "2022-11-02T02:08:52.222Z",
              "endTime": "2022-11-02T02:08:56.199Z",
              "isPitch": true,
              "type": "pitch"
            },
            {
              "details": {
                "call": { "code": "*B", "description": "Ball In Dirt" },
                "description": "Ball In Dirt",
                "code": "*B",
                "ballColor": "rgba(39, 161, 39, 1.0)",
                "trailColor": "rgba(188, 0, 33, 1.0)",
                "isInPlay": false,
                "isStrike": false,
                "isBall": true,
                "type": { "code": "FF", "description": "Four-Seam Fastball" },
                "isOut": false,
                "hasReview": false
              },
              "count": { "balls": 4, "strikes": 0, "outs": 0 },
              "pitchData": {
                "startSpeed": 93.4,
                "endSpeed": 85.7,
                "strikeZoneTop": 3.50240918220026,
                "strikeZoneBottom": 1.57414598141484,
                "coordinates": {
                  "aY": 28.64365856781205,
                  "aZ": -8.917259471928597,
                  "pfxX": -5.0980672976508155,
                  "pfxZ": 12.497864496913902,
                  "pX": 0.6546480497390006,
                  "pZ": 0.5286319650954412,
                  "vX0": 6.120253424357916,
                  "vY0": -135.3257430235037,
                  "vZ0": -12.89479114510845,
                  "x": 92.05,
                  "y": 224.51,
                  "x0": -0.9704791644240012,
                  "y0": 50.00034793122406,
                  "z0": 5.9717499857945855,
                  "aX": -9.484861654164368
                },
                "breaks": {
                  "breakAngle": 36.0,
                  "breakLength": 3.6,
                  "breakY": 24.0,
                  "spinRate": 2079,
                  "spinDirection": 209
                },
                "zone": 14,
                "typeConfidence": 0.9,
                "plateTime": 0.4042540177591474,
                "extension": 6.078975268538954
              },
              "index": 3,
              "playId": "aae13cde-7450-4fa8-baed-9a465a2e1b5e",
              "pitchNumber": 4,
              "startTime": "2022-11-02T02:09:16.278Z",
              "endTime": "2022-11-02T02:09:19.278Z",
              "isPitch": true,
              "type": "pitch"
            }
          ],
          "playEndTime": "2022-11-02T02:09:19.278Z",
          "atBatIndex": 46
        },
        {
          "result": {
            "type": "atBat",
            "event": "Strikeout",
            "eventType": "strikeout",
            "description": "Bryson Stott strikes out swinging.",
            "rbi": 0,
            "awayScore": 0,
            "homeScore": 7,
            "isOut": true
          },
          "about": {
            "atBatIndex": 47,
            "halfInning": "bottom",
            "isTopInning": false,
            "inning": 6,
            "startTime": "2022-11-02T02:10:11.666Z",
            "endTime": "2022-11-02T02:13:23.370Z",
            "isComplete": true,
            "isScoringPlay": false,
            "hasReview": false,
            "hasOut": true,
            "captivatingIndex": 14
          },
          "count": { "balls": 1, "strikes": 3, "outs": 1 },
          "matchup": {
            "batter": {
              "id": 681082,
              "fullName": "Bryson Stott",
              "link": "/api/v1/people/681082"
            },
            "batSide": { "code": "L", "description": "Left" },
            "pitcher": {
              "id": 664353,
              "fullName": "Jose Urquidy",
              "link": "/api/v1/people/664353"
            },
            "pitchHand": { "code": "R", "description": "Right" },
            "postOnFirst": {
              "id": 664761,
              "fullName": "Alec Bohm",
              "link": "/api/v1/people/664761"
            },
            "postOnSecond": {
              "id": 592206,
              "fullName": "Nick Castellanos",
              "link": "/api/v1/people/592206"
            },
            "batterHotColdZones": [],
            "pitcherHotColdZones": [],
            "splits": {
              "batter": "vs_RHP",
              "pitcher": "vs_LHB",
              "menOnBase": "RISP"
            }
          },
          "pitchIndex": [1, 2, 3, 4, 5, 6, 7, 8],
          "actionIndex": [0],
          "runnerIndex": [0],
          "runners": [
            {
              "movement": {
                "originBase": null,
                "start": null,
                "end": null,
                "outBase": "1B",
                "isOut": true,
                "outNumber": 1
              },
              "details": {
                "event": "Strikeout",
                "eventType": "strikeout",
                "movementReason": null,
                "runner": {
                  "id": 681082,
                  "fullName": "Bryson Stott",
                  "link": "/api/v1/people/681082"
                },
                "responsiblePitcher": null,
                "isScoringEvent": false,
                "rbi": false,
                "earned": false,
                "teamUnearned": false,
                "playIndex": 8
              },
              "credits": [
                {
                  "player": { "id": 455117, "link": "/api/v1/people/455117" },
                  "position": {
                    "code": "2",
                    "name": "Catcher",
                    "type": "Catcher",
                    "abbreviation": "C"
                  },
                  "credit": "f_putout"
                }
              ]
            }
          ],
          "playEvents": [
            {
              "details": {
                "description": "Mound visit.",
                "event": "Game Advisory",
                "eventType": "game_advisory",
                "awayScore": 0,
                "homeScore": 7,
                "isScoringPlay": false,
                "isOut": false,
                "hasReview": false
              },
              "count": { "balls": 0, "strikes": 0, "outs": 0 },
              "index": 0,
              "startTime": "2022-11-02T02:09:30.298Z",
              "endTime": "2022-11-02T02:10:13.895Z",
              "isPitch": false,
              "type": "action",
              "player": { "id": 681082, "link": "/api/v1/people/681082" }
            },
            {
              "details": {
                "call": { "code": "C", "description": "Called Strike" },
                "description": "Called Strike",
                "code": "C",
                "ballColor": "rgba(170, 21, 11, 1.0)",
                "trailColor": "rgba(0, 34, 255, 1.0)",
                "isInPlay": false,
                "isStrike": true,
                "isBall": false,
                "type": { "code": "CU", "description": "Curveball" },
                "isOut": false,
                "hasReview": false
              },
              "count": { "balls": 0, "strikes": 1, "outs": 0 },
              "pitchData": {
                "startSpeed": 79.9,
                "endSpeed": 73.5,
                "strikeZoneTop": 3.19274645019226,
                "strikeZoneBottom": 1.4774246966977,
                "coordinates": {
                  "aY": 23.50344773645382,
                  "aZ": -44.413455236101846,
                  "pfxX": 1.1374836049203605,
                  "pfxZ": -9.00902940048514,
                  "pX": 0.1370091583999157,
                  "pZ": 2.297289918804956,
                  "vX0": 3.3837425170897992,
                  "vY0": -116.33842771101594,
                  "vZ0": 0.4228601634250768,
                  "x": 111.78,
                  "y": 176.75,
                  "x0": -1.488826911172678,
                  "y0": 50.00043583555696,
                  "z0": 6.351238905209166,
                  "aX": 1.5454607656158525
                },
                "breaks": {
                  "breakAngle": 2.4,
                  "breakLength": 13.2,
                  "breakY": 24.0,
                  "spinRate": 2642,
                  "spinDirection": 33
                },
                "zone": 5,
                "typeConfidence": 0.9,
                "plateTime": 0.4722954357146718,
                "extension": 6.013298820321989
              },
              "index": 1,
              "playId": "d78653e1-04c5-423e-a9c2-02c95edaf0e3",
              "pitchNumber": 1,
              "startTime": "2022-11-02T02:10:13.895Z",
              "endTime": "2022-11-02T02:10:16.947Z",
              "isPitch": true,
              "type": "pitch"
            },
            {
              "details": {
                "call": { "code": "F", "description": "Foul" },
                "description": "Foul",
                "code": "F",
                "ballColor": "rgba(170, 21, 11, 1.0)",
                "trailColor": "rgba(188, 0, 33, 1.0)",
                "isInPlay": false,
                "isStrike": true,
                "isBall": false,
                "type": { "code": "FF", "description": "Four-Seam Fastball" },
                "isOut": false,
                "hasReview": false
              },
              "count": { "balls": 0, "strikes": 2, "outs": 0 },
              "pitchData": {
                "startSpeed": 94.4,
                "endSpeed": 86.6,
                "strikeZoneTop": 3.23,
                "strikeZoneBottom": 1.48,
                "coordinates": {
                  "aY": 29.65714588738319,
                  "aZ": -11.442050453202704,
                  "pfxX": -5.605603047635679,
                  "pfxZ": 10.83312294133295,
                  "pX": -0.6056875560516475,
                  "pZ": 2.184728223901632,
                  "vX0": 3.4351845866099433,
                  "vY0": -137.28013054149727,
                  "vZ0": -8.651621027441209,
                  "x": 140.09,
                  "y": 179.79,
                  "x0": -1.143289990745541,
                  "y0": 50.00193251902979,
                  "z0": 6.150874741732031,
                  "aX": -10.726237087499639
                },
                "breaks": {
                  "breakAngle": 37.2,
                  "breakLength": 3.6,
                  "breakY": 24.0,
                  "spinRate": 2130,
                  "spinDirection": 208
                },
                "zone": 4,
                "typeConfidence": 0.91,
                "plateTime": 0.39859423369050795,
                "extension": 5.962653263799109
              },
              "index": 2,
              "playId": "a5df22fc-9c17-434b-a991-cbd5bcc7b74d",
              "pitchNumber": 2,
              "startTime": "2022-11-02T02:10:32.923Z",
              "endTime": "2022-11-02T02:10:35.923Z",
              "isPitch": true,
              "type": "pitch"
            },
            {
              "details": {
                "call": { "code": "B", "description": "Ball" },
                "description": "Ball",
                "code": "B",
                "ballColor": "rgba(39, 161, 39, 1.0)",
                "trailColor": "rgba(188, 0, 33, 1.0)",
                "isInPlay": false,
                "isStrike": false,
                "isBall": true,
                "type": { "code": "FF", "description": "Four-Seam Fastball" },
                "isOut": false,
                "hasReview": false
              },
              "count": { "balls": 1, "strikes": 2, "outs": 0 },
              "pitchData": {
                "startSpeed": 94.0,
                "endSpeed": 85.2,
                "strikeZoneTop": 3.19274645019226,
                "strikeZoneBottom": 1.47021148536669,
                "coordinates": {
                  "aY": 32.8795434060509,
                  "aZ": -12.259156819145947,
                  "pfxX": -5.864821071007229,
                  "pfxZ": 10.600858894702869,
                  "pX": -1.2652052724269796,
                  "pZ": 3.6766238023397215,
                  "vX0": 1.4507384654567859,
                  "vY0": -136.84055129394034,
                  "vZ0": -4.8710040945777004,
                  "x": 165.23,
                  "y": 139.51,
                  "x0": -1.0437179037976627,
                  "y0": 50.0007362494839,
                  "z0": 6.333449432131517,
                  "aX": -11.014820701842519
                },
                "breaks": {
                  "breakAngle": 38.4,
                  "breakLength": 3.6,
                  "breakY": 24.0,
                  "spinRate": 2181,
                  "spinDirection": 203
                },
                "zone": 11,
                "typeConfidence": 0.91,
                "plateTime": 0.4017395283874774,
                "extension": 5.9107865113836535
              },
              "index": 3,
              "playId": "493a95a2-68c1-42b8-8843-30b525a2e42b",
              "pitchNumber": 3,
              "startTime": "2022-11-02T02:10:56.788Z",
              "endTime": "2022-11-02T02:10:59.788Z",
              "isPitch": true,
              "type": "pitch"
            },
            {
              "details": {
                "call": { "code": "F", "description": "Foul" },
                "description": "Foul",
                "code": "F",
                "ballColor": "rgba(170, 21, 11, 1.0)",
                "trailColor": "rgba(188, 0, 33, 1.0)",
                "isInPlay": false,
                "isStrike": true,
                "isBall": false,
                "type": { "code": "FF", "description": "Four-Seam Fastball" },
                "isOut": false,
                "hasReview": false
              },
              "count": { "balls": 1, "strikes": 2, "outs": 0 },
              "pitchData": {
                "startSpeed": 93.2,
                "endSpeed": 84.7,
                "strikeZoneTop": 3.23,
                "strikeZoneBottom": 1.48,
                "coordinates": {
                  "aY": 31.618592359621672,
                  "aZ": -11.202947188208489,
                  "pfxX": -6.4522700164883275,
                  "pfxZ": 11.373358601012102,
                  "pX": -0.1818960491662921,
                  "pZ": 2.2486311642364134,
                  "vX0": 4.778475941192898,
                  "vY0": -135.43341648651378,
                  "vZ0": -8.247857219686756,
                  "x": 123.93,
                  "y": 178.07,
                  "x0": -1.1374164057029255,
                  "y0": 50.00282862224312,
                  "z0": 6.131392402925372,
                  "aX": -11.897700034095566
                },
                "breaks": {
                  "breakAngle": 39.6,
                  "breakLength": 3.6,
                  "breakY": 24.0,
                  "spinRate": 2207,
                  "spinDirection": 208
                },
                "zone": 5,
                "typeConfidence": 0.9,
                "plateTime": 0.4055763333342428,
                "extension": 6.065421259655568
              },
              "index": 4,
              "playId": "711f3ded-bff2-4fcc-939f-1ec3c33bc7f4",
              "pitchNumber": 4,
              "startTime": "2022-11-02T02:11:19.123Z",
              "endTime": "2022-11-02T02:11:22.123Z",
              "isPitch": true,
              "type": "pitch"
            },
            {
              "details": {
                "call": { "code": "F", "description": "Foul" },
                "description": "Foul",
                "code": "F",
                "ballColor": "rgba(170, 21, 11, 1.0)",
                "trailColor": "rgba(188, 0, 33, 1.0)",
                "isInPlay": false,
                "isStrike": true,
                "isBall": false,
                "type": { "code": "FF", "description": "Four-Seam Fastball" },
                "isOut": false,
                "hasReview": false
              },
              "count": { "balls": 1, "strikes": 2, "outs": 0 },
              "pitchData": {
                "startSpeed": 94.1,
                "endSpeed": 85.7,
                "strikeZoneTop": 3.23,
                "strikeZoneBottom": 1.48,
                "coordinates": {
                  "aY": 31.230103768486693,
                  "aZ": -10.793941777229977,
                  "pfxX": -4.557823152656185,
                  "pfxZ": 11.294710198517553,
                  "pX": -0.4926926152178036,
                  "pZ": 4.2976195913334845,
                  "vX0": 2.6922552946906464,
                  "vY0": -136.95575847099346,
                  "vZ0": -3.7379384771495783,
                  "x": 135.78,
                  "y": 122.74,
                  "x0": -0.8980878928799312,
                  "y0": 50.003003042315314,
                  "z0": 6.422511189746849,
                  "aX": -8.628316628871662
                },
                "breaks": {
                  "breakAngle": 34.8,
                  "breakLength": 3.6,
                  "breakY": 24.0,
                  "spinRate": 2167,
                  "spinDirection": 201
                },
                "zone": 11,
                "typeConfidence": 0.91,
                "plateTime": 0.4004504099021142,
                "extension": 5.905946233122465
              },
              "index": 5,
              "playId": "a7803341-7848-4a50-9dff-2e59c41488c8",
              "pitchNumber": 5,
              "startTime": "2022-11-02T02:11:47.989Z",
              "endTime": "2022-11-02T02:11:51.436Z",
              "isPitch": true,
              "type": "pitch"
            },
            {
              "details": {
                "call": { "code": "F", "description": "Foul" },
                "description": "Foul",
                "code": "F",
                "ballColor": "rgba(170, 21, 11, 1.0)",
                "trailColor": "rgba(188, 0, 33, 1.0)",
                "isInPlay": false,
                "isStrike": true,
                "isBall": false,
                "type": { "code": "FF", "description": "Four-Seam Fastball" },
                "isOut": false,
                "hasReview": false
              },
              "count": { "balls": 1, "strikes": 2, "outs": 0 },
              "pitchData": {
                "startSpeed": 94.3,
                "endSpeed": 85.9,
                "strikeZoneTop": 3.23,
                "strikeZoneBottom": 1.48,
                "coordinates": {
                  "aY": 31.492556181915955,
                  "aZ": -8.652963060541369,
                  "pfxX": -5.961054061287124,
                  "pfxZ": 12.45549267650415,
                  "pX": -0.22325115666293827,
                  "pZ": 1.6389376655348666,
                  "vX0": 3.631497819148503,
                  "vY0": -136.86031229018616,
                  "vZ0": -10.46921361700736,
                  "x": 125.51,
                  "y": 194.53,
                  "x0": -0.7960665762240013,
                  "y0": 50.00089224961992,
                  "z0": 6.115918237363934,
                  "aX": -11.255365102822195
                },
                "breaks": {
                  "breakAngle": 43.2,
                  "breakLength": 3.6,
                  "breakY": 24.0,
                  "spinRate": 2320,
                  "spinDirection": 208
                },
                "zone": 8,
                "typeConfidence": 0.91,
                "plateTime": 0.4009115306299238,
                "extension": 6.019851156441698
              },
              "index": 6,
              "playId": "c0697a4b-5aa1-4178-aa9c-2b1cf71659f2",
              "pitchNumber": 6,
              "startTime": "2022-11-02T02:12:16.291Z",
              "endTime": "2022-11-02T02:12:19.291Z",
              "isPitch": true,
              "type": "pitch"
            },
            {
              "details": {
                "call": { "code": "F", "description": "Foul" },
                "description": "Foul",
                "code": "F",
                "ballColor": "rgba(170, 21, 11, 1.0)",
                "trailColor": "rgba(0, 85, 254, 1.0)",
                "isInPlay": false,
                "isStrike": true,
                "isBall": false,
                "type": { "code": "CH", "description": "Changeup" },
                "isOut": false,
                "hasReview": false
              },
              "count": { "balls": 1, "strikes": 2, "outs": 0 },
              "pitchData": {
                "startSpeed": 87.4,
                "endSpeed": 80.2,
                "strikeZoneTop": 3.23,
                "strikeZoneBottom": 1.48,
                "coordinates": {
                  "aY": 26.093858290216765,
                  "aZ": -20.795582445490986,
                  "pfxX": -10.660140568455489,
                  "pfxZ": 6.962519819471529,
                  "pX": -0.8905889166471092,
                  "pZ": 1.5587957416761944,
                  "vX0": 4.4172529717655795,
                  "vY0": -127.0573408482041,
                  "vZ0": -6.7134462247670115,
                  "x": 150.95,
                  "y": 196.69,
                  "x0": -1.2668949293992553,
                  "y0": 50.00311189782079,
                  "z0": 5.888368545756305,
                  "aX": -17.425288283502493
                },
                "breaks": {
                  "breakAngle": 37.2,
                  "breakLength": 7.2,
                  "breakY": 24.0,
                  "spinRate": 1853,
                  "spinDirection": 237
                },
                "zone": 13,
                "typeConfidence": 0.9,
                "plateTime": 0.43111828788434137,
                "extension": 6.072018962853776
              },
              "index": 7,
              "playId": "9958fbd9-81d6-40aa-b0e5-717e8ecaf7aa",
              "pitchNumber": 7,
              "startTime": "2022-11-02T02:12:44.872Z",
              "endTime": "2022-11-02T02:12:49.425Z",
              "isPitch": true,
              "type": "pitch"
            },
            {
              "details": {
                "call": { "code": "S", "description": "Swinging Strike" },
                "description": "Swinging Strike",
                "code": "S",
                "ballColor": "rgba(170, 21, 11, 1.0)",
                "trailColor": "rgba(0, 85, 254, 1.0)",
                "isInPlay": false,
                "isStrike": true,
                "isBall": false,
                "type": { "code": "CH", "description": "Changeup" },
                "isOut": true,
                "hasReview": false
              },
              "count": { "balls": 1, "strikes": 3, "outs": 0 },
              "pitchData": {
                "startSpeed": 87.2,
                "endSpeed": 79.9,
                "strikeZoneTop": 3.23,
                "strikeZoneBottom": 1.48,
                "coordinates": {
                  "aY": 26.456299038707996,
                  "aZ": -21.139062791846214,
                  "pfxX": -11.082664163932442,
                  "pfxZ": 6.789053845391423,
                  "pX": -0.8848826631491169,
                  "pZ": 1.48118910560076,
                  "vX0": 4.60987063647608,
                  "vY0": -126.79035731980903,
                  "vZ0": -6.904736578406264,
                  "x": 150.73,
                  "y": 198.79,
                  "x0": -1.289097484643267,
                  "y0": 50.00016598392795,
                  "z0": 5.932214787304448,
                  "aX": -18.000964399209284
                },
                "breaks": {
                  "breakAngle": 37.2,
                  "breakLength": 7.2,
                  "breakY": 24.0,
                  "spinRate": 2107,
                  "spinDirection": 235
                },
                "zone": 13,
                "typeConfidence": 0.9,
                "plateTime": 0.4323708960534707,
                "extension": 6.150866557345796
              },
              "index": 8,
              "playId": "59b7c3d6-8ef3-4487-b862-fbbf334af4e2",
              "pitchNumber": 8,
              "startTime": "2022-11-02T02:13:20.008Z",
              "endTime": "2022-11-02T02:13:23.370Z",
              "isPitch": true,
              "type": "pitch"
            }
          ],
          "playEndTime": "2022-11-02T02:13:23.370Z",
          "atBatIndex": 47
        },
        {
          "result": {
            "type": "atBat",
            "event": "Pop Out",
            "eventType": "field_out",
            "description": "Jean Segura pops out to shortstop Jeremy Pena.",
            "rbi": 0,
            "awayScore": 0,
            "homeScore": 7,
            "isOut": true
          },
          "about": {
            "atBatIndex": 48,
            "halfInning": "bottom",
            "isTopInning": false,
            "inning": 6,
            "startTime": "2022-11-02T02:13:37.362Z",
            "endTime": "2022-11-02T02:16:16.836Z",
            "isComplete": true,
            "isScoringPlay": false,
            "hasReview": false,
            "hasOut": true,
            "captivatingIndex": 0
          },
          "count": { "balls": 1, "strikes": 2, "outs": 2 },
          "matchup": {
            "batter": {
              "id": 516416,
              "fullName": "Jean Segura",
              "link": "/api/v1/people/516416"
            },
            "batSide": { "code": "R", "description": "Right" },
            "pitcher": {
              "id": 664353,
              "fullName": "Jose Urquidy",
              "link": "/api/v1/people/664353"
            },
            "pitchHand": { "code": "R", "description": "Right" },
            "postOnSecond": {
              "id": 664761,
              "fullName": "Alec Bohm",
              "link": "/api/v1/people/664761"
            },
            "postOnThird": {
              "id": 592206,
              "fullName": "Nick Castellanos",
              "link": "/api/v1/people/592206"
            },
            "batterHotColdZones": [],
            "pitcherHotColdZones": [],
            "splits": {
              "batter": "vs_RHP",
              "pitcher": "vs_RHB",
              "menOnBase": "RISP"
            }
          },
          "pitchIndex": [0, 2, 3, 4, 5],
          "actionIndex": [1],
          "runnerIndex": [0, 1, 2],
          "runners": [
            {
              "movement": {
                "originBase": "2B",
                "start": "2B",
                "end": "3B",
                "outBase": null,
                "isOut": false,
                "outNumber": null
              },
              "details": {
                "event": "Wild Pitch",
                "eventType": "wild_pitch",
                "movementReason": "r_adv_play",
                "runner": {
                  "id": 592206,
                  "fullName": "Nick Castellanos",
                  "link": "/api/v1/people/592206"
                },
                "responsiblePitcher": null,
                "isScoringEvent": false,
                "rbi": false,
                "earned": false,
                "teamUnearned": false,
                "playIndex": 1
              },
              "credits": []
            },
            {
              "movement": {
                "originBase": "1B",
                "start": "1B",
                "end": "2B",
                "outBase": null,
                "isOut": false,
                "outNumber": null
              },
              "details": {
                "event": "Wild Pitch",
                "eventType": "wild_pitch",
                "movementReason": "r_adv_play",
                "runner": {
                  "id": 664761,
                  "fullName": "Alec Bohm",
                  "link": "/api/v1/people/664761"
                },
                "responsiblePitcher": null,
                "isScoringEvent": false,
                "rbi": false,
                "earned": false,
                "teamUnearned": false,
                "playIndex": 1
              },
              "credits": []
            },
            {
              "movement": {
                "originBase": null,
                "start": null,
                "end": null,
                "outBase": "1B",
                "isOut": true,
                "outNumber": 2
              },
              "details": {
                "event": "Pop Out",
                "eventType": "field_out",
                "movementReason": null,
                "runner": {
                  "id": 516416,
                  "fullName": "Jean Segura",
                  "link": "/api/v1/people/516416"
                },
                "responsiblePitcher": null,
                "isScoringEvent": false,
                "rbi": false,
                "earned": false,
                "teamUnearned": false,
                "playIndex": 5
              },
              "credits": [
                {
                  "player": { "id": 665161, "link": "/api/v1/people/665161" },
                  "position": {
                    "code": "6",
                    "name": "Shortstop",
                    "type": "Infielder",
                    "abbreviation": "SS"
                  },
                  "credit": "f_putout"
                }
              ]
            }
          ],
          "playEvents": [
            {
              "details": {
                "call": { "code": "B", "description": "Ball" },
                "description": "Ball",
                "code": "B",
                "ballColor": "rgba(39, 161, 39, 1.0)",
                "trailColor": "rgba(188, 0, 33, 1.0)",
                "isInPlay": false,
                "isStrike": false,
                "isBall": true,
                "type": { "code": "FF", "description": "Four-Seam Fastball" },
                "isOut": false,
                "hasReview": false
              },
              "count": { "balls": 1, "strikes": 0, "outs": 1 },
              "pitchData": {
                "startSpeed": 95.1,
                "endSpeed": 87.1,
                "strikeZoneTop": 3.16666750414551,
                "strikeZoneBottom": 1.49600738114077,
                "coordinates": {
                  "aY": 29.828058791112674,
                  "aZ": -8.11319739141806,
                  "pfxX": -4.509671079587937,
                  "pfxZ": 12.524131086456235,
                  "pX": 2.095210073148262,
                  "pZ": 0.4847299988023284,
                  "vX0": 9.216439402233766,
                  "vY0": -137.576332442718,
                  "vZ0": -13.467023947965654,
                  "x": 37.14,
                  "y": 225.69,
                  "x0": -0.7088075893032173,
                  "y0": 50.0064754827711,
                  "z0": 5.98728965802768,
                  "aX": -8.666954264892928
                },
                "breaks": {
                  "breakAngle": 31.2,
                  "breakLength": 2.4,
                  "breakY": 24.0,
                  "spinRate": 2211,
                  "spinDirection": 203
                },
                "zone": 14,
                "typeConfidence": 0.91,
                "plateTime": 0.3977464930650858,
                "extension": 6.200077046445089
              },
              "index": 0,
              "playId": "63c3bd1f-f9c0-4479-ad58-c37c7b19cd8d",
              "pitchNumber": 1,
              "startTime": "2022-11-02T02:14:02.109Z",
              "endTime": "2022-11-02T02:14:13.768Z",
              "isPitch": true,
              "type": "pitch"
            },
            {
              "details": {
                "description": "Wild pitch by pitcher Jose Urquidy.   Nick Castellanos to 3rd.    Alec Bohm to 2nd.",
                "event": "Wild Pitch",
                "eventType": "wild_pitch",
                "awayScore": 0,
                "homeScore": 7,
                "isScoringPlay": false,
                "isOut": false,
                "hasReview": false
              },
              "count": { "balls": 1, "strikes": 0, "outs": 1 },
              "index": 1,
              "actionPlayId": "63c3bd1f-f9c0-4479-ad58-c37c7b19cd8d",
              "startTime": "2022-11-02T02:14:22.045Z",
              "endTime": "2022-11-02T02:14:39.018Z",
              "isPitch": false,
              "isBaseRunningPlay": true,
              "type": "action",
              "player": { "id": 592206, "link": "/api/v1/people/592206" }
            },
            {
              "details": {
                "call": { "code": "C", "description": "Called Strike" },
                "description": "Called Strike",
                "code": "C",
                "ballColor": "rgba(170, 21, 11, 1.0)",
                "trailColor": "rgba(188, 0, 33, 1.0)",
                "isInPlay": false,
                "isStrike": true,
                "isBall": false,
                "type": { "code": "FF", "description": "Four-Seam Fastball" },
                "isOut": false,
                "hasReview": false
              },
              "count": { "balls": 1, "strikes": 1, "outs": 1 },
              "pitchData": {
                "startSpeed": 94.3,
                "endSpeed": 86.1,
                "strikeZoneTop": 3.0374673660418,
                "strikeZoneBottom": 1.39204849664445,
                "coordinates": {
                  "aY": 30.241395200216786,
                  "aZ": -10.625947484396958,
                  "pfxX": -7.559498864815341,
                  "pfxZ": 11.340992859900245,
                  "pX": 0.6075478722798714,
                  "pZ": 2.47256748554381,
                  "vX0": 7.1926277957052855,
                  "vY0": -136.97570329604756,
                  "vZ0": -7.796300294448805,
                  "x": 93.84,
                  "y": 172.02,
                  "x0": -1.0701399987080564,
                  "y0": 50.00441119375222,
                  "z0": 6.082189652027611,
                  "aX": -14.366670088787995
                },
                "breaks": {
                  "breakAngle": 45.6,
                  "breakLength": 3.6,
                  "breakY": 24.0,
                  "spinRate": 2132,
                  "spinDirection": 211
                },
                "zone": 6,
                "typeConfidence": 0.9,
                "plateTime": 0.39985996675657054,
                "extension": 5.961014058918741
              },
              "index": 2,
              "playId": "93587215-2327-4fc6-9bf1-9a8df51cc96d",
              "pitchNumber": 2,
              "startTime": "2022-11-02T02:14:39.018Z",
              "endTime": "2022-11-02T02:14:43.186Z",
              "isPitch": true,
              "type": "pitch"
            },
            {
              "details": {
                "call": { "code": "S", "description": "Swinging Strike" },
                "description": "Swinging Strike",
                "code": "S",
                "ballColor": "rgba(170, 21, 11, 1.0)",
                "trailColor": "rgba(188, 0, 33, 1.0)",
                "isInPlay": false,
                "isStrike": true,
                "isBall": false,
                "type": { "code": "FF", "description": "Four-Seam Fastball" },
                "isOut": false,
                "hasReview": false
              },
              "count": { "balls": 1, "strikes": 2, "outs": 1 },
              "pitchData": {
                "startSpeed": 94.0,
                "endSpeed": 86.0,
                "strikeZoneTop": 3.08,
                "strikeZoneBottom": 1.44,
                "coordinates": {
                  "aY": 30.225090854869883,
                  "aZ": -11.440849893776656,
                  "pfxX": -4.948482283109956,
                  "pfxZ": 11.025486858811668,
                  "pX": 0.747991418488333,
                  "pZ": 1.1284812130055175,
                  "vX0": 6.40750473730591,
                  "vY0": -136.3313970219654,
                  "vZ0": -11.185107092081166,
                  "x": 88.49,
                  "y": 208.31,
                  "x0": -0.990846981790145,
                  "y0": 50.00379859550238,
                  "z0": 6.076253833452691,
                  "aX": -9.30707133930593
                },
                "breaks": {
                  "breakAngle": 30.0,
                  "breakLength": 3.6,
                  "breakY": 24.0,
                  "spinRate": 2039,
                  "spinDirection": 209
                },
                "zone": 14,
                "typeConfidence": 0.9,
                "plateTime": 0.40190309645417877,
                "extension": 6.213481239871388
              },
              "index": 3,
              "playId": "3cfcf24f-91ed-4d74-aa32-bedfd59029f6",
              "pitchNumber": 3,
              "startTime": "2022-11-02T02:15:06.291Z",
              "endTime": "2022-11-02T02:15:09.564Z",
              "isPitch": true,
              "type": "pitch"
            },
            {
              "details": {
                "call": { "code": "F", "description": "Foul" },
                "description": "Foul",
                "code": "F",
                "ballColor": "rgba(170, 21, 11, 1.0)",
                "trailColor": "rgba(188, 0, 33, 1.0)",
                "isInPlay": false,
                "isStrike": true,
                "isBall": false,
                "type": { "code": "FF", "description": "Four-Seam Fastball" },
                "isOut": false,
                "hasReview": false
              },
              "count": { "balls": 1, "strikes": 2, "outs": 1 },
              "pitchData": {
                "startSpeed": 93.8,
                "endSpeed": 85.6,
                "strikeZoneTop": 3.08,
                "strikeZoneBottom": 1.44,
                "coordinates": {
                  "aY": 30.47645414117386,
                  "aZ": -12.638520437611142,
                  "pfxX": -5.494621504150804,
                  "pfxZ": 10.398584818151686,
                  "pX": -0.29163818818387494,
                  "pZ": 2.5142880640646594,
                  "vX0": 4.512647286453838,
                  "vY0": -136.31841423596117,
                  "vZ0": -7.37437712344361,
                  "x": 128.12,
                  "y": 170.89,
                  "x0": -1.2561243473736297,
                  "y0": 50.00236127192426,
                  "z0": 6.130462529320611,
                  "aX": -10.322026099578851
                },
                "breaks": {
                  "breakAngle": 33.6,
                  "breakLength": 3.6,
                  "breakY": 24.0,
                  "spinRate": 2086,
                  "spinDirection": 210
                },
                "zone": 4,
                "typeConfidence": 0.91,
                "plateTime": 0.40207603278477455,
                "extension": 5.989687034819832
              },
              "index": 4,
              "playId": "b980bf88-566c-458d-8db3-447d36ab8a2a",
              "pitchNumber": 4,
              "startTime": "2022-11-02T02:15:33.432Z",
              "endTime": "2022-11-02T02:15:37.148Z",
              "isPitch": true,
              "type": "pitch"
            },
            {
              "details": {
                "call": { "code": "X", "description": "In play, out(s)" },
                "description": "In play, out(s)",
                "code": "X",
                "ballColor": "rgba(26, 86, 190, 1.0)",
                "trailColor": "rgba(188, 0, 33, 1.0)",
                "isInPlay": true,
                "isStrike": false,
                "isBall": false,
                "type": { "code": "FF", "description": "Four-Seam Fastball" },
                "isOut": true,
                "hasReview": false
              },
              "count": { "balls": 1, "strikes": 2, "outs": 1 },
              "pitchData": {
                "startSpeed": 93.5,
                "endSpeed": 85.4,
                "strikeZoneTop": 3.08,
                "strikeZoneBottom": 1.44,
                "coordinates": {
                  "aY": 30.205058397437746,
                  "aZ": -9.010954618349505,
                  "pfxX": -5.4484172315622645,
                  "pfxZ": 12.370809274249531,
                  "pX": -0.41895525270467515,
                  "pZ": 2.8118007832295566,
                  "vX0": 3.000763490395138,
                  "vY0": -136.06064700507204,
                  "vZ0": -7.40685377420976,
                  "x": 132.97,
                  "y": 162.86,
                  "x0": -0.8289958290783441,
                  "y0": 50.002993345663064,
                  "z0": 6.195843555077948,
                  "aX": -10.202564970818711
                },
                "breaks": {
                  "breakAngle": 42.0,
                  "breakLength": 3.6,
                  "breakY": 24.0,
                  "spinRate": 2156,
                  "spinDirection": 203
                },
                "zone": 1,
                "typeConfidence": 0.91,
                "plateTime": 0.40274075088240746,
                "extension": 6.122501836465959
              },
              "hitData": {
                "launchSpeed": 80.1,
                "launchAngle": 69.0,
                "totalDistance": 111.0,
                "trajectory": "popup",
                "hardness": "medium",
                "location": "6",
                "coordinates": { "coordX": 108.93, "coordY": 157.16 }
              },
              "index": 5,
              "playId": "f4425b54-3d69-427c-bd89-d78690201c9f",
              "pitchNumber": 5,
              "startTime": "2022-11-02T02:16:07.085Z",
              "endTime": "2022-11-02T02:16:16.836Z",
              "isPitch": true,
              "type": "pitch"
            }
          ],
          "playEndTime": "2022-11-02T02:16:16.836Z",
          "atBatIndex": 48
        },
        {
          "result": {
            "type": "atBat",
            "event": "Flyout",
            "eventType": "field_out",
            "description": "Brandon Marsh flies out to left fielder Yordan Alvarez.",
            "rbi": 0,
            "awayScore": 0,
            "homeScore": 7,
            "isOut": true
          },
          "about": {
            "atBatIndex": 49,
            "halfInning": "bottom",
            "isTopInning": false,
            "inning": 6,
            "startTime": "2022-11-02T02:16:35.182Z",
            "endTime": "2022-11-02T02:17:35.330Z",
            "isComplete": true,
            "isScoringPlay": false,
            "hasReview": false,
            "hasOut": true,
            "captivatingIndex": 0
          },
          "count": { "balls": 1, "strikes": 0, "outs": 3 },
          "matchup": {
            "batter": {
              "id": 669016,
              "fullName": "Brandon Marsh",
              "link": "/api/v1/people/669016"
            },
            "batSide": { "code": "L", "description": "Left" },
            "pitcher": {
              "id": 664353,
              "fullName": "Jose Urquidy",
              "link": "/api/v1/people/664353"
            },
            "pitchHand": { "code": "R", "description": "Right" },
            "batterHotColdZones": [],
            "pitcherHotColdZones": [],
            "splits": {
              "batter": "vs_RHP",
              "pitcher": "vs_LHB",
              "menOnBase": "Empty"
            }
          },
          "pitchIndex": [0, 1],
          "actionIndex": [],
          "runnerIndex": [0],
          "runners": [
            {
              "movement": {
                "originBase": null,
                "start": null,
                "end": null,
                "outBase": "1B",
                "isOut": true,
                "outNumber": 3
              },
              "details": {
                "event": "Flyout",
                "eventType": "field_out",
                "movementReason": null,
                "runner": {
                  "id": 669016,
                  "fullName": "Brandon Marsh",
                  "link": "/api/v1/people/669016"
                },
                "responsiblePitcher": null,
                "isScoringEvent": false,
                "rbi": false,
                "earned": false,
                "teamUnearned": false,
                "playIndex": 1
              },
              "credits": [
                {
                  "player": { "id": 670541, "link": "/api/v1/people/670541" },
                  "position": {
                    "code": "7",
                    "name": "Outfielder",
                    "type": "Outfielder",
                    "abbreviation": "LF"
                  },
                  "credit": "f_putout"
                }
              ]
            }
          ],
          "playEvents": [
            {
              "details": {
                "call": { "code": "B", "description": "Ball" },
                "description": "Ball",
                "code": "B",
                "ballColor": "rgba(39, 161, 39, 1.0)",
                "trailColor": "rgba(0, 34, 255, 1.0)",
                "isInPlay": false,
                "isStrike": false,
                "isBall": true,
                "type": { "code": "CU", "description": "Curveball" },
                "isOut": false,
                "hasReview": false
              },
              "count": { "balls": 1, "strikes": 0, "outs": 2 },
              "pitchData": {
                "startSpeed": 80.6,
                "endSpeed": 74.3,
                "strikeZoneTop": 3.19249649300288,
                "strikeZoneBottom": 1.43725996981459,
                "coordinates": {
                  "aY": 23.2354347955573,
                  "aZ": -42.66046446428684,
                  "pfxX": 2.1996007235019412,
                  "pfxZ": -7.561542171006298,
                  "pX": 1.3321594035746145,
                  "pZ": 2.4334244557949556,
                  "vX0": 4.986261744646786,
                  "vY0": -117.31864837966579,
                  "vZ0": 0.32767693342482307,
                  "x": 66.22,
                  "y": 173.08,
                  "x0": -1.1107349155747506,
                  "y0": 50.00188891005471,
                  "z0": 6.284377920933577,
                  "aX": 3.0505003548389955
                },
                "breaks": {
                  "breakAngle": 4.8,
                  "breakLength": 12.0,
                  "breakY": 24.0,
                  "spinRate": 2669,
                  "spinDirection": 33
                },
                "zone": 12,
                "typeConfidence": 0.89,
                "plateTime": 0.4677664780084867,
                "extension": 5.963903054608153
              },
              "index": 0,
              "playId": "1f1d7a96-5bb5-4c38-8ff4-96491f00c47b",
              "pitchNumber": 1,
              "startTime": "2022-11-02T02:17:03.582Z",
              "endTime": "2022-11-02T02:17:06.877Z",
              "isPitch": true,
              "type": "pitch"
            },
            {
              "details": {
                "call": { "code": "X", "description": "In play, out(s)" },
                "description": "In play, out(s)",
                "code": "X",
                "ballColor": "rgba(26, 86, 190, 1.0)",
                "trailColor": "rgba(188, 0, 33, 1.0)",
                "isInPlay": true,
                "isStrike": false,
                "isBall": false,
                "type": { "code": "FF", "description": "Four-Seam Fastball" },
                "isOut": true,
                "hasReview": false
              },
              "count": { "balls": 1, "strikes": 0, "outs": 2 },
              "pitchData": {
                "startSpeed": 94.6,
                "endSpeed": 86.6,
                "strikeZoneTop": 3.06,
                "strikeZoneBottom": 1.44,
                "coordinates": {
                  "aY": 30.369303299261237,
                  "aZ": -10.570919244070414,
                  "pfxX": -6.574959762478431,
                  "pfxZ": 11.28962376319284,
                  "pX": -0.07742258286253872,
                  "pZ": 1.6587359833389053,
                  "vX0": 4.740301729281502,
                  "vY0": -137.43386370442286,
                  "vZ0": -9.697247407106179,
                  "x": 119.95,
                  "y": 193.99,
                  "x0": -0.970054471650892,
                  "y0": 50.00473277998877,
                  "z0": 5.950453670535762,
                  "aX": -12.58296032069098
                },
                "breaks": {
                  "breakAngle": 42.0,
                  "breakLength": 3.6,
                  "breakY": 24.0,
                  "spinRate": 2209,
                  "spinDirection": 209
                },
                "zone": 8,
                "typeConfidence": 0.91,
                "plateTime": 0.3985008887585906,
                "extension": 5.959602300666605
              },
              "hitData": {
                "launchSpeed": 93.5,
                "launchAngle": 40.0,
                "totalDistance": 313.0,
                "trajectory": "fly_ball",
                "hardness": "medium",
                "location": "7",
                "coordinates": { "coordX": 48.28, "coordY": 99.38 }
              },
              "index": 1,
              "playId": "b0e6f1e4-6949-4049-a6c3-de9493ad8172",
              "pitchNumber": 2,
              "startTime": "2022-11-02T02:17:26.321Z",
              "endTime": "2022-11-02T02:17:35.330Z",
              "isPitch": true,
              "type": "pitch"
            }
          ],
          "playEndTime": "2022-11-02T02:17:35.330Z",
          "atBatIndex": 49
        },
        {
          "result": {
            "type": "atBat",
            "event": "Flyout",
            "eventType": "field_out",
            "description": "Yuli Gurriel flies out to center fielder Brandon Marsh.",
            "rbi": 0,
            "awayScore": 0,
            "homeScore": 7,
            "isOut": true
          },
          "about": {
            "atBatIndex": 50,
            "halfInning": "top",
            "isTopInning": true,
            "inning": 7,
            "startTime": "2022-11-02T02:20:47.301Z",
            "endTime": "2022-11-02T02:21:37.844Z",
            "isComplete": true,
            "isScoringPlay": false,
            "hasReview": false,
            "hasOut": true,
            "captivatingIndex": 0
          },
          "count": { "balls": 1, "strikes": 1, "outs": 1 },
          "matchup": {
            "batter": {
              "id": 493329,
              "fullName": "Yuli Gurriel",
              "link": "/api/v1/people/493329"
            },
            "batSide": { "code": "R", "description": "Right" },
            "pitcher": {
              "id": 502043,
              "fullName": "Kyle Gibson",
              "link": "/api/v1/people/502043"
            },
            "pitchHand": { "code": "R", "description": "Right" },
            "batterHotColdZones": [],
            "pitcherHotColdZones": [],
            "splits": {
              "batter": "vs_RHP",
              "pitcher": "vs_RHB",
              "menOnBase": "Empty"
            }
          },
          "pitchIndex": [1, 2, 3],
          "actionIndex": [0],
          "runnerIndex": [0],
          "runners": [
            {
              "movement": {
                "originBase": null,
                "start": null,
                "end": null,
                "outBase": "1B",
                "isOut": true,
                "outNumber": 1
              },
              "details": {
                "event": "Flyout",
                "eventType": "field_out",
                "movementReason": null,
                "runner": {
                  "id": 493329,
                  "fullName": "Yuli Gurriel",
                  "link": "/api/v1/people/493329"
                },
                "responsiblePitcher": null,
                "isScoringEvent": false,
                "rbi": false,
                "earned": false,
                "teamUnearned": false,
                "playIndex": 3
              },
              "credits": [
                {
                  "player": { "id": 669016, "link": "/api/v1/people/669016" },
                  "position": {
                    "code": "8",
                    "name": "Outfielder",
                    "type": "Outfielder",
                    "abbreviation": "CF"
                  },
                  "credit": "f_putout"
                }
              ]
            }
          ],
          "playEvents": [
            {
              "details": {
                "description": "Pitching Change: Kyle Gibson replaces Connor Brogdon.",
                "event": "Pitching Substitution",
                "eventType": "pitching_substitution",
                "awayScore": 0,
                "homeScore": 7,
                "isScoringPlay": false,
                "isOut": false,
                "hasReview": false
              },
              "count": { "balls": 0, "strikes": 0, "outs": 0 },
              "index": 0,
              "startTime": "2022-11-02T02:18:27.672Z",
              "endTime": "2022-11-02T02:20:49.593Z",
              "isPitch": false,
              "isSubstitution": true,
              "type": "action",
              "player": { "id": 502043, "link": "/api/v1/people/502043" },
              "position": {
                "code": "1",
                "name": "Pitcher",
                "type": "Pitcher",
                "abbreviation": "P"
              }
            },
            {
              "details": {
                "call": { "code": "F", "description": "Foul" },
                "description": "Foul",
                "code": "F",
                "ballColor": "rgba(170, 21, 11, 1.0)",
                "trailColor": "rgba(152, 0, 101, 1.0)",
                "isInPlay": false,
                "isStrike": true,
                "isBall": false,
                "type": { "code": "FC", "description": "Cutter" },
                "isOut": false,
                "hasReview": false
              },
              "count": { "balls": 0, "strikes": 1, "outs": 0 },
              "pitchData": {
                "startSpeed": 88.6,
                "endSpeed": 82.0,
                "strikeZoneTop": 3.39,
                "strikeZoneBottom": 1.64,
                "coordinates": {
                  "aY": 24.53885534336709,
                  "aZ": -24.982427067594973,
                  "pfxX": -0.7650323657987055,
                  "pfxZ": 4.2342645916463635,
                  "pX": -0.14521978866141977,
                  "pZ": 2.3085522937669714,
                  "vX0": 5.636396806407146,
                  "vY0": -128.91356922869065,
                  "vZ0": -5.035364812433912,
                  "x": 122.54,
                  "y": 176.45,
                  "x0": -2.252164346000098,
                  "y0": 50.00339170295979,
                  "z0": 6.194012603761202,
                  "aX": -1.300358998853304
                },
                "breaks": {
                  "breakAngle": 1.2,
                  "breakLength": 6.0,
                  "breakY": 24.0,
                  "spinRate": 2345,
                  "spinDirection": 204
                },
                "zone": 5,
                "typeConfidence": 0.87,
                "plateTime": 0.4234375741476586,
                "extension": 6.635687318045756
              },
              "index": 1,
              "playId": "1e40ff42-6d0a-442a-bcaf-003569300890",
              "pitchNumber": 1,
              "startTime": "2022-11-02T02:20:49.593Z",
              "endTime": "2022-11-02T02:20:52.763Z",
              "isPitch": true,
              "type": "pitch"
            },
            {
              "details": {
                "call": { "code": "B", "description": "Ball" },
                "description": "Ball",
                "code": "B",
                "ballColor": "rgba(39, 161, 39, 1.0)",
                "trailColor": "rgba(0, 0, 254, 1.0)",
                "isInPlay": false,
                "isStrike": false,
                "isBall": true,
                "type": { "code": "SL", "description": "Slider" },
                "isOut": false,
                "hasReview": false
              },
              "count": { "balls": 1, "strikes": 1, "outs": 0 },
              "pitchData": {
                "startSpeed": 82.2,
                "endSpeed": 76.1,
                "strikeZoneTop": 3.42478627506239,
                "strikeZoneBottom": 1.67784061774012,
                "coordinates": {
                  "aY": 22.999005498985266,
                  "aZ": -27.7963654635949,
                  "pfxX": 5.377564667769583,
                  "pfxZ": 3.0245037519425093,
                  "pX": 1.3557843963732719,
                  "pZ": 1.2343783322522663,
                  "vX0": 6.88624560370072,
                  "vY0": -119.53457572055439,
                  "vZ0": -5.6076214112726595,
                  "x": 65.32,
                  "y": 205.45,
                  "x0": -2.2607175712098595,
                  "y0": 50.00191873290048,
                  "z0": 6.105563347718877,
                  "aX": 7.78311017135087
                },
                "breaks": {
                  "breakAngle": 16.8,
                  "breakLength": 8.4,
                  "breakY": 24.0,
                  "spinRate": 2411,
                  "spinDirection": 42
                },
                "zone": 14,
                "typeConfidence": 0.9,
                "plateTime": 0.4581729865699904,
                "extension": 6.718748031282627
              },
              "index": 2,
              "playId": "dd4dd5b1-0671-4e50-9d46-1dd8de204732",
              "pitchNumber": 2,
              "startTime": "2022-11-02T02:21:09.591Z",
              "endTime": "2022-11-02T02:21:12.591Z",
              "isPitch": true,
              "type": "pitch"
            },
            {
              "details": {
                "call": { "code": "X", "description": "In play, out(s)" },
                "description": "In play, out(s)",
                "code": "X",
                "ballColor": "rgba(26, 86, 190, 1.0)",
                "trailColor": "rgba(50, 0, 221, 1.0)",
                "isInPlay": true,
                "isStrike": false,
                "isBall": false,
                "type": { "code": "SI", "description": "Sinker" },
                "isOut": true,
                "hasReview": false
              },
              "count": { "balls": 1, "strikes": 1, "outs": 0 },
              "pitchData": {
                "startSpeed": 92.5,
                "endSpeed": 85.5,
                "strikeZoneTop": 3.39,
                "strikeZoneBottom": 1.64,
                "coordinates": {
                  "aY": 27.02200732750365,
                  "aZ": -20.855986580191004,
                  "pfxX": -8.079976133246596,
                  "pfxZ": 6.129261352192291,
                  "pX": -0.14991543388431253,
                  "pZ": 1.8714393623984036,
                  "vX0": 7.273745024819682,
                  "vY0": -134.46916169288875,
                  "vZ0": -7.9494598945205155,
                  "x": 122.71,
                  "y": 188.25,
                  "x0": -1.829942575825493,
                  "y0": 50.00034222692828,
                  "z0": 6.326359240258698,
                  "aX": -14.911072989049616
                },
                "breaks": {
                  "breakAngle": 31.2,
                  "breakLength": 6.0,
                  "breakY": 24.0,
                  "spinRate": 2326,
                  "spinDirection": 210
                },
                "zone": 8,
                "typeConfidence": 0.9,
                "plateTime": 0.4061226218379783,
                "extension": 6.6027057592016325
              },
              "hitData": {
                "launchSpeed": 92.1,
                "launchAngle": 33.0,
                "totalDistance": 338.0,
                "trajectory": "fly_ball",
                "hardness": "medium",
                "location": "8",
                "coordinates": { "coordX": 135.87, "coordY": 63.78 }
              },
              "index": 3,
              "playId": "884cd8bf-c49a-40c5-9e03-842f02565c0b",
              "pitchNumber": 3,
              "startTime": "2022-11-02T02:21:27.386Z",
              "endTime": "2022-11-02T02:21:37.844Z",
              "isPitch": true,
              "type": "pitch"
            }
          ],
          "playEndTime": "2022-11-02T02:21:37.844Z",
          "atBatIndex": 50
        },
        {
          "result": {
            "type": "atBat",
            "event": "Strikeout",
            "eventType": "strikeout",
            "description": "David Hensley strikes out swinging.",
            "rbi": 0,
            "awayScore": 0,
            "homeScore": 7,
            "isOut": true
          },
          "about": {
            "atBatIndex": 51,
            "halfInning": "top",
            "isTopInning": true,
            "inning": 7,
            "startTime": "2022-11-02T02:22:06.861Z",
            "endTime": "2022-11-02T02:23:37.668Z",
            "isComplete": true,
            "isScoringPlay": false,
            "hasReview": false,
            "hasOut": true,
            "captivatingIndex": 14
          },
          "count": { "balls": 2, "strikes": 3, "outs": 2 },
          "matchup": {
            "batter": {
              "id": 682073,
              "fullName": "David Hensley",
              "link": "/api/v1/people/682073"
            },
            "batSide": { "code": "R", "description": "Right" },
            "pitcher": {
              "id": 502043,
              "fullName": "Kyle Gibson",
              "link": "/api/v1/people/502043"
            },
            "pitchHand": { "code": "R", "description": "Right" },
            "batterHotColdZones": [],
            "pitcherHotColdZones": [],
            "splits": {
              "batter": "vs_RHP",
              "pitcher": "vs_RHB",
              "menOnBase": "Empty"
            }
          },
          "pitchIndex": [0, 1, 2, 3, 4],
          "actionIndex": [],
          "runnerIndex": [0],
          "runners": [
            {
              "movement": {
                "originBase": null,
                "start": null,
                "end": null,
                "outBase": "1B",
                "isOut": true,
                "outNumber": 2
              },
              "details": {
                "event": "Strikeout",
                "eventType": "strikeout",
                "movementReason": null,
                "runner": {
                  "id": 682073,
                  "fullName": "David Hensley",
                  "link": "/api/v1/people/682073"
                },
                "responsiblePitcher": null,
                "isScoringEvent": false,
                "rbi": false,
                "earned": false,
                "teamUnearned": false,
                "playIndex": 4
              },
              "credits": [
                {
                  "player": { "id": 592663, "link": "/api/v1/people/592663" },
                  "position": {
                    "code": "2",
                    "name": "Catcher",
                    "type": "Catcher",
                    "abbreviation": "C"
                  },
                  "credit": "f_putout"
                }
              ]
            }
          ],
          "playEvents": [
            {
              "details": {
                "call": { "code": "B", "description": "Ball" },
                "description": "Ball",
                "code": "B",
                "ballColor": "rgba(39, 161, 39, 1.0)",
                "trailColor": "rgba(50, 0, 221, 1.0)",
                "isInPlay": false,
                "isStrike": false,
                "isBall": true,
                "type": { "code": "SI", "description": "Sinker" },
                "isOut": false,
                "hasReview": false
              },
              "count": { "balls": 1, "strikes": 0, "outs": 1 },
              "pitchData": {
                "startSpeed": 94.4,
                "endSpeed": 87.4,
                "strikeZoneTop": 3.61296417710625,
                "strikeZoneBottom": 1.73755792566144,
                "coordinates": {
                  "aY": 27.748712755001254,
                  "aZ": -21.01741632312291,
                  "pfxX": -8.013722480088079,
                  "pfxZ": 5.856825381821952,
                  "pX": 1.214300163475066,
                  "pZ": -0.3354958643490013,
                  "vX0": 10.845065243884555,
                  "vY0": -136.55318563518762,
                  "vZ0": -13.543260771809015,
                  "x": 70.71,
                  "y": 247.84,
                  "x0": -1.7523644778096226,
                  "y0": 50.0032403478309,
                  "z0": 6.10767788739072,
                  "aX": -15.26090048514112
                },
                "breaks": {
                  "breakAngle": 28.8,
                  "breakLength": 6.0,
                  "breakY": 24.0,
                  "spinRate": 2187,
                  "spinDirection": 213
                },
                "zone": 14,
                "typeConfidence": 0.9,
                "plateTime": 0.3998549015306656,
                "extension": 6.834151258381994
              },
              "index": 0,
              "playId": "e15e501e-6f20-4638-8050-eac6af8337f9",
              "pitchNumber": 1,
              "startTime": "2022-11-02T02:22:04.814Z",
              "endTime": "2022-11-02T02:22:07.814Z",
              "isPitch": true,
              "type": "pitch"
            },
            {
              "details": {
                "call": { "code": "C", "description": "Called Strike" },
                "description": "Called Strike",
                "code": "C",
                "ballColor": "rgba(170, 21, 11, 1.0)",
                "trailColor": "rgba(152, 0, 101, 1.0)",
                "isInPlay": false,
                "isStrike": true,
                "isBall": false,
                "type": { "code": "FC", "description": "Cutter" },
                "isOut": false,
                "hasReview": false
              },
              "count": { "balls": 1, "strikes": 1, "outs": 1 },
              "pitchData": {
                "startSpeed": 88.9,
                "endSpeed": 81.7,
                "strikeZoneTop": 3.56143001340385,
                "strikeZoneBottom": 1.71159546421728,
                "coordinates": {
                  "aY": 26.778639820822203,
                  "aZ": -25.398326012090962,
                  "pfxX": -1.1545978225196363,
                  "pfxZ": 4.005909502910177,
                  "pX": 0.18970243290545633,
                  "pZ": 2.089250178254342,
                  "vX0": 6.614079908635886,
                  "vY0": -129.2155282496858,
                  "vZ0": -5.302663627346955,
                  "x": 109.77,
                  "y": 182.37,
                  "x0": -2.252570596069018,
                  "y0": 50.00551421071197,
                  "z0": 6.118211981063014,
                  "aX": -1.9552452921112125
                },
                "breaks": {
                  "breakAngle": 1.2,
                  "breakLength": 6.0,
                  "breakY": 24.0,
                  "spinRate": 2454,
                  "spinDirection": 191
                },
                "zone": 8,
                "typeConfidence": 0.87,
                "plateTime": 0.4238066334146664,
                "extension": 6.597085610129445
              },
              "index": 1,
              "playId": "872ea5aa-c318-47ba-a143-c0ec2be1f025",
              "pitchNumber": 2,
              "startTime": "2022-11-02T02:22:23.860Z",
              "endTime": "2022-11-02T02:22:27.872Z",
              "isPitch": true,
              "type": "pitch"
            },
            {
              "details": {
                "call": { "code": "C", "description": "Called Strike" },
                "description": "Called Strike",
                "code": "C",
                "ballColor": "rgba(170, 21, 11, 1.0)",
                "trailColor": "rgba(152, 0, 101, 1.0)",
                "isInPlay": false,
                "isStrike": true,
                "isBall": false,
                "type": { "code": "FC", "description": "Cutter" },
                "isOut": false,
                "hasReview": false
              },
              "count": { "balls": 1, "strikes": 2, "outs": 1 },
              "pitchData": {
                "startSpeed": 89.1,
                "endSpeed": 82.3,
                "strikeZoneTop": 3.42478627506239,
                "strikeZoneBottom": 1.6371328781476,
                "coordinates": {
                  "aY": 25.983357809758374,
                  "aZ": -25.81539253496466,
                  "pfxX": 0.9365213476597187,
                  "pfxZ": 3.7205953850333717,
                  "pX": 0.7520152215613864,
                  "pZ": 2.3818069886107254,
                  "vX0": 6.676219683402681,
                  "vY0": -129.66852278196754,
                  "vZ0": -5.097411298972592,
                  "x": 88.33,
                  "y": 174.47,
                  "x0": -1.9731088566383859,
                  "y0": 50.004703206573744,
                  "z0": 6.3317699477888665,
                  "aX": 1.602438103745831
                },
                "breaks": {
                  "breakAngle": 6.0,
                  "breakLength": 6.0,
                  "breakY": 24.0,
                  "spinRate": 2458,
                  "spinDirection": 194
                },
                "zone": 6,
                "typeConfidence": 0.81,
                "plateTime": 0.421689139195383,
                "extension": 6.582385267599596
              },
              "index": 2,
              "playId": "c3cd0065-59d5-4fe5-8bfe-c264af447cfb",
              "pitchNumber": 3,
              "startTime": "2022-11-02T02:22:42.405Z",
              "endTime": "2022-11-02T02:22:45.974Z",
              "isPitch": true,
              "type": "pitch"
            },
            {
              "details": {
                "call": { "code": "B", "description": "Ball" },
                "description": "Ball",
                "code": "B",
                "ballColor": "rgba(39, 161, 39, 1.0)",
                "trailColor": "rgba(0, 0, 254, 1.0)",
                "isInPlay": false,
                "isStrike": false,
                "isBall": true,
                "type": { "code": "SL", "description": "Slider" },
                "isOut": false,
                "hasReview": false
              },
              "count": { "balls": 2, "strikes": 2, "outs": 1 },
              "pitchData": {
                "startSpeed": 82.7,
                "endSpeed": 76.3,
                "strikeZoneTop": 3.4505767894105,
                "strikeZoneBottom": 1.65187209151199,
                "coordinates": {
                  "aY": 24.855008164209703,
                  "aZ": -34.3801721500633,
                  "pfxX": 4.0522356077551605,
                  "pfxZ": -1.5207158652608175,
                  "pX": 1.0452543783537507,
                  "pZ": 0.3317802050607725,
                  "vX0": 6.335938838422217,
                  "vY0": -120.12762140326058,
                  "vZ0": -6.2214276156253945,
                  "x": 77.16,
                  "y": 229.82,
                  "x0": -2.1604768458849133,
                  "y0": 50.0043332225691,
                  "z0": 6.038436430481722,
                  "aX": 5.877651365484918
                },
                "breaks": {
                  "breakAngle": 10.8,
                  "breakLength": 9.6,
                  "breakY": 24.0,
                  "spinRate": 2498,
                  "spinDirection": 47
                },
                "zone": 14,
                "typeConfidence": 0.89,
                "plateTime": 0.45723612980948314,
                "extension": 6.48114698811952
              },
              "index": 3,
              "playId": "212d91b5-9a5e-458c-8090-cfff6d6e2a88",
              "pitchNumber": 4,
              "startTime": "2022-11-02T02:23:05.265Z",
              "endTime": "2022-11-02T02:23:08.265Z",
              "isPitch": true,
              "type": "pitch"
            },
            {
              "details": {
                "call": { "code": "S", "description": "Swinging Strike" },
                "description": "Swinging Strike",
                "code": "S",
                "ballColor": "rgba(170, 21, 11, 1.0)",
                "trailColor": "rgba(0, 0, 254, 1.0)",
                "isInPlay": false,
                "isStrike": true,
                "isBall": false,
                "type": { "code": "SL", "description": "Slider" },
                "isOut": true,
                "hasReview": false
              },
              "count": { "balls": 2, "strikes": 3, "outs": 1 },
              "pitchData": {
                "startSpeed": 82.2,
                "endSpeed": 76.0,
                "strikeZoneTop": 3.4,
                "strikeZoneBottom": 1.64,
                "coordinates": {
                  "aY": 23.92809596328194,
                  "aZ": -34.553973209525644,
                  "pfxX": 7.255516570178168,
                  "pfxZ": -1.6538679184279408,
                  "pX": 0.572208636858967,
                  "pZ": 1.177755545863542,
                  "vX0": 4.4247531733454455,
                  "vY0": -119.56809656103302,
                  "vZ0": -4.388824341981589,
                  "x": 95.19,
                  "y": 206.98,
                  "x0": -2.2472513057450367,
                  "y0": 50.00067742874976,
                  "z0": 6.151193656019745,
                  "aX": 10.460631496595939
                },
                "breaks": {
                  "breakAngle": 18.0,
                  "breakLength": 10.8,
                  "breakY": 24.0,
                  "spinRate": 2510,
                  "spinDirection": 52
                },
                "zone": 14,
                "typeConfidence": 0.67,
                "plateTime": 0.4588003204823856,
                "extension": 6.548552602022752
              },
              "index": 4,
              "playId": "627d0364-a27f-4bf6-8ee8-9169bf60b75a",
              "pitchNumber": 5,
              "startTime": "2022-11-02T02:23:33.631Z",
              "endTime": "2022-11-02T02:23:37.668Z",
              "isPitch": true,
              "type": "pitch"
            }
          ],
          "playEndTime": "2022-11-02T02:23:37.668Z",
          "atBatIndex": 51
        },
        {
          "result": {
            "type": "atBat",
            "event": "Single",
            "eventType": "single",
            "description": "Chas McCormick singles on a sharp ground ball to center fielder Brandon Marsh.",
            "rbi": 0,
            "awayScore": 0,
            "homeScore": 7,
            "isOut": false
          },
          "about": {
            "atBatIndex": 52,
            "halfInning": "top",
            "isTopInning": true,
            "inning": 7,
            "startTime": "2022-11-02T02:23:47.807Z",
            "endTime": "2022-11-02T02:24:36.625Z",
            "isComplete": true,
            "isScoringPlay": false,
            "hasReview": false,
            "hasOut": false,
            "captivatingIndex": 33
          },
          "count": { "balls": 1, "strikes": 0, "outs": 2 },
          "matchup": {
            "batter": {
              "id": 676801,
              "fullName": "Chas McCormick",
              "link": "/api/v1/people/676801"
            },
            "batSide": { "code": "R", "description": "Right" },
            "pitcher": {
              "id": 502043,
              "fullName": "Kyle Gibson",
              "link": "/api/v1/people/502043"
            },
            "pitchHand": { "code": "R", "description": "Right" },
            "postOnFirst": {
              "id": 676801,
              "fullName": "Chas McCormick",
              "link": "/api/v1/people/676801"
            },
            "batterHotColdZones": [],
            "pitcherHotColdZones": [],
            "splits": {
              "batter": "vs_RHP",
              "pitcher": "vs_RHB",
              "menOnBase": "Men_On"
            }
          },
          "pitchIndex": [0, 1],
          "actionIndex": [],
          "runnerIndex": [0],
          "runners": [
            {
              "movement": {
                "originBase": null,
                "start": null,
                "end": "1B",
                "outBase": null,
                "isOut": false,
                "outNumber": null
              },
              "details": {
                "event": "Single",
                "eventType": "single",
                "movementReason": null,
                "runner": {
                  "id": 676801,
                  "fullName": "Chas McCormick",
                  "link": "/api/v1/people/676801"
                },
                "responsiblePitcher": null,
                "isScoringEvent": false,
                "rbi": false,
                "earned": false,
                "teamUnearned": false,
                "playIndex": 1
              },
              "credits": [
                {
                  "player": { "id": 669016, "link": "/api/v1/people/669016" },
                  "position": {
                    "code": "8",
                    "name": "Outfielder",
                    "type": "Outfielder",
                    "abbreviation": "CF"
                  },
                  "credit": "f_fielded_ball"
                }
              ]
            }
          ],
          "playEvents": [
            {
              "details": {
                "call": { "code": "B", "description": "Ball" },
                "description": "Ball",
                "code": "B",
                "ballColor": "rgba(39, 161, 39, 1.0)",
                "trailColor": "rgba(152, 0, 101, 1.0)",
                "isInPlay": false,
                "isStrike": false,
                "isBall": true,
                "type": { "code": "FC", "description": "Cutter" },
                "isOut": false,
                "hasReview": false
              },
              "count": { "balls": 1, "strikes": 0, "outs": 2 },
              "pitchData": {
                "startSpeed": 89.5,
                "endSpeed": 82.2,
                "strikeZoneTop": 3.26996093814823,
                "strikeZoneBottom": 1.57395105475997,
                "coordinates": {
                  "aY": 27.65569569161533,
                  "aZ": -27.135622625433726,
                  "pfxX": 1.6369970205516022,
                  "pfxZ": 2.944914696448313,
                  "pX": 1.1837700784527152,
                  "pZ": 2.481934310191081,
                  "vX0": 7.728584688746579,
                  "vY0": -130.07383126735425,
                  "vZ0": -4.492076286817859,
                  "x": 71.88,
                  "y": 171.77,
                  "x0": -2.040457101232169,
                  "y0": 50.00369286214954,
                  "z0": 6.292418719352487,
                  "aX": 2.7996448672938676
                },
                "breaks": {
                  "breakAngle": 8.4,
                  "breakLength": 7.2,
                  "breakY": 24.0,
                  "spinRate": 2460,
                  "spinDirection": 175
                },
                "zone": 12,
                "typeConfidence": 0.72,
                "plateTime": 0.42133221456843106,
                "extension": 6.735433432995329
              },
              "index": 0,
              "playId": "b6f01e1c-f996-494f-bdf7-c9a2da1469f2",
              "pitchNumber": 1,
              "startTime": "2022-11-02T02:24:06.799Z",
              "endTime": "2022-11-02T02:24:10.556Z",
              "isPitch": true,
              "type": "pitch"
            },
            {
              "details": {
                "call": { "code": "D", "description": "In play, no out" },
                "description": "In play, no out",
                "code": "D",
                "ballColor": "rgba(26, 86, 190, 1.0)",
                "trailColor": "rgba(50, 0, 221, 1.0)",
                "isInPlay": true,
                "isStrike": false,
                "isBall": false,
                "type": { "code": "SI", "description": "Sinker" },
                "isOut": false,
                "hasReview": false
              },
              "count": { "balls": 1, "strikes": 0, "outs": 2 },
              "pitchData": {
                "startSpeed": 93.6,
                "endSpeed": 86.4,
                "strikeZoneTop": 3.21,
                "strikeZoneBottom": 1.54,
                "coordinates": {
                  "aY": 27.95698757713772,
                  "aZ": -23.13919536494615,
                  "pfxX": -8.462364780746054,
                  "pfxZ": 4.791115772964965,
                  "pX": -0.3825471630079667,
                  "pZ": 1.7958961857323408,
                  "vX0": 6.899288214822265,
                  "vY0": -135.97540291513567,
                  "vZ0": -7.85003508631131,
                  "x": 131.58,
                  "y": 190.29,
                  "x0": -1.8449790475719379,
                  "y0": 50.00213158894448,
                  "z0": 6.308900846072045,
                  "aX": -15.951523292539592
                },
                "breaks": {
                  "breakAngle": 31.2,
                  "breakLength": 6.0,
                  "breakY": 24.0,
                  "spinRate": 2242,
                  "spinDirection": 210
                },
                "zone": 7,
                "typeConfidence": 0.9,
                "plateTime": 0.40180639515492533,
                "extension": 6.772660346686881
              },
              "hitData": {
                "launchSpeed": 106.1,
                "launchAngle": 4.0,
                "totalDistance": 83.0,
                "trajectory": "ground_ball",
                "hardness": "hard",
                "location": "8",
                "coordinates": { "coordX": 145.43, "coordY": 86.18 }
              },
              "index": 1,
              "playId": "fb6cb1c5-c364-40ff-9a6f-be60217a1655",
              "pitchNumber": 2,
              "startTime": "2022-11-02T02:24:25.091Z",
              "endTime": "2022-11-02T02:24:36.625Z",
              "isPitch": true,
              "type": "pitch"
            }
          ],
          "playEndTime": "2022-11-02T02:24:36.625Z",
          "atBatIndex": 52
        },
        {
          "result": {
            "type": "atBat",
            "event": "Groundout",
            "eventType": "field_out",
            "description": "Martin Maldonado grounds out softly, pitcher Kyle Gibson to first baseman Rhys Hoskins.",
            "rbi": 0,
            "awayScore": 0,
            "homeScore": 7,
            "isOut": true
          },
          "about": {
            "atBatIndex": 53,
            "halfInning": "top",
            "isTopInning": true,
            "inning": 7,
            "startTime": "2022-11-02T02:24:47.075Z",
            "endTime": "2022-11-02T02:26:57.647Z",
            "isComplete": true,
            "isScoringPlay": false,
            "hasReview": false,
            "hasOut": true,
            "captivatingIndex": 0
          },
          "count": { "balls": 2, "strikes": 2, "outs": 3 },
          "matchup": {
            "batter": {
              "id": 455117,
              "fullName": "Martin Maldonado",
              "link": "/api/v1/people/455117"
            },
            "batSide": { "code": "R", "description": "Right" },
            "pitcher": {
              "id": 502043,
              "fullName": "Kyle Gibson",
              "link": "/api/v1/people/502043"
            },
            "pitchHand": { "code": "R", "description": "Right" },
            "batterHotColdZones": [],
            "pitcherHotColdZones": [],
            "splits": {
              "batter": "vs_RHP",
              "pitcher": "vs_RHB",
              "menOnBase": "Empty"
            }
          },
          "pitchIndex": [0, 1, 2, 3, 4],
          "actionIndex": [],
          "runnerIndex": [0],
          "runners": [
            {
              "movement": {
                "originBase": null,
                "start": null,
                "end": null,
                "outBase": "1B",
                "isOut": true,
                "outNumber": 3
              },
              "details": {
                "event": "Groundout",
                "eventType": "field_out",
                "movementReason": null,
                "runner": {
                  "id": 455117,
                  "fullName": "Martin Maldonado",
                  "link": "/api/v1/people/455117"
                },
                "responsiblePitcher": null,
                "isScoringEvent": false,
                "rbi": false,
                "earned": false,
                "teamUnearned": false,
                "playIndex": 4
              },
              "credits": [
                {
                  "player": { "id": 502043, "link": "/api/v1/people/502043" },
                  "position": {
                    "code": "1",
                    "name": "Pitcher",
                    "type": "Pitcher",
                    "abbreviation": "P"
                  },
                  "credit": "f_assist"
                },
                {
                  "player": { "id": 656555, "link": "/api/v1/people/656555" },
                  "position": {
                    "code": "3",
                    "name": "First Base",
                    "type": "Infielder",
                    "abbreviation": "1B"
                  },
                  "credit": "f_putout"
                }
              ]
            }
          ],
          "playEvents": [
            {
              "details": {
                "call": { "code": "B", "description": "Ball" },
                "description": "Ball",
                "code": "B",
                "ballColor": "rgba(39, 161, 39, 1.0)",
                "trailColor": "rgba(50, 0, 221, 1.0)",
                "isInPlay": false,
                "isStrike": false,
                "isBall": true,
                "type": { "code": "SI", "description": "Sinker" },
                "isOut": false,
                "hasReview": false
              },
              "count": { "balls": 1, "strikes": 0, "outs": 2 },
              "pitchData": {
                "startSpeed": 92.2,
                "endSpeed": 85.0,
                "strikeZoneTop": 3.37319339883632,
                "strikeZoneBottom": 1.57395105475997,
                "coordinates": {
                  "aY": 27.678930143580885,
                  "aZ": -20.64818289789368,
                  "pfxX": -8.975187464085025,
                  "pfxZ": 6.3295596499532625,
                  "pX": 0.09464980505793538,
                  "pZ": 1.0868966859161149,
                  "vX0": 7.990456234152207,
                  "vY0": -133.8236361601991,
                  "vZ0": -9.753583849041823,
                  "x": 113.39,
                  "y": 209.43,
                  "x0": -1.7573652763007612,
                  "y0": 50.00518958948583,
                  "z0": 6.245752011712498,
                  "aX": -16.353457808350875
                },
                "breaks": {
                  "breakAngle": 33.6,
                  "breakLength": 6.0,
                  "breakY": 24.0,
                  "spinRate": 2135,
                  "spinDirection": 213
                },
                "zone": 14,
                "typeConfidence": 0.91,
                "plateTime": 0.4085879949982858,
                "extension": 6.9446720887471285
              },
              "index": 0,
              "playId": "c7851878-3f89-49f1-b405-0041f3ad37a9",
              "pitchNumber": 1,
              "startTime": "2022-11-02T02:25:06.872Z",
              "endTime": "2022-11-02T02:25:09.872Z",
              "isPitch": true,
              "type": "pitch"
            },
            {
              "details": {
                "call": { "code": "C", "description": "Called Strike" },
                "description": "Called Strike",
                "code": "C",
                "ballColor": "rgba(170, 21, 11, 1.0)",
                "trailColor": "rgba(152, 0, 101, 1.0)",
                "isInPlay": false,
                "isStrike": true,
                "isBall": false,
                "type": { "code": "FC", "description": "Cutter" },
                "isOut": false,
                "hasReview": false
              },
              "count": { "balls": 1, "strikes": 1, "outs": 2 },
              "pitchData": {
                "startSpeed": 89.9,
                "endSpeed": 82.5,
                "strikeZoneTop": 3.26636758234072,
                "strikeZoneBottom": 1.49600738114077,
                "coordinates": {
                  "aY": 27.3486549923907,
                  "aZ": -25.326648131125584,
                  "pfxX": -0.353496021875753,
                  "pfxZ": 3.9475086325274304,
                  "pX": 0.6954191483004214,
                  "pZ": 3.1246745613887024,
                  "vX0": 7.421476847963113,
                  "vY0": -130.7670484432697,
                  "vZ0": -3.0079124588299426,
                  "x": 90.49,
                  "y": 154.41,
                  "x0": -2.132231535037279,
                  "y0": 50.00006784341632,
                  "z0": 6.1879832527272,
                  "aX": -0.6137816554592258
                },
                "breaks": {
                  "breakAngle": 2.4,
                  "breakLength": 6.0,
                  "breakY": 24.0,
                  "spinRate": 2397,
                  "spinDirection": 187
                },
                "zone": 3,
                "typeConfidence": 0.9,
                "plateTime": 0.4187090447531441,
                "extension": 6.703966939298951
              },
              "index": 1,
              "playId": "16299a32-7e3f-4266-9963-71b02af11a96",
              "pitchNumber": 2,
              "startTime": "2022-11-02T02:25:27.298Z",
              "endTime": "2022-11-02T02:25:30.712Z",
              "isPitch": true,
              "type": "pitch"
            },
            {
              "details": {
                "call": { "code": "S", "description": "Swinging Strike" },
                "description": "Swinging Strike",
                "code": "S",
                "ballColor": "rgba(170, 21, 11, 1.0)",
                "trailColor": "rgba(0, 0, 254, 1.0)",
                "isInPlay": false,
                "isStrike": true,
                "isBall": false,
                "type": { "code": "SL", "description": "Slider" },
                "isOut": false,
                "hasReview": false
              },
              "count": { "balls": 1, "strikes": 2, "outs": 2 },
              "pitchData": {
                "startSpeed": 82.6,
                "endSpeed": 76.0,
                "strikeZoneTop": 3.27,
                "strikeZoneBottom": 1.53,
                "coordinates": {
                  "aY": 24.857985514421838,
                  "aZ": -31.987937695322497,
                  "pfxX": 6.855014549766116,
                  "pfxZ": 0.12507617359417722,
                  "pX": 0.9510734992003363,
                  "pZ": 1.2096947056420668,
                  "vX0": 5.689142273526532,
                  "vY0": -120.11246426309764,
                  "vZ0": -4.624128973862421,
                  "x": 80.75,
                  "y": 206.12,
                  "x0": -2.344768870088729,
                  "y0": 50.00041125803533,
                  "z0": 6.0274829905898635,
                  "aX": 9.940546681562004
                },
                "breaks": {
                  "breakAngle": 18.0,
                  "breakLength": 9.6,
                  "breakY": 24.0,
                  "spinRate": 2528,
                  "spinDirection": 54
                },
                "zone": 14,
                "typeConfidence": 0.89,
                "plateTime": 0.4573023798486,
                "extension": 6.659621372274271
              },
              "index": 2,
              "playId": "015af7bd-6fab-40f6-8455-2cfa979e8816",
              "pitchNumber": 3,
              "startTime": "2022-11-02T02:25:50.727Z",
              "endTime": "2022-11-02T02:25:53.836Z",
              "isPitch": true,
              "type": "pitch"
            },
            {
              "details": {
                "call": { "code": "B", "description": "Ball" },
                "description": "Ball",
                "code": "B",
                "ballColor": "rgba(39, 161, 39, 1.0)",
                "trailColor": "rgba(0, 0, 254, 1.0)",
                "isInPlay": false,
                "isStrike": false,
                "isBall": true,
                "type": { "code": "SL", "description": "Slider" },
                "isOut": false,
                "hasReview": false
              },
              "count": { "balls": 2, "strikes": 2, "outs": 2 },
              "pitchData": {
                "startSpeed": 83.0,
                "endSpeed": 76.2,
                "strikeZoneTop": 3.30868034043207,
                "strikeZoneBottom": 1.56096199536435,
                "coordinates": {
                  "aY": 25.529911499918263,
                  "aZ": -27.590557142796563,
                  "pfxX": 6.757081200009389,
                  "pfxZ": 3.142718077747533,
                  "pX": 1.3344376350716558,
                  "pZ": 1.0766792431860137,
                  "vX0": 6.325036832680832,
                  "vY0": -120.6291901945272,
                  "vZ0": -6.014714059018121,
                  "x": 66.13,
                  "y": 209.71,
                  "x0": -2.2087404507886754,
                  "y0": 50.00466329668508,
                  "z0": 6.064000439992897,
                  "aX": 9.865285845470016
                },
                "breaks": {
                  "breakAngle": 20.4,
                  "breakLength": 8.4,
                  "breakY": 24.0,
                  "spinRate": 2539,
                  "spinDirection": 50
                },
                "zone": 14,
                "typeConfidence": 0.9,
                "plateTime": 0.45569456613936854,
                "extension": 6.659580873504706
              },
              "index": 3,
              "playId": "b832b895-908c-4861-a06a-d9389a452ea0",
              "pitchNumber": 4,
              "startTime": "2022-11-02T02:26:23.532Z",
              "endTime": "2022-11-02T02:26:26.597Z",
              "isPitch": true,
              "type": "pitch"
            },
            {
              "details": {
                "call": { "code": "X", "description": "In play, out(s)" },
                "description": "In play, out(s)",
                "code": "X",
                "ballColor": "rgba(26, 86, 190, 1.0)",
                "trailColor": "rgba(0, 0, 254, 1.0)",
                "isInPlay": true,
                "isStrike": false,
                "isBall": false,
                "type": { "code": "SL", "description": "Slider" },
                "isOut": true,
                "hasReview": false
              },
              "count": { "balls": 2, "strikes": 2, "outs": 2 },
              "pitchData": {
                "startSpeed": 82.7,
                "endSpeed": 76.1,
                "strikeZoneTop": 3.27,
                "strikeZoneBottom": 1.53,
                "coordinates": {
                  "aY": 24.895065630805508,
                  "aZ": -32.23331485756146,
                  "pfxX": 6.2208841921043065,
                  "pfxZ": -0.04610307147048687,
                  "pX": 0.9868027551628082,
                  "pZ": 1.2435960470503906,
                  "vX0": 5.812953422913464,
                  "vY0": -120.24742754295275,
                  "vZ0": -4.714852791378463,
                  "x": 79.39,
                  "y": 205.2,
                  "x0": -2.276247543482566,
                  "y0": 50.00034411795291,
                  "z0": 6.112885918810209,
                  "aX": 9.040456988354057
                },
                "breaks": {
                  "breakAngle": 16.8,
                  "breakLength": 9.6,
                  "breakY": 24.0,
                  "spinRate": 2556,
                  "spinDirection": 46
                },
                "zone": 14,
                "typeConfidence": 0.89,
                "plateTime": 0.45677069744881793,
                "extension": 6.747487663260131
              },
              "hitData": {
                "launchSpeed": 58.9,
                "launchAngle": -54.0,
                "totalDistance": 4.0,
                "trajectory": "ground_ball",
                "hardness": "soft",
                "location": "1",
                "coordinates": { "coordX": 125.34, "coordY": 178.09 }
              },
              "index": 4,
              "playId": "247f3add-f913-4bf3-820a-56d10f0fac68",
              "pitchNumber": 5,
              "startTime": "2022-11-02T02:26:50.133Z",
              "endTime": "2022-11-02T02:26:57.647Z",
              "isPitch": true,
              "type": "pitch"
            }
          ],
          "playEndTime": "2022-11-02T02:26:57.647Z",
          "atBatIndex": 53
        },
        {
          "result": {
            "type": "atBat",
            "event": "Strikeout",
            "eventType": "strikeout",
            "description": "Kyle Schwarber strikes out swinging.",
            "rbi": 0,
            "awayScore": 0,
            "homeScore": 7,
            "isOut": true
          },
          "about": {
            "atBatIndex": 54,
            "halfInning": "bottom",
            "isTopInning": false,
            "inning": 7,
            "startTime": "2022-11-02T02:30:41.084Z",
            "endTime": "2022-11-02T02:34:03.891Z",
            "isComplete": true,
            "isScoringPlay": false,
            "hasReview": false,
            "hasOut": true,
            "captivatingIndex": 14
          },
          "count": { "balls": 3, "strikes": 3, "outs": 1 },
          "matchup": {
            "batter": {
              "id": 656941,
              "fullName": "Kyle Schwarber",
              "link": "/api/v1/people/656941"
            },
            "batSide": { "code": "L", "description": "Left" },
            "pitcher": {
              "id": 664353,
              "fullName": "Jose Urquidy",
              "link": "/api/v1/people/664353"
            },
            "pitchHand": { "code": "R", "description": "Right" },
            "batterHotColdZones": [],
            "pitcherHotColdZones": [],
            "splits": {
              "batter": "vs_RHP",
              "pitcher": "vs_LHB",
              "menOnBase": "Empty"
            }
          },
          "pitchIndex": [0, 1, 2, 3, 4, 5, 6, 7],
          "actionIndex": [],
          "runnerIndex": [0],
          "runners": [
            {
              "movement": {
                "originBase": null,
                "start": null,
                "end": null,
                "outBase": "1B",
                "isOut": true,
                "outNumber": 1
              },
              "details": {
                "event": "Strikeout",
                "eventType": "strikeout",
                "movementReason": null,
                "runner": {
                  "id": 656941,
                  "fullName": "Kyle Schwarber",
                  "link": "/api/v1/people/656941"
                },
                "responsiblePitcher": null,
                "isScoringEvent": false,
                "rbi": false,
                "earned": false,
                "teamUnearned": false,
                "playIndex": 7
              },
              "credits": [
                {
                  "player": { "id": 455117, "link": "/api/v1/people/455117" },
                  "position": {
                    "code": "2",
                    "name": "Catcher",
                    "type": "Catcher",
                    "abbreviation": "C"
                  },
                  "credit": "f_putout"
                }
              ]
            }
          ],
          "playEvents": [
            {
              "details": {
                "call": { "code": "B", "description": "Ball" },
                "description": "Ball",
                "code": "B",
                "ballColor": "rgba(39, 161, 39, 1.0)",
                "trailColor": "rgba(0, 34, 255, 1.0)",
                "isInPlay": false,
                "isStrike": false,
                "isBall": true,
                "type": { "code": "CU", "description": "Curveball" },
                "isOut": false,
                "hasReview": false
              },
              "count": { "balls": 1, "strikes": 0, "outs": 0 },
              "pitchData": {
                "startSpeed": 79.9,
                "endSpeed": 73.7,
                "strikeZoneTop": 3.2054095875305,
                "strikeZoneBottom": 1.5089995353376,
                "coordinates": {
                  "aY": 23.430855352715014,
                  "aZ": -41.98575667970009,
                  "pfxX": 5.693747720365155,
                  "pfxZ": -7.2071633283822605,
                  "pX": 1.0430066136687508,
                  "pZ": 1.6176608142724536,
                  "vX0": 3.4318314896028292,
                  "vY0": -116.3675455503308,
                  "vZ0": -1.3812106105254682,
                  "x": 77.24,
                  "y": 195.1,
                  "x0": -1.1946731548678633,
                  "y0": 50.00549175679275,
                  "z0": 6.224605400708477,
                  "aX": 7.747612808656078
                },
                "breaks": {
                  "breakAngle": 10.8,
                  "breakLength": 13.2,
                  "breakY": 24.0,
                  "spinRate": 2633,
                  "spinDirection": 28
                },
                "zone": 14,
                "typeConfidence": 0.85,
                "plateTime": 0.4721082615946868,
                "extension": 6.2088398173818495
              },
              "index": 0,
              "playId": "25e82de0-5c71-4c3d-9a5b-071204f35624",
              "pitchNumber": 1,
              "startTime": "2022-11-02T02:31:07.049Z",
              "endTime": "2022-11-02T02:31:12.233Z",
              "isPitch": true,
              "type": "pitch"
            },
            {
              "details": {
                "call": { "code": "F", "description": "Foul" },
                "description": "Foul",
                "code": "F",
                "ballColor": "rgba(170, 21, 11, 1.0)",
                "trailColor": "rgba(0, 34, 255, 1.0)",
                "isInPlay": false,
                "isStrike": true,
                "isBall": false,
                "type": { "code": "CU", "description": "Curveball" },
                "isOut": false,
                "hasReview": false
              },
              "count": { "balls": 1, "strikes": 1, "outs": 0 },
              "pitchData": {
                "startSpeed": 79.5,
                "endSpeed": 73.2,
                "strikeZoneTop": 3.28,
                "strikeZoneBottom": 1.56,
                "coordinates": {
                  "aY": 23.51072491305244,
                  "aZ": -41.48216051252821,
                  "pfxX": 6.380252978801095,
                  "pfxZ": -6.926034834738096,
                  "pX": 0.536822215275919,
                  "pZ": 1.7201083689360581,
                  "vX0": 2.9540467342096703,
                  "vY0": -115.73934176024648,
                  "vZ0": -1.2619636468850208,
                  "x": 96.54,
                  "y": 192.34,
                  "x0": -1.5888114485762745,
                  "y0": 50.00377791679302,
                  "z0": 6.278855420235851,
                  "aX": 8.573397097855572
                },
                "breaks": {
                  "breakAngle": 12.0,
                  "breakLength": 13.2,
                  "breakY": 24.0,
                  "spinRate": 2686,
                  "spinDirection": 33
                },
                "zone": 9,
                "typeConfidence": 0.82,
                "plateTime": 0.47496569543666745,
                "extension": 5.830631804544683
              },
              "index": 1,
              "playId": "e99311f1-86d1-4145-9072-be54eaace4db",
              "pitchNumber": 2,
              "startTime": "2022-11-02T02:31:22.400Z",
              "endTime": "2022-11-02T02:31:27.219Z",
              "isPitch": true,
              "type": "pitch"
            },
            {
              "details": {
                "call": { "code": "B", "description": "Ball" },
                "description": "Ball",
                "code": "B",
                "ballColor": "rgba(39, 161, 39, 1.0)",
                "trailColor": "rgba(188, 0, 33, 1.0)",
                "isInPlay": false,
                "isStrike": false,
                "isBall": true,
                "type": { "code": "FF", "description": "Four-Seam Fastball" },
                "isOut": false,
                "hasReview": false
              },
              "count": { "balls": 2, "strikes": 1, "outs": 0 },
              "pitchData": {
                "startSpeed": 93.8,
                "endSpeed": 85.1,
                "strikeZoneTop": 3.30868034043207,
                "strikeZoneBottom": 1.53498200327368,
                "coordinates": {
                  "aY": 32.13059497220577,
                  "aZ": -13.447412541520054,
                  "pfxX": -3.459856386460421,
                  "pfxZ": 9.999546550459243,
                  "pX": 0.3719554571273389,
                  "pZ": 3.911895277587624,
                  "vX0": 4.900520264696721,
                  "vY0": -136.49207381809802,
                  "vZ0": -3.9507090384300945,
                  "x": 102.82,
                  "y": 133.16,
                  "x0": -1.003431338352547,
                  "y0": 50.00408318491298,
                  "z0": 6.314495500960533,
                  "aX": -6.4806715949555045
                },
                "breaks": {
                  "breakAngle": 20.4,
                  "breakLength": 3.6,
                  "breakY": 24.0,
                  "spinRate": 2223,
                  "spinDirection": 203
                },
                "zone": 12,
                "typeConfidence": 0.9,
                "plateTime": 0.40244400589734797,
                "extension": 5.9553000112802925
              },
              "index": 2,
              "playId": "93b8e482-8ed7-4856-a8da-853a8c2fb3c1",
              "pitchNumber": 3,
              "startTime": "2022-11-02T02:31:49.836Z",
              "endTime": "2022-11-02T02:31:53.197Z",
              "isPitch": true,
              "type": "pitch"
            },
            {
              "details": {
                "call": { "code": "C", "description": "Called Strike" },
                "description": "Called Strike",
                "code": "C",
                "ballColor": "rgba(170, 21, 11, 1.0)",
                "trailColor": "rgba(188, 0, 33, 1.0)",
                "isInPlay": false,
                "isStrike": true,
                "isBall": false,
                "type": { "code": "FF", "description": "Four-Seam Fastball" },
                "isOut": false,
                "hasReview": false
              },
              "count": { "balls": 2, "strikes": 2, "outs": 0 },
              "pitchData": {
                "startSpeed": 94.6,
                "endSpeed": 85.9,
                "strikeZoneTop": 3.2054095875305,
                "strikeZoneBottom": 1.5089995353376,
                "coordinates": {
                  "aY": 32.593900634734474,
                  "aZ": -9.497810969380437,
                  "pfxX": -4.683856315938586,
                  "pfxZ": 11.924255663916819,
                  "pX": 0.010154995726494205,
                  "pZ": 2.522725983417724,
                  "vX0": 3.9438968646108465,
                  "vY0": -137.52990993719058,
                  "vZ0": -8.374817706840867,
                  "x": 116.61,
                  "y": 170.67,
                  "x0": -0.8391478896433973,
                  "y0": 50.000585240565236,
                  "z0": 6.264822489639817,
                  "aX": -8.905566299430584
                },
                "breaks": {
                  "breakAngle": 34.8,
                  "breakLength": 2.4,
                  "breakY": 24.0,
                  "spinRate": 2233,
                  "spinDirection": 207
                },
                "zone": 5,
                "typeConfidence": 0.91,
                "plateTime": 0.3993866407969153,
                "extension": 6.110145735958937
              },
              "index": 3,
              "playId": "3765d962-2b7b-43ba-9a59-d79545135b5e",
              "pitchNumber": 4,
              "startTime": "2022-11-02T02:32:08.137Z",
              "endTime": "2022-11-02T02:32:11.483Z",
              "isPitch": true,
              "type": "pitch"
            },
            {
              "details": {
                "call": { "code": "B", "description": "Ball" },
                "description": "Ball",
                "code": "B",
                "ballColor": "rgba(39, 161, 39, 1.0)",
                "trailColor": "rgba(0, 34, 255, 1.0)",
                "isInPlay": false,
                "isStrike": false,
                "isBall": true,
                "type": { "code": "CU", "description": "Curveball" },
                "isOut": false,
                "hasReview": false
              },
              "count": { "balls": 3, "strikes": 2, "outs": 0 },
              "pitchData": {
                "startSpeed": 80.7,
                "endSpeed": 73.8,
                "strikeZoneTop": 3.10207884367867,
                "strikeZoneBottom": 1.45702727712014,
                "coordinates": {
                  "aY": 26.537202561808083,
                  "aZ": -44.05641778379146,
                  "pfxX": 4.132718653608537,
                  "pfxZ": -8.717157185008897,
                  "pX": 0.8961587106031484,
                  "pZ": 0.5607722335026022,
                  "vX0": 4.07704368791167,
                  "vY0": -117.29327047455786,
                  "vZ0": -3.0247337995380326,
                  "x": 82.84,
                  "y": 223.64,
                  "x0": -1.4150239874526322,
                  "y0": 50.00064301809681,
                  "z0": 6.06003905408933,
                  "aX": 5.63535520705918
                },
                "breaks": {
                  "breakAngle": 8.4,
                  "breakLength": 13.2,
                  "breakY": 24.0,
                  "spinRate": 2720,
                  "spinDirection": 33
                },
                "zone": 14,
                "typeConfidence": 0.9,
                "plateTime": 0.4707901769509464,
                "extension": 6.021125913195346
              },
              "index": 4,
              "playId": "4ed06fc3-38c0-4e25-b7c3-331cce7301fa",
              "pitchNumber": 5,
              "startTime": "2022-11-02T02:32:31.296Z",
              "endTime": "2022-11-02T02:32:34.296Z",
              "isPitch": true,
              "type": "pitch"
            },
            {
              "details": {
                "call": { "code": "F", "description": "Foul" },
                "description": "Foul",
                "code": "F",
                "ballColor": "rgba(170, 21, 11, 1.0)",
                "trailColor": "rgba(188, 0, 33, 1.0)",
                "isInPlay": false,
                "isStrike": true,
                "isBall": false,
                "type": { "code": "FF", "description": "Four-Seam Fastball" },
                "isOut": false,
                "hasReview": false
              },
              "count": { "balls": 3, "strikes": 2, "outs": 0 },
              "pitchData": {
                "startSpeed": 94.7,
                "endSpeed": 86.0,
                "strikeZoneTop": 3.28,
                "strikeZoneBottom": 1.56,
                "coordinates": {
                  "aY": 32.54328675431435,
                  "aZ": -7.061295966453482,
                  "pfxX": -6.261874779542371,
                  "pfxZ": 13.19306715977616,
                  "pX": 0.014857633257539063,
                  "pZ": 2.2649688063971563,
                  "vX0": 4.317154419024878,
                  "vY0": -137.58609489216693,
                  "vZ0": -9.446367806958188,
                  "x": 116.43,
                  "y": 177.63,
                  "x0": -0.7666736186640104,
                  "y0": 50.004622719979984,
                  "z0": 6.234604103017878,
                  "aX": -11.921533133839219
                },
                "breaks": {
                  "breakAngle": 49.2,
                  "breakLength": 3.6,
                  "breakY": 24.0,
                  "spinRate": 2279,
                  "spinDirection": 200
                },
                "zone": 5,
                "typeConfidence": 0.91,
                "plateTime": 0.39917185266592314,
                "extension": 6.0230938969003835
              },
              "index": 5,
              "playId": "f287b96b-4613-4837-91fe-afbb29d2e884",
              "pitchNumber": 6,
              "startTime": "2022-11-02T02:32:59.080Z",
              "endTime": "2022-11-02T02:33:02.080Z",
              "isPitch": true,
              "type": "pitch"
            },
            {
              "details": {
                "call": { "code": "F", "description": "Foul" },
                "description": "Foul",
                "code": "F",
                "ballColor": "rgba(170, 21, 11, 1.0)",
                "trailColor": "rgba(0, 0, 254, 1.0)",
                "isInPlay": false,
                "isStrike": true,
                "isBall": false,
                "type": { "code": "SL", "description": "Slider" },
                "isOut": false,
                "hasReview": false
              },
              "count": { "balls": 3, "strikes": 2, "outs": 0 },
              "pitchData": {
                "startSpeed": 79.7,
                "endSpeed": 73.5,
                "strikeZoneTop": 3.28,
                "strikeZoneBottom": 1.56,
                "coordinates": {
                  "aY": 22.149390810659128,
                  "aZ": -30.66233416227515,
                  "pfxX": 8.319176006999559,
                  "pfxZ": 1.1096638930097313,
                  "pX": 0.5272098320023464,
                  "pZ": 2.1287301163619015,
                  "vX0": 3.051410144172284,
                  "vY0": -116.00607341206577,
                  "vZ0": -2.0715315247179147,
                  "x": 96.9,
                  "y": 181.3,
                  "x0": -1.886707865870954,
                  "y0": 50.00153261079941,
                  "z0": 5.962395342914951,
                  "aX": 11.311790072591686
                },
                "breaks": {
                  "breakAngle": 20.4,
                  "breakLength": 9.6,
                  "breakY": 24.0,
                  "spinRate": 2519,
                  "spinDirection": 46
                },
                "zone": 6,
                "typeConfidence": 0.91,
                "plateTime": 0.4725520529404741,
                "extension": 5.96017547127977
              },
              "index": 6,
              "playId": "575e3218-c909-4399-8e38-c7f10703d9ee",
              "pitchNumber": 7,
              "startTime": "2022-11-02T02:33:31.236Z",
              "endTime": "2022-11-02T02:33:36.668Z",
              "isPitch": true,
              "type": "pitch"
            },
            {
              "details": {
                "call": { "code": "S", "description": "Swinging Strike" },
                "description": "Swinging Strike",
                "code": "S",
                "ballColor": "rgba(170, 21, 11, 1.0)",
                "trailColor": "rgba(0, 85, 254, 1.0)",
                "isInPlay": false,
                "isStrike": true,
                "isBall": false,
                "type": { "code": "CH", "description": "Changeup" },
                "isOut": true,
                "hasReview": false
              },
              "count": { "balls": 3, "strikes": 3, "outs": 0 },
              "pitchData": {
                "startSpeed": 87.0,
                "endSpeed": 79.4,
                "strikeZoneTop": 3.28,
                "strikeZoneBottom": 1.56,
                "coordinates": {
                  "aY": 26.782006653587796,
                  "aZ": -21.887964314913813,
                  "pfxX": -9.402840995660016,
                  "pfxZ": 6.371131677181836,
                  "pX": -0.3787378648523858,
                  "pZ": 2.648958483208301,
                  "vX0": 5.409556418778804,
                  "vY0": -126.50272282087884,
                  "vZ0": -3.8559900110684584,
                  "x": 131.44,
                  "y": 167.26,
                  "x0": -1.327728190466365,
                  "y0": 50.00266610287186,
                  "z0": 5.95623148243251,
                  "aX": -15.177702596765787
                },
                "breaks": {
                  "breakAngle": 32.4,
                  "breakLength": 7.2,
                  "breakY": 24.0,
                  "spinRate": 1872,
                  "spinDirection": 232
                },
                "zone": 4,
                "typeConfidence": 0.9,
                "plateTime": 0.43366102822435737,
                "extension": 6.164519801186866
              },
              "index": 7,
              "playId": "af3ad1a9-2170-438a-8ad6-143e5833d6fc",
              "pitchNumber": 8,
              "startTime": "2022-11-02T02:33:58.849Z",
              "endTime": "2022-11-02T02:34:03.891Z",
              "isPitch": true,
              "type": "pitch"
            }
          ],
          "playEndTime": "2022-11-02T02:34:03.891Z",
          "atBatIndex": 54
        },
        {
          "result": {
            "type": "atBat",
            "event": "Flyout",
            "eventType": "field_out",
            "description": "Rhys Hoskins flies out sharply to center fielder Chas McCormick.",
            "rbi": 0,
            "awayScore": 0,
            "homeScore": 7,
            "isOut": true
          },
          "about": {
            "atBatIndex": 55,
            "halfInning": "bottom",
            "isTopInning": false,
            "inning": 7,
            "startTime": "2022-11-02T02:34:11.430Z",
            "endTime": "2022-11-02T02:35:04.797Z",
            "isComplete": true,
            "isScoringPlay": false,
            "hasReview": false,
            "hasOut": true,
            "captivatingIndex": 0
          },
          "count": { "balls": 0, "strikes": 1, "outs": 2 },
          "matchup": {
            "batter": {
              "id": 656555,
              "fullName": "Rhys Hoskins",
              "link": "/api/v1/people/656555"
            },
            "batSide": { "code": "R", "description": "Right" },
            "pitcher": {
              "id": 664353,
              "fullName": "Jose Urquidy",
              "link": "/api/v1/people/664353"
            },
            "pitchHand": { "code": "R", "description": "Right" },
            "batterHotColdZones": [],
            "pitcherHotColdZones": [],
            "splits": {
              "batter": "vs_RHP",
              "pitcher": "vs_RHB",
              "menOnBase": "Empty"
            }
          },
          "pitchIndex": [0, 1],
          "actionIndex": [],
          "runnerIndex": [0],
          "runners": [
            {
              "movement": {
                "originBase": null,
                "start": null,
                "end": null,
                "outBase": "1B",
                "isOut": true,
                "outNumber": 2
              },
              "details": {
                "event": "Flyout",
                "eventType": "field_out",
                "movementReason": null,
                "runner": {
                  "id": 656555,
                  "fullName": "Rhys Hoskins",
                  "link": "/api/v1/people/656555"
                },
                "responsiblePitcher": null,
                "isScoringEvent": false,
                "rbi": false,
                "earned": false,
                "teamUnearned": false,
                "playIndex": 1
              },
              "credits": [
                {
                  "player": { "id": 676801, "link": "/api/v1/people/676801" },
                  "position": {
                    "code": "8",
                    "name": "Outfielder",
                    "type": "Outfielder",
                    "abbreviation": "CF"
                  },
                  "credit": "f_putout"
                }
              ]
            }
          ],
          "playEvents": [
            {
              "details": {
                "call": { "code": "C", "description": "Called Strike" },
                "description": "Called Strike",
                "code": "C",
                "ballColor": "rgba(170, 21, 11, 1.0)",
                "trailColor": "rgba(0, 0, 254, 1.0)",
                "isInPlay": false,
                "isStrike": true,
                "isBall": false,
                "type": { "code": "SL", "description": "Slider" },
                "isOut": false,
                "hasReview": false
              },
              "count": { "balls": 0, "strikes": 1, "outs": 1 },
              "pitchData": {
                "startSpeed": 79.9,
                "endSpeed": 73.2,
                "strikeZoneTop": 3.56658448291191,
                "strikeZoneBottom": 1.61291444699205,
                "coordinates": {
                  "aY": 23.39815772765196,
                  "aZ": -32.96548685653432,
                  "pfxX": 7.138786840571212,
                  "pfxZ": -0.5769057221718494,
                  "pX": 0.7410136650178004,
                  "pZ": 2.937464310389873,
                  "vX0": 3.5935900209404323,
                  "vY0": -116.3596975050981,
                  "vZ0": 0.36020733057412646,
                  "x": 88.75,
                  "y": 159.47,
                  "x0": -1.754878353973476,
                  "y0": 50.005012067074446,
                  "z0": 5.9235232316858335,
                  "aX": 9.715580723384114
                },
                "breaks": {
                  "breakAngle": 18.0,
                  "breakLength": 10.8,
                  "breakY": 24.0,
                  "spinRate": 2472,
                  "spinDirection": 48
                },
                "zone": 6,
                "typeConfidence": 0.9,
                "plateTime": 0.4720933779969121,
                "extension": 5.868510324629468
              },
              "index": 0,
              "playId": "e4aa01a8-84d7-4847-a4bd-4e29865f8960",
              "pitchNumber": 1,
              "startTime": "2022-11-02T02:34:40.852Z",
              "endTime": "2022-11-02T02:34:46.584Z",
              "isPitch": true,
              "type": "pitch"
            },
            {
              "details": {
                "call": { "code": "X", "description": "In play, out(s)" },
                "description": "In play, out(s)",
                "code": "X",
                "ballColor": "rgba(26, 86, 190, 1.0)",
                "trailColor": "rgba(188, 0, 33, 1.0)",
                "isInPlay": true,
                "isStrike": false,
                "isBall": false,
                "type": { "code": "FF", "description": "Four-Seam Fastball" },
                "isOut": true,
                "hasReview": false
              },
              "count": { "balls": 0, "strikes": 1, "outs": 1 },
              "pitchData": {
                "startSpeed": 92.5,
                "endSpeed": 84.2,
                "strikeZoneTop": 3.63,
                "strikeZoneBottom": 1.71,
                "coordinates": {
                  "aY": 30.466362423196767,
                  "aZ": -11.021547454055618,
                  "pfxX": -4.2725735654910295,
                  "pfxZ": 11.594581224284486,
                  "pX": -0.1645478651145334,
                  "pZ": 2.9467757439346602,
                  "vX0": 3.3633185271769777,
                  "vY0": -134.52417227322482,
                  "vZ0": -6.812123884347077,
                  "x": 123.27,
                  "y": 159.22,
                  "x0": -0.8788269362764534,
                  "y0": 50.00264163059147,
                  "z0": 6.301384417606579,
                  "aX": -7.793996271637779
                },
                "breaks": {
                  "breakAngle": 28.8,
                  "breakLength": 3.6,
                  "breakY": 24.0,
                  "spinRate": 2089,
                  "spinDirection": 206
                },
                "zone": 5,
                "typeConfidence": 0.9,
                "plateTime": 0.4078989242204334,
                "extension": 5.944073394533321
              },
              "hitData": {
                "launchSpeed": 101.1,
                "launchAngle": 40.0,
                "totalDistance": 362.0,
                "trajectory": "fly_ball",
                "hardness": "hard",
                "location": "8",
                "coordinates": { "coordX": 150.87, "coordY": 55.31 }
              },
              "index": 1,
              "playId": "4b40a3e8-5448-4ea6-a333-2f84a09dea52",
              "pitchNumber": 2,
              "startTime": "2022-11-02T02:34:55.224Z",
              "endTime": "2022-11-02T02:35:04.797Z",
              "isPitch": true,
              "type": "pitch"
            }
          ],
          "playEndTime": "2022-11-02T02:35:04.797Z",
          "atBatIndex": 55
        },
        {
          "result": {
            "type": "atBat",
            "event": "Strikeout",
            "eventType": "strikeout",
            "description": "J.T. Realmuto strikes out swinging.",
            "rbi": 0,
            "awayScore": 0,
            "homeScore": 7,
            "isOut": true
          },
          "about": {
            "atBatIndex": 56,
            "halfInning": "bottom",
            "isTopInning": false,
            "inning": 7,
            "startTime": "2022-11-02T02:35:12.579Z",
            "endTime": "2022-11-02T02:36:39.745Z",
            "isComplete": true,
            "isScoringPlay": false,
            "hasReview": false,
            "hasOut": true,
            "captivatingIndex": 14
          },
          "count": { "balls": 0, "strikes": 3, "outs": 3 },
          "matchup": {
            "batter": {
              "id": 592663,
              "fullName": "J.T. Realmuto",
              "link": "/api/v1/people/592663"
            },
            "batSide": { "code": "R", "description": "Right" },
            "pitcher": {
              "id": 664353,
              "fullName": "Jose Urquidy",
              "link": "/api/v1/people/664353"
            },
            "pitchHand": { "code": "R", "description": "Right" },
            "batterHotColdZones": [],
            "pitcherHotColdZones": [],
            "splits": {
              "batter": "vs_RHP",
              "pitcher": "vs_RHB",
              "menOnBase": "Empty"
            }
          },
          "pitchIndex": [0, 1, 2],
          "actionIndex": [],
          "runnerIndex": [0],
          "runners": [
            {
              "movement": {
                "originBase": null,
                "start": null,
                "end": null,
                "outBase": "1B",
                "isOut": true,
                "outNumber": 3
              },
              "details": {
                "event": "Strikeout",
                "eventType": "strikeout",
                "movementReason": null,
                "runner": {
                  "id": 592663,
                  "fullName": "J.T. Realmuto",
                  "link": "/api/v1/people/592663"
                },
                "responsiblePitcher": null,
                "isScoringEvent": false,
                "rbi": false,
                "earned": false,
                "teamUnearned": false,
                "playIndex": 2
              },
              "credits": [
                {
                  "player": { "id": 455117, "link": "/api/v1/people/455117" },
                  "position": {
                    "code": "2",
                    "name": "Catcher",
                    "type": "Catcher",
                    "abbreviation": "C"
                  },
                  "credit": "f_putout"
                }
              ]
            }
          ],
          "playEvents": [
            {
              "details": {
                "call": { "code": "F", "description": "Foul" },
                "description": "Foul",
                "code": "F",
                "ballColor": "rgba(170, 21, 11, 1.0)",
                "trailColor": "rgba(0, 34, 255, 1.0)",
                "isInPlay": false,
                "isStrike": true,
                "isBall": false,
                "type": { "code": "CU", "description": "Curveball" },
                "isOut": false,
                "hasReview": false
              },
              "count": { "balls": 0, "strikes": 1, "outs": 2 },
              "pitchData": {
                "startSpeed": 77.2,
                "endSpeed": 70.8,
                "strikeZoneTop": 3.63,
                "strikeZoneBottom": 1.69,
                "coordinates": {
                  "aY": 22.193556022368345,
                  "aZ": -42.177046537296256,
                  "pfxX": 2.799703001007959,
                  "pfxZ": -7.901579364523977,
                  "pX": -0.08555233676664711,
                  "pZ": 2.6734582615999063,
                  "vX0": 2.2481326572710447,
                  "vY0": -112.34067723686172,
                  "vZ0": 1.3713047142171473,
                  "x": 120.26,
                  "y": 166.6,
                  "x0": -1.466493988753083,
                  "y0": 50.002692241263354,
                  "z0": 6.374585811620466,
                  "aX": 3.543824493820303
                },
                "breaks": {
                  "breakAngle": 4.8,
                  "breakLength": 13.2,
                  "breakY": 24.0,
                  "spinRate": 2559,
                  "spinDirection": 26
                },
                "zone": 5,
                "typeConfidence": 0.9,
                "plateTime": 0.4893810328485917,
                "extension": 5.9106183904639416
              },
              "index": 0,
              "playId": "7a7c7c14-d9f2-4b7e-8518-4459afb82013",
              "pitchNumber": 1,
              "startTime": "2022-11-02T02:35:42.885Z",
              "endTime": "2022-11-02T02:35:46.061Z",
              "isPitch": true,
              "type": "pitch"
            },
            {
              "details": {
                "call": { "code": "F", "description": "Foul" },
                "description": "Foul",
                "code": "F",
                "ballColor": "rgba(170, 21, 11, 1.0)",
                "trailColor": "rgba(188, 0, 33, 1.0)",
                "isInPlay": false,
                "isStrike": true,
                "isBall": false,
                "type": { "code": "FF", "description": "Four-Seam Fastball" },
                "isOut": false,
                "hasReview": false
              },
              "count": { "balls": 0, "strikes": 2, "outs": 2 },
              "pitchData": {
                "startSpeed": 93.9,
                "endSpeed": 85.6,
                "strikeZoneTop": 3.63,
                "strikeZoneBottom": 1.69,
                "coordinates": {
                  "aY": 30.982519164439427,
                  "aZ": -9.43299084663512,
                  "pfxX": -4.256978226977054,
                  "pfxZ": 12.0766603504969,
                  "pX": -0.22965311367780206,
                  "pZ": 3.042440682254462,
                  "vX0": 3.1895379998245144,
                  "vY0": -136.57474594371524,
                  "vZ0": -6.962546474232456,
                  "x": 125.75,
                  "y": 156.63,
                  "x0": -0.8614441303702777,
                  "y0": 50.00307502080529,
                  "z0": 6.278840100124333,
                  "aX": -8.016220138599333
                },
                "breaks": {
                  "breakAngle": 33.6,
                  "breakLength": 2.4,
                  "breakY": 24.0,
                  "spinRate": 2247,
                  "spinDirection": 198
                },
                "zone": 2,
                "typeConfidence": 0.91,
                "plateTime": 0.4015504567730668,
                "extension": 6.072029799828835
              },
              "index": 1,
              "playId": "9945b6ad-8e0a-40ce-8f41-bbf937ddc097",
              "pitchNumber": 2,
              "startTime": "2022-11-02T02:36:05.990Z",
              "endTime": "2022-11-02T02:36:10.121Z",
              "isPitch": true,
              "type": "pitch"
            },
            {
              "details": {
                "call": { "code": "S", "description": "Swinging Strike" },
                "description": "Swinging Strike",
                "code": "S",
                "ballColor": "rgba(170, 21, 11, 1.0)",
                "trailColor": "rgba(0, 85, 254, 1.0)",
                "isInPlay": false,
                "isStrike": true,
                "isBall": false,
                "type": { "code": "CH", "description": "Changeup" },
                "isOut": true,
                "hasReview": false
              },
              "count": { "balls": 0, "strikes": 3, "outs": 2 },
              "pitchData": {
                "startSpeed": 87.6,
                "endSpeed": 80.2,
                "strikeZoneTop": 3.63,
                "strikeZoneBottom": 1.69,
                "coordinates": {
                  "aY": 26.718041535680936,
                  "aZ": -21.676624056161604,
                  "pfxX": -10.058393092731164,
                  "pfxZ": 6.413664488337699,
                  "pX": -0.31648201961195305,
                  "pZ": 1.582834162518487,
                  "vX0": 5.587201721836339,
                  "vY0": -127.26996974231335,
                  "vZ0": -6.590905544163693,
                  "x": 129.06,
                  "y": 196.04,
                  "x0": -1.2362760900087812,
                  "y0": 50.002428431081924,
                  "z0": 5.929100027600027,
                  "aX": -16.45955358598057
                },
                "breaks": {
                  "breakAngle": 33.6,
                  "breakLength": 7.2,
                  "breakY": 24.0,
                  "spinRate": 2025,
                  "spinDirection": 236
                },
                "zone": 7,
                "typeConfidence": 0.9,
                "plateTime": 0.4307716230255374,
                "extension": 6.1654983183285506
              },
              "index": 2,
              "playId": "898c7902-5485-43c3-be72-0c6911ba11bb",
              "pitchNumber": 3,
              "startTime": "2022-11-02T02:36:35.055Z",
              "endTime": "2022-11-02T02:36:39.745Z",
              "isPitch": true,
              "type": "pitch"
            }
          ],
          "playEndTime": "2022-11-02T02:36:39.745Z",
          "atBatIndex": 56
        },
        {
          "result": {
            "type": "atBat",
            "event": "Groundout",
            "eventType": "field_out",
            "description": "Jose Altuve grounds out, shortstop Bryson Stott to first baseman Rhys Hoskins.",
            "rbi": 0,
            "awayScore": 0,
            "homeScore": 7,
            "isOut": true
          },
          "about": {
            "atBatIndex": 57,
            "halfInning": "top",
            "isTopInning": true,
            "inning": 8,
            "startTime": "2022-11-02T02:40:20.237Z",
            "endTime": "2022-11-02T02:42:24.987Z",
            "isComplete": true,
            "isScoringPlay": false,
            "hasReview": false,
            "hasOut": true,
            "captivatingIndex": 0
          },
          "count": { "balls": 2, "strikes": 2, "outs": 1 },
          "matchup": {
            "batter": {
              "id": 514888,
              "fullName": "Jose Altuve",
              "link": "/api/v1/people/514888"
            },
            "batSide": { "code": "R", "description": "Right" },
            "pitcher": {
              "id": 656793,
              "fullName": "Nick Nelson",
              "link": "/api/v1/people/656793"
            },
            "pitchHand": { "code": "R", "description": "Right" },
            "batterHotColdZones": [],
            "pitcherHotColdZones": [],
            "splits": {
              "batter": "vs_RHP",
              "pitcher": "vs_RHB",
              "menOnBase": "Empty"
            }
          },
          "pitchIndex": [1, 2, 3, 4, 5, 6],
          "actionIndex": [0],
          "runnerIndex": [0],
          "runners": [
            {
              "movement": {
                "originBase": null,
                "start": null,
                "end": null,
                "outBase": "1B",
                "isOut": true,
                "outNumber": 1
              },
              "details": {
                "event": "Groundout",
                "eventType": "field_out",
                "movementReason": null,
                "runner": {
                  "id": 514888,
                  "fullName": "Jose Altuve",
                  "link": "/api/v1/people/514888"
                },
                "responsiblePitcher": null,
                "isScoringEvent": false,
                "rbi": false,
                "earned": false,
                "teamUnearned": false,
                "playIndex": 6
              },
              "credits": [
                {
                  "player": { "id": 681082, "link": "/api/v1/people/681082" },
                  "position": {
                    "code": "6",
                    "name": "Shortstop",
                    "type": "Infielder",
                    "abbreviation": "SS"
                  },
                  "credit": "f_assist"
                },
                {
                  "player": { "id": 656555, "link": "/api/v1/people/656555" },
                  "position": {
                    "code": "3",
                    "name": "First Base",
                    "type": "Infielder",
                    "abbreviation": "1B"
                  },
                  "credit": "f_putout"
                }
              ]
            }
          ],
          "playEvents": [
            {
              "details": {
                "description": "Pitching Change: Nick Nelson replaces Kyle Gibson.",
                "event": "Pitching Substitution",
                "eventType": "pitching_substitution",
                "awayScore": 0,
                "homeScore": 7,
                "isScoringPlay": false,
                "isOut": false,
                "hasReview": false
              },
              "count": { "balls": 0, "strikes": 0, "outs": 0 },
              "index": 0,
              "startTime": "2022-11-02T02:37:46.671Z",
              "endTime": "2022-11-02T02:40:22.430Z",
              "isPitch": false,
              "isSubstitution": true,
              "type": "action",
              "player": { "id": 656793, "link": "/api/v1/people/656793" },
              "position": {
                "code": "1",
                "name": "Pitcher",
                "type": "Pitcher",
                "abbreviation": "P"
              }
            },
            {
              "details": {
                "call": { "code": "B", "description": "Ball" },
                "description": "Ball",
                "code": "B",
                "ballColor": "rgba(39, 161, 39, 1.0)",
                "trailColor": "rgba(0, 0, 254, 1.0)",
                "isInPlay": false,
                "isStrike": false,
                "isBall": true,
                "type": { "code": "SL", "description": "Slider" },
                "isOut": false,
                "hasReview": false
              },
              "count": { "balls": 1, "strikes": 0, "outs": 0 },
              "pitchData": {
                "startSpeed": 89.3,
                "endSpeed": 83.0,
                "strikeZoneTop": 2.81773981889342,
                "strikeZoneBottom": 1.24913467166502,
                "coordinates": {
                  "aY": 24.707813853316996,
                  "aZ": -31.53380739138229,
                  "pfxX": 0.284836532319225,
                  "pfxZ": 0.3711531857197068,
                  "pX": 0.9995956159012661,
                  "pZ": 1.7857416163749082,
                  "vX0": 8.515806532460166,
                  "vY0": -129.89666278673775,
                  "vZ0": -3.972540493461274,
                  "x": 78.9,
                  "y": 190.56,
                  "x0": -2.3448607480699013,
                  "y0": 50.00369771038281,
                  "z0": 5.706778348859544,
                  "aX": 0.48992901977811953
                },
                "breaks": {
                  "breakAngle": 3.6,
                  "breakLength": 7.2,
                  "breakY": 24.0,
                  "spinRate": 2475,
                  "spinDirection": 131
                },
                "zone": 14,
                "typeConfidence": 0.91,
                "plateTime": 0.42009638301628893,
                "extension": 6.259454194583212
              },
              "index": 1,
              "playId": "453a3720-ef63-480f-bc6f-4698d10f58f1",
              "pitchNumber": 1,
              "startTime": "2022-11-02T02:40:22.430Z",
              "endTime": "2022-11-02T02:40:26.358Z",
              "isPitch": true,
              "type": "pitch"
            },
            {
              "details": {
                "call": { "code": "F", "description": "Foul" },
                "description": "Foul",
                "code": "F",
                "ballColor": "rgba(170, 21, 11, 1.0)",
                "trailColor": "rgba(0, 0, 254, 1.0)",
                "isInPlay": false,
                "isStrike": true,
                "isBall": false,
                "type": { "code": "SL", "description": "Slider" },
                "isOut": false,
                "hasReview": false
              },
              "count": { "balls": 1, "strikes": 1, "outs": 0 },
              "pitchData": {
                "startSpeed": 91.0,
                "endSpeed": 84.5,
                "strikeZoneTop": 2.84,
                "strikeZoneBottom": 1.3,
                "coordinates": {
                  "aY": 25.98416394354675,
                  "aZ": -28.05734255696961,
                  "pfxX": 0.9819391881565429,
                  "pfxZ": 2.3025865343524092,
                  "pX": 0.5533234140613098,
                  "pZ": 1.2684500816429414,
                  "vX0": 7.361231054789526,
                  "vY0": -132.37160228520094,
                  "vZ0": -6.0469073326810605,
                  "x": 95.91,
                  "y": 204.53,
                  "x0": -2.381464867674264,
                  "y0": 50.00428803987053,
                  "z0": 5.613788373038473,
                  "aX": 1.7579343768196838
                },
                "breaks": {
                  "breakAngle": 6.0,
                  "breakLength": 7.2,
                  "breakY": 24.0,
                  "spinRate": 2435,
                  "spinDirection": 194
                },
                "zone": 9,
                "typeConfidence": 0.9,
                "plateTime": 0.41242239024389304,
                "extension": 6.24368595068167
              },
              "index": 2,
              "playId": "0db243dc-492a-4f6f-af07-1f1d55702ca5",
              "pitchNumber": 2,
              "startTime": "2022-11-02T02:40:40.079Z",
              "endTime": "2022-11-02T02:40:43.581Z",
              "isPitch": true,
              "type": "pitch"
            },
            {
              "details": {
                "call": { "code": "B", "description": "Ball" },
                "description": "Ball",
                "code": "B",
                "ballColor": "rgba(39, 161, 39, 1.0)",
                "trailColor": "rgba(188, 0, 33, 1.0)",
                "isInPlay": false,
                "isStrike": false,
                "isBall": true,
                "type": { "code": "FF", "description": "Four-Seam Fastball" },
                "isOut": false,
                "hasReview": false
              },
              "count": { "balls": 2, "strikes": 1, "outs": 0 },
              "pitchData": {
                "startSpeed": 97.2,
                "endSpeed": 89.4,
                "strikeZoneTop": 2.96002406488861,
                "strikeZoneBottom": 1.31414643477185,
                "coordinates": {
                  "aY": 30.188887733895456,
                  "aZ": -13.291937241949862,
                  "pfxX": -5.31938825419771,
                  "pfxZ": 9.33097009936586,
                  "pX": 0.8118426534257454,
                  "pZ": 1.039252524984266,
                  "vX0": 10.330274946317406,
                  "vY0": -140.93411518838664,
                  "vZ0": -10.13709773325492,
                  "x": 86.05,
                  "y": 210.72,
                  "x0": -2.199951118373077,
                  "y0": 50.00668600130915,
                  "z0": 5.52793003147482,
                  "aX": -10.769389690364925
                },
                "breaks": {
                  "breakAngle": 28.8,
                  "breakLength": 3.6,
                  "breakY": 24.0,
                  "spinRate": 2010,
                  "spinDirection": 206
                },
                "zone": 14,
                "typeConfidence": 0.9,
                "plateTime": 0.38774020894806416,
                "extension": 6.291877195778774
              },
              "index": 3,
              "playId": "1c5dcd0c-4fef-4530-a534-f535e50b661a",
              "pitchNumber": 3,
              "startTime": "2022-11-02T02:41:04.289Z",
              "endTime": "2022-11-02T02:41:08.307Z",
              "isPitch": true,
              "type": "pitch"
            },
            {
              "details": {
                "call": { "code": "C", "description": "Called Strike" },
                "description": "Called Strike",
                "code": "C",
                "ballColor": "rgba(170, 21, 11, 1.0)",
                "trailColor": "rgba(188, 0, 33, 1.0)",
                "isInPlay": false,
                "isStrike": true,
                "isBall": false,
                "type": { "code": "FF", "description": "Four-Seam Fastball" },
                "isOut": false,
                "hasReview": false
              },
              "count": { "balls": 2, "strikes": 2, "outs": 0 },
              "pitchData": {
                "startSpeed": 97.3,
                "endSpeed": 89.4,
                "strikeZoneTop": 2.90829642140808,
                "strikeZoneBottom": 1.2621381303348,
                "coordinates": {
                  "aY": 30.534554498721064,
                  "aZ": -14.117947504818153,
                  "pfxX": -5.120331608184467,
                  "pfxZ": 8.864158958599823,
                  "pX": 0.3584825543208985,
                  "pZ": 2.88203670384602,
                  "vX0": 9.058854346482992,
                  "vY0": -141.42964734625647,
                  "vZ0": -5.46216458720137,
                  "x": 103.34,
                  "y": 160.97,
                  "x0": -2.2125986699703244,
                  "y0": 50.006321136492986,
                  "z0": 5.735122613881798,
                  "aX": -10.434822652469652
                },
                "breaks": {
                  "breakAngle": 28.8,
                  "breakLength": 3.6,
                  "breakY": 24.0,
                  "spinRate": 2099,
                  "spinDirection": 202
                },
                "zone": 3,
                "typeConfidence": 0.91,
                "plateTime": 0.3864483659675786,
                "extension": 6.307658056718934
              },
              "index": 4,
              "playId": "d3623240-c235-4720-9aa0-f4839e54002d",
              "pitchNumber": 4,
              "startTime": "2022-11-02T02:41:24.696Z",
              "endTime": "2022-11-02T02:41:27.867Z",
              "isPitch": true,
              "type": "pitch"
            },
            {
              "details": {
                "call": { "code": "F", "description": "Foul" },
                "description": "Foul",
                "code": "F",
                "ballColor": "rgba(170, 21, 11, 1.0)",
                "trailColor": "rgba(0, 0, 254, 1.0)",
                "isInPlay": false,
                "isStrike": true,
                "isBall": false,
                "type": { "code": "SL", "description": "Slider" },
                "isOut": false,
                "hasReview": false
              },
              "count": { "balls": 2, "strikes": 2, "outs": 0 },
              "pitchData": {
                "startSpeed": 89.5,
                "endSpeed": 82.6,
                "strikeZoneTop": 2.84,
                "strikeZoneBottom": 1.3,
                "coordinates": {
                  "aY": 27.096701054921233,
                  "aZ": -31.124093524464605,
                  "pfxX": 1.0572267737284844,
                  "pfxZ": 0.6160237502054917,
                  "pX": 0.49727591474366484,
                  "pZ": 1.3839550114298431,
                  "vX0": 6.7537576971947075,
                  "vY0": -130.19763963500432,
                  "vZ0": -4.98878107215387,
                  "x": 98.05,
                  "y": 201.41,
                  "x0": -2.266910714209687,
                  "y0": 50.0058960238112,
                  "z0": 5.677730282076198,
                  "aX": 1.817599870061778
                },
                "breaks": {
                  "breakAngle": 6.0,
                  "breakLength": 7.2,
                  "breakY": 24.0,
                  "spinRate": 2404,
                  "spinDirection": 84
                },
                "zone": 9,
                "typeConfidence": 0.9,
                "plateTime": 0.420531157336026,
                "extension": 6.236158761174279
              },
              "index": 5,
              "playId": "62dd2067-ee7d-4b9b-99a6-146d8ee7bfe1",
              "pitchNumber": 5,
              "startTime": "2022-11-02T02:41:46.620Z",
              "endTime": "2022-11-02T02:41:49.954Z",
              "isPitch": true,
              "type": "pitch"
            },
            {
              "details": {
                "call": { "code": "X", "description": "In play, out(s)" },
                "description": "In play, out(s)",
                "code": "X",
                "ballColor": "rgba(26, 86, 190, 1.0)",
                "trailColor": "rgba(0, 0, 254, 1.0)",
                "isInPlay": true,
                "isStrike": false,
                "isBall": false,
                "type": { "code": "SL", "description": "Slider" },
                "isOut": true,
                "hasReview": false
              },
              "count": { "balls": 2, "strikes": 2, "outs": 0 },
              "pitchData": {
                "startSpeed": 90.7,
                "endSpeed": 83.5,
                "strikeZoneTop": 2.84,
                "strikeZoneBottom": 1.3,
                "coordinates": {
                  "aY": 27.446957441932287,
                  "aZ": -28.519472041579323,
                  "pfxX": 0.8499310893717393,
                  "pfxZ": 2.0711492968678495,
                  "pX": 0.375637889748857,
                  "pZ": 1.9826839761660475,
                  "vX0": 6.727522262338353,
                  "vY0": -131.9183288918856,
                  "vZ0": -4.102017766482461,
                  "x": 102.68,
                  "y": 185.25,
                  "x0": -2.315681136680586,
                  "y0": 50.00442667949259,
                  "z0": 5.654522486200538,
                  "aX": 1.5016479584172167
                },
                "breaks": {
                  "breakAngle": 6.0,
                  "breakLength": 7.2,
                  "breakY": 24.0,
                  "spinRate": 2408,
                  "spinDirection": 145
                },
                "zone": 6,
                "typeConfidence": 0.9,
                "plateTime": 0.41482435103163606,
                "extension": 6.19846163453844
              },
              "hitData": {
                "launchSpeed": 82.8,
                "launchAngle": -11.0,
                "totalDistance": 11.0,
                "trajectory": "ground_ball",
                "hardness": "medium",
                "location": "6",
                "coordinates": { "coordX": 118.05, "coordY": 149.55 }
              },
              "index": 6,
              "playId": "de858224-4142-4d1a-94d0-b4a39b069cc6",
              "pitchNumber": 6,
              "startTime": "2022-11-02T02:42:16.523Z",
              "endTime": "2022-11-02T02:42:24.987Z",
              "isPitch": true,
              "type": "pitch"
            }
          ],
          "playEndTime": "2022-11-02T02:42:24.987Z",
          "atBatIndex": 57
        },
        {
          "result": {
            "type": "atBat",
            "event": "Walk",
            "eventType": "walk",
            "description": "Jeremy Pena walks.",
            "rbi": 0,
            "awayScore": 0,
            "homeScore": 7,
            "isOut": false
          },
          "about": {
            "atBatIndex": 58,
            "halfInning": "top",
            "isTopInning": true,
            "inning": 8,
            "startTime": "2022-11-02T02:42:34.815Z",
            "endTime": "2022-11-02T02:45:18.816Z",
            "isComplete": true,
            "isScoringPlay": false,
            "hasReview": false,
            "hasOut": false,
            "captivatingIndex": 0
          },
          "count": { "balls": 4, "strikes": 2, "outs": 1 },
          "matchup": {
            "batter": {
              "id": 665161,
              "fullName": "Jeremy Pena",
              "link": "/api/v1/people/665161"
            },
            "batSide": { "code": "R", "description": "Right" },
            "pitcher": {
              "id": 656793,
              "fullName": "Nick Nelson",
              "link": "/api/v1/people/656793"
            },
            "pitchHand": { "code": "R", "description": "Right" },
            "postOnFirst": {
              "id": 665161,
              "fullName": "Jeremy Pena",
              "link": "/api/v1/people/665161"
            },
            "batterHotColdZones": [],
            "pitcherHotColdZones": [],
            "splits": {
              "batter": "vs_RHP",
              "pitcher": "vs_RHB",
              "menOnBase": "Men_On"
            }
          },
          "pitchIndex": [0, 1, 2, 3, 4, 5],
          "actionIndex": [],
          "runnerIndex": [0],
          "runners": [
            {
              "movement": {
                "originBase": null,
                "start": null,
                "end": "1B",
                "outBase": null,
                "isOut": false,
                "outNumber": null
              },
              "details": {
                "event": "Walk",
                "eventType": "walk",
                "movementReason": null,
                "runner": {
                  "id": 665161,
                  "fullName": "Jeremy Pena",
                  "link": "/api/v1/people/665161"
                },
                "responsiblePitcher": null,
                "isScoringEvent": false,
                "rbi": false,
                "earned": false,
                "teamUnearned": false,
                "playIndex": 5
              },
              "credits": []
            }
          ],
          "playEvents": [
            {
              "details": {
                "call": { "code": "S", "description": "Swinging Strike" },
                "description": "Swinging Strike",
                "code": "S",
                "ballColor": "rgba(170, 21, 11, 1.0)",
                "trailColor": "rgba(0, 0, 254, 1.0)",
                "isInPlay": false,
                "isStrike": true,
                "isBall": false,
                "type": { "code": "SL", "description": "Slider" },
                "isOut": false,
                "hasReview": false
              },
              "count": { "balls": 0, "strikes": 1, "outs": 1 },
              "pitchData": {
                "startSpeed": 88.8,
                "endSpeed": 81.8,
                "strikeZoneTop": 3.63,
                "strikeZoneBottom": 1.75,
                "coordinates": {
                  "aY": 25.965275345213048,
                  "aZ": -32.57241962178248,
                  "pfxX": 0.9696358591653615,
                  "pfxZ": -0.2360288317989383,
                  "pX": -0.4202956946352621,
                  "pZ": 3.6536071580607175,
                  "vX0": 4.961562876039662,
                  "vY0": -129.35509178994693,
                  "vZ0": 0.6629427856670356,
                  "x": 133.02,
                  "y": 140.13,
                  "x0": -2.4859163145175023,
                  "y0": 50.000719459242134,
                  "z0": 5.883261176061554,
                  "aX": 1.6493717833084842
                },
                "breaks": {
                  "breakAngle": 4.8,
                  "breakLength": 7.2,
                  "breakY": 24.0,
                  "spinRate": 2305,
                  "spinDirection": 88
                },
                "zone": 1,
                "typeConfidence": 0.91,
                "plateTime": 0.4227740721480626,
                "extension": 6.294721223706791
              },
              "index": 0,
              "playId": "91fbfe70-bca2-4c5b-98d3-f158edd7a2ed",
              "pitchNumber": 1,
              "startTime": "2022-11-02T02:43:07.133Z",
              "endTime": "2022-11-02T02:43:12.790Z",
              "isPitch": true,
              "type": "pitch"
            },
            {
              "details": {
                "call": { "code": "B", "description": "Ball" },
                "description": "Ball",
                "code": "B",
                "ballColor": "rgba(39, 161, 39, 1.0)",
                "trailColor": "rgba(188, 0, 33, 1.0)",
                "isInPlay": false,
                "isStrike": false,
                "isBall": true,
                "type": { "code": "FF", "description": "Four-Seam Fastball" },
                "isOut": false,
                "hasReview": false
              },
              "count": { "balls": 1, "strikes": 1, "outs": 1 },
              "pitchData": {
                "startSpeed": 97.0,
                "endSpeed": 88.8,
                "strikeZoneTop": 3.70839520759941,
                "strikeZoneBottom": 1.80774624212668,
                "coordinates": {
                  "aY": 31.568728293372462,
                  "aZ": -11.173716553103285,
                  "pfxX": -4.273267795792451,
                  "pfxZ": 10.467882400818446,
                  "pX": 0.8335693261041214,
                  "pZ": 1.3067507861025551,
                  "vX0": 9.64674452662371,
                  "vY0": -140.6572706576314,
                  "vZ0": -9.82409019922819,
                  "x": 85.23,
                  "y": 203.5,
                  "x0": -2.0834574212861177,
                  "y0": 50.00001458195261,
                  "z0": 5.566679462306845,
                  "aX": -8.57133345772836
                },
                "breaks": {
                  "breakAngle": 26.4,
                  "breakLength": 2.4,
                  "breakY": 24.0,
                  "spinRate": 2056,
                  "spinDirection": 205
                },
                "zone": 14,
                "typeConfidence": 0.91,
                "plateTime": 0.38924220760030925,
                "extension": 6.328925855962747
              },
              "index": 1,
              "playId": "06173595-f3a6-4ce5-98ee-9b05e3bc90b1",
              "pitchNumber": 2,
              "startTime": "2022-11-02T02:43:33.609Z",
              "endTime": "2022-11-02T02:43:37.214Z",
              "isPitch": true,
              "type": "pitch"
            },
            {
              "details": {
                "call": { "code": "T", "description": "Foul Tip" },
                "description": "Foul Tip",
                "code": "T",
                "ballColor": "rgba(170, 21, 11, 1.0)",
                "trailColor": "rgba(0, 0, 254, 1.0)",
                "isInPlay": false,
                "isStrike": true,
                "isBall": false,
                "type": { "code": "SL", "description": "Slider" },
                "isOut": false,
                "hasReview": false
              },
              "count": { "balls": 1, "strikes": 2, "outs": 1 },
              "pitchData": {
                "startSpeed": 90.0,
                "endSpeed": 83.2,
                "strikeZoneTop": 3.63,
                "strikeZoneBottom": 1.75,
                "coordinates": {
                  "aY": 26.64292428382527,
                  "aZ": -31.024858339859584,
                  "pfxX": 0.8404579370977894,
                  "pfxZ": 0.6583672877707754,
                  "pX": 0.605004396015028,
                  "pZ": 1.6624934933011557,
                  "vX0": 7.279477319560744,
                  "vY0": -130.9367892138477,
                  "vZ0": -4.481018609953976,
                  "x": 93.94,
                  "y": 193.89,
                  "x0": -2.315841491314034,
                  "y0": 50.00258529187936,
                  "z0": 5.707281604046556,
                  "aX": 1.4637054399960943
                },
                "breaks": {
                  "breakAngle": 4.8,
                  "breakLength": 7.2,
                  "breakY": 24.0,
                  "spinRate": 2348,
                  "spinDirection": 67
                },
                "zone": 9,
                "typeConfidence": 0.91,
                "plateTime": 0.4176967512454359,
                "extension": 6.1434242455515795
              },
              "index": 2,
              "playId": "12fc87f0-b315-4b75-99dc-4b70e84bb874",
              "pitchNumber": 3,
              "startTime": "2022-11-02T02:43:53.661Z",
              "endTime": "2022-11-02T02:43:56.780Z",
              "isPitch": true,
              "type": "pitch"
            },
            {
              "details": {
                "call": { "code": "B", "description": "Ball" },
                "description": "Ball",
                "code": "B",
                "ballColor": "rgba(39, 161, 39, 1.0)",
                "trailColor": "rgba(0, 85, 254, 1.0)",
                "isInPlay": false,
                "isStrike": false,
                "isBall": true,
                "type": { "code": "CH", "description": "Changeup" },
                "isOut": false,
                "hasReview": false
              },
              "count": { "balls": 2, "strikes": 2, "outs": 1 },
              "pitchData": {
                "startSpeed": 91.0,
                "endSpeed": 83.7,
                "strikeZoneTop": 3.60536945452749,
                "strikeZoneBottom": 1.70390700555157,
                "coordinates": {
                  "aY": 27.157414714231102,
                  "aZ": -23.652597884807633,
                  "pfxX": -10.862910248973765,
                  "pfxZ": 4.810557247705359,
                  "pX": 0.8463624408481994,
                  "pZ": 1.3258263581288774,
                  "vX0": 11.371561164759857,
                  "vY0": -131.99882119403205,
                  "vZ0": -6.884480382256279,
                  "x": 84.74,
                  "y": 202.98,
                  "x0": -2.09882576062647,
                  "y0": 50.002634481199514,
                  "z0": 5.700227652863625,
                  "aX": -19.2383788167126
                },
                "breaks": {
                  "breakAngle": 34.8,
                  "breakLength": 7.2,
                  "breakY": 24.0,
                  "spinRate": 1889,
                  "spinDirection": 242
                },
                "zone": 14,
                "typeConfidence": 0.82,
                "plateTime": 0.4143905365187428,
                "extension": 6.158243457737575
              },
              "index": 3,
              "playId": "a8c29fed-d603-4880-9760-e1dd9cdf3805",
              "pitchNumber": 4,
              "startTime": "2022-11-02T02:44:21.214Z",
              "endTime": "2022-11-02T02:44:24.214Z",
              "isPitch": true,
              "type": "pitch"
            },
            {
              "details": {
                "call": { "code": "B", "description": "Ball" },
                "description": "Ball",
                "code": "B",
                "ballColor": "rgba(39, 161, 39, 1.0)",
                "trailColor": "rgba(0, 85, 254, 1.0)",
                "isInPlay": false,
                "isStrike": false,
                "isBall": true,
                "type": { "code": "CH", "description": "Changeup" },
                "isOut": false,
                "hasReview": false
              },
              "count": { "balls": 3, "strikes": 2, "outs": 1 },
              "pitchData": {
                "startSpeed": 90.5,
                "endSpeed": 83.1,
                "strikeZoneTop": 3.63113214309617,
                "strikeZoneBottom": 1.75583202103134,
                "coordinates": {
                  "aY": 27.288768388206407,
                  "aZ": -21.598180715463563,
                  "pfxX": -12.00801281336862,
                  "pfxZ": 6.0801731776706855,
                  "pX": 1.3122508439034404,
                  "pZ": 0.25370305381179903,
                  "vX0": 12.668362638002396,
                  "vY0": -130.93536973843072,
                  "vZ0": -9.769544019619257,
                  "x": 66.98,
                  "y": 231.93,
                  "x0": -2.0254263253493887,
                  "y0": 50.00275070938058,
                  "z0": 5.645542784600819,
                  "aX": -20.879974331569834
                },
                "breaks": {
                  "breakAngle": 38.4,
                  "breakLength": 7.2,
                  "breakY": 24.0,
                  "spinRate": 1907,
                  "spinDirection": 242
                },
                "zone": 14,
                "typeConfidence": 0.86,
                "plateTime": 0.4181097217734804,
                "extension": 6.157110814364332
              },
              "index": 4,
              "playId": "18415300-0014-46b8-b922-8474d94c8f47",
              "pitchNumber": 5,
              "startTime": "2022-11-02T02:44:43.361Z",
              "endTime": "2022-11-02T02:44:46.374Z",
              "isPitch": true,
              "type": "pitch"
            },
            {
              "details": {
                "call": { "code": "B", "description": "Ball" },
                "description": "Ball",
                "code": "B",
                "ballColor": "rgba(39, 161, 39, 1.0)",
                "trailColor": "rgba(188, 0, 33, 1.0)",
                "isInPlay": false,
                "isStrike": false,
                "isBall": true,
                "type": { "code": "FF", "description": "Four-Seam Fastball" },
                "isOut": false,
                "hasReview": false
              },
              "count": { "balls": 4, "strikes": 2, "outs": 1 },
              "pitchData": {
                "startSpeed": 97.7,
                "endSpeed": 89.4,
                "strikeZoneTop": 3.65689068076325,
                "strikeZoneBottom": 1.74716565555137,
                "coordinates": {
                  "aY": 31.423677254209903,
                  "aZ": -12.533919994699422,
                  "pfxX": -5.7949783719429,
                  "pfxZ": 9.634027767777413,
                  "pX": 1.8382987732174358,
                  "pZ": 3.041340363115997,
                  "vX0": 12.747404310482327,
                  "vY0": -141.6614743865023,
                  "vZ0": -5.294734541952974,
                  "x": 46.93,
                  "y": 156.66,
                  "x0": -1.960779995881125,
                  "y0": 50.00461507892032,
                  "z0": 5.731474404310851,
                  "aX": -11.817327482688071
                },
                "breaks": {
                  "breakAngle": 33.6,
                  "breakLength": 3.6,
                  "breakY": 24.0,
                  "spinRate": 2103,
                  "spinDirection": 202
                },
                "zone": 12,
                "typeConfidence": 0.91,
                "plateTime": 0.3861873415839181,
                "extension": 6.333570563209821
              },
              "index": 5,
              "playId": "2b85f7c5-8eca-4f31-9f30-f207b20ec9bc",
              "pitchNumber": 6,
              "startTime": "2022-11-02T02:45:14.796Z",
              "endTime": "2022-11-02T02:45:18.816Z",
              "isPitch": true,
              "type": "pitch"
            }
          ],
          "playEndTime": "2022-11-02T02:45:18.816Z",
          "atBatIndex": 58
        },
        {
          "result": {
            "type": "atBat",
            "event": "Flyout",
            "eventType": "field_out",
            "description": "Yordan Alvarez flies out to center fielder Brandon Marsh.",
            "rbi": 0,
            "awayScore": 0,
            "homeScore": 7,
            "isOut": true
          },
          "about": {
            "atBatIndex": 59,
            "halfInning": "top",
            "isTopInning": true,
            "inning": 8,
            "startTime": "2022-11-02T02:45:26.428Z",
            "endTime": "2022-11-02T02:47:42.853Z",
            "isComplete": true,
            "isScoringPlay": false,
            "hasReview": false,
            "hasOut": true,
            "captivatingIndex": 0
          },
          "count": { "balls": 3, "strikes": 1, "outs": 2 },
          "matchup": {
            "batter": {
              "id": 670541,
              "fullName": "Yordan Alvarez",
              "link": "/api/v1/people/670541"
            },
            "batSide": { "code": "L", "description": "Left" },
            "pitcher": {
              "id": 656793,
              "fullName": "Nick Nelson",
              "link": "/api/v1/people/656793"
            },
            "pitchHand": { "code": "R", "description": "Right" },
            "postOnFirst": {
              "id": 665161,
              "fullName": "Jeremy Pena",
              "link": "/api/v1/people/665161"
            },
            "batterHotColdZones": [],
            "pitcherHotColdZones": [],
            "splits": {
              "batter": "vs_RHP",
              "pitcher": "vs_LHB",
              "menOnBase": "Men_On"
            }
          },
          "pitchIndex": [0, 1, 2, 3, 4],
          "actionIndex": [],
          "runnerIndex": [0],
          "runners": [
            {
              "movement": {
                "originBase": null,
                "start": null,
                "end": null,
                "outBase": "1B",
                "isOut": true,
                "outNumber": 2
              },
              "details": {
                "event": "Flyout",
                "eventType": "field_out",
                "movementReason": null,
                "runner": {
                  "id": 670541,
                  "fullName": "Yordan Alvarez",
                  "link": "/api/v1/people/670541"
                },
                "responsiblePitcher": null,
                "isScoringEvent": false,
                "rbi": false,
                "earned": false,
                "teamUnearned": false,
                "playIndex": 4
              },
              "credits": [
                {
                  "player": { "id": 669016, "link": "/api/v1/people/669016" },
                  "position": {
                    "code": "8",
                    "name": "Outfielder",
                    "type": "Outfielder",
                    "abbreviation": "CF"
                  },
                  "credit": "f_putout"
                }
              ]
            }
          ],
          "playEvents": [
            {
              "details": {
                "call": { "code": "B", "description": "Ball" },
                "description": "Ball",
                "code": "B",
                "ballColor": "rgba(39, 161, 39, 1.0)",
                "trailColor": "rgba(188, 0, 33, 1.0)",
                "isInPlay": false,
                "isStrike": false,
                "isBall": true,
                "type": { "code": "FF", "description": "Four-Seam Fastball" },
                "isOut": false,
                "hasReview": false
              },
              "count": { "balls": 1, "strikes": 0, "outs": 1 },
              "pitchData": {
                "startSpeed": 97.7,
                "endSpeed": 89.3,
                "strikeZoneTop": 3.42491642998784,
                "strikeZoneBottom": 1.57404861035727,
                "coordinates": {
                  "aY": 32.38045337361814,
                  "aZ": -11.76229743279741,
                  "pfxX": -4.632179344411771,
                  "pfxZ": 9.979994170430235,
                  "pX": -1.5609547599742517,
                  "pZ": 2.598115957662256,
                  "vX0": 3.9297554856908317,
                  "vY0": -142.08628801354317,
                  "vZ0": -6.620219300473605,
                  "x": 176.5,
                  "y": 168.63,
                  "x0": -2.359704697276406,
                  "y0": 50.00653655297352,
                  "z0": 5.704886038930723,
                  "aX": -9.47867522107451
                },
                "breaks": {
                  "breakAngle": 32.4,
                  "breakLength": 3.6,
                  "breakY": 24.0,
                  "spinRate": 2073,
                  "spinDirection": 204
                },
                "zone": 11,
                "typeConfidence": 0.92,
                "plateTime": 0.38539509966306795,
                "extension": 5.983954673200172
              },
              "index": 0,
              "playId": "fae66a6a-fff4-4231-be3c-7c8cb17525be",
              "pitchNumber": 1,
              "startTime": "2022-11-02T02:45:55.492Z",
              "endTime": "2022-11-02T02:45:58.492Z",
              "isPitch": true,
              "type": "pitch"
            },
            {
              "details": {
                "call": { "code": "B", "description": "Ball" },
                "description": "Ball",
                "code": "B",
                "ballColor": "rgba(39, 161, 39, 1.0)",
                "trailColor": "rgba(188, 0, 33, 1.0)",
                "isInPlay": false,
                "isStrike": false,
                "isBall": true,
                "type": { "code": "FF", "description": "Four-Seam Fastball" },
                "isOut": false,
                "hasReview": false
              },
              "count": { "balls": 2, "strikes": 0, "outs": 1 },
              "pitchData": {
                "startSpeed": 97.2,
                "endSpeed": 88.7,
                "strikeZoneTop": 3.47637734151516,
                "strikeZoneBottom": 1.70390700555157,
                "coordinates": {
                  "aY": 32.328537025821696,
                  "aZ": -12.599654400544757,
                  "pfxX": -6.199339891825945,
                  "pfxZ": 9.681001805956233,
                  "pX": 0.07916281210711382,
                  "pZ": 4.050313818699502,
                  "vX0": 8.683916360603407,
                  "vY0": -141.34075098015882,
                  "vZ0": -2.8044959645604117,
                  "x": 113.98,
                  "y": 129.42,
                  "x0": -2.2282331330163587,
                  "y0": 50.006806565503005,
                  "z0": 5.864964340106214,
                  "aX": -12.540761300060105
                },
                "breaks": {
                  "breakAngle": 38.4,
                  "breakLength": 3.6,
                  "breakY": 24.0,
                  "spinRate": 2316,
                  "spinDirection": 204
                },
                "zone": 12,
                "typeConfidence": 0.91,
                "plateTime": 0.3875710785388118,
                "extension": 6.233433249141818
              },
              "index": 1,
              "playId": "f1b4e029-a92f-43c2-be68-6dbfbdd9d6e6",
              "pitchNumber": 2,
              "startTime": "2022-11-02T02:46:12.875Z",
              "endTime": "2022-11-02T02:46:16.513Z",
              "isPitch": true,
              "type": "pitch"
            },
            {
              "details": {
                "call": { "code": "F", "description": "Foul" },
                "description": "Foul",
                "code": "F",
                "ballColor": "rgba(170, 21, 11, 1.0)",
                "trailColor": "rgba(188, 0, 33, 1.0)",
                "isInPlay": false,
                "isStrike": true,
                "isBall": false,
                "type": { "code": "FF", "description": "Four-Seam Fastball" },
                "isOut": false,
                "hasReview": false
              },
              "count": { "balls": 2, "strikes": 1, "outs": 1 },
              "pitchData": {
                "startSpeed": 97.1,
                "endSpeed": 88.2,
                "strikeZoneTop": 3.48,
                "strikeZoneBottom": 1.73,
                "coordinates": {
                  "aY": 33.79906482429447,
                  "aZ": -10.135192541646326,
                  "pfxX": -3.3042664557970824,
                  "pfxZ": 10.978303402166178,
                  "pX": 0.027684360786471063,
                  "pZ": 3.2267011035565445,
                  "vX0": 7.4141195638723465,
                  "vY0": -141.18489424631636,
                  "vZ0": -4.941315993362722,
                  "x": 115.94,
                  "y": 151.66,
                  "x0": -2.209644322763984,
                  "y0": 50.00456391962873,
                  "z0": 5.6589989180606945,
                  "aX": -6.634993644125794
                },
                "breaks": {
                  "breakAngle": 22.8,
                  "breakLength": 2.4,
                  "breakY": 24.0,
                  "spinRate": 2161,
                  "spinDirection": 209
                },
                "zone": 2,
                "typeConfidence": 0.91,
                "plateTime": 0.38877522537308007,
                "extension": 6.187679617344682
              },
              "index": 2,
              "playId": "22dd50a5-7b80-4b43-abef-24b94423c04e",
              "pitchNumber": 3,
              "startTime": "2022-11-02T02:46:37.686Z",
              "endTime": "2022-11-02T02:46:40.686Z",
              "isPitch": true,
              "type": "pitch"
            },
            {
              "details": {
                "call": { "code": "B", "description": "Ball" },
                "description": "Ball",
                "code": "B",
                "ballColor": "rgba(39, 161, 39, 1.0)",
                "trailColor": "rgba(188, 0, 33, 1.0)",
                "isInPlay": false,
                "isStrike": false,
                "isBall": true,
                "type": { "code": "FF", "description": "Four-Seam Fastball" },
                "isOut": false,
                "hasReview": false
              },
              "count": { "balls": 3, "strikes": 1, "outs": 1 },
              "pitchData": {
                "startSpeed": 97.4,
                "endSpeed": 89.4,
                "strikeZoneTop": 3.45070750076087,
                "strikeZoneBottom": 1.67794051502889,
                "coordinates": {
                  "aY": 30.585222528965033,
                  "aZ": -10.6724156043492,
                  "pfxX": -4.532950135637092,
                  "pfxZ": 10.5688853062527,
                  "pX": 1.0556604812459196,
                  "pZ": 2.416147443533736,
                  "vX0": 10.488411484440286,
                  "vY0": -141.34453727612436,
                  "vZ0": -7.083187639584983,
                  "x": 76.76,
                  "y": 173.54,
                  "x0": -2.1051859339440493,
                  "y0": 50.00172185557757,
                  "z0": 5.631131695725079,
                  "aX": -9.2221218188248
                },
                "breaks": {
                  "breakAngle": 30.0,
                  "breakLength": 2.4,
                  "breakY": 24.0,
                  "spinRate": 2153,
                  "spinDirection": 204
                },
                "zone": 14,
                "typeConfidence": 0.91,
                "plateTime": 0.3867225253348816,
                "extension": 6.262706206973611
              },
              "index": 3,
              "playId": "ac884878-73d0-4aca-8083-cc808f3b78a1",
              "pitchNumber": 4,
              "startTime": "2022-11-02T02:47:05.759Z",
              "endTime": "2022-11-02T02:47:08.835Z",
              "isPitch": true,
              "type": "pitch"
            },
            {
              "details": {
                "call": { "code": "X", "description": "In play, out(s)" },
                "description": "In play, out(s)",
                "code": "X",
                "ballColor": "rgba(26, 86, 190, 1.0)",
                "trailColor": "rgba(188, 0, 33, 1.0)",
                "isInPlay": true,
                "isStrike": false,
                "isBall": false,
                "type": { "code": "FF", "description": "Four-Seam Fastball" },
                "isOut": true,
                "hasReview": false
              },
              "count": { "balls": 3, "strikes": 1, "outs": 1 },
              "pitchData": {
                "startSpeed": 96.7,
                "endSpeed": 88.6,
                "strikeZoneTop": 3.48,
                "strikeZoneBottom": 1.73,
                "coordinates": {
                  "aY": 30.948936983343945,
                  "aZ": -10.825088909129155,
                  "pfxX": -4.928182130812488,
                  "pfxZ": 10.67307203784749,
                  "pX": 0.358705669872276,
                  "pZ": 1.7411147304610604,
                  "vX0": 8.968600483545057,
                  "vY0": -140.33698262891903,
                  "vZ0": -8.50012445130593,
                  "x": 103.33,
                  "y": 191.77,
                  "x0": -2.2342009941066627,
                  "y0": 50.000782679289195,
                  "z0": 5.509216232920972,
                  "aX": -9.856457662379063
                },
                "breaks": {
                  "breakAngle": 32.4,
                  "breakLength": 3.6,
                  "breakY": 24.0,
                  "spinRate": 2195,
                  "spinDirection": 206
                },
                "zone": 9,
                "typeConfidence": 0.91,
                "plateTime": 0.38988328083086987,
                "extension": 6.412907000988345
              },
              "hitData": {
                "launchSpeed": 107.2,
                "launchAngle": 60.0,
                "totalDistance": 229.0,
                "trajectory": "fly_ball",
                "hardness": "medium",
                "location": "8",
                "coordinates": { "coordX": 141.88, "coordY": 102.91 }
              },
              "index": 4,
              "playId": "a4828724-268d-499b-8431-2f33babfe873",
              "pitchNumber": 5,
              "startTime": "2022-11-02T02:47:26.717Z",
              "endTime": "2022-11-02T02:47:42.853Z",
              "isPitch": true,
              "type": "pitch"
            }
          ],
          "playEndTime": "2022-11-02T02:47:42.853Z",
          "atBatIndex": 59
        },
        {
          "result": {
            "type": "atBat",
            "event": "Walk",
            "eventType": "walk",
            "description": "Alex Bregman walks.   Jeremy Pena to 2nd.",
            "rbi": 0,
            "awayScore": 0,
            "homeScore": 7,
            "isOut": false
          },
          "about": {
            "atBatIndex": 60,
            "halfInning": "top",
            "isTopInning": true,
            "inning": 8,
            "startTime": "2022-11-02T02:47:54.290Z",
            "endTime": "2022-11-02T02:53:56.479Z",
            "isComplete": true,
            "isScoringPlay": false,
            "hasReview": false,
            "hasOut": false,
            "captivatingIndex": 0
          },
          "count": { "balls": 4, "strikes": 2, "outs": 2 },
          "matchup": {
            "batter": {
              "id": 608324,
              "fullName": "Alex Bregman",
              "link": "/api/v1/people/608324"
            },
            "batSide": { "code": "R", "description": "Right" },
            "pitcher": {
              "id": 656793,
              "fullName": "Nick Nelson",
              "link": "/api/v1/people/656793"
            },
            "pitchHand": { "code": "R", "description": "Right" },
            "postOnFirst": {
              "id": 608324,
              "fullName": "Alex Bregman",
              "link": "/api/v1/people/608324"
            },
            "postOnSecond": {
              "id": 665161,
              "fullName": "Jeremy Pena",
              "link": "/api/v1/people/665161"
            },
            "batterHotColdZones": [],
            "pitcherHotColdZones": [],
            "splits": {
              "batter": "vs_RHP",
              "pitcher": "vs_RHB",
              "menOnBase": "RISP"
            }
          },
          "pitchIndex": [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10],
          "actionIndex": [],
          "runnerIndex": [0, 1],
          "runners": [
            {
              "movement": {
                "originBase": "1B",
                "start": "1B",
                "end": "2B",
                "outBase": null,
                "isOut": false,
                "outNumber": null
              },
              "details": {
                "event": "Walk",
                "eventType": "walk",
                "movementReason": "r_adv_force",
                "runner": {
                  "id": 665161,
                  "fullName": "Jeremy Pena",
                  "link": "/api/v1/people/665161"
                },
                "responsiblePitcher": null,
                "isScoringEvent": false,
                "rbi": false,
                "earned": false,
                "teamUnearned": false,
                "playIndex": 10
              },
              "credits": []
            },
            {
              "movement": {
                "originBase": null,
                "start": null,
                "end": "1B",
                "outBase": null,
                "isOut": false,
                "outNumber": null
              },
              "details": {
                "event": "Walk",
                "eventType": "walk",
                "movementReason": null,
                "runner": {
                  "id": 608324,
                  "fullName": "Alex Bregman",
                  "link": "/api/v1/people/608324"
                },
                "responsiblePitcher": null,
                "isScoringEvent": false,
                "rbi": false,
                "earned": false,
                "teamUnearned": false,
                "playIndex": 10
              },
              "credits": []
            }
          ],
          "playEvents": [
            {
              "details": {
                "call": { "code": "B", "description": "Ball" },
                "description": "Ball",
                "code": "B",
                "ballColor": "rgba(39, 161, 39, 1.0)",
                "trailColor": "rgba(0, 0, 254, 1.0)",
                "isInPlay": false,
                "isStrike": false,
                "isBall": true,
                "type": { "code": "SL", "description": "Slider" },
                "isOut": false,
                "hasReview": false
              },
              "count": { "balls": 1, "strikes": 0, "outs": 2 },
              "pitchData": {
                "startSpeed": 90.2,
                "endSpeed": 83.0,
                "strikeZoneTop": 3.03758910829274,
                "strikeZoneBottom": 1.36614573158434,
                "coordinates": {
                  "aY": 26.873727166672023,
                  "aZ": -30.445920616839516,
                  "pfxX": 1.716589788056993,
                  "pfxZ": 0.9898804921996618,
                  "pX": 0.3588647711568702,
                  "pZ": 3.481138535603049,
                  "vX0": 6.266085188169243,
                  "vY0": -131.2903167279493,
                  "vZ0": -0.2885382837365422,
                  "x": 103.32,
                  "y": 144.79,
                  "x0": -2.2785002257111806,
                  "y0": 50.0057715029722,
                  "z0": 5.851527605537909,
                  "aX": 3.007262026701103
                },
                "breaks": {
                  "breakAngle": 8.4,
                  "breakLength": 7.2,
                  "breakY": 24.0,
                  "spinRate": 2302,
                  "spinDirection": 155
                },
                "zone": 12,
                "typeConfidence": 0.9,
                "plateTime": 0.41663250804370433,
                "extension": 6.196827538110548
              },
              "index": 0,
              "playId": "bf6b2ab7-c78d-4518-bb64-4d83e9cbfe60",
              "pitchNumber": 1,
              "startTime": "2022-11-02T02:48:31.152Z",
              "endTime": "2022-11-02T02:48:34.681Z",
              "isPitch": true,
              "type": "pitch"
            },
            {
              "details": {
                "call": { "code": "S", "description": "Swinging Strike" },
                "description": "Swinging Strike",
                "code": "S",
                "ballColor": "rgba(170, 21, 11, 1.0)",
                "trailColor": "rgba(188, 0, 33, 1.0)",
                "isInPlay": false,
                "isStrike": true,
                "isBall": false,
                "type": { "code": "FF", "description": "Four-Seam Fastball" },
                "isOut": false,
                "hasReview": false
              },
              "count": { "balls": 1, "strikes": 1, "outs": 2 },
              "pitchData": {
                "startSpeed": 96.6,
                "endSpeed": 88.3,
                "strikeZoneTop": 3.16,
                "strikeZoneBottom": 1.51,
                "coordinates": {
                  "aY": 31.593370248438212,
                  "aZ": -10.545651421768829,
                  "pfxX": -3.768148728624456,
                  "pfxZ": 10.810781975417115,
                  "pX": 0.10560437493856206,
                  "pZ": 2.720340125181656,
                  "vX0": 7.57828664301494,
                  "vY0": -140.48920936785237,
                  "vZ0": -6.197967645865953,
                  "x": 112.97,
                  "y": 165.33,
                  "x0": -2.136273305538455,
                  "y0": 50.003128021660096,
                  "z0": 5.639434905670351,
                  "aX": -7.539821497805293
                },
                "breaks": {
                  "breakAngle": 26.4,
                  "breakLength": 2.4,
                  "breakY": 24.0,
                  "spinRate": 1994,
                  "spinDirection": 205
                },
                "zone": 2,
                "typeConfidence": 0.91,
                "plateTime": 0.3897554306734219,
                "extension": 6.284861541722445
              },
              "index": 1,
              "playId": "de3aa905-dfc4-4b44-b0e5-a88d46bcfcca",
              "pitchNumber": 2,
              "startTime": "2022-11-02T02:48:49.423Z",
              "endTime": "2022-11-02T02:48:52.428Z",
              "isPitch": true,
              "type": "pitch"
            },
            {
              "details": {
                "call": { "code": "F", "description": "Foul" },
                "description": "Foul",
                "code": "F",
                "ballColor": "rgba(170, 21, 11, 1.0)",
                "trailColor": "rgba(188, 0, 33, 1.0)",
                "isInPlay": false,
                "isStrike": true,
                "isBall": false,
                "type": { "code": "FF", "description": "Four-Seam Fastball" },
                "isOut": false,
                "hasReview": false
              },
              "count": { "balls": 1, "strikes": 2, "outs": 2 },
              "pitchData": {
                "startSpeed": 96.1,
                "endSpeed": 88.1,
                "strikeZoneTop": 3.16,
                "strikeZoneBottom": 1.51,
                "coordinates": {
                  "aY": 30.19228215284759,
                  "aZ": -12.462616056832735,
                  "pfxX": -4.789947540423285,
                  "pfxZ": 9.965951864182674,
                  "pX": 0.5742052630791341,
                  "pZ": 1.7039452609291312,
                  "vX0": 8.906966671754521,
                  "vY0": -139.4723832183019,
                  "vZ0": -8.31507953133755,
                  "x": 95.11,
                  "y": 192.77,
                  "x0": -2.032655178181152,
                  "y0": 50.00589941046573,
                  "z0": 5.538302212464278,
                  "aX": -9.477469054782487
                },
                "breaks": {
                  "breakAngle": 27.6,
                  "breakLength": 3.6,
                  "breakY": 24.0,
                  "spinRate": 1957,
                  "spinDirection": 205
                },
                "zone": 9,
                "typeConfidence": 0.9,
                "plateTime": 0.3921167998363053,
                "extension": 6.37190521975412
              },
              "index": 2,
              "playId": "869977a5-1cb2-42a4-ade6-4ae2876c8a50",
              "pitchNumber": 3,
              "startTime": "2022-11-02T02:49:14.116Z",
              "endTime": "2022-11-02T02:49:17.433Z",
              "isPitch": true,
              "type": "pitch"
            },
            {
              "details": {
                "call": { "code": "F", "description": "Foul" },
                "description": "Foul",
                "code": "F",
                "ballColor": "rgba(170, 21, 11, 1.0)",
                "trailColor": "rgba(0, 0, 254, 1.0)",
                "isInPlay": false,
                "isStrike": true,
                "isBall": false,
                "type": { "code": "SL", "description": "Slider" },
                "isOut": false,
                "hasReview": false
              },
              "count": { "balls": 1, "strikes": 2, "outs": 2 },
              "pitchData": {
                "startSpeed": 86.9,
                "endSpeed": 79.9,
                "strikeZoneTop": 3.16,
                "strikeZoneBottom": 1.51,
                "coordinates": {
                  "aY": 25.890942201936287,
                  "aZ": -34.486630712250864,
                  "pfxX": -0.9483682712393863,
                  "pfxZ": -1.4256575790829498,
                  "pX": -0.24969392032320517,
                  "pZ": 2.4775133833274445,
                  "vX0": 5.387610734697039,
                  "vY0": -126.41951930861205,
                  "vZ0": -1.3729357681946994,
                  "x": 126.52,
                  "y": 171.89,
                  "x0": -2.2857883216619794,
                  "y0": 50.006161941960904,
                  "z0": 5.797189521738678,
                  "aX": -1.5353696547597389
                },
                "breaks": {
                  "breakAngle": 1.2,
                  "breakLength": 8.4,
                  "breakY": 24.0,
                  "spinRate": 2429,
                  "spinDirection": 75
                },
                "zone": 5,
                "typeConfidence": 0.92,
                "plateTime": 0.43335658095857355,
                "extension": 6.202785018197815
              },
              "index": 3,
              "playId": "ef4e5eba-e73f-4fb5-aef5-a8413d48f807",
              "pitchNumber": 4,
              "startTime": "2022-11-02T02:49:44.691Z",
              "endTime": "2022-11-02T02:49:51.628Z",
              "isPitch": true,
              "type": "pitch"
            },
            {
              "details": {
                "call": { "code": "F", "description": "Foul" },
                "description": "Foul",
                "code": "F",
                "ballColor": "rgba(170, 21, 11, 1.0)",
                "trailColor": "rgba(188, 0, 33, 1.0)",
                "isInPlay": false,
                "isStrike": true,
                "isBall": false,
                "type": { "code": "FF", "description": "Four-Seam Fastball" },
                "isOut": false,
                "hasReview": false
              },
              "count": { "balls": 1, "strikes": 2, "outs": 2 },
              "pitchData": {
                "startSpeed": 96.3,
                "endSpeed": 88.3,
                "strikeZoneTop": 3.16,
                "strikeZoneBottom": 1.51,
                "coordinates": {
                  "aY": 30.58949919211178,
                  "aZ": -12.096247828380713,
                  "pfxX": -4.817546053608266,
                  "pfxZ": 10.111435430600611,
                  "pX": 0.5689693748042538,
                  "pZ": 1.8763085812304803,
                  "vX0": 9.262119487366963,
                  "vY0": -139.79628512509598,
                  "vZ0": -8.009813918515377,
                  "x": 95.31,
                  "y": 188.12,
                  "x0": -2.1565132950597463,
                  "y0": 50.003660296169336,
                  "z0": 5.567002826234418,
                  "aX": -9.567474420475511
                },
                "breaks": {
                  "breakAngle": 28.8,
                  "breakLength": 3.6,
                  "breakY": 24.0,
                  "spinRate": 2079,
                  "spinDirection": 208
                },
                "zone": 9,
                "typeConfidence": 0.9,
                "plateTime": 0.39134391954966263,
                "extension": 6.371979666711163
              },
              "index": 4,
              "playId": "388edfb6-9758-4029-86ee-7f644f3f4dc8",
              "pitchNumber": 5,
              "startTime": "2022-11-02T02:50:35.691Z",
              "endTime": "2022-11-02T02:50:39.101Z",
              "isPitch": true,
              "type": "pitch"
            },
            {
              "details": {
                "call": { "code": "B", "description": "Ball" },
                "description": "Ball",
                "code": "B",
                "ballColor": "rgba(39, 161, 39, 1.0)",
                "trailColor": "rgba(188, 0, 33, 1.0)",
                "isInPlay": false,
                "isStrike": false,
                "isBall": true,
                "type": { "code": "FF", "description": "Four-Seam Fastball" },
                "isOut": false,
                "hasReview": false
              },
              "count": { "balls": 2, "strikes": 2, "outs": 2 },
              "pitchData": {
                "startSpeed": 95.9,
                "endSpeed": 87.7,
                "strikeZoneTop": 3.24388987259725,
                "strikeZoneBottom": 1.50702194576122,
                "coordinates": {
                  "aY": 30.875886492868684,
                  "aZ": -12.877037121487382,
                  "pfxX": -3.7683681135577958,
                  "pfxZ": 9.776886461644148,
                  "pX": -0.07323182463197804,
                  "pZ": 3.9149505503462563,
                  "vX0": 7.329186506658991,
                  "vY0": -139.49243132450982,
                  "vZ0": -2.8048468718781683,
                  "x": 119.79,
                  "y": 133.08,
                  "x0": -2.2431467364219526,
                  "y0": 50.00437357521311,
                  "z0": 5.780524267827213,
                  "aX": -7.439485086775492
                },
                "breaks": {
                  "breakAngle": 22.8,
                  "breakLength": 3.6,
                  "breakY": 24.0,
                  "spinRate": 2021,
                  "spinDirection": 203
                },
                "zone": 11,
                "typeConfidence": 0.9,
                "plateTime": 0.39238816765252515,
                "extension": 6.10817585395164
              },
              "index": 5,
              "playId": "749d3dd8-f4d3-41e2-891c-c81655d16162",
              "pitchNumber": 6,
              "startTime": "2022-11-02T02:51:22.566Z",
              "endTime": "2022-11-02T02:51:25.739Z",
              "isPitch": true,
              "type": "pitch"
            },
            {
              "details": {
                "call": { "code": "F", "description": "Foul" },
                "description": "Foul",
                "code": "F",
                "ballColor": "rgba(170, 21, 11, 1.0)",
                "trailColor": "rgba(0, 0, 254, 1.0)",
                "isInPlay": false,
                "isStrike": true,
                "isBall": false,
                "type": { "code": "SL", "description": "Slider" },
                "isOut": false,
                "hasReview": false
              },
              "count": { "balls": 2, "strikes": 2, "outs": 2 },
              "pitchData": {
                "startSpeed": 86.2,
                "endSpeed": 79.8,
                "strikeZoneTop": 3.16,
                "strikeZoneBottom": 1.51,
                "coordinates": {
                  "aY": 24.393571664732825,
                  "aZ": -35.21527976572601,
                  "pfxX": 1.0077192988137273,
                  "pfxZ": -1.8967730010221189,
                  "pX": 0.15048034206868888,
                  "pZ": 1.725279654100543,
                  "vX0": 5.7795297326716835,
                  "vY0": -125.50785605674812,
                  "vZ0": -2.7729057715545915,
                  "x": 111.26,
                  "y": 192.2,
                  "x0": -2.3090578691150423,
                  "y0": 50.0031244588995,
                  "z0": 5.700180693442594,
                  "aX": 1.6145812502499073
                },
                "breaks": {
                  "breakAngle": 3.6,
                  "breakLength": 9.6,
                  "breakY": 24.0,
                  "spinRate": 2353,
                  "spinDirection": 41
                },
                "zone": 8,
                "typeConfidence": 0.79,
                "plateTime": 0.43568999572131073,
                "extension": 6.190348965316978
              },
              "index": 6,
              "playId": "14c8e9a7-3b6c-45bb-aecd-fe7ab9fc2ab8",
              "pitchNumber": 7,
              "startTime": "2022-11-02T02:51:48.187Z",
              "endTime": "2022-11-02T02:51:51.512Z",
              "isPitch": true,
              "type": "pitch"
            },
            {
              "details": {
                "call": { "code": "F", "description": "Foul" },
                "description": "Foul",
                "code": "F",
                "ballColor": "rgba(170, 21, 11, 1.0)",
                "trailColor": "rgba(188, 0, 33, 1.0)",
                "isInPlay": false,
                "isStrike": true,
                "isBall": false,
                "type": { "code": "FF", "description": "Four-Seam Fastball" },
                "isOut": false,
                "hasReview": false
              },
              "count": { "balls": 2, "strikes": 2, "outs": 2 },
              "pitchData": {
                "startSpeed": 96.1,
                "endSpeed": 87.7,
                "strikeZoneTop": 3.16,
                "strikeZoneBottom": 1.51,
                "coordinates": {
                  "aY": 32.262790733872514,
                  "aZ": -15.78299953602281,
                  "pfxX": -4.987650960807082,
                  "pfxZ": 8.323404834218158,
                  "pX": 0.48984415097474787,
                  "pZ": 2.3712856304087,
                  "vX0": 8.961538338930206,
                  "vY0": -139.6254498188427,
                  "vZ0": -6.081186904321965,
                  "x": 98.33,
                  "y": 174.76,
                  "x0": -2.117337973187064,
                  "y0": 50.001010618840866,
                  "z0": 5.621047762285146,
                  "aX": -9.820427132120587
                },
                "breaks": {
                  "breakAngle": 24.0,
                  "breakLength": 3.6,
                  "breakY": 24.0,
                  "spinRate": 2132,
                  "spinDirection": 204
                },
                "zone": 6,
                "typeConfidence": 0.89,
                "plateTime": 0.39270976382113476,
                "extension": 6.273563447638269
              },
              "index": 7,
              "playId": "696545f1-18ec-457e-a34d-098c5a2058dd",
              "pitchNumber": 8,
              "startTime": "2022-11-02T02:52:16.014Z",
              "endTime": "2022-11-02T02:52:20.698Z",
              "isPitch": true,
              "type": "pitch"
            },
            {
              "details": {
                "call": { "code": "F", "description": "Foul" },
                "description": "Foul",
                "code": "F",
                "ballColor": "rgba(170, 21, 11, 1.0)",
                "trailColor": "rgba(0, 0, 254, 1.0)",
                "isInPlay": false,
                "isStrike": true,
                "isBall": false,
                "type": { "code": "SL", "description": "Slider" },
                "isOut": false,
                "hasReview": false
              },
              "count": { "balls": 2, "strikes": 2, "outs": 2 },
              "pitchData": {
                "startSpeed": 86.5,
                "endSpeed": 80.1,
                "strikeZoneTop": 3.16,
                "strikeZoneBottom": 1.51,
                "coordinates": {
                  "aY": 24.107659844938937,
                  "aZ": -35.561047231533536,
                  "pfxX": 0.10432620531254311,
                  "pfxZ": -2.0957728311753563,
                  "pX": -0.24193977315044507,
                  "pZ": 2.0452846156621476,
                  "vX0": 5.21762384151833,
                  "vY0": -125.92753219525974,
                  "vZ0": -2.0868228779874487,
                  "x": 126.22,
                  "y": 183.56,
                  "x0": -2.3489869814455786,
                  "y0": 50.002962521895284,
                  "z0": 5.744800299337501,
                  "aX": 0.16813350944558453
                },
                "breaks": {
                  "breakAngle": 1.2,
                  "breakLength": 9.6,
                  "breakY": 24.0,
                  "spinRate": 2399,
                  "spinDirection": 58
                },
                "zone": 5,
                "typeConfidence": 0.88,
                "plateTime": 0.4339390919658652,
                "extension": 6.246107403844631
              },
              "index": 8,
              "playId": "4ce9596e-9d39-4742-b7b7-d6bcaacbc5f3",
              "pitchNumber": 9,
              "startTime": "2022-11-02T02:52:43.950Z",
              "endTime": "2022-11-02T02:52:51.486Z",
              "isPitch": true,
              "type": "pitch"
            },
            {
              "details": {
                "call": { "code": "B", "description": "Ball" },
                "description": "Ball",
                "code": "B",
                "ballColor": "rgba(39, 161, 39, 1.0)",
                "trailColor": "rgba(0, 0, 254, 1.0)",
                "isInPlay": false,
                "isStrike": false,
                "isBall": true,
                "type": { "code": "SL", "description": "Slider" },
                "isOut": false,
                "hasReview": false
              },
              "count": { "balls": 3, "strikes": 2, "outs": 2 },
              "pitchData": {
                "startSpeed": 88.3,
                "endSpeed": 80.8,
                "strikeZoneTop": 3.21806951068304,
                "strikeZoneBottom": 1.50702194576122,
                "coordinates": {
                  "aY": 28.97699487113875,
                  "aZ": -33.72711241220495,
                  "pfxX": -0.47884507139778254,
                  "pfxZ": -0.9406424845095986,
                  "pX": 1.0241988088607683,
                  "pZ": 0.8387806576494453,
                  "vX0": 8.240491940581153,
                  "vY0": -128.1873824698527,
                  "vZ0": -5.298382303802557,
                  "x": 77.96,
                  "y": 216.13,
                  "x0": -2.1837631300655054,
                  "y0": 50.00419854345547,
                  "z0": 5.596549176149193,
                  "aX": -0.7894070817672254
                },
                "breaks": {
                  "breakAngle": 1.2,
                  "breakLength": 8.4,
                  "breakY": 24.0,
                  "spinRate": 2290,
                  "spinDirection": 54
                },
                "zone": 14,
                "typeConfidence": 0.92,
                "plateTime": 0.428934140980215,
                "extension": 6.266538199317491
              },
              "index": 9,
              "playId": "ef82d14a-334c-4bf4-9a0a-5072b4af7367",
              "pitchNumber": 10,
              "startTime": "2022-11-02T02:53:27.052Z",
              "endTime": "2022-11-02T02:53:30.756Z",
              "isPitch": true,
              "type": "pitch"
            },
            {
              "details": {
                "call": { "code": "B", "description": "Ball" },
                "description": "Ball",
                "code": "B",
                "ballColor": "rgba(39, 161, 39, 1.0)",
                "trailColor": "rgba(188, 0, 33, 1.0)",
                "isInPlay": false,
                "isStrike": false,
                "isBall": true,
                "type": { "code": "FF", "description": "Four-Seam Fastball" },
                "isOut": false,
                "hasReview": false,
                "runnerGoing": true
              },
              "count": { "balls": 4, "strikes": 2, "outs": 2 },
              "pitchData": {
                "startSpeed": 95.9,
                "endSpeed": 87.7,
                "strikeZoneTop": 3.19224538809226,
                "strikeZoneBottom": 1.46983030921795,
                "coordinates": {
                  "aY": 30.978968988375094,
                  "aZ": -12.473764018866218,
                  "pfxX": -2.968697821956921,
                  "pfxZ": 10.054610534322771,
                  "pX": 2.0126352173257427,
                  "pZ": 2.5345052452147163,
                  "vX0": 12.108288439750464,
                  "vY0": -139.04153652723758,
                  "vZ0": -6.066154617548133,
                  "x": 40.28,
                  "y": 170.35,
                  "x0": -2.011640127156949,
                  "y0": 50.004383495227664,
                  "z0": 5.571312979475217,
                  "aX": -5.820113222623189
                },
                "breaks": {
                  "breakAngle": 13.2,
                  "breakLength": 2.4,
                  "breakY": 24.0,
                  "spinRate": 2227,
                  "spinDirection": 198
                },
                "zone": 12,
                "typeConfidence": 0.87,
                "plateTime": 0.3938364963207621,
                "extension": 6.376664372976459
              },
              "index": 10,
              "playId": "3c48ca57-9b83-49ba-b242-0e4cd47caf57",
              "pitchNumber": 11,
              "startTime": "2022-11-02T02:53:51.460Z",
              "endTime": "2022-11-02T02:53:56.479Z",
              "isPitch": true,
              "type": "pitch"
            }
          ],
          "playEndTime": "2022-11-02T02:53:56.479Z",
          "atBatIndex": 60
        },
        {
          "result": {
            "type": "atBat",
            "event": "Flyout",
            "eventType": "field_out",
            "description": "Kyle Tucker flies out to left fielder Kyle Schwarber.",
            "rbi": 0,
            "awayScore": 0,
            "homeScore": 7,
            "isOut": true
          },
          "about": {
            "atBatIndex": 61,
            "halfInning": "top",
            "isTopInning": true,
            "inning": 8,
            "startTime": "2022-11-02T02:55:28.618Z",
            "endTime": "2022-11-02T02:56:03.251Z",
            "isComplete": true,
            "isScoringPlay": false,
            "hasReview": false,
            "hasOut": true,
            "captivatingIndex": 0
          },
          "count": { "balls": 1, "strikes": 0, "outs": 3 },
          "matchup": {
            "batter": {
              "id": 663656,
              "fullName": "Kyle Tucker",
              "link": "/api/v1/people/663656"
            },
            "batSide": { "code": "L", "description": "Left" },
            "pitcher": {
              "id": 656793,
              "fullName": "Nick Nelson",
              "link": "/api/v1/people/656793"
            },
            "pitchHand": { "code": "R", "description": "Right" },
            "batterHotColdZones": [],
            "pitcherHotColdZones": [],
            "splits": {
              "batter": "vs_RHP",
              "pitcher": "vs_LHB",
              "menOnBase": "Empty"
            }
          },
          "pitchIndex": [1, 2],
          "actionIndex": [0],
          "runnerIndex": [0],
          "runners": [
            {
              "movement": {
                "originBase": null,
                "start": null,
                "end": null,
                "outBase": "1B",
                "isOut": true,
                "outNumber": 3
              },
              "details": {
                "event": "Flyout",
                "eventType": "field_out",
                "movementReason": null,
                "runner": {
                  "id": 663656,
                  "fullName": "Kyle Tucker",
                  "link": "/api/v1/people/663656"
                },
                "responsiblePitcher": null,
                "isScoringEvent": false,
                "rbi": false,
                "earned": false,
                "teamUnearned": false,
                "playIndex": 2
              },
              "credits": [
                {
                  "player": { "id": 656941, "link": "/api/v1/people/656941" },
                  "position": {
                    "code": "7",
                    "name": "Outfielder",
                    "type": "Outfielder",
                    "abbreviation": "LF"
                  },
                  "credit": "f_putout"
                }
              ]
            }
          ],
          "playEvents": [
            {
              "details": {
                "description": "Mound visit.",
                "event": "Game Advisory",
                "eventType": "game_advisory",
                "awayScore": 0,
                "homeScore": 7,
                "isScoringPlay": false,
                "isOut": false,
                "hasReview": false
              },
              "count": { "balls": 0, "strikes": 0, "outs": 2 },
              "index": 0,
              "startTime": "2022-11-02T02:54:14.175Z",
              "endTime": "2022-11-02T02:55:30.913Z",
              "isPitch": false,
              "type": "action",
              "player": { "id": 663656, "link": "/api/v1/people/663656" }
            },
            {
              "details": {
                "call": { "code": "B", "description": "Ball" },
                "description": "Ball",
                "code": "B",
                "ballColor": "rgba(39, 161, 39, 1.0)",
                "trailColor": "rgba(0, 85, 254, 1.0)",
                "isInPlay": false,
                "isStrike": false,
                "isBall": true,
                "type": { "code": "CH", "description": "Changeup" },
                "isOut": false,
                "hasReview": false
              },
              "count": { "balls": 1, "strikes": 0, "outs": 2 },
              "pitchData": {
                "startSpeed": 89.5,
                "endSpeed": 81.9,
                "strikeZoneTop": 3.60496637964331,
                "strikeZoneBottom": 1.67764024397582,
                "coordinates": {
                  "aY": 27.917259094495538,
                  "aZ": -23.525130110461195,
                  "pfxX": -10.769173232422359,
                  "pfxZ": 5.081961326944394,
                  "pX": 0.47380654207883743,
                  "pZ": 1.1282238818063126,
                  "vX0": 10.146150490525832,
                  "vY0": -129.8259943007768,
                  "vZ0": -7.0406960935340965,
                  "x": 98.94,
                  "y": 208.32,
                  "x0": -2.0912707054938244,
                  "y0": 50.00493636738154,
                  "z0": 5.673777599363968,
                  "aX": -18.332822622828054
                },
                "breaks": {
                  "breakAngle": 33.6,
                  "breakLength": 7.2,
                  "breakY": 24.0,
                  "spinRate": 2017,
                  "spinDirection": 240
                },
                "zone": 14,
                "typeConfidence": 0.89,
                "plateTime": 0.4223746754160391,
                "extension": 6.1019551194083235
              },
              "index": 1,
              "playId": "e5f7e1ae-fc97-4f53-810f-fc389400f521",
              "pitchNumber": 1,
              "startTime": "2022-11-02T02:55:30.913Z",
              "endTime": "2022-11-02T02:55:34.248Z",
              "isPitch": true,
              "type": "pitch"
            },
            {
              "details": {
                "call": { "code": "X", "description": "In play, out(s)" },
                "description": "In play, out(s)",
                "code": "X",
                "ballColor": "rgba(26, 86, 190, 1.0)",
                "trailColor": "rgba(188, 0, 33, 1.0)",
                "isInPlay": true,
                "isStrike": false,
                "isBall": false,
                "type": { "code": "FF", "description": "Four-Seam Fastball" },
                "isOut": true,
                "hasReview": false
              },
              "count": { "balls": 1, "strikes": 0, "outs": 2 },
              "pitchData": {
                "startSpeed": 96.5,
                "endSpeed": 87.4,
                "strikeZoneTop": 3.64,
                "strikeZoneBottom": 1.74,
                "coordinates": {
                  "aY": 34.34620761723771,
                  "aZ": -10.706110241433443,
                  "pfxX": -5.55218807311805,
                  "pfxZ": 10.860913203268506,
                  "pX": -0.4684609998196096,
                  "pZ": 3.471828127769336,
                  "vX0": 6.914837994399492,
                  "vY0": -140.31910315797617,
                  "vZ0": -4.309973410894544,
                  "x": 134.86,
                  "y": 145.04,
                  "x0": -2.253545270361625,
                  "y0": 50.00193322722017,
                  "z0": 5.736040049516132,
                  "aX": -10.974399163931764
                },
                "breaks": {
                  "breakAngle": 38.4,
                  "breakLength": 3.6,
                  "breakY": 24.0,
                  "spinRate": 2277,
                  "spinDirection": 205
                },
                "zone": 1,
                "typeConfidence": 0.91,
                "plateTime": 0.39166380853376825,
                "extension": 6.2868857351115315
              },
              "hitData": {
                "launchSpeed": 93.7,
                "launchAngle": 32.0,
                "totalDistance": 325.0,
                "trajectory": "fly_ball",
                "hardness": "medium",
                "location": "7",
                "coordinates": { "coordX": 45.77, "coordY": 94.95 }
              },
              "index": 2,
              "playId": "ef0b8eed-ad71-46f9-b0fe-2e3c9b666c26",
              "pitchNumber": 2,
              "startTime": "2022-11-02T02:55:53.783Z",
              "endTime": "2022-11-02T02:56:03.251Z",
              "isPitch": true,
              "type": "pitch"
            }
          ],
          "playEndTime": "2022-11-02T02:56:03.251Z",
          "atBatIndex": 61
        },
        {
          "result": {
            "type": "atBat",
            "event": "Pop Out",
            "eventType": "field_out",
            "description": "Bryce Harper pops out to third baseman Alex Bregman.",
            "rbi": 0,
            "awayScore": 0,
            "homeScore": 7,
            "isOut": true
          },
          "about": {
            "atBatIndex": 62,
            "halfInning": "bottom",
            "isTopInning": false,
            "inning": 8,
            "startTime": "2022-11-02T02:58:49.880Z",
            "endTime": "2022-11-02T03:00:39.391Z",
            "isComplete": true,
            "isScoringPlay": false,
            "hasReview": false,
            "hasOut": true,
            "captivatingIndex": 0
          },
          "count": { "balls": 1, "strikes": 2, "outs": 1 },
          "matchup": {
            "batter": {
              "id": 547180,
              "fullName": "Bryce Harper",
              "link": "/api/v1/people/547180"
            },
            "batSide": { "code": "L", "description": "Left" },
            "pitcher": {
              "id": 664353,
              "fullName": "Jose Urquidy",
              "link": "/api/v1/people/664353"
            },
            "pitchHand": { "code": "R", "description": "Right" },
            "batterHotColdZones": [],
            "pitcherHotColdZones": [],
            "splits": {
              "batter": "vs_RHP",
              "pitcher": "vs_LHB",
              "menOnBase": "Empty"
            }
          },
          "pitchIndex": [0, 1, 2, 3],
          "actionIndex": [],
          "runnerIndex": [0],
          "runners": [
            {
              "movement": {
                "originBase": null,
                "start": null,
                "end": null,
                "outBase": "1B",
                "isOut": true,
                "outNumber": 1
              },
              "details": {
                "event": "Pop Out",
                "eventType": "field_out",
                "movementReason": null,
                "runner": {
                  "id": 547180,
                  "fullName": "Bryce Harper",
                  "link": "/api/v1/people/547180"
                },
                "responsiblePitcher": null,
                "isScoringEvent": false,
                "rbi": false,
                "earned": false,
                "teamUnearned": false,
                "playIndex": 3
              },
              "credits": [
                {
                  "player": { "id": 608324, "link": "/api/v1/people/608324" },
                  "position": {
                    "code": "5",
                    "name": "Third Base",
                    "type": "Infielder",
                    "abbreviation": "3B"
                  },
                  "credit": "f_putout"
                }
              ]
            }
          ],
          "playEvents": [
            {
              "details": {
                "call": { "code": "F", "description": "Foul" },
                "description": "Foul",
                "code": "F",
                "ballColor": "rgba(170, 21, 11, 1.0)",
                "trailColor": "rgba(188, 0, 33, 1.0)",
                "isInPlay": false,
                "isStrike": true,
                "isBall": false,
                "type": { "code": "FF", "description": "Four-Seam Fastball" },
                "isOut": false,
                "hasReview": false
              },
              "count": { "balls": 0, "strikes": 1, "outs": 0 },
              "pitchData": {
                "startSpeed": 93.2,
                "endSpeed": 85.1,
                "strikeZoneTop": 3.25,
                "strikeZoneBottom": 1.61,
                "coordinates": {
                  "aY": 29.681782640168706,
                  "aZ": -9.86273276124771,
                  "pfxX": -5.608560448593474,
                  "pfxZ": 11.997931277294313,
                  "pX": 0.12891486697776436,
                  "pZ": 2.9402305169115808,
                  "vX0": 4.381021069359608,
                  "vY0": -135.51282878218828,
                  "vZ0": -6.721928671285702,
                  "x": 112.09,
                  "y": 159.39,
                  "x0": -0.7802490365510169,
                  "y0": 50.001735242297514,
                  "z0": 6.142339966874108,
                  "aX": -10.427989300428472
                },
                "breaks": {
                  "breakAngle": 39.6,
                  "breakLength": 3.6,
                  "breakY": 24.0,
                  "spinRate": 2233,
                  "spinDirection": 203
                },
                "zone": 2,
                "typeConfidence": 0.9,
                "plateTime": 0.40424394896234217,
                "extension": 5.97550865259958
              },
              "index": 0,
              "playId": "82798382-de5d-4b3e-b2e5-cd7608fd82c9",
              "pitchNumber": 1,
              "startTime": "2022-11-02T02:59:19.583Z",
              "endTime": "2022-11-02T02:59:22.615Z",
              "isPitch": true,
              "type": "pitch"
            },
            {
              "details": {
                "call": { "code": "B", "description": "Ball" },
                "description": "Ball",
                "code": "B",
                "ballColor": "rgba(39, 161, 39, 1.0)",
                "trailColor": "rgba(188, 0, 33, 1.0)",
                "isInPlay": false,
                "isStrike": false,
                "isBall": true,
                "type": { "code": "FF", "description": "Four-Seam Fastball" },
                "isOut": false,
                "hasReview": false
              },
              "count": { "balls": 1, "strikes": 1, "outs": 0 },
              "pitchData": {
                "startSpeed": 93.9,
                "endSpeed": 85.5,
                "strikeZoneTop": 3.21806951068304,
                "strikeZoneBottom": 1.60695541082108,
                "coordinates": {
                  "aY": 31.02128380694434,
                  "aZ": -9.408290787969353,
                  "pfxX": -5.12611672171651,
                  "pfxZ": 12.082315461651728,
                  "pX": 0.7581411932267311,
                  "pZ": 3.972450752916349,
                  "vX0": 5.749511718081612,
                  "vY0": -136.62113760925845,
                  "vZ0": -4.754223101275002,
                  "x": 88.1,
                  "y": 131.52,
                  "x0": -0.7108697495527576,
                  "y0": 50.00095803903474,
                  "z0": 6.38588668898162,
                  "aX": -9.657737500900847
                },
                "breaks": {
                  "breakAngle": 38.4,
                  "breakLength": 2.4,
                  "breakY": 24.0,
                  "spinRate": 2288,
                  "spinDirection": 200
                },
                "zone": 12,
                "typeConfidence": 0.91,
                "plateTime": 0.4014119938251257,
                "extension": 5.977388056379919
              },
              "index": 1,
              "playId": "7aa99846-d884-4d07-9c25-67da5b6db2e0",
              "pitchNumber": 2,
              "startTime": "2022-11-02T02:59:43.776Z",
              "endTime": "2022-11-02T02:59:47.211Z",
              "isPitch": true,
              "type": "pitch"
            },
            {
              "details": {
                "call": { "code": "T", "description": "Foul Tip" },
                "description": "Foul Tip",
                "code": "T",
                "ballColor": "rgba(170, 21, 11, 1.0)",
                "trailColor": "rgba(188, 0, 33, 1.0)",
                "isInPlay": false,
                "isStrike": true,
                "isBall": false,
                "type": { "code": "FF", "description": "Four-Seam Fastball" },
                "isOut": false,
                "hasReview": false
              },
              "count": { "balls": 1, "strikes": 2, "outs": 0 },
              "pitchData": {
                "startSpeed": 93.5,
                "endSpeed": 84.9,
                "strikeZoneTop": 3.25,
                "strikeZoneBottom": 1.61,
                "coordinates": {
                  "aY": 31.317821500330243,
                  "aZ": -8.779123961729274,
                  "pfxX": -5.145527630448034,
                  "pfxZ": 12.570380163723971,
                  "pX": 0.5689528334195915,
                  "pZ": 3.5583467336430257,
                  "vX0": 5.4992643460467185,
                  "vY0": -135.92524060312192,
                  "vZ0": -5.672027286546215,
                  "x": 95.31,
                  "y": 142.7,
                  "x0": -0.8172072618033623,
                  "y0": 50.001649825164876,
                  "z0": 6.289370031043222,
                  "aX": -9.575516427136563
                },
                "breaks": {
                  "breakAngle": 39.6,
                  "breakLength": 2.4,
                  "breakY": 24.0,
                  "spinRate": 2291,
                  "spinDirection": 200
                },
                "zone": 12,
                "typeConfidence": 0.91,
                "plateTime": 0.40382314066309855,
                "extension": 5.957193124963668
              },
              "index": 2,
              "playId": "c308b38c-b5b2-4bde-8e6c-3edb93d98717",
              "pitchNumber": 3,
              "startTime": "2022-11-02T03:00:04.574Z",
              "endTime": "2022-11-02T03:00:08.328Z",
              "isPitch": true,
              "type": "pitch"
            },
            {
              "details": {
                "call": { "code": "X", "description": "In play, out(s)" },
                "description": "In play, out(s)",
                "code": "X",
                "ballColor": "rgba(26, 86, 190, 1.0)",
                "trailColor": "rgba(188, 0, 33, 1.0)",
                "isInPlay": true,
                "isStrike": false,
                "isBall": false,
                "type": { "code": "FF", "description": "Four-Seam Fastball" },
                "isOut": true,
                "hasReview": false
              },
              "count": { "balls": 1, "strikes": 2, "outs": 0 },
              "pitchData": {
                "startSpeed": 93.8,
                "endSpeed": 85.4,
                "strikeZoneTop": 3.25,
                "strikeZoneBottom": 1.61,
                "coordinates": {
                  "aY": 31.13344996335766,
                  "aZ": -9.087583701093994,
                  "pfxX": -5.252599622837694,
                  "pfxZ": 12.303053934853562,
                  "pX": 0.4739491767332731,
                  "pZ": 3.314476765957887,
                  "vX0": 5.127819875486749,
                  "vY0": -136.40274457640461,
                  "vZ0": -6.4568925375827515,
                  "x": 98.93,
                  "y": 149.29,
                  "x0": -0.7515638212478186,
                  "y0": 50.00644914444311,
                  "z0": 6.34523101628662,
                  "aX": -9.86000488965907
                },
                "breaks": {
                  "breakAngle": 39.6,
                  "breakLength": 2.4,
                  "breakY": 24.0,
                  "spinRate": 2264,
                  "spinDirection": 199
                },
                "zone": 3,
                "typeConfidence": 0.91,
                "plateTime": 0.40216646503214015,
                "extension": 5.825400822309768
              },
              "hitData": {
                "launchSpeed": 93.7,
                "launchAngle": 66.0,
                "totalDistance": 161.0,
                "trajectory": "popup",
                "hardness": "medium",
                "location": "5",
                "coordinates": { "coordX": 97.78, "coordY": 137.39 }
              },
              "index": 3,
              "playId": "74af77a7-2ec3-4511-9b82-d8b2e0322d33",
              "pitchNumber": 4,
              "startTime": "2022-11-02T03:00:29.468Z",
              "endTime": "2022-11-02T03:00:39.391Z",
              "isPitch": true,
              "type": "pitch"
            }
          ],
          "playEndTime": "2022-11-02T03:00:39.391Z",
          "atBatIndex": 62
        },
        {
          "result": {
            "type": "atBat",
            "event": "Strikeout",
            "eventType": "strikeout",
            "description": "Nick Castellanos strikes out swinging.",
            "rbi": 0,
            "awayScore": 0,
            "homeScore": 7,
            "isOut": true
          },
          "about": {
            "atBatIndex": 63,
            "halfInning": "bottom",
            "isTopInning": false,
            "inning": 8,
            "startTime": "2022-11-02T03:00:50.778Z",
            "endTime": "2022-11-02T03:02:48.263Z",
            "isComplete": true,
            "isScoringPlay": false,
            "hasReview": false,
            "hasOut": true,
            "captivatingIndex": 14
          },
          "count": { "balls": 2, "strikes": 3, "outs": 2 },
          "matchup": {
            "batter": {
              "id": 592206,
              "fullName": "Nick Castellanos",
              "link": "/api/v1/people/592206"
            },
            "batSide": { "code": "R", "description": "Right" },
            "pitcher": {
              "id": 664353,
              "fullName": "Jose Urquidy",
              "link": "/api/v1/people/664353"
            },
            "pitchHand": { "code": "R", "description": "Right" },
            "batterHotColdZones": [],
            "pitcherHotColdZones": [],
            "splits": {
              "batter": "vs_RHP",
              "pitcher": "vs_RHB",
              "menOnBase": "Empty"
            }
          },
          "pitchIndex": [0, 1, 2, 3, 4],
          "actionIndex": [],
          "runnerIndex": [0],
          "runners": [
            {
              "movement": {
                "originBase": null,
                "start": null,
                "end": null,
                "outBase": "1B",
                "isOut": true,
                "outNumber": 2
              },
              "details": {
                "event": "Strikeout",
                "eventType": "strikeout",
                "movementReason": null,
                "runner": {
                  "id": 592206,
                  "fullName": "Nick Castellanos",
                  "link": "/api/v1/people/592206"
                },
                "responsiblePitcher": null,
                "isScoringEvent": false,
                "rbi": false,
                "earned": false,
                "teamUnearned": false,
                "playIndex": 4
              },
              "credits": [
                {
                  "player": { "id": 455117, "link": "/api/v1/people/455117" },
                  "position": {
                    "code": "2",
                    "name": "Catcher",
                    "type": "Catcher",
                    "abbreviation": "C"
                  },
                  "credit": "f_putout"
                }
              ]
            }
          ],
          "playEvents": [
            {
              "details": {
                "call": { "code": "B", "description": "Ball" },
                "description": "Ball",
                "code": "B",
                "ballColor": "rgba(39, 161, 39, 1.0)",
                "trailColor": "rgba(0, 0, 254, 1.0)",
                "isInPlay": false,
                "isStrike": false,
                "isBall": true,
                "type": { "code": "SL", "description": "Slider" },
                "isOut": false,
                "hasReview": false
              },
              "count": { "balls": 1, "strikes": 0, "outs": 1 },
              "pitchData": {
                "startSpeed": 80.0,
                "endSpeed": 73.4,
                "strikeZoneTop": 3.73372977294263,
                "strikeZoneBottom": 1.83338843602292,
                "coordinates": {
                  "aY": 24.18263251289397,
                  "aZ": -31.056805816369895,
                  "pfxX": 9.035857869623461,
                  "pfxZ": 0.823835482422953,
                  "pX": 1.4775048445102412,
                  "pZ": 1.6439554311277806,
                  "vX0": 4.957198833773651,
                  "vY0": -116.43092152355291,
                  "vZ0": -2.9142182507003795,
                  "x": 60.68,
                  "y": 194.39,
                  "x0": -1.8611681819997863,
                  "y0": 50.00307402347843,
                  "z0": 5.884925661115388,
                  "aX": 12.264132738646397
                },
                "breaks": {
                  "breakAngle": 22.8,
                  "breakLength": 10.8,
                  "breakY": 24.0,
                  "spinRate": 2672,
                  "spinDirection": 55
                },
                "zone": 14,
                "typeConfidence": 0.9,
                "plateTime": 0.4724938428967431,
                "extension": 5.86583029106101
              },
              "index": 0,
              "playId": "5648bc2c-938c-4321-b064-18f654d84efd",
              "pitchNumber": 1,
              "startTime": "2022-11-02T03:01:20.493Z",
              "endTime": "2022-11-02T03:01:25.817Z",
              "isPitch": true,
              "type": "pitch"
            },
            {
              "details": {
                "call": { "code": "C", "description": "Called Strike" },
                "description": "Called Strike",
                "code": "C",
                "ballColor": "rgba(170, 21, 11, 1.0)",
                "trailColor": "rgba(188, 0, 33, 1.0)",
                "isInPlay": false,
                "isStrike": true,
                "isBall": false,
                "type": { "code": "FF", "description": "Four-Seam Fastball" },
                "isOut": false,
                "hasReview": false
              },
              "count": { "balls": 1, "strikes": 1, "outs": 1 },
              "pitchData": {
                "startSpeed": 93.8,
                "endSpeed": 85.5,
                "strikeZoneTop": 3.70798548837165,
                "strikeZoneBottom": 1.80743719011992,
                "coordinates": {
                  "aY": 30.51055158498878,
                  "aZ": -10.262266147927527,
                  "pfxX": -7.90488421680246,
                  "pfxZ": 11.706868007294695,
                  "pX": 0.500484450654875,
                  "pZ": 1.8378096030247126,
                  "vX0": 6.816578204244822,
                  "vY0": -136.10716593966487,
                  "vZ0": -9.372531020041846,
                  "x": 97.92,
                  "y": 189.16,
                  "x0": -1.0122222270822385,
                  "y0": 50.00326167297377,
                  "z0": 6.041261232554228,
                  "aX": -14.797608378825903
                },
                "breaks": {
                  "breakAngle": 46.8,
                  "breakLength": 3.6,
                  "breakY": 24.0,
                  "spinRate": 2320,
                  "spinDirection": 209
                },
                "zone": 9,
                "typeConfidence": 0.89,
                "plateTime": 0.40277263324224233,
                "extension": 5.975174430314019
              },
              "index": 1,
              "playId": "a691aa54-d8fb-41be-815a-af05360b90a5",
              "pitchNumber": 2,
              "startTime": "2022-11-02T03:01:37.520Z",
              "endTime": "2022-11-02T03:01:41.034Z",
              "isPitch": true,
              "type": "pitch"
            },
            {
              "details": {
                "call": { "code": "B", "description": "Ball" },
                "description": "Ball",
                "code": "B",
                "ballColor": "rgba(39, 161, 39, 1.0)",
                "trailColor": "rgba(0, 85, 254, 1.0)",
                "isInPlay": false,
                "isStrike": false,
                "isBall": true,
                "type": { "code": "CH", "description": "Changeup" },
                "isOut": false,
                "hasReview": false
              },
              "count": { "balls": 2, "strikes": 1, "outs": 1 },
              "pitchData": {
                "startSpeed": 87.6,
                "endSpeed": 80.3,
                "strikeZoneTop": 3.75946981273504,
                "strikeZoneBottom": 1.85933690688847,
                "coordinates": {
                  "aY": 26.616058936399256,
                  "aZ": -17.77845058896976,
                  "pfxX": -11.094892110767047,
                  "pfxZ": 8.851848455664161,
                  "pX": 0.3954865777787621,
                  "pZ": -0.3695559438702016,
                  "vX0": 7.901561330098894,
                  "vY0": -126.88591044386162,
                  "vZ0": -11.553775868485289,
                  "x": 101.92,
                  "y": 248.76,
                  "x0": -1.3216974136614812,
                  "y0": 50.001378157475656,
                  "z0": 5.667651511970105,
                  "aX": -18.040988113145126
                },
                "breaks": {
                  "breakAngle": 39.6,
                  "breakLength": 6.0,
                  "breakY": 24.0,
                  "spinRate": 2129,
                  "spinDirection": 231
                },
                "zone": 14,
                "typeConfidence": 0.9,
                "plateTime": 0.4321016050826274,
                "extension": 6.328174385576484
              },
              "index": 2,
              "playId": "1d89c11f-ac7c-40d4-b0a9-fa1993cb4f89",
              "pitchNumber": 3,
              "startTime": "2022-11-02T03:01:56.380Z",
              "endTime": "2022-11-02T03:01:59.509Z",
              "isPitch": true,
              "type": "pitch"
            },
            {
              "details": {
                "call": { "code": "S", "description": "Swinging Strike" },
                "description": "Swinging Strike",
                "code": "S",
                "ballColor": "rgba(170, 21, 11, 1.0)",
                "trailColor": "rgba(0, 85, 254, 1.0)",
                "isInPlay": false,
                "isStrike": true,
                "isBall": false,
                "type": { "code": "CH", "description": "Changeup" },
                "isOut": false,
                "hasReview": false
              },
              "count": { "balls": 2, "strikes": 2, "outs": 1 },
              "pitchData": {
                "startSpeed": 85.6,
                "endSpeed": 77.8,
                "strikeZoneTop": 3.69,
                "strikeZoneBottom": 1.8,
                "coordinates": {
                  "aY": 27.20026085606005,
                  "aZ": -18.5922457182775,
                  "pfxX": -10.025273763582064,
                  "pfxZ": 8.771223292273568,
                  "pX": -0.5514901053235107,
                  "pZ": 1.331417756683946,
                  "vX0": 5.191645711393954,
                  "vY0": -124.27895280086997,
                  "vZ0": -7.5790667960657885,
                  "x": 138.02,
                  "y": 202.83,
                  "x0": -1.3758566005290236,
                  "y0": 50.00619721208644,
                  "z0": 5.990635519409774,
                  "aX": -15.530444905924885
                },
                "breaks": {
                  "breakAngle": 36.0,
                  "breakLength": 6.0,
                  "breakY": 24.0,
                  "spinRate": 2073,
                  "spinDirection": 230
                },
                "zone": 13,
                "typeConfidence": 0.91,
                "plateTime": 0.44240910936988653,
                "extension": 6.225094230666855
              },
              "index": 3,
              "playId": "9aad8cec-05ad-4006-9e48-c3729ac4b708",
              "pitchNumber": 4,
              "startTime": "2022-11-02T03:02:19.347Z",
              "endTime": "2022-11-02T03:02:23.197Z",
              "isPitch": true,
              "type": "pitch"
            },
            {
              "details": {
                "call": { "code": "S", "description": "Swinging Strike" },
                "description": "Swinging Strike",
                "code": "S",
                "ballColor": "rgba(170, 21, 11, 1.0)",
                "trailColor": "rgba(0, 85, 254, 1.0)",
                "isInPlay": false,
                "isStrike": true,
                "isBall": false,
                "type": { "code": "CH", "description": "Changeup" },
                "isOut": true,
                "hasReview": false
              },
              "count": { "balls": 2, "strikes": 3, "outs": 1 },
              "pitchData": {
                "startSpeed": 86.7,
                "endSpeed": 79.1,
                "strikeZoneTop": 3.69,
                "strikeZoneBottom": 1.8,
                "coordinates": {
                  "aY": 26.814020086453727,
                  "aZ": -20.053757596014076,
                  "pfxX": -9.74311856934649,
                  "pfxZ": 7.5832430171726175,
                  "pX": -0.09420216995025583,
                  "pZ": 2.0525095795803505,
                  "vX0": 5.471271252878937,
                  "vY0": -125.97661127067083,
                  "vZ0": -5.624864670151187,
                  "x": 120.59,
                  "y": 183.36,
                  "x0": -1.034033879056825,
                  "y0": 50.006014696168386,
                  "z0": 5.947126146803399,
                  "aX": -15.582960924691813
                },
                "breaks": {
                  "breakAngle": 34.8,
                  "breakLength": 6.0,
                  "breakY": 24.0,
                  "spinRate": 2050,
                  "spinDirection": 235
                },
                "zone": 8,
                "typeConfidence": 0.9,
                "plateTime": 0.4356300516084719,
                "extension": 6.100085771735761
              },
              "index": 4,
              "playId": "b00ee7ea-2417-4b69-85ca-182643afab1c",
              "pitchNumber": 5,
              "startTime": "2022-11-02T03:02:43.560Z",
              "endTime": "2022-11-02T03:02:48.263Z",
              "isPitch": true,
              "type": "pitch"
            }
          ],
          "playEndTime": "2022-11-02T03:02:48.263Z",
          "atBatIndex": 63
        },
        {
          "result": {
            "type": "atBat",
            "event": "Flyout",
            "eventType": "field_out",
            "description": "Alec Bohm flies out to right fielder Kyle Tucker in foul territory.",
            "rbi": 0,
            "awayScore": 0,
            "homeScore": 7,
            "isOut": true
          },
          "about": {
            "atBatIndex": 64,
            "halfInning": "bottom",
            "isTopInning": false,
            "inning": 8,
            "startTime": "2022-11-02T03:02:58.854Z",
            "endTime": "2022-11-02T03:03:57.753Z",
            "isComplete": true,
            "isScoringPlay": false,
            "hasReview": false,
            "hasOut": true,
            "captivatingIndex": 0
          },
          "count": { "balls": 1, "strikes": 0, "outs": 3 },
          "matchup": {
            "batter": {
              "id": 664761,
              "fullName": "Alec Bohm",
              "link": "/api/v1/people/664761"
            },
            "batSide": { "code": "R", "description": "Right" },
            "pitcher": {
              "id": 664353,
              "fullName": "Jose Urquidy",
              "link": "/api/v1/people/664353"
            },
            "pitchHand": { "code": "R", "description": "Right" },
            "batterHotColdZones": [],
            "pitcherHotColdZones": [],
            "splits": {
              "batter": "vs_RHP",
              "pitcher": "vs_RHB",
              "menOnBase": "Empty"
            }
          },
          "pitchIndex": [0, 1],
          "actionIndex": [],
          "runnerIndex": [0],
          "runners": [
            {
              "movement": {
                "originBase": null,
                "start": null,
                "end": null,
                "outBase": "1B",
                "isOut": true,
                "outNumber": 3
              },
              "details": {
                "event": "Flyout",
                "eventType": "field_out",
                "movementReason": null,
                "runner": {
                  "id": 664761,
                  "fullName": "Alec Bohm",
                  "link": "/api/v1/people/664761"
                },
                "responsiblePitcher": null,
                "isScoringEvent": false,
                "rbi": false,
                "earned": false,
                "teamUnearned": false,
                "playIndex": 1
              },
              "credits": [
                {
                  "player": { "id": 663656, "link": "/api/v1/people/663656" },
                  "position": {
                    "code": "9",
                    "name": "Outfielder",
                    "type": "Outfielder",
                    "abbreviation": "RF"
                  },
                  "credit": "f_putout"
                }
              ]
            }
          ],
          "playEvents": [
            {
              "details": {
                "call": { "code": "B", "description": "Ball" },
                "description": "Ball",
                "code": "B",
                "ballColor": "rgba(39, 161, 39, 1.0)",
                "trailColor": "rgba(0, 85, 254, 1.0)",
                "isInPlay": false,
                "isStrike": false,
                "isBall": true,
                "type": { "code": "CH", "description": "Changeup" },
                "isOut": false,
                "hasReview": false
              },
              "count": { "balls": 1, "strikes": 0, "outs": 2 },
              "pitchData": {
                "startSpeed": 86.5,
                "endSpeed": 79.3,
                "strikeZoneTop": 3.55343197824116,
                "strikeZoneBottom": 1.5997304406944,
                "coordinates": {
                  "aY": 25.75777863896482,
                  "aZ": -19.929349333441408,
                  "pfxX": -10.208183913715638,
                  "pfxZ": 7.671964745471639,
                  "pX": 0.6706330089631782,
                  "pZ": 1.0044628307388017,
                  "vX0": 7.721264139176723,
                  "vY0": -125.59688294809798,
                  "vZ0": -7.805884485346317,
                  "x": 91.44,
                  "y": 211.66,
                  "x0": -1.1192434417382326,
                  "y0": 50.001545257921784,
                  "z0": 5.777046518684845,
                  "aX": -16.28600677309287
                },
                "breaks": {
                  "breakAngle": 34.8,
                  "breakLength": 7.2,
                  "breakY": 24.0,
                  "spinRate": 2105,
                  "spinDirection": 232
                },
                "zone": 14,
                "typeConfidence": 0.91,
                "plateTime": 0.4363402038608566,
                "extension": 6.180142901567915
              },
              "index": 0,
              "playId": "8e0b77d6-6c8f-49bd-bf6c-7ded07e7ddcd",
              "pitchNumber": 1,
              "startTime": "2022-11-02T03:03:27.627Z",
              "endTime": "2022-11-02T03:03:30.910Z",
              "isPitch": true,
              "type": "pitch"
            },
            {
              "details": {
                "call": { "code": "X", "description": "In play, out(s)" },
                "description": "In play, out(s)",
                "code": "X",
                "ballColor": "rgba(26, 86, 190, 1.0)",
                "trailColor": "rgba(188, 0, 33, 1.0)",
                "isInPlay": true,
                "isStrike": false,
                "isBall": false,
                "type": { "code": "FF", "description": "Four-Seam Fastball" },
                "isOut": true,
                "hasReview": false
              },
              "count": { "balls": 1, "strikes": 0, "outs": 2 },
              "pitchData": {
                "startSpeed": 94.1,
                "endSpeed": 85.5,
                "strikeZoneTop": 3.46,
                "strikeZoneBottom": 1.55,
                "coordinates": {
                  "aY": 31.661555770845325,
                  "aZ": -10.98135407370973,
                  "pfxX": -6.958144834665612,
                  "pfxZ": 11.266857809008751,
                  "pX": 0.5779589883981221,
                  "pZ": 2.8714520428078103,
                  "vX0": 7.249227401316596,
                  "vY0": -136.6627116326985,
                  "vZ0": -6.309181292051256,
                  "x": 94.97,
                  "y": 161.25,
                  "x0": -1.211984529407888,
                  "y0": 50.006171172039544,
                  "z0": 5.973309821915865,
                  "aX": -13.09240387134943
                },
                "breaks": {
                  "breakAngle": 43.2,
                  "breakLength": 3.6,
                  "breakY": 24.0,
                  "spinRate": 2165,
                  "spinDirection": 213
                },
                "zone": 3,
                "typeConfidence": 0.9,
                "plateTime": 0.40163854796500553,
                "extension": 6.115246241861701
              },
              "hitData": {
                "launchSpeed": 97.1,
                "launchAngle": 42.0,
                "totalDistance": 314.0,
                "trajectory": "fly_ball",
                "hardness": "medium",
                "location": "9",
                "coordinates": { "coordX": 214.88, "coordY": 123.7 }
              },
              "index": 1,
              "playId": "b074790b-97db-4e1f-abd7-2860486d0ac8",
              "pitchNumber": 2,
              "startTime": "2022-11-02T03:03:46.759Z",
              "endTime": "2022-11-02T03:03:57.753Z",
              "isPitch": true,
              "type": "pitch"
            }
          ],
          "playEndTime": "2022-11-02T03:03:57.753Z",
          "atBatIndex": 64
        },
        {
          "result": {
            "type": "atBat",
            "event": "Pop Out",
            "eventType": "field_out",
            "description": "Yuli Gurriel pops out to second baseman Jean Segura.",
            "rbi": 0,
            "awayScore": 0,
            "homeScore": 7,
            "isOut": true
          },
          "about": {
            "atBatIndex": 65,
            "halfInning": "top",
            "isTopInning": true,
            "inning": 9,
            "startTime": "2022-11-02T03:07:24.959Z",
            "endTime": "2022-11-02T03:07:57.769Z",
            "isComplete": true,
            "isScoringPlay": false,
            "hasReview": false,
            "hasOut": true,
            "captivatingIndex": 0
          },
          "count": { "balls": 0, "strikes": 1, "outs": 1 },
          "matchup": {
            "batter": {
              "id": 493329,
              "fullName": "Yuli Gurriel",
              "link": "/api/v1/people/493329"
            },
            "batSide": { "code": "R", "description": "Right" },
            "pitcher": {
              "id": 571479,
              "fullName": "Andrew Bellatti",
              "link": "/api/v1/people/571479"
            },
            "pitchHand": { "code": "R", "description": "Right" },
            "batterHotColdZones": [],
            "pitcherHotColdZones": [],
            "splits": {
              "batter": "vs_RHP",
              "pitcher": "vs_RHB",
              "menOnBase": "Empty"
            }
          },
          "pitchIndex": [3, 4],
          "actionIndex": [0, 1, 2],
          "runnerIndex": [0],
          "runners": [
            {
              "movement": {
                "originBase": null,
                "start": null,
                "end": null,
                "outBase": "1B",
                "isOut": true,
                "outNumber": 1
              },
              "details": {
                "event": "Pop Out",
                "eventType": "field_out",
                "movementReason": null,
                "runner": {
                  "id": 493329,
                  "fullName": "Yuli Gurriel",
                  "link": "/api/v1/people/493329"
                },
                "responsiblePitcher": null,
                "isScoringEvent": false,
                "rbi": false,
                "earned": false,
                "teamUnearned": false,
                "playIndex": 4
              },
              "credits": [
                {
                  "player": { "id": 516416, "link": "/api/v1/people/516416" },
                  "position": {
                    "code": "4",
                    "name": "Second Base",
                    "type": "Infielder",
                    "abbreviation": "2B"
                  },
                  "credit": "f_putout"
                }
              ]
            }
          ],
          "playEvents": [
            {
              "details": {
                "description": "Defensive Substitution: Matt Vierling replaces right fielder Nick Castellanos, batting 5th, playing right field.",
                "event": "Defensive Sub",
                "eventType": "defensive_substitution",
                "awayScore": 0,
                "homeScore": 7,
                "isScoringPlay": false,
                "isOut": false,
                "hasReview": false
              },
              "count": { "balls": 0, "strikes": 0, "outs": 0 },
              "index": 0,
              "startTime": "2022-11-02T03:06:40.454Z",
              "endTime": "2022-11-02T03:06:40.473Z",
              "isPitch": false,
              "isSubstitution": true,
              "type": "action",
              "player": { "id": 663837, "link": "/api/v1/people/663837" },
              "position": {
                "code": "9",
                "name": "Outfielder",
                "type": "Outfielder",
                "abbreviation": "RF"
              },
              "battingOrder": "501",
              "replacedPlayer": { "id": 592206, "link": "/api/v1/people/592206" }
            },
            {
              "details": {
                "description": "Defensive Substitution: Edmundo Sosa replaces third baseman Alec Bohm, batting 6th, playing third base.",
                "event": "Defensive Sub",
                "eventType": "defensive_substitution",
                "awayScore": 0,
                "homeScore": 7,
                "isScoringPlay": false,
                "isOut": false,
                "hasReview": false
              },
              "count": { "balls": 0, "strikes": 0, "outs": 0 },
              "index": 1,
              "startTime": "2022-11-02T03:06:40.473Z",
              "endTime": "2022-11-02T03:06:40.475Z",
              "isPitch": false,
              "isSubstitution": true,
              "type": "action",
              "player": { "id": 624641, "link": "/api/v1/people/624641" },
              "position": {
                "code": "5",
                "name": "Third Base",
                "type": "Infielder",
                "abbreviation": "3B"
              },
              "battingOrder": "601",
              "replacedPlayer": { "id": 664761, "link": "/api/v1/people/664761" }
            },
            {
              "details": {
                "description": "Pitching Change: Andrew Bellatti replaces Nick Nelson.",
                "event": "Pitching Substitution",
                "eventType": "pitching_substitution",
                "awayScore": 0,
                "homeScore": 7,
                "isScoringPlay": false,
                "isOut": false,
                "hasReview": false
              },
              "count": { "balls": 0, "strikes": 0, "outs": 0 },
              "index": 2,
              "startTime": "2022-11-02T03:06:40.475Z",
              "endTime": "2022-11-02T03:07:27.253Z",
              "isPitch": false,
              "isSubstitution": true,
              "type": "action",
              "player": { "id": 571479, "link": "/api/v1/people/571479" },
              "position": {
                "code": "1",
                "name": "Pitcher",
                "type": "Pitcher",
                "abbreviation": "P"
              }
            },
            {
              "details": {
                "call": { "code": "C", "description": "Called Strike" },
                "description": "Called Strike",
                "code": "C",
                "ballColor": "rgba(170, 21, 11, 1.0)",
                "trailColor": "rgba(188, 0, 33, 1.0)",
                "isInPlay": false,
                "isStrike": true,
                "isBall": false,
                "type": { "code": "FF", "description": "Four-Seam Fastball" },
                "isOut": false,
                "hasReview": false
              },
              "count": { "balls": 0, "strikes": 1, "outs": 0 },
              "pitchData": {
                "startSpeed": 94.9,
                "endSpeed": 86.4,
                "strikeZoneTop": 3.45031444345966,
                "strikeZoneBottom": 1.67764024397582,
                "coordinates": {
                  "aY": 32.062733282121606,
                  "aZ": -12.832816197054449,
                  "pfxX": -6.817741645287674,
                  "pfxZ": 10.085522106889957,
                  "pX": -0.07949405128731488,
                  "pZ": 1.7338010241344315,
                  "vX0": 6.46551692828176,
                  "vY0": -137.93359721908988,
                  "vZ0": -7.219685720939524,
                  "x": 120.03,
                  "y": 191.97,
                  "x0": -1.5736208074739897,
                  "y0": 50.00120308796395,
                  "z0": 5.259189222916748,
                  "aX": -13.072673109209038
                },
                "breaks": {
                  "breakAngle": 38.4,
                  "breakLength": 3.6,
                  "breakY": 24.0,
                  "spinRate": 2348,
                  "spinDirection": 224
                },
                "zone": 8,
                "typeConfidence": 0.91,
                "plateTime": 0.39782064055820276,
                "extension": 5.614118812735331
              },
              "index": 3,
              "playId": "03cf7b57-3ac0-456c-84ec-61d8c9eac4fd",
              "pitchNumber": 1,
              "startTime": "2022-11-02T03:07:27.253Z",
              "endTime": "2022-11-02T03:07:30.474Z",
              "isPitch": true,
              "type": "pitch"
            },
            {
              "details": {
                "call": { "code": "X", "description": "In play, out(s)" },
                "description": "In play, out(s)",
                "code": "X",
                "ballColor": "rgba(26, 86, 190, 1.0)",
                "trailColor": "rgba(0, 0, 254, 1.0)",
                "isInPlay": true,
                "isStrike": false,
                "isBall": false,
                "type": { "code": "SL", "description": "Slider" },
                "isOut": true,
                "hasReview": false
              },
              "count": { "balls": 0, "strikes": 1, "outs": 0 },
              "pitchData": {
                "startSpeed": 85.1,
                "endSpeed": 78.6,
                "strikeZoneTop": 3.39,
                "strikeZoneBottom": 1.64,
                "coordinates": {
                  "aY": 23.967668938028176,
                  "aZ": -29.049826370487875,
                  "pfxX": 1.4471934412706076,
                  "pfxZ": 2.0026525870701297,
                  "pX": 0.3399710533980159,
                  "pZ": 1.9436394968688282,
                  "vX0": 4.376853767060236,
                  "vY0": -123.94985337684831,
                  "vZ0": -2.688654552171572,
                  "x": 104.04,
                  "y": 186.3,
                  "x0": -1.6343491643928008,
                  "y0": 50.00510629665202,
                  "z0": 5.459610211939777,
                  "aX": 2.2589171400466794
                },
                "breaks": {
                  "breakAngle": 6.0,
                  "breakLength": 7.2,
                  "breakY": 24.0,
                  "spinRate": 2337,
                  "spinDirection": 128
                },
                "zone": 9,
                "typeConfidence": 0.9,
                "plateTime": 0.4413109096612251,
                "extension": 5.861396758036375
              },
              "hitData": {
                "launchSpeed": 80.9,
                "launchAngle": 59.0,
                "totalDistance": 177.0,
                "trajectory": "popup",
                "hardness": "medium",
                "location": "4",
                "coordinates": { "coordX": 166.59, "coordY": 142.6 }
              },
              "index": 4,
              "playId": "9ce4fa30-7a4f-4c14-8ffe-b2beb6698208",
              "pitchNumber": 2,
              "startTime": "2022-11-02T03:07:47.739Z",
              "endTime": "2022-11-02T03:07:57.769Z",
              "isPitch": true,
              "type": "pitch"
            }
          ],
          "playEndTime": "2022-11-02T03:07:57.769Z",
          "atBatIndex": 65
        },
        {
          "result": {
            "type": "atBat",
            "event": "Flyout",
            "eventType": "field_out",
            "description": "Trey Mancini flies out to right fielder Matt Vierling in foul territory.",
            "rbi": 0,
            "awayScore": 0,
            "homeScore": 7,
            "isOut": true
          },
          "about": {
            "atBatIndex": 66,
            "halfInning": "top",
            "isTopInning": true,
            "inning": 9,
            "startTime": "2022-11-02T03:08:34.812Z",
            "endTime": "2022-11-02T03:10:25.227Z",
            "isComplete": true,
            "isScoringPlay": false,
            "hasReview": false,
            "hasOut": true,
            "captivatingIndex": 0
          },
          "count": { "balls": 3, "strikes": 1, "outs": 2 },
          "matchup": {
            "batter": {
              "id": 641820,
              "fullName": "Trey Mancini",
              "link": "/api/v1/people/641820"
            },
            "batSide": { "code": "R", "description": "Right" },
            "pitcher": {
              "id": 571479,
              "fullName": "Andrew Bellatti",
              "link": "/api/v1/people/571479"
            },
            "pitchHand": { "code": "R", "description": "Right" },
            "batterHotColdZones": [],
            "pitcherHotColdZones": [],
            "splits": {
              "batter": "vs_RHP",
              "pitcher": "vs_RHB",
              "menOnBase": "Empty"
            }
          },
          "pitchIndex": [1, 2, 3, 4, 5],
          "actionIndex": [0],
          "runnerIndex": [0],
          "runners": [
            {
              "movement": {
                "originBase": null,
                "start": null,
                "end": null,
                "outBase": "1B",
                "isOut": true,
                "outNumber": 2
              },
              "details": {
                "event": "Flyout",
                "eventType": "field_out",
                "movementReason": null,
                "runner": {
                  "id": 641820,
                  "fullName": "Trey Mancini",
                  "link": "/api/v1/people/641820"
                },
                "responsiblePitcher": null,
                "isScoringEvent": false,
                "rbi": false,
                "earned": false,
                "teamUnearned": false,
                "playIndex": 5
              },
              "credits": [
                {
                  "player": { "id": 663837, "link": "/api/v1/people/663837" },
                  "position": {
                    "code": "9",
                    "name": "Outfielder",
                    "type": "Outfielder",
                    "abbreviation": "RF"
                  },
                  "credit": "f_putout"
                }
              ]
            }
          ],
          "playEvents": [
            {
              "details": {
                "description": "Offensive Substitution: Pinch-hitter Trey Mancini replaces David Hensley.",
                "event": "Offensive Substitution",
                "eventType": "offensive_substitution",
                "awayScore": 0,
                "homeScore": 7,
                "isScoringPlay": false,
                "isOut": false,
                "hasReview": false
              },
              "count": { "balls": 0, "strikes": 0, "outs": 1 },
              "index": 0,
              "startTime": "2022-11-02T03:08:27.575Z",
              "endTime": "2022-11-02T03:08:36.923Z",
              "isPitch": false,
              "isSubstitution": true,
              "type": "action",
              "player": { "id": 641820, "link": "/api/v1/people/641820" },
              "position": {
                "code": "11",
                "name": "Pinch Hitter",
                "type": "Hitter",
                "abbreviation": "PH"
              },
              "battingOrder": "701",
              "replacedPlayer": { "id": 682073, "link": "/api/v1/people/682073" }
            },
            {
              "details": {
                "call": { "code": "C", "description": "Called Strike" },
                "description": "Called Strike",
                "code": "C",
                "ballColor": "rgba(170, 21, 11, 1.0)",
                "trailColor": "rgba(0, 0, 254, 1.0)",
                "isInPlay": false,
                "isStrike": true,
                "isBall": false,
                "type": { "code": "SL", "description": "Slider" },
                "isOut": false,
                "hasReview": false
              },
              "count": { "balls": 0, "strikes": 1, "outs": 1 },
              "pitchData": {
                "startSpeed": 86.0,
                "endSpeed": 78.7,
                "strikeZoneTop": 3.65648428028469,
                "strikeZoneBottom": 1.67764024397582,
                "coordinates": {
                  "aY": 26.232389215141186,
                  "aZ": -27.84915459590935,
                  "pfxX": 1.4624250192083106,
                  "pfxZ": 2.737529118365531,
                  "pX": -0.5630562556646279,
                  "pZ": 2.1267481870980673,
                  "vX0": 2.676147218778246,
                  "vY0": -125.2397784522851,
                  "vZ0": -2.4279911434662593,
                  "x": 138.46,
                  "y": 181.36,
                  "x0": -1.8372203996846934,
                  "y0": 50.00565852248404,
                  "z0": 5.395692469580845,
                  "aX": 2.314319062449048
                },
                "breaks": {
                  "breakAngle": 6.0,
                  "breakLength": 7.2,
                  "breakY": 24.0,
                  "spinRate": 2397,
                  "spinDirection": 161
                },
                "zone": 7,
                "typeConfidence": 0.9,
                "plateTime": 0.4380060185980117,
                "extension": 5.804191748089508
              },
              "index": 1,
              "playId": "1330e31b-21e5-4115-b77b-5a84dc1ce418",
              "pitchNumber": 1,
              "startTime": "2022-11-02T03:08:36.923Z",
              "endTime": "2022-11-02T03:08:40.307Z",
              "isPitch": true,
              "type": "pitch"
            },
            {
              "details": {
                "call": { "code": "B", "description": "Ball" },
                "description": "Ball",
                "code": "B",
                "ballColor": "rgba(39, 161, 39, 1.0)",
                "trailColor": "rgba(0, 0, 254, 1.0)",
                "isInPlay": false,
                "isStrike": false,
                "isBall": true,
                "type": { "code": "SL", "description": "Slider" },
                "isOut": false,
                "hasReview": false
              },
              "count": { "balls": 1, "strikes": 1, "outs": 1 },
              "pitchData": {
                "startSpeed": 85.5,
                "endSpeed": 79.4,
                "strikeZoneTop": 3.60496637964331,
                "strikeZoneBottom": 1.67690725367847,
                "coordinates": {
                  "aY": 23.303966415129185,
                  "aZ": -29.925967058850382,
                  "pfxX": 1.2286230693506397,
                  "pfxZ": 1.4248965903394097,
                  "pX": 1.1232967892633918,
                  "pZ": 1.0097862013696075,
                  "vX0": 5.882487376732296,
                  "vY0": -124.50727841041653,
                  "vZ0": -4.789347505154043,
                  "x": 74.18,
                  "y": 211.52,
                  "x0": -1.422741677637123,
                  "y0": 50.00562955859951,
                  "z0": 5.414246988019934,
                  "aX": 1.9426570084712897
                },
                "breaks": {
                  "breakAngle": 4.8,
                  "breakLength": 8.4,
                  "breakY": 24.0,
                  "spinRate": 2380,
                  "spinDirection": 122
                },
                "zone": 14,
                "typeConfidence": 0.9,
                "plateTime": 0.43870136731044296,
                "extension": 5.705062826779734
              },
              "index": 2,
              "playId": "dedb1337-8033-4d13-b5a9-7799de6fa11e",
              "pitchNumber": 2,
              "startTime": "2022-11-02T03:08:59.784Z",
              "endTime": "2022-11-02T03:09:02.784Z",
              "isPitch": true,
              "type": "pitch"
            },
            {
              "details": {
                "call": { "code": "B", "description": "Ball" },
                "description": "Ball",
                "code": "B",
                "ballColor": "rgba(39, 161, 39, 1.0)",
                "trailColor": "rgba(0, 0, 254, 1.0)",
                "isInPlay": false,
                "isStrike": false,
                "isBall": true,
                "type": { "code": "SL", "description": "Slider" },
                "isOut": false,
                "hasReview": false
              },
              "count": { "balls": 2, "strikes": 1, "outs": 1 },
              "pitchData": {
                "startSpeed": 85.5,
                "endSpeed": 79.1,
                "strikeZoneTop": 3.52765864986246,
                "strikeZoneBottom": 1.62570295049976,
                "coordinates": {
                  "aY": 24.016280811832768,
                  "aZ": -29.113060809297643,
                  "pfxX": 2.2067199998645033,
                  "pfxZ": 1.9408084974233484,
                  "pX": 1.0229476738740189,
                  "pZ": 1.422587179865483,
                  "vX0": 5.095767967383966,
                  "vY0": -124.46645902393153,
                  "vZ0": -3.7827089616837632,
                  "x": 78.01,
                  "y": 200.37,
                  "x0": -1.3340973490062042,
                  "y0": 50.000614311098445,
                  "z0": 5.3618214670297455,
                  "aX": 3.4758432908074113
                },
                "breaks": {
                  "breakAngle": 8.4,
                  "breakLength": 7.2,
                  "breakY": 24.0,
                  "spinRate": 2472,
                  "spinDirection": 148
                },
                "zone": 14,
                "typeConfidence": 0.9,
                "plateTime": 0.43936095547442955,
                "extension": 5.94842749210507
              },
              "index": 3,
              "playId": "68864da3-eb44-4b67-9abe-5487f92e523c",
              "pitchNumber": 3,
              "startTime": "2022-11-02T03:09:25.289Z",
              "endTime": "2022-11-02T03:09:28.774Z",
              "isPitch": true,
              "type": "pitch"
            },
            {
              "details": {
                "call": { "code": "B", "description": "Ball" },
                "description": "Ball",
                "code": "B",
                "ballColor": "rgba(39, 161, 39, 1.0)",
                "trailColor": "rgba(0, 0, 254, 1.0)",
                "isInPlay": false,
                "isStrike": false,
                "isBall": true,
                "type": { "code": "SL", "description": "Slider" },
                "isOut": false,
                "hasReview": false
              },
              "count": { "balls": 3, "strikes": 1, "outs": 1 },
              "pitchData": {
                "startSpeed": 85.7,
                "endSpeed": 79.3,
                "strikeZoneTop": 3.73372977294263,
                "strikeZoneBottom": 1.72956706172234,
                "coordinates": {
                  "aY": 24.351931387833105,
                  "aZ": -31.45607786108759,
                  "pfxX": 1.292722499193549,
                  "pfxZ": 0.4577270844733117,
                  "pX": 0.9219161781366039,
                  "pZ": 0.8696240115915183,
                  "vX0": 5.441991110484804,
                  "vY0": -124.7419844926743,
                  "vZ0": -4.71609563517375,
                  "x": 81.86,
                  "y": 215.3,
                  "x0": -1.4531950387560044,
                  "y0": 50.00445973146877,
                  "z0": 5.368677521727449,
                  "aX": 2.0442252891415578
                },
                "breaks": {
                  "breakAngle": 4.8,
                  "breakLength": 8.4,
                  "breakY": 24.0,
                  "spinRate": 2446,
                  "spinDirection": 131
                },
                "zone": 14,
                "typeConfidence": 0.9,
                "plateTime": 0.43855536989973487,
                "extension": 5.749500190777563
              },
              "index": 4,
              "playId": "28dd03c1-a5ed-444b-99d5-031a77aba36f",
              "pitchNumber": 4,
              "startTime": "2022-11-02T03:09:50.828Z",
              "endTime": "2022-11-02T03:09:53.828Z",
              "isPitch": true,
              "type": "pitch"
            },
            {
              "details": {
                "call": { "code": "X", "description": "In play, out(s)" },
                "description": "In play, out(s)",
                "code": "X",
                "ballColor": "rgba(26, 86, 190, 1.0)",
                "trailColor": "rgba(188, 0, 33, 1.0)",
                "isInPlay": true,
                "isStrike": false,
                "isBall": false,
                "type": { "code": "FF", "description": "Four-Seam Fastball" },
                "isOut": true,
                "hasReview": false
              },
              "count": { "balls": 3, "strikes": 1, "outs": 1 },
              "pitchData": {
                "startSpeed": 94.5,
                "endSpeed": 86.1,
                "strikeZoneTop": 3.59,
                "strikeZoneBottom": 1.68,
                "coordinates": {
                  "aY": 31.865061927566362,
                  "aZ": -13.499037263602263,
                  "pfxX": -6.949232059701738,
                  "pfxZ": 9.820277388122129,
                  "pX": -0.5224432328925896,
                  "pZ": 1.5883817533981268,
                  "vX0": 5.44667507078442,
                  "vY0": -137.3865861654445,
                  "vZ0": -7.238603796424753,
                  "x": 136.91,
                  "y": 195.89,
                  "x0": -1.6327342369189266,
                  "y0": 50.005342378641004,
                  "z0": 5.184303440936744,
                  "aX": -13.219671514208061
                },
                "breaks": {
                  "breakAngle": 38.4,
                  "breakLength": 3.6,
                  "breakY": 24.0,
                  "spinRate": 2554,
                  "spinDirection": 223
                },
                "zone": 7,
                "typeConfidence": 0.9,
                "plateTime": 0.39944493500249845,
                "extension": 6.061003982182596
              },
              "hitData": {
                "launchSpeed": 85.4,
                "launchAngle": 48.0,
                "totalDistance": 244.0,
                "trajectory": "fly_ball",
                "hardness": "medium",
                "location": "9",
                "coordinates": { "coordX": 198.44, "coordY": 132.74 }
              },
              "index": 5,
              "playId": "077beee9-3ea3-4c48-b08b-9a800c7463df",
              "pitchNumber": 5,
              "startTime": "2022-11-02T03:10:15.060Z",
              "endTime": "2022-11-02T03:10:25.227Z",
              "isPitch": true,
              "type": "pitch"
            }
          ],
          "playEndTime": "2022-11-02T03:10:25.227Z",
          "atBatIndex": 66
        },
        {
          "result": {
            "type": "atBat",
            "event": "Strikeout",
            "eventType": "strikeout",
            "description": "Chas McCormick called out on strikes.",
            "rbi": 0,
            "awayScore": 0,
            "homeScore": 7,
            "isOut": true
          },
          "about": {
            "atBatIndex": 67,
            "halfInning": "top",
            "isTopInning": true,
            "inning": 9,
            "startTime": "2022-11-02T03:10:41.226Z",
            "endTime": "2022-11-02T03:13:54.743Z",
            "isComplete": true,
            "isScoringPlay": false,
            "hasReview": false,
            "hasOut": true,
            "captivatingIndex": 14
          },
          "count": { "balls": 3, "strikes": 3, "outs": 3 },
          "matchup": {
            "batter": {
              "id": 676801,
              "fullName": "Chas McCormick",
              "link": "/api/v1/people/676801"
            },
            "batSide": { "code": "R", "description": "Right" },
            "pitcher": {
              "id": 571479,
              "fullName": "Andrew Bellatti",
              "link": "/api/v1/people/571479"
            },
            "pitchHand": { "code": "R", "description": "Right" },
            "batterHotColdZones": [],
            "pitcherHotColdZones": [],
            "splits": {
              "batter": "vs_RHP",
              "pitcher": "vs_RHB",
              "menOnBase": "Empty"
            }
          },
          "pitchIndex": [0, 1, 2, 3, 4, 5, 6],
          "actionIndex": [],
          "runnerIndex": [0],
          "runners": [
            {
              "movement": {
                "originBase": null,
                "start": null,
                "end": null,
                "outBase": "1B",
                "isOut": true,
                "outNumber": 3
              },
              "details": {
                "event": "Strikeout",
                "eventType": "strikeout",
                "movementReason": null,
                "runner": {
                  "id": 676801,
                  "fullName": "Chas McCormick",
                  "link": "/api/v1/people/676801"
                },
                "responsiblePitcher": null,
                "isScoringEvent": false,
                "rbi": false,
                "earned": false,
                "teamUnearned": false,
                "playIndex": 6
              },
              "credits": [
                {
                  "player": { "id": 592663, "link": "/api/v1/people/592663" },
                  "position": {
                    "code": "2",
                    "name": "Catcher",
                    "type": "Catcher",
                    "abbreviation": "C"
                  },
                  "credit": "f_putout"
                }
              ]
            }
          ],
          "playEvents": [
            {
              "details": {
                "call": { "code": "B", "description": "Ball" },
                "description": "Ball",
                "code": "B",
                "ballColor": "rgba(39, 161, 39, 1.0)",
                "trailColor": "rgba(0, 0, 254, 1.0)",
                "isInPlay": false,
                "isStrike": false,
                "isBall": true,
                "type": { "code": "SL", "description": "Slider" },
                "isOut": false,
                "hasReview": false
              },
              "count": { "balls": 1, "strikes": 0, "outs": 2 },
              "pitchData": {
                "startSpeed": 84.8,
                "endSpeed": 77.6,
                "strikeZoneTop": 3.29577483082744,
                "strikeZoneBottom": 1.53719652026685,
                "coordinates": {
                  "aY": 25.03461593620389,
                  "aZ": -30.176591105635776,
                  "pfxX": 1.8040145990118486,
                  "pfxZ": 1.2967119997167593,
                  "pX": -2.179011922167364,
                  "pZ": 3.313158794652033,
                  "vX0": -1.5635404835608495,
                  "vY0": -123.4864776879468,
                  "vZ0": 0.8935410661235292,
                  "x": 200.06,
                  "y": 149.32,
                  "x0": -1.7714265592889862,
                  "y0": 50.0026483282166,
                  "z0": 5.489002555893328,
                  "aX": 2.7806768811797045
                },
                "breaks": {
                  "breakAngle": 4.8,
                  "breakLength": 8.4,
                  "breakY": 24.0,
                  "spinRate": 2338,
                  "spinDirection": 137
                },
                "zone": 11,
                "typeConfidence": 0.9,
                "plateTime": 0.4438826766286996,
                "extension": 5.534377587287512
              },
              "index": 0,
              "playId": "1db07b89-0925-499a-9f04-c7b55d32975e",
              "pitchNumber": 1,
              "startTime": "2022-11-02T03:11:07.452Z",
              "endTime": "2022-11-02T03:11:11.590Z",
              "isPitch": true,
              "type": "pitch"
            },
            {
              "details": {
                "call": { "code": "B", "description": "Ball" },
                "description": "Ball",
                "code": "B",
                "ballColor": "rgba(39, 161, 39, 1.0)",
                "trailColor": "rgba(188, 0, 33, 1.0)",
                "isInPlay": false,
                "isStrike": false,
                "isBall": true,
                "type": { "code": "FF", "description": "Four-Seam Fastball" },
                "isOut": false,
                "hasReview": false
              },
              "count": { "balls": 2, "strikes": 0, "outs": 2 },
              "pitchData": {
                "startSpeed": 94.7,
                "endSpeed": 86.0,
                "strikeZoneTop": 3.26996093814823,
                "strikeZoneBottom": 1.57395105475997,
                "coordinates": {
                  "aY": 32.60670140760296,
                  "aZ": -13.22362776068406,
                  "pfxX": -6.233896601339055,
                  "pfxZ": 9.921834412565417,
                  "pX": -1.4442663948437005,
                  "pZ": 2.9805121856126893,
                  "vX0": 2.7445495830212625,
                  "vY0": -137.81362665717901,
                  "vZ0": -3.893699171693313,
                  "x": 172.05,
                  "y": 158.31,
                  "x0": -1.646926212028839,
                  "y0": 50.005829804288254,
                  "z0": 5.3143177255307865,
                  "aX": -11.909943599464452
                },
                "breaks": {
                  "breakAngle": 38.4,
                  "breakLength": 3.6,
                  "breakY": 24.0,
                  "spinRate": 2497,
                  "spinDirection": 224
                },
                "zone": 11,
                "typeConfidence": 0.91,
                "plateTime": 0.39850403613992036,
                "extension": 5.640716734945427
              },
              "index": 1,
              "playId": "3e8c3c99-5491-4c34-ad1d-a33cd2e061f2",
              "pitchNumber": 2,
              "startTime": "2022-11-02T03:11:33.821Z",
              "endTime": "2022-11-02T03:11:37.351Z",
              "isPitch": true,
              "type": "pitch"
            },
            {
              "details": {
                "call": { "code": "B", "description": "Ball" },
                "description": "Ball",
                "code": "B",
                "ballColor": "rgba(39, 161, 39, 1.0)",
                "trailColor": "rgba(188, 0, 33, 1.0)",
                "isInPlay": false,
                "isStrike": false,
                "isBall": true,
                "type": { "code": "FF", "description": "Four-Seam Fastball" },
                "isOut": false,
                "hasReview": false
              },
              "count": { "balls": 3, "strikes": 0, "outs": 2 },
              "pitchData": {
                "startSpeed": 93.7,
                "endSpeed": 84.8,
                "strikeZoneTop": 3.26996093814823,
                "strikeZoneBottom": 1.53719652026685,
                "coordinates": {
                  "aY": 32.32856016486391,
                  "aZ": -11.170383238322518,
                  "pfxX": -6.125588241713921,
                  "pfxZ": 11.288691571946332,
                  "pX": 1.1283623433213352,
                  "pZ": 2.991760821949574,
                  "vX0": 8.874105398525264,
                  "vY0": -136.1343601443372,
                  "vZ0": -4.074978006114474,
                  "x": 73.99,
                  "y": 158.0,
                  "x0": -1.3910068446895802,
                  "y0": 50.00071767867155,
                  "z0": 5.292424068430164,
                  "aX": -11.395812571555393
                },
                "breaks": {
                  "breakAngle": 37.2,
                  "breakLength": 3.6,
                  "breakY": 24.0,
                  "spinRate": 2537,
                  "spinDirection": 221
                },
                "zone": 12,
                "typeConfidence": 0.91,
                "plateTime": 0.4036935120515994,
                "extension": 5.864601291883096
              },
              "index": 2,
              "playId": "3981d602-13fc-4a13-89a8-13eb7a3adcc1",
              "pitchNumber": 3,
              "startTime": "2022-11-02T03:11:58.807Z",
              "endTime": "2022-11-02T03:12:02.229Z",
              "isPitch": true,
              "type": "pitch"
            },
            {
              "details": {
                "call": { "code": "C", "description": "Called Strike" },
                "description": "Called Strike",
                "code": "C",
                "ballColor": "rgba(170, 21, 11, 1.0)",
                "trailColor": "rgba(188, 0, 33, 1.0)",
                "isInPlay": false,
                "isStrike": true,
                "isBall": false,
                "type": { "code": "FF", "description": "Four-Seam Fastball" },
                "isOut": false,
                "hasReview": false
              },
              "count": { "balls": 3, "strikes": 1, "outs": 2 },
              "pitchData": {
                "startSpeed": 94.5,
                "endSpeed": 85.7,
                "strikeZoneTop": 3.2441432345912,
                "strikeZoneBottom": 1.54797231044138,
                "coordinates": {
                  "aY": 32.422926436922374,
                  "aZ": -11.557592786138864,
                  "pfxX": -6.158579528006566,
                  "pfxZ": 10.853270975410503,
                  "pX": -0.4825438563326896,
                  "pZ": 2.8790578693218443,
                  "vX0": 5.183711162007077,
                  "vY0": -137.43567623167255,
                  "vZ0": -4.255145214102253,
                  "x": 135.39,
                  "y": 161.05,
                  "x0": -1.5994144685448866,
                  "y0": 50.00372826254533,
                  "z0": 5.241377882861771,
                  "aX": -11.700657691765048
                },
                "breaks": {
                  "breakAngle": 39.6,
                  "breakLength": 3.6,
                  "breakY": 24.0,
                  "spinRate": 2554,
                  "spinDirection": 222
                },
                "zone": 1,
                "typeConfidence": 0.91,
                "plateTime": 0.3995883023767526,
                "extension": 5.956739352945355
              },
              "index": 3,
              "playId": "bd6b1998-d504-462d-950b-7cb1493c76df",
              "pitchNumber": 4,
              "startTime": "2022-11-02T03:12:24.948Z",
              "endTime": "2022-11-02T03:12:28.287Z",
              "isPitch": true,
              "type": "pitch"
            },
            {
              "details": {
                "call": { "code": "S", "description": "Swinging Strike" },
                "description": "Swinging Strike",
                "code": "S",
                "ballColor": "rgba(170, 21, 11, 1.0)",
                "trailColor": "rgba(188, 0, 33, 1.0)",
                "isInPlay": false,
                "isStrike": true,
                "isBall": false,
                "type": { "code": "FF", "description": "Four-Seam Fastball" },
                "isOut": false,
                "hasReview": false
              },
              "count": { "balls": 3, "strikes": 2, "outs": 2 },
              "pitchData": {
                "startSpeed": 94.6,
                "endSpeed": 86.0,
                "strikeZoneTop": 3.21,
                "strikeZoneBottom": 1.54,
                "coordinates": {
                  "aY": 32.324896097322544,
                  "aZ": -11.458161623291227,
                  "pfxX": -5.855700941391206,
                  "pfxZ": 10.844124429061033,
                  "pX": -1.1302664963484204,
                  "pZ": 3.214820390504218,
                  "vX0": 3.716850446823382,
                  "vY0": -137.75240378711294,
                  "vZ0": -3.529146610361238,
                  "x": 160.08,
                  "y": 151.98,
                  "x0": -1.7405221479222808,
                  "y0": 50.00035623311616,
                  "z0": 5.294299002222957,
                  "aX": -11.18414835205707
                },
                "breaks": {
                  "breakAngle": 39.6,
                  "breakLength": 3.6,
                  "breakY": 24.0,
                  "spinRate": 2601,
                  "spinDirection": 222
                },
                "zone": 11,
                "typeConfidence": 0.92,
                "plateTime": 0.3985334110601575,
                "extension": 5.934562983459901
              },
              "index": 4,
              "playId": "8d47c194-937f-4483-82b6-354bc9cacf99",
              "pitchNumber": 5,
              "startTime": "2022-11-02T03:12:48.090Z",
              "endTime": "2022-11-02T03:12:51.453Z",
              "isPitch": true,
              "type": "pitch"
            },
            {
              "details": {
                "call": { "code": "F", "description": "Foul" },
                "description": "Foul",
                "code": "F",
                "ballColor": "rgba(170, 21, 11, 1.0)",
                "trailColor": "rgba(0, 0, 254, 1.0)",
                "isInPlay": false,
                "isStrike": true,
                "isBall": false,
                "type": { "code": "SL", "description": "Slider" },
                "isOut": false,
                "hasReview": false
              },
              "count": { "balls": 3, "strikes": 2, "outs": 2 },
              "pitchData": {
                "startSpeed": 85.3,
                "endSpeed": 78.8,
                "strikeZoneTop": 3.21,
                "strikeZoneBottom": 1.54,
                "coordinates": {
                  "aY": 24.19657011654126,
                  "aZ": -28.31197487094703,
                  "pfxX": 2.1787348395642496,
                  "pfxZ": 2.4684218007755634,
                  "pX": 0.2698375088311689,
                  "pZ": 1.187033241834342,
                  "vX0": 3.8124416898274793,
                  "vY0": -124.180784920277,
                  "vZ0": -4.338652621008059,
                  "x": 106.71,
                  "y": 206.73,
                  "x0": -1.5667394216370647,
                  "y0": 50.00508455040486,
                  "z0": 5.304406049206582,
                  "aX": 3.4125923914442278
                },
                "breaks": {
                  "breakAngle": 8.4,
                  "breakLength": 7.2,
                  "breakY": 24.0,
                  "spinRate": 2435,
                  "spinDirection": 144
                },
                "zone": 14,
                "typeConfidence": 0.9,
                "plateTime": 0.4405967085594127,
                "extension": 5.746751232640174
              },
              "index": 5,
              "playId": "9937ff7f-c4c6-494d-a263-6a3d69a26a28",
              "pitchNumber": 6,
              "startTime": "2022-11-02T03:13:15.273Z",
              "endTime": "2022-11-02T03:13:18.566Z",
              "isPitch": true,
              "type": "pitch"
            },
            {
              "details": {
                "call": { "code": "C", "description": "Called Strike" },
                "description": "Called Strike",
                "code": "C",
                "ballColor": "rgba(170, 21, 11, 1.0)",
                "trailColor": "rgba(0, 0, 254, 1.0)",
                "isInPlay": false,
                "isStrike": true,
                "isBall": false,
                "type": { "code": "SL", "description": "Slider" },
                "isOut": true,
                "hasReview": false
              },
              "count": { "balls": 3, "strikes": 3, "outs": 2 },
              "pitchData": {
                "startSpeed": 85.2,
                "endSpeed": 78.7,
                "strikeZoneTop": 3.2441432345912,
                "strikeZoneBottom": 1.52199107714324,
                "coordinates": {
                  "aY": 23.941053727561386,
                  "aZ": -30.12355739845236,
                  "pfxX": 1.9184188620597606,
                  "pfxZ": 1.3121341495861456,
                  "pX": 0.026588906339298293,
                  "pZ": 1.8560776005611663,
                  "vX0": 2.925743918813079,
                  "vY0": -124.11845880874047,
                  "vZ0": -2.564777330695012,
                  "x": 115.99,
                  "y": 188.67,
                  "x0": -1.415025399851339,
                  "y0": 50.00527306547528,
                  "z0": 5.401594073490684,
                  "aX": 3.0048223791802458
                },
                "breaks": {
                  "breakAngle": 6.0,
                  "breakLength": 8.4,
                  "breakY": 24.0,
                  "spinRate": 2385,
                  "spinDirection": 156
                },
                "zone": 8,
                "typeConfidence": 0.9,
                "plateTime": 0.440635761965424,
                "extension": 5.989151116918801
              },
              "index": 6,
              "playId": "f44b3468-ed08-4a94-b713-43ae416fdcc5",
              "pitchNumber": 7,
              "startTime": "2022-11-02T03:13:51.187Z",
              "endTime": "2022-11-02T03:13:54.743Z",
              "isPitch": true,
              "type": "pitch"
            }
          ],
          "playEndTime": "2022-11-02T03:13:54.743Z",
          "atBatIndex": 67
        }
      ],
      "currentPlay": {
        "result": {
          "type": "atBat",
          "event": "Strikeout",
          "eventType": "strikeout",
          "description": "Chas McCormick called out on strikes.",
          "rbi": 0,
          "awayScore": 0,
          "homeScore": 7,
          "isOut": true
        },
        "about": {
          "atBatIndex": 67,
          "halfInning": "top",
          "isTopInning": true,
          "inning": 9,
          "startTime": "2022-11-02T03:10:41.226Z",
          "endTime": "2022-11-02T03:13:54.743Z",
          "isComplete": true,
          "isScoringPlay": false,
          "hasReview": false,
          "hasOut": true,
          "captivatingIndex": 14
        },
        "count": { "balls": 3, "strikes": 3, "outs": 3 },
        "matchup": {
          "batter": {
            "id": 676801,
            "fullName": "Chas McCormick",
            "link": "/api/v1/people/676801"
          },
          "batSide": { "code": "R", "description": "Right" },
          "pitcher": {
            "id": 571479,
            "fullName": "Andrew Bellatti",
            "link": "/api/v1/people/571479"
          },
          "pitchHand": { "code": "R", "description": "Right" },
          "batterHotColdZones": [],
          "pitcherHotColdZones": [],
          "splits": {
            "batter": "vs_RHP",
            "pitcher": "vs_RHB",
            "menOnBase": "Empty"
          }
        },
        "pitchIndex": [0, 1, 2, 3, 4, 5, 6],
        "actionIndex": [],
        "runnerIndex": [0],
        "runners": [
          {
            "movement": {
              "originBase": null,
              "start": null,
              "end": null,
              "outBase": "1B",
              "isOut": true,
              "outNumber": 3
            },
            "details": {
              "event": "Strikeout",
              "eventType": "strikeout",
              "movementReason": null,
              "runner": {
                "id": 676801,
                "fullName": "Chas McCormick",
                "link": "/api/v1/people/676801"
              },
              "responsiblePitcher": null,
              "isScoringEvent": false,
              "rbi": false,
              "earned": false,
              "teamUnearned": false,
              "playIndex": 6
            },
            "credits": [
              {
                "player": { "id": 592663, "link": "/api/v1/people/592663" },
                "position": {
                  "code": "2",
                  "name": "Catcher",
                  "type": "Catcher",
                  "abbreviation": "C"
                },
                "credit": "f_putout"
              }
            ]
          }
        ],
        "playEvents": [
          {
            "details": {
              "call": { "code": "B", "description": "Ball" },
              "description": "Ball",
              "code": "B",
              "ballColor": "rgba(39, 161, 39, 1.0)",
              "trailColor": "rgba(0, 0, 254, 1.0)",
              "isInPlay": false,
              "isStrike": false,
              "isBall": true,
              "type": { "code": "SL", "description": "Slider" },
              "isOut": false,
              "hasReview": false
            },
            "count": { "balls": 1, "strikes": 0, "outs": 2 },
            "pitchData": {
              "startSpeed": 84.8,
              "endSpeed": 77.6,
              "strikeZoneTop": 3.29577483082744,
              "strikeZoneBottom": 1.53719652026685,
              "coordinates": {
                "aY": 25.03461593620389,
                "aZ": -30.176591105635776,
                "pfxX": 1.8040145990118486,
                "pfxZ": 1.2967119997167593,
                "pX": -2.179011922167364,
                "pZ": 3.313158794652033,
                "vX0": -1.5635404835608495,
                "vY0": -123.4864776879468,
                "vZ0": 0.8935410661235292,
                "x": 200.06,
                "y": 149.32,
                "x0": -1.7714265592889862,
                "y0": 50.0026483282166,
                "z0": 5.489002555893328,
                "aX": 2.7806768811797045
              },
              "breaks": {
                "breakAngle": 4.8,
                "breakLength": 8.4,
                "breakY": 24.0,
                "spinRate": 2338,
                "spinDirection": 137
              },
              "zone": 11,
              "typeConfidence": 0.9,
              "plateTime": 0.4438826766286996,
              "extension": 5.534377587287512
            },
            "index": 0,
            "playId": "1db07b89-0925-499a-9f04-c7b55d32975e",
            "pitchNumber": 1,
            "startTime": "2022-11-02T03:11:07.452Z",
            "endTime": "2022-11-02T03:11:11.590Z",
            "isPitch": true,
            "type": "pitch"
          },
          {
            "details": {
              "call": { "code": "B", "description": "Ball" },
              "description": "Ball",
              "code": "B",
              "ballColor": "rgba(39, 161, 39, 1.0)",
              "trailColor": "rgba(188, 0, 33, 1.0)",
              "isInPlay": false,
              "isStrike": false,
              "isBall": true,
              "type": { "code": "FF", "description": "Four-Seam Fastball" },
              "isOut": false,
              "hasReview": false
            },
            "count": { "balls": 2, "strikes": 0, "outs": 2 },
            "pitchData": {
              "startSpeed": 94.7,
              "endSpeed": 86.0,
              "strikeZoneTop": 3.26996093814823,
              "strikeZoneBottom": 1.57395105475997,
              "coordinates": {
                "aY": 32.60670140760296,
                "aZ": -13.22362776068406,
                "pfxX": -6.233896601339055,
                "pfxZ": 9.921834412565417,
                "pX": -1.4442663948437005,
                "pZ": 2.9805121856126893,
                "vX0": 2.7445495830212625,
                "vY0": -137.81362665717901,
                "vZ0": -3.893699171693313,
                "x": 172.05,
                "y": 158.31,
                "x0": -1.646926212028839,
                "y0": 50.005829804288254,
                "z0": 5.3143177255307865,
                "aX": -11.909943599464452
              },
              "breaks": {
                "breakAngle": 38.4,
                "breakLength": 3.6,
                "breakY": 24.0,
                "spinRate": 2497,
                "spinDirection": 224
              },
              "zone": 11,
              "typeConfidence": 0.91,
              "plateTime": 0.39850403613992036,
              "extension": 5.640716734945427
            },
            "index": 1,
            "playId": "3e8c3c99-5491-4c34-ad1d-a33cd2e061f2",
            "pitchNumber": 2,
            "startTime": "2022-11-02T03:11:33.821Z",
            "endTime": "2022-11-02T03:11:37.351Z",
            "isPitch": true,
            "type": "pitch"
          },
          {
            "details": {
              "call": { "code": "B", "description": "Ball" },
              "description": "Ball",
              "code": "B",
              "ballColor": "rgba(39, 161, 39, 1.0)",
              "trailColor": "rgba(188, 0, 33, 1.0)",
              "isInPlay": false,
              "isStrike": false,
              "isBall": true,
              "type": { "code": "FF", "description": "Four-Seam Fastball" },
              "isOut": false,
              "hasReview": false
            },
            "count": { "balls": 3, "strikes": 0, "outs": 2 },
            "pitchData": {
              "startSpeed": 93.7,
              "endSpeed": 84.8,
              "strikeZoneTop": 3.26996093814823,
              "strikeZoneBottom": 1.53719652026685,
              "coordinates": {
                "aY": 32.32856016486391,
                "aZ": -11.170383238322518,
                "pfxX": -6.125588241713921,
                "pfxZ": 11.288691571946332,
                "pX": 1.1283623433213352,
                "pZ": 2.991760821949574,
                "vX0": 8.874105398525264,
                "vY0": -136.1343601443372,
                "vZ0": -4.074978006114474,
                "x": 73.99,
                "y": 158.0,
                "x0": -1.3910068446895802,
                "y0": 50.00071767867155,
                "z0": 5.292424068430164,
                "aX": -11.395812571555393
              },
              "breaks": {
                "breakAngle": 37.2,
                "breakLength": 3.6,
                "breakY": 24.0,
                "spinRate": 2537,
                "spinDirection": 221
              },
              "zone": 12,
              "typeConfidence": 0.91,
              "plateTime": 0.4036935120515994,
              "extension": 5.864601291883096
            },
            "index": 2,
            "playId": "3981d602-13fc-4a13-89a8-13eb7a3adcc1",
            "pitchNumber": 3,
            "startTime": "2022-11-02T03:11:58.807Z",
            "endTime": "2022-11-02T03:12:02.229Z",
            "isPitch": true,
            "type": "pitch"
          },
          {
            "details": {
              "call": { "code": "C", "description": "Called Strike" },
              "description": "Called Strike",
              "code": "C",
              "ballColor": "rgba(170, 21, 11, 1.0)",
              "trailColor": "rgba(188, 0, 33, 1.0)",
              "isInPlay": false,
              "isStrike": true,
              "isBall": false,
              "type": { "code": "FF", "description": "Four-Seam Fastball" },
              "isOut": false,
              "hasReview": false
            },
            "count": { "balls": 3, "strikes": 1, "outs": 2 },
            "pitchData": {
              "startSpeed": 94.5,
              "endSpeed": 85.7,
              "strikeZoneTop": 3.2441432345912,
              "strikeZoneBottom": 1.54797231044138,
              "coordinates": {
                "aY": 32.422926436922374,
                "aZ": -11.557592786138864,
                "pfxX": -6.158579528006566,
                "pfxZ": 10.853270975410503,
                "pX": -0.4825438563326896,
                "pZ": 2.8790578693218443,
                "vX0": 5.183711162007077,
                "vY0": -137.43567623167255,
                "vZ0": -4.255145214102253,
                "x": 135.39,
                "y": 161.05,
                "x0": -1.5994144685448866,
                "y0": 50.00372826254533,
                "z0": 5.241377882861771,
                "aX": -11.700657691765048
              },
              "breaks": {
                "breakAngle": 39.6,
                "breakLength": 3.6,
                "breakY": 24.0,
                "spinRate": 2554,
                "spinDirection": 222
              },
              "zone": 1,
              "typeConfidence": 0.91,
              "plateTime": 0.3995883023767526,
              "extension": 5.956739352945355
            },
            "index": 3,
            "playId": "bd6b1998-d504-462d-950b-7cb1493c76df",
            "pitchNumber": 4,
            "startTime": "2022-11-02T03:12:24.948Z",
            "endTime": "2022-11-02T03:12:28.287Z",
            "isPitch": true,
            "type": "pitch"
          },
          {
            "details": {
              "call": { "code": "S", "description": "Swinging Strike" },
              "description": "Swinging Strike",
              "code": "S",
              "ballColor": "rgba(170, 21, 11, 1.0)",
              "trailColor": "rgba(188, 0, 33, 1.0)",
              "isInPlay": false,
              "isStrike": true,
              "isBall": false,
              "type": { "code": "FF", "description": "Four-Seam Fastball" },
              "isOut": false,
              "hasReview": false
            },
            "count": { "balls": 3, "strikes": 2, "outs": 2 },
            "pitchData": {
              "startSpeed": 94.6,
              "endSpeed": 86.0,
              "strikeZoneTop": 3.21,
              "strikeZoneBottom": 1.54,
              "coordinates": {
                "aY": 32.324896097322544,
                "aZ": -11.458161623291227,
                "pfxX": -5.855700941391206,
                "pfxZ": 10.844124429061033,
                "pX": -1.1302664963484204,
                "pZ": 3.214820390504218,
                "vX0": 3.716850446823382,
                "vY0": -137.75240378711294,
                "vZ0": -3.529146610361238,
                "x": 160.08,
                "y": 151.98,
                "x0": -1.7405221479222808,
                "y0": 50.00035623311616,
                "z0": 5.294299002222957,
                "aX": -11.18414835205707
              },
              "breaks": {
                "breakAngle": 39.6,
                "breakLength": 3.6,
                "breakY": 24.0,
                "spinRate": 2601,
                "spinDirection": 222
              },
              "zone": 11,
              "typeConfidence": 0.92,
              "plateTime": 0.3985334110601575,
              "extension": 5.934562983459901
            },
            "index": 4,
            "playId": "8d47c194-937f-4483-82b6-354bc9cacf99",
            "pitchNumber": 5,
            "startTime": "2022-11-02T03:12:48.090Z",
            "endTime": "2022-11-02T03:12:51.453Z",
            "isPitch": true,
            "type": "pitch"
          },
          {
            "details": {
              "call": { "code": "F", "description": "Foul" },
              "description": "Foul",
              "code": "F",
              "ballColor": "rgba(170, 21, 11, 1.0)",
              "trailColor": "rgba(0, 0, 254, 1.0)",
              "isInPlay": false,
              "isStrike": true,
              "isBall": false,
              "type": { "code": "SL", "description": "Slider" },
              "isOut": false,
              "hasReview": false
            },
            "count": { "balls": 3, "strikes": 2, "outs": 2 },
            "pitchData": {
              "startSpeed": 85.3,
              "endSpeed": 78.8,
              "strikeZoneTop": 3.21,
              "strikeZoneBottom": 1.54,
              "coordinates": {
                "aY": 24.19657011654126,
                "aZ": -28.31197487094703,
                "pfxX": 2.1787348395642496,
                "pfxZ": 2.4684218007755634,
                "pX": 0.2698375088311689,
                "pZ": 1.187033241834342,
                "vX0": 3.8124416898274793,
                "vY0": -124.180784920277,
                "vZ0": -4.338652621008059,
                "x": 106.71,
                "y": 206.73,
                "x0": -1.5667394216370647,
                "y0": 50.00508455040486,
                "z0": 5.304406049206582,
                "aX": 3.4125923914442278
              },
              "breaks": {
                "breakAngle": 8.4,
                "breakLength": 7.2,
                "breakY": 24.0,
                "spinRate": 2435,
                "spinDirection": 144
              },
              "zone": 14,
              "typeConfidence": 0.9,
              "plateTime": 0.4405967085594127,
              "extension": 5.746751232640174
            },
            "index": 5,
            "playId": "9937ff7f-c4c6-494d-a263-6a3d69a26a28",
            "pitchNumber": 6,
            "startTime": "2022-11-02T03:13:15.273Z",
            "endTime": "2022-11-02T03:13:18.566Z",
            "isPitch": true,
            "type": "pitch"
          },
          {
            "details": {
              "call": { "code": "C", "description": "Called Strike" },
              "description": "Called Strike",
              "code": "C",
              "ballColor": "rgba(170, 21, 11, 1.0)",
              "trailColor": "rgba(0, 0, 254, 1.0)",
              "isInPlay": false,
              "isStrike": true,
              "isBall": false,
              "type": { "code": "SL", "description": "Slider" },
              "isOut": true,
              "hasReview": false
            },
            "count": { "balls": 3, "strikes": 3, "outs": 2 },
            "pitchData": {
              "startSpeed": 85.2,
              "endSpeed": 78.7,
              "strikeZoneTop": 3.2441432345912,
              "strikeZoneBottom": 1.52199107714324,
              "coordinates": {
                "aY": 23.941053727561386,
                "aZ": -30.12355739845236,
                "pfxX": 1.9184188620597606,
                "pfxZ": 1.3121341495861456,
                "pX": 0.026588906339298293,
                "pZ": 1.8560776005611663,
                "vX0": 2.925743918813079,
                "vY0": -124.11845880874047,
                "vZ0": -2.564777330695012,
                "x": 115.99,
                "y": 188.67,
                "x0": -1.415025399851339,
                "y0": 50.00527306547528,
                "z0": 5.401594073490684,
                "aX": 3.0048223791802458
              },
              "breaks": {
                "breakAngle": 6.0,
                "breakLength": 8.4,
                "breakY": 24.0,
                "spinRate": 2385,
                "spinDirection": 156
              },
              "zone": 8,
              "typeConfidence": 0.9,
              "plateTime": 0.440635761965424,
              "extension": 5.989151116918801
            },
            "index": 6,
            "playId": "f44b3468-ed08-4a94-b713-43ae416fdcc5",
            "pitchNumber": 7,
            "startTime": "2022-11-02T03:13:51.187Z",
            "endTime": "2022-11-02T03:13:54.743Z",
            "isPitch": true,
            "type": "pitch"
          }
        ],
        "playEndTime": "2022-11-02T03:13:54.743Z",
        "atBatIndex": 67
      },
      "scoringPlays": [6, 13, 16, 37, 38],
      "playsByInning": [
        {
          "startIndex": 0,
          "endIndex": 7,
          "top": [0, 1, 2],
          "bottom": [3, 4, 5, 6, 7],
          "hits": {
            "away": [
              {
                "team": {
                  "springLeague": {
                    "id": 115,
                    "name": "Grapefruit League",
                    "link": "/api/v1/league/115",
                    "abbreviation": "GL"
                  },
                  "allStarStatus": "N",
                  "id": 117,
                  "name": "Houston Astros",
                  "link": "/api/v1/teams/117"
                },
                "inning": 1,
                "pitcher": {
                  "id": 624133,
                  "fullName": "Ranger Suarez",
                  "link": "/api/v1/people/624133"
                },
                "batter": {
                  "id": 514888,
                  "fullName": "Jose Altuve",
                  "link": "/api/v1/people/514888"
                },
                "coordinates": { "x": 166.32, "y": 111.33 },
                "type": "O",
                "description": "Lineout"
              },
              {
                "team": {
                  "springLeague": {
                    "id": 115,
                    "name": "Grapefruit League",
                    "link": "/api/v1/league/115",
                    "abbreviation": "GL"
                  },
                  "allStarStatus": "N",
                  "id": 117,
                  "name": "Houston Astros",
                  "link": "/api/v1/teams/117"
                },
                "inning": 1,
                "pitcher": {
                  "id": 624133,
                  "fullName": "Ranger Suarez",
                  "link": "/api/v1/people/624133"
                },
                "batter": {
                  "id": 665161,
                  "fullName": "Jeremy Pena",
                  "link": "/api/v1/people/665161"
                },
                "coordinates": { "x": 116.27, "y": 157.61 },
                "type": "O",
                "description": "Groundout"
              }
            ],
            "home": [
              {
                "team": {
                  "springLeague": {
                    "id": 115,
                    "name": "Grapefruit League",
                    "link": "/api/v1/league/115",
                    "abbreviation": "GL"
                  },
                  "allStarStatus": "N",
                  "id": 143,
                  "name": "Philadelphia Phillies",
                  "link": "/api/v1/teams/143"
                },
                "inning": 1,
                "pitcher": {
                  "id": 621121,
                  "fullName": "Lance McCullers Jr.",
                  "link": "/api/v1/people/621121"
                },
                "batter": {
                  "id": 592663,
                  "fullName": "J.T. Realmuto",
                  "link": "/api/v1/people/592663"
                },
                "coordinates": { "x": 147.46, "y": 208.36 },
                "type": "O",
                "description": "Pop Out"
              },
              {
                "team": {
                  "springLeague": {
                    "id": 115,
                    "name": "Grapefruit League",
                    "link": "/api/v1/league/115",
                    "abbreviation": "GL"
                  },
                  "allStarStatus": "N",
                  "id": 143,
                  "name": "Philadelphia Phillies",
                  "link": "/api/v1/teams/143"
                },
                "inning": 1,
                "pitcher": {
                  "id": 621121,
                  "fullName": "Lance McCullers Jr.",
                  "link": "/api/v1/people/621121"
                },
                "batter": {
                  "id": 547180,
                  "fullName": "Bryce Harper",
                  "link": "/api/v1/people/547180"
                },
                "coordinates": { "x": 193.13, "y": 50.82 },
                "type": "H",
                "description": "Home Run"
              },
              {
                "team": {
                  "springLeague": {
                    "id": 115,
                    "name": "Grapefruit League",
                    "link": "/api/v1/league/115",
                    "abbreviation": "GL"
                  },
                  "allStarStatus": "N",
                  "id": 143,
                  "name": "Philadelphia Phillies",
                  "link": "/api/v1/teams/143"
                },
                "inning": 1,
                "pitcher": {
                  "id": 621121,
                  "fullName": "Lance McCullers Jr.",
                  "link": "/api/v1/people/621121"
                },
                "batter": {
                  "id": 592206,
                  "fullName": "Nick Castellanos",
                  "link": "/api/v1/people/592206"
                },
                "coordinates": { "x": 102.34, "y": 169.83 },
                "type": "O",
                "description": "Groundout"
              }
            ]
          }
        },
        {
          "startIndex": 8,
          "endIndex": 17,
          "top": [8, 9, 10, 11, 12],
          "bottom": [13, 14, 15, 16, 17],
          "hits": {
            "away": [
              {
                "team": {
                  "springLeague": {
                    "id": 115,
                    "name": "Grapefruit League",
                    "link": "/api/v1/league/115",
                    "abbreviation": "GL"
                  },
                  "allStarStatus": "N",
                  "id": 117,
                  "name": "Houston Astros",
                  "link": "/api/v1/teams/117"
                },
                "inning": 2,
                "pitcher": {
                  "id": 624133,
                  "fullName": "Ranger Suarez",
                  "link": "/api/v1/people/624133"
                },
                "batter": {
                  "id": 608324,
                  "fullName": "Alex Bregman",
                  "link": "/api/v1/people/608324"
                },
                "coordinates": { "x": 98.79, "y": 163.75 },
                "type": "O",
                "description": "Groundout"
              },
              {
                "team": {
                  "springLeague": {
                    "id": 115,
                    "name": "Grapefruit League",
                    "link": "/api/v1/league/115",
                    "abbreviation": "GL"
                  },
                  "allStarStatus": "N",
                  "id": 117,
                  "name": "Houston Astros",
                  "link": "/api/v1/teams/117"
                },
                "inning": 2,
                "pitcher": {
                  "id": 624133,
                  "fullName": "Ranger Suarez",
                  "link": "/api/v1/people/624133"
                },
                "batter": {
                  "id": 663656,
                  "fullName": "Kyle Tucker",
                  "link": "/api/v1/people/663656"
                },
                "coordinates": { "x": 143.91, "y": 146.0 },
                "type": "O",
                "description": "Groundout"
              },
              {
                "team": {
                  "springLeague": {
                    "id": 115,
                    "name": "Grapefruit League",
                    "link": "/api/v1/league/115",
                    "abbreviation": "GL"
                  },
                  "allStarStatus": "N",
                  "id": 117,
                  "name": "Houston Astros",
                  "link": "/api/v1/teams/117"
                },
                "inning": 2,
                "pitcher": {
                  "id": 624133,
                  "fullName": "Ranger Suarez",
                  "link": "/api/v1/people/624133"
                },
                "batter": {
                  "id": 493329,
                  "fullName": "Yuli Gurriel",
                  "link": "/api/v1/people/493329"
                },
                "coordinates": { "x": 102.58, "y": 177.52 },
                "type": "H",
                "description": "Single"
              },
              {
                "team": {
                  "springLeague": {
                    "id": 115,
                    "name": "Grapefruit League",
                    "link": "/api/v1/league/115",
                    "abbreviation": "GL"
                  },
                  "allStarStatus": "N",
                  "id": 117,
                  "name": "Houston Astros",
                  "link": "/api/v1/teams/117"
                },
                "inning": 2,
                "pitcher": {
                  "id": 624133,
                  "fullName": "Ranger Suarez",
                  "link": "/api/v1/people/624133"
                },
                "batter": {
                  "id": 682073,
                  "fullName": "David Hensley",
                  "link": "/api/v1/people/682073"
                },
                "coordinates": { "x": 123.91, "y": 90.78 },
                "type": "H",
                "description": "Single"
              }
            ],
            "home": [
              {
                "team": {
                  "springLeague": {
                    "id": 115,
                    "name": "Grapefruit League",
                    "link": "/api/v1/league/115",
                    "abbreviation": "GL"
                  },
                  "allStarStatus": "N",
                  "id": 143,
                  "name": "Philadelphia Phillies",
                  "link": "/api/v1/teams/143"
                },
                "inning": 2,
                "pitcher": {
                  "id": 621121,
                  "fullName": "Lance McCullers Jr.",
                  "link": "/api/v1/people/621121"
                },
                "batter": {
                  "id": 664761,
                  "fullName": "Alec Bohm",
                  "link": "/api/v1/people/664761"
                },
                "coordinates": { "x": 51.84, "y": 67.63 },
                "type": "H",
                "description": "Home Run"
              },
              {
                "team": {
                  "springLeague": {
                    "id": 115,
                    "name": "Grapefruit League",
                    "link": "/api/v1/league/115",
                    "abbreviation": "GL"
                  },
                  "allStarStatus": "N",
                  "id": 143,
                  "name": "Philadelphia Phillies",
                  "link": "/api/v1/teams/143"
                },
                "inning": 2,
                "pitcher": {
                  "id": 621121,
                  "fullName": "Lance McCullers Jr.",
                  "link": "/api/v1/people/621121"
                },
                "batter": {
                  "id": 669016,
                  "fullName": "Brandon Marsh",
                  "link": "/api/v1/people/669016"
                },
                "coordinates": { "x": 190.86, "y": 69.73 },
                "type": "H",
                "description": "Home Run"
              },
              {
                "team": {
                  "springLeague": {
                    "id": 115,
                    "name": "Grapefruit League",
                    "link": "/api/v1/league/115",
                    "abbreviation": "GL"
                  },
                  "allStarStatus": "N",
                  "id": 143,
                  "name": "Philadelphia Phillies",
                  "link": "/api/v1/teams/143"
                },
                "inning": 2,
                "pitcher": {
                  "id": 621121,
                  "fullName": "Lance McCullers Jr.",
                  "link": "/api/v1/people/621121"
                },
                "batter": {
                  "id": 656941,
                  "fullName": "Kyle Schwarber",
                  "link": "/api/v1/people/656941"
                },
                "coordinates": { "x": 159.62, "y": 167.8 },
                "type": "O",
                "description": "Groundout"
              }
            ]
          }
        },
        {
          "startIndex": 18,
          "endIndex": 23,
          "top": [18, 19, 20],
          "bottom": [21, 22, 23],
          "hits": {
            "away": [
              {
                "team": {
                  "springLeague": {
                    "id": 115,
                    "name": "Grapefruit League",
                    "link": "/api/v1/league/115",
                    "abbreviation": "GL"
                  },
                  "allStarStatus": "N",
                  "id": 117,
                  "name": "Houston Astros",
                  "link": "/api/v1/teams/117"
                },
                "inning": 3,
                "pitcher": {
                  "id": 624133,
                  "fullName": "Ranger Suarez",
                  "link": "/api/v1/people/624133"
                },
                "batter": {
                  "id": 514888,
                  "fullName": "Jose Altuve",
                  "link": "/api/v1/people/514888"
                },
                "coordinates": { "x": 127.69, "y": 182.5 },
                "type": "O",
                "description": "Lineout"
              },
              {
                "team": {
                  "springLeague": {
                    "id": 115,
                    "name": "Grapefruit League",
                    "link": "/api/v1/league/115",
                    "abbreviation": "GL"
                  },
                  "allStarStatus": "N",
                  "id": 117,
                  "name": "Houston Astros",
                  "link": "/api/v1/teams/117"
                },
                "inning": 3,
                "pitcher": {
                  "id": 624133,
                  "fullName": "Ranger Suarez",
                  "link": "/api/v1/people/624133"
                },
                "batter": {
                  "id": 665161,
                  "fullName": "Jeremy Pena",
                  "link": "/api/v1/people/665161"
                },
                "coordinates": { "x": 102.34, "y": 161.21 },
                "type": "O",
                "description": "Groundout"
              }
            ],
            "home": [
              {
                "team": {
                  "springLeague": {
                    "id": 115,
                    "name": "Grapefruit League",
                    "link": "/api/v1/league/115",
                    "abbreviation": "GL"
                  },
                  "allStarStatus": "N",
                  "id": 143,
                  "name": "Philadelphia Phillies",
                  "link": "/api/v1/teams/143"
                },
                "inning": 3,
                "pitcher": {
                  "id": 621121,
                  "fullName": "Lance McCullers Jr.",
                  "link": "/api/v1/people/621121"
                },
                "batter": {
                  "id": 547180,
                  "fullName": "Bryce Harper",
                  "link": "/api/v1/people/547180"
                },
                "coordinates": { "x": 161.15, "y": 138.91 },
                "type": "O",
                "description": "Groundout"
              }
            ]
          }
        },
        {
          "startIndex": 24,
          "endIndex": 29,
          "top": [24, 25, 26],
          "bottom": [27, 28, 29],
          "hits": {
            "away": [
              {
                "team": {
                  "springLeague": {
                    "id": 115,
                    "name": "Grapefruit League",
                    "link": "/api/v1/league/115",
                    "abbreviation": "GL"
                  },
                  "allStarStatus": "N",
                  "id": 117,
                  "name": "Houston Astros",
                  "link": "/api/v1/teams/117"
                },
                "inning": 4,
                "pitcher": {
                  "id": 624133,
                  "fullName": "Ranger Suarez",
                  "link": "/api/v1/people/624133"
                },
                "batter": {
                  "id": 670541,
                  "fullName": "Yordan Alvarez",
                  "link": "/api/v1/people/670541"
                },
                "coordinates": { "x": 153.03, "y": 168.82 },
                "type": "O",
                "description": "Groundout"
              },
              {
                "team": {
                  "springLeague": {
                    "id": 115,
                    "name": "Grapefruit League",
                    "link": "/api/v1/league/115",
                    "abbreviation": "GL"
                  },
                  "allStarStatus": "N",
                  "id": 117,
                  "name": "Houston Astros",
                  "link": "/api/v1/teams/117"
                },
                "inning": 4,
                "pitcher": {
                  "id": 624133,
                  "fullName": "Ranger Suarez",
                  "link": "/api/v1/people/624133"
                },
                "batter": {
                  "id": 608324,
                  "fullName": "Alex Bregman",
                  "link": "/api/v1/people/608324"
                },
                "coordinates": { "x": 161.15, "y": 170.84 },
                "type": "O",
                "description": "Groundout"
              },
              {
                "team": {
                  "springLeague": {
                    "id": 115,
                    "name": "Grapefruit League",
                    "link": "/api/v1/league/115",
                    "abbreviation": "GL"
                  },
                  "allStarStatus": "N",
                  "id": 117,
                  "name": "Houston Astros",
                  "link": "/api/v1/teams/117"
                },
                "inning": 4,
                "pitcher": {
                  "id": 624133,
                  "fullName": "Ranger Suarez",
                  "link": "/api/v1/people/624133"
                },
                "batter": {
                  "id": 663656,
                  "fullName": "Kyle Tucker",
                  "link": "/api/v1/people/663656"
                },
                "coordinates": { "x": 87.72, "y": 58.14 },
                "type": "O",
                "description": "Flyout"
              }
            ],
            "home": [
              {
                "team": {
                  "springLeague": {
                    "id": 115,
                    "name": "Grapefruit League",
                    "link": "/api/v1/league/115",
                    "abbreviation": "GL"
                  },
                  "allStarStatus": "N",
                  "id": 143,
                  "name": "Philadelphia Phillies",
                  "link": "/api/v1/teams/143"
                },
                "inning": 4,
                "pitcher": {
                  "id": 621121,
                  "fullName": "Lance McCullers Jr.",
                  "link": "/api/v1/people/621121"
                },
                "batter": {
                  "id": 592206,
                  "fullName": "Nick Castellanos",
                  "link": "/api/v1/people/592206"
                },
                "coordinates": { "x": 116.53, "y": 154.12 },
                "type": "O",
                "description": "Groundout"
              },
              {
                "team": {
                  "springLeague": {
                    "id": 115,
                    "name": "Grapefruit League",
                    "link": "/api/v1/league/115",
                    "abbreviation": "GL"
                  },
                  "allStarStatus": "N",
                  "id": 143,
                  "name": "Philadelphia Phillies",
                  "link": "/api/v1/teams/143"
                },
                "inning": 4,
                "pitcher": {
                  "id": 621121,
                  "fullName": "Lance McCullers Jr.",
                  "link": "/api/v1/people/621121"
                },
                "batter": {
                  "id": 664761,
                  "fullName": "Alec Bohm",
                  "link": "/api/v1/people/664761"
                },
                "coordinates": { "x": 118.02, "y": 72.85 },
                "type": "O",
                "description": "Flyout"
              },
              {
                "team": {
                  "springLeague": {
                    "id": 115,
                    "name": "Grapefruit League",
                    "link": "/api/v1/league/115",
                    "abbreviation": "GL"
                  },
                  "allStarStatus": "N",
                  "id": 143,
                  "name": "Philadelphia Phillies",
                  "link": "/api/v1/teams/143"
                },
                "inning": 4,
                "pitcher": {
                  "id": 621121,
                  "fullName": "Lance McCullers Jr.",
                  "link": "/api/v1/people/621121"
                },
                "batter": {
                  "id": 681082,
                  "fullName": "Bryson Stott",
                  "link": "/api/v1/people/681082"
                },
                "coordinates": { "x": 153.54, "y": 165.78 },
                "type": "O",
                "description": "Groundout"
              }
            ]
          }
        },
        {
          "startIndex": 30,
          "endIndex": 40,
          "top": [30, 31, 32, 33, 34],
          "bottom": [35, 36, 37, 38, 39, 40],
          "hits": {
            "away": [
              {
                "team": {
                  "springLeague": {
                    "id": 115,
                    "name": "Grapefruit League",
                    "link": "/api/v1/league/115",
                    "abbreviation": "GL"
                  },
                  "allStarStatus": "N",
                  "id": 117,
                  "name": "Houston Astros",
                  "link": "/api/v1/teams/117"
                },
                "inning": 5,
                "pitcher": {
                  "id": 624133,
                  "fullName": "Ranger Suarez",
                  "link": "/api/v1/people/624133"
                },
                "batter": {
                  "id": 493329,
                  "fullName": "Yuli Gurriel",
                  "link": "/api/v1/people/493329"
                },
                "coordinates": { "x": 146.95, "y": 150.06 },
                "type": "O",
                "description": "Groundout"
              },
              {
                "team": {
                  "springLeague": {
                    "id": 115,
                    "name": "Grapefruit League",
                    "link": "/api/v1/league/115",
                    "abbreviation": "GL"
                  },
                  "allStarStatus": "N",
                  "id": 117,
                  "name": "Houston Astros",
                  "link": "/api/v1/teams/117"
                },
                "inning": 5,
                "pitcher": {
                  "id": 624133,
                  "fullName": "Ranger Suarez",
                  "link": "/api/v1/people/624133"
                },
                "batter": {
                  "id": 455117,
                  "fullName": "Martin Maldonado",
                  "link": "/api/v1/people/455117"
                },
                "coordinates": { "x": 118.05, "y": 92.77 },
                "type": "H",
                "description": "Single"
              },
              {
                "team": {
                  "springLeague": {
                    "id": 115,
                    "name": "Grapefruit League",
                    "link": "/api/v1/league/115",
                    "abbreviation": "GL"
                  },
                  "allStarStatus": "N",
                  "id": 117,
                  "name": "Houston Astros",
                  "link": "/api/v1/teams/117"
                },
                "inning": 5,
                "pitcher": {
                  "id": 624133,
                  "fullName": "Ranger Suarez",
                  "link": "/api/v1/people/624133"
                },
                "batter": {
                  "id": 514888,
                  "fullName": "Jose Altuve",
                  "link": "/api/v1/people/514888"
                },
                "coordinates": { "x": 149.73, "y": 187.03 },
                "type": "O",
                "description": "Pop Out"
              }
            ],
            "home": [
              {
                "team": {
                  "springLeague": {
                    "id": 115,
                    "name": "Grapefruit League",
                    "link": "/api/v1/league/115",
                    "abbreviation": "GL"
                  },
                  "allStarStatus": "N",
                  "id": 143,
                  "name": "Philadelphia Phillies",
                  "link": "/api/v1/teams/143"
                },
                "inning": 5,
                "pitcher": {
                  "id": 621121,
                  "fullName": "Lance McCullers Jr.",
                  "link": "/api/v1/people/621121"
                },
                "batter": {
                  "id": 516416,
                  "fullName": "Jean Segura",
                  "link": "/api/v1/people/516416"
                },
                "coordinates": { "x": 107.39, "y": 165.61 },
                "type": "O",
                "description": "Groundout"
              },
              {
                "team": {
                  "springLeague": {
                    "id": 115,
                    "name": "Grapefruit League",
                    "link": "/api/v1/league/115",
                    "abbreviation": "GL"
                  },
                  "allStarStatus": "N",
                  "id": 143,
                  "name": "Philadelphia Phillies",
                  "link": "/api/v1/teams/143"
                },
                "inning": 5,
                "pitcher": {
                  "id": 621121,
                  "fullName": "Lance McCullers Jr.",
                  "link": "/api/v1/people/621121"
                },
                "batter": {
                  "id": 669016,
                  "fullName": "Brandon Marsh",
                  "link": "/api/v1/people/669016"
                },
                "coordinates": { "x": 192.62, "y": 122.31 },
                "type": "H",
                "description": "Single"
              },
              {
                "team": {
                  "springLeague": {
                    "id": 115,
                    "name": "Grapefruit League",
                    "link": "/api/v1/league/115",
                    "abbreviation": "GL"
                  },
                  "allStarStatus": "N",
                  "id": 143,
                  "name": "Philadelphia Phillies",
                  "link": "/api/v1/teams/143"
                },
                "inning": 5,
                "pitcher": {
                  "id": 621121,
                  "fullName": "Lance McCullers Jr.",
                  "link": "/api/v1/people/621121"
                },
                "batter": {
                  "id": 656941,
                  "fullName": "Kyle Schwarber",
                  "link": "/api/v1/people/656941"
                },
                "coordinates": { "x": 118.22, "y": 19.44 },
                "type": "H",
                "description": "Home Run"
              },
              {
                "team": {
                  "springLeague": {
                    "id": 115,
                    "name": "Grapefruit League",
                    "link": "/api/v1/league/115",
                    "abbreviation": "GL"
                  },
                  "allStarStatus": "N",
                  "id": 143,
                  "name": "Philadelphia Phillies",
                  "link": "/api/v1/teams/143"
                },
                "inning": 5,
                "pitcher": {
                  "id": 621121,
                  "fullName": "Lance McCullers Jr.",
                  "link": "/api/v1/people/621121"
                },
                "batter": {
                  "id": 656555,
                  "fullName": "Rhys Hoskins",
                  "link": "/api/v1/people/656555"
                },
                "coordinates": { "x": 47.81, "y": 69.18 },
                "type": "H",
                "description": "Home Run"
              }
            ]
          }
        },
        {
          "startIndex": 41,
          "endIndex": 49,
          "top": [41, 42, 43, 44],
          "bottom": [45, 46, 47, 48, 49],
          "hits": {
            "away": [
              {
                "team": {
                  "springLeague": {
                    "id": 115,
                    "name": "Grapefruit League",
                    "link": "/api/v1/league/115",
                    "abbreviation": "GL"
                  },
                  "allStarStatus": "N",
                  "id": 117,
                  "name": "Houston Astros",
                  "link": "/api/v1/teams/117"
                },
                "inning": 6,
                "pitcher": {
                  "id": 641401,
                  "fullName": "Connor Brogdon",
                  "link": "/api/v1/people/641401"
                },
                "batter": {
                  "id": 665161,
                  "fullName": "Jeremy Pena",
                  "link": "/api/v1/people/665161"
                },
                "coordinates": { "x": 66.03, "y": 102.28 },
                "type": "H",
                "description": "Single"
              },
              {
                "team": {
                  "springLeague": {
                    "id": 115,
                    "name": "Grapefruit League",
                    "link": "/api/v1/league/115",
                    "abbreviation": "GL"
                  },
                  "allStarStatus": "N",
                  "id": 117,
                  "name": "Houston Astros",
                  "link": "/api/v1/teams/117"
                },
                "inning": 6,
                "pitcher": {
                  "id": 641401,
                  "fullName": "Connor Brogdon",
                  "link": "/api/v1/people/641401"
                },
                "batter": {
                  "id": 670541,
                  "fullName": "Yordan Alvarez",
                  "link": "/api/v1/people/670541"
                },
                "coordinates": { "x": 170.67, "y": 106.79 },
                "type": "O",
                "description": "Lineout"
              },
              {
                "team": {
                  "springLeague": {
                    "id": 115,
                    "name": "Grapefruit League",
                    "link": "/api/v1/league/115",
                    "abbreviation": "GL"
                  },
                  "allStarStatus": "N",
                  "id": 117,
                  "name": "Houston Astros",
                  "link": "/api/v1/teams/117"
                },
                "inning": 6,
                "pitcher": {
                  "id": 641401,
                  "fullName": "Connor Brogdon",
                  "link": "/api/v1/people/641401"
                },
                "batter": {
                  "id": 608324,
                  "fullName": "Alex Bregman",
                  "link": "/api/v1/people/608324"
                },
                "coordinates": { "x": 83.84, "y": 156.73 },
                "type": "O",
                "description": "Pop Out"
              }
            ],
            "home": [
              {
                "team": {
                  "springLeague": {
                    "id": 115,
                    "name": "Grapefruit League",
                    "link": "/api/v1/league/115",
                    "abbreviation": "GL"
                  },
                  "allStarStatus": "N",
                  "id": 143,
                  "name": "Philadelphia Phillies",
                  "link": "/api/v1/teams/143"
                },
                "inning": 6,
                "pitcher": {
                  "id": 664353,
                  "fullName": "Jose Urquidy",
                  "link": "/api/v1/people/664353"
                },
                "batter": {
                  "id": 592206,
                  "fullName": "Nick Castellanos",
                  "link": "/api/v1/people/592206"
                },
                "coordinates": { "x": 172.3, "y": 110.01 },
                "type": "H",
                "description": "Single"
              },
              {
                "team": {
                  "springLeague": {
                    "id": 115,
                    "name": "Grapefruit League",
                    "link": "/api/v1/league/115",
                    "abbreviation": "GL"
                  },
                  "allStarStatus": "N",
                  "id": 143,
                  "name": "Philadelphia Phillies",
                  "link": "/api/v1/teams/143"
                },
                "inning": 6,
                "pitcher": {
                  "id": 664353,
                  "fullName": "Jose Urquidy",
                  "link": "/api/v1/people/664353"
                },
                "batter": {
                  "id": 516416,
                  "fullName": "Jean Segura",
                  "link": "/api/v1/people/516416"
                },
                "coordinates": { "x": 108.93, "y": 157.16 },
                "type": "O",
                "description": "Pop Out"
              },
              {
                "team": {
                  "springLeague": {
                    "id": 115,
                    "name": "Grapefruit League",
                    "link": "/api/v1/league/115",
                    "abbreviation": "GL"
                  },
                  "allStarStatus": "N",
                  "id": 143,
                  "name": "Philadelphia Phillies",
                  "link": "/api/v1/teams/143"
                },
                "inning": 6,
                "pitcher": {
                  "id": 664353,
                  "fullName": "Jose Urquidy",
                  "link": "/api/v1/people/664353"
                },
                "batter": {
                  "id": 669016,
                  "fullName": "Brandon Marsh",
                  "link": "/api/v1/people/669016"
                },
                "coordinates": { "x": 48.28, "y": 99.38 },
                "type": "O",
                "description": "Flyout"
              }
            ]
          }
        },
        {
          "startIndex": 50,
          "endIndex": 56,
          "top": [50, 51, 52, 53],
          "bottom": [54, 55, 56],
          "hits": {
            "away": [
              {
                "team": {
                  "springLeague": {
                    "id": 115,
                    "name": "Grapefruit League",
                    "link": "/api/v1/league/115",
                    "abbreviation": "GL"
                  },
                  "allStarStatus": "N",
                  "id": 117,
                  "name": "Houston Astros",
                  "link": "/api/v1/teams/117"
                },
                "inning": 7,
                "pitcher": {
                  "id": 502043,
                  "fullName": "Kyle Gibson",
                  "link": "/api/v1/people/502043"
                },
                "batter": {
                  "id": 493329,
                  "fullName": "Yuli Gurriel",
                  "link": "/api/v1/people/493329"
                },
                "coordinates": { "x": 135.87, "y": 63.78 },
                "type": "O",
                "description": "Flyout"
              },
              {
                "team": {
                  "springLeague": {
                    "id": 115,
                    "name": "Grapefruit League",
                    "link": "/api/v1/league/115",
                    "abbreviation": "GL"
                  },
                  "allStarStatus": "N",
                  "id": 117,
                  "name": "Houston Astros",
                  "link": "/api/v1/teams/117"
                },
                "inning": 7,
                "pitcher": {
                  "id": 502043,
                  "fullName": "Kyle Gibson",
                  "link": "/api/v1/people/502043"
                },
                "batter": {
                  "id": 676801,
                  "fullName": "Chas McCormick",
                  "link": "/api/v1/people/676801"
                },
                "coordinates": { "x": 145.43, "y": 86.18 },
                "type": "H",
                "description": "Single"
              },
              {
                "team": {
                  "springLeague": {
                    "id": 115,
                    "name": "Grapefruit League",
                    "link": "/api/v1/league/115",
                    "abbreviation": "GL"
                  },
                  "allStarStatus": "N",
                  "id": 117,
                  "name": "Houston Astros",
                  "link": "/api/v1/teams/117"
                },
                "inning": 7,
                "pitcher": {
                  "id": 502043,
                  "fullName": "Kyle Gibson",
                  "link": "/api/v1/people/502043"
                },
                "batter": {
                  "id": 455117,
                  "fullName": "Martin Maldonado",
                  "link": "/api/v1/people/455117"
                },
                "coordinates": { "x": 125.34, "y": 178.09 },
                "type": "O",
                "description": "Groundout"
              }
            ],
            "home": [
              {
                "team": {
                  "springLeague": {
                    "id": 115,
                    "name": "Grapefruit League",
                    "link": "/api/v1/league/115",
                    "abbreviation": "GL"
                  },
                  "allStarStatus": "N",
                  "id": 143,
                  "name": "Philadelphia Phillies",
                  "link": "/api/v1/teams/143"
                },
                "inning": 7,
                "pitcher": {
                  "id": 664353,
                  "fullName": "Jose Urquidy",
                  "link": "/api/v1/people/664353"
                },
                "batter": {
                  "id": 656555,
                  "fullName": "Rhys Hoskins",
                  "link": "/api/v1/people/656555"
                },
                "coordinates": { "x": 150.87, "y": 55.31 },
                "type": "O",
                "description": "Flyout"
              }
            ]
          }
        },
        {
          "startIndex": 57,
          "endIndex": 64,
          "top": [57, 58, 59, 60, 61],
          "bottom": [62, 63, 64],
          "hits": {
            "away": [
              {
                "team": {
                  "springLeague": {
                    "id": 115,
                    "name": "Grapefruit League",
                    "link": "/api/v1/league/115",
                    "abbreviation": "GL"
                  },
                  "allStarStatus": "N",
                  "id": 117,
                  "name": "Houston Astros",
                  "link": "/api/v1/teams/117"
                },
                "inning": 8,
                "pitcher": {
                  "id": 656793,
                  "fullName": "Nick Nelson",
                  "link": "/api/v1/people/656793"
                },
                "batter": {
                  "id": 514888,
                  "fullName": "Jose Altuve",
                  "link": "/api/v1/people/514888"
                },
                "coordinates": { "x": 118.05, "y": 149.55 },
                "type": "O",
                "description": "Groundout"
              },
              {
                "team": {
                  "springLeague": {
                    "id": 115,
                    "name": "Grapefruit League",
                    "link": "/api/v1/league/115",
                    "abbreviation": "GL"
                  },
                  "allStarStatus": "N",
                  "id": 117,
                  "name": "Houston Astros",
                  "link": "/api/v1/teams/117"
                },
                "inning": 8,
                "pitcher": {
                  "id": 656793,
                  "fullName": "Nick Nelson",
                  "link": "/api/v1/people/656793"
                },
                "batter": {
                  "id": 670541,
                  "fullName": "Yordan Alvarez",
                  "link": "/api/v1/people/670541"
                },
                "coordinates": { "x": 141.88, "y": 102.91 },
                "type": "O",
                "description": "Flyout"
              },
              {
                "team": {
                  "springLeague": {
                    "id": 115,
                    "name": "Grapefruit League",
                    "link": "/api/v1/league/115",
                    "abbreviation": "GL"
                  },
                  "allStarStatus": "N",
                  "id": 117,
                  "name": "Houston Astros",
                  "link": "/api/v1/teams/117"
                },
                "inning": 8,
                "pitcher": {
                  "id": 656793,
                  "fullName": "Nick Nelson",
                  "link": "/api/v1/people/656793"
                },
                "batter": {
                  "id": 663656,
                  "fullName": "Kyle Tucker",
                  "link": "/api/v1/people/663656"
                },
                "coordinates": { "x": 45.77, "y": 94.95 },
                "type": "O",
                "description": "Flyout"
              }
            ],
            "home": [
              {
                "team": {
                  "springLeague": {
                    "id": 115,
                    "name": "Grapefruit League",
                    "link": "/api/v1/league/115",
                    "abbreviation": "GL"
                  },
                  "allStarStatus": "N",
                  "id": 143,
                  "name": "Philadelphia Phillies",
                  "link": "/api/v1/teams/143"
                },
                "inning": 8,
                "pitcher": {
                  "id": 664353,
                  "fullName": "Jose Urquidy",
                  "link": "/api/v1/people/664353"
                },
                "batter": {
                  "id": 547180,
                  "fullName": "Bryce Harper",
                  "link": "/api/v1/people/547180"
                },
                "coordinates": { "x": 97.78, "y": 137.39 },
                "type": "O",
                "description": "Pop Out"
              },
              {
                "team": {
                  "springLeague": {
                    "id": 115,
                    "name": "Grapefruit League",
                    "link": "/api/v1/league/115",
                    "abbreviation": "GL"
                  },
                  "allStarStatus": "N",
                  "id": 143,
                  "name": "Philadelphia Phillies",
                  "link": "/api/v1/teams/143"
                },
                "inning": 8,
                "pitcher": {
                  "id": 664353,
                  "fullName": "Jose Urquidy",
                  "link": "/api/v1/people/664353"
                },
                "batter": {
                  "id": 664761,
                  "fullName": "Alec Bohm",
                  "link": "/api/v1/people/664761"
                },
                "coordinates": { "x": 214.88, "y": 123.7 },
                "type": "O",
                "description": "Flyout"
              }
            ]
          }
        },
        {
          "startIndex": 65,
          "endIndex": 67,
          "top": [65, 66, 67],
          "bottom": [],
          "hits": {
            "away": [
              {
                "team": {
                  "springLeague": {
                    "id": 115,
                    "name": "Grapefruit League",
                    "link": "/api/v1/league/115",
                    "abbreviation": "GL"
                  },
                  "allStarStatus": "N",
                  "id": 117,
                  "name": "Houston Astros",
                  "link": "/api/v1/teams/117"
                },
                "inning": 9,
                "pitcher": {
                  "id": 571479,
                  "fullName": "Andrew Bellatti",
                  "link": "/api/v1/people/571479"
                },
                "batter": {
                  "id": 493329,
                  "fullName": "Yuli Gurriel",
                  "link": "/api/v1/people/493329"
                },
                "coordinates": { "x": 166.59, "y": 142.6 },
                "type": "O",
                "description": "Pop Out"
              },
              {
                "team": {
                  "springLeague": {
                    "id": 115,
                    "name": "Grapefruit League",
                    "link": "/api/v1/league/115",
                    "abbreviation": "GL"
                  },
                  "allStarStatus": "N",
                  "id": 117,
                  "name": "Houston Astros",
                  "link": "/api/v1/teams/117"
                },
                "inning": 9,
                "pitcher": {
                  "id": 571479,
                  "fullName": "Andrew Bellatti",
                  "link": "/api/v1/people/571479"
                },
                "batter": {
                  "id": 641820,
                  "fullName": "Trey Mancini",
                  "link": "/api/v1/people/641820"
                },
                "coordinates": { "x": 198.44, "y": 132.74 },
                "type": "O",
                "description": "Flyout"
              }
            ],
            "home": []
          }
        }
      ]
    }
    """
  end
end
