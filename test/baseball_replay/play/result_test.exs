defmodule BaseballReplay.Play.ResultTest do
  use ExUnit.Case, async: true

  alias BaseballReplay.Play.Result

  @json %{
    "type" => "atBat",
    "event" => "Lineout",
    "eventType" => "field_out",
    "description" => "Jose Altuve lines out to right fielder Nick Castellanos.",
    "rbi" => 0,
    "awayScore" => 0,
    "homeScore" => 0,
    "isOut" => true
  }

  describe "parse/1" do
    test "parses json data into a Result struct" do
      assert Result.parse(@json) ==
               {:ok,
                %Result{
                  type: "atBat",
                  event: "Lineout",
                  event_type: "field_out",
                  description: "Jose Altuve lines out to right fielder Nick Castellanos.",
                  rbi: 0,
                  away_score: 0,
                  home_score: 0,
                  out?: true
                }}
    end
  end
end
