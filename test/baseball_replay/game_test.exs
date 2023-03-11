defmodule BaseballReplay.GameTest do
  use ExUnit.Case, async: true

  import BaseballReplay.TestHelpers

  alias BaseballReplay.Game
  alias BaseballReplay.Play

  describe "parse/1" do
    test "returns a Game struct" do
      binary = read_fixture!("715722-playByPlay.json")

      assert {:ok,
              %Game{
                start_time: ~U[2022-11-02 00:05:14.458Z],
                all_plays: all_plays,
                current_play: %Play{}
              }} = Game.parse(binary)

      assert Enum.all?(all_plays, &match?(%Play{}, &1))
    end
  end
end
