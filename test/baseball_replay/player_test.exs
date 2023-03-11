defmodule BaseballReplay.PlayerTest do
  use ExUnit.Case, async: true

  alias BaseballReplay.Player

  @json %{
    "id" => 624_133,
    "fullName" => "Ranger Suarez",
    "link" => "/api/v1/people/624133"
  }

  describe "parse/1" do
    test "parses json data into a Player struct" do
      assert Player.parse(@json) ==
               {:ok,
                %Player{
                  id: 624_133,
                  full_name: "Ranger Suarez",
                  link: "/api/v1/people/624133"
                }}
    end
  end
end
