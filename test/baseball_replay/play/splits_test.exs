defmodule BaseballReplay.Play.SplitsTest do
  use ExUnit.Case, async: true

  alias BaseballReplay.Play.Splits

  @json %{
    "batter" => "vs_LHP",
    "pitcher" => "vs_RHB",
    "menOnBase" => "Empty"
  }

  describe "parse/1" do
    test "parses json data into a Splits struct" do
      assert Splits.parse(@json) ==
               {:ok,
                %Splits{
                  batter: :vs_lhp,
                  pitcher: :vs_rhb,
                  men_on_base: :empty
                }}
    end
  end
end
