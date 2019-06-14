defmodule SakugadailyTest do
  use ExUnit.Case
  doctest Sakugadaily

  test "greets the world" do
    assert Sakugadaily.hello() == :world
  end
end
