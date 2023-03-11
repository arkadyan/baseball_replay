defmodule BaseballReplay.Play.AboutTest do
  use ExUnit.Case, async: true

  alias BaseballReplay.Play.About

  @json %{
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
  }

  describe "parse/1" do
    test "parses json data into a Result struct" do
      assert About.parse(@json) ==
               {:ok,
                %About{
                  at_bat_index: 0,
                  half_inning: "top",
                  top_inning?: true,
                  inning: 1,
                  start_time: ~U[2022-11-02 00:05:14.458Z],
                  end_time: ~U[2022-11-02 00:05:23.532Z],
                  complete?: true,
                  scoring_play?: false,
                  review?: false,
                  out?: true,
                  captivating_index: 0
                }}
    end
  end

  describe "start_time/1" do
    test "returns the play's start_time" do
      start_time = ~U[2022-11-02 00:05:14.458Z]
      about = %About{start_time: start_time}

      assert About.start_time(about) == start_time
    end
  end
end
