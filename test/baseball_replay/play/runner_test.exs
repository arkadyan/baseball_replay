defmodule BaseballReplay.Play.RunnerTest do
  use ExUnit.Case, async: true

  alias BaseballReplay.Play.Runner

  @json %{
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

  describe "parse/1" do
    test "parses json data into a Runner struct" do
      assert Runner.parse(@json) ==
               {:ok,
                %Runner{
                  movement: %{
                    origin_base: nil,
                    start: nil,
                    end: nil,
                    outBase: :"1B",
                    out?: true,
                    out_number: 1
                  }
                }}
    end
  end
end
