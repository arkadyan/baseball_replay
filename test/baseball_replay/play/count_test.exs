defmodule BaseballReplay.Play.CountTest do
  use ExUnit.Case, async: true

  alias BaseballReplay.Play.Count

  @json %{
    "balls" => 0,
    "strikes" => 0,
    "outs" => 2
  }

  describe "parse/1" do
    test "parses json data into a Count struct" do
      assert Count.parse(@json) ==
               {:ok,
                %Count{
                  balls: 0,
                  strikes: 0,
                  outs: 2
                }}
    end
  end
end
