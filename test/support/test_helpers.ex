defmodule BaseballReplay.TestHelpers do
  @moduledoc """
  Helper functions used by multiple test cases.
  """

  def read_fixture!(path) do
    path
    |> fixture_path()
    |> File.read!()
  end

  def fixture_path(path) do
    fixture_path = Path.expand("./fixtures", __DIR__)
    Path.expand(path, fixture_path)
  end
end
