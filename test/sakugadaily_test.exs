defmodule SakugadailyTest do
  use ExUnit.Case
  doctest Sakugadaily

  test "greets the world" do
    assert Sakugadaily.hello() == :world
  end

  # test "post by score" do
  #   {:ok, url, body} = Sakugadaily.Utils.SakugaScraper.get_html()

  #   score =
  #     body
  #     |> Floki.find("span[id^='post-score-']")
  #     |> Floki.text()
  #     |> String.to_integer()

  #   IO.inspect(test)
  #   IO.inspect(score)

  #   assert score >= 30
  # end

  # test "list string" do
  #   test = Sakugadaily.Utils.Anilist.list_to_string(["test1"])

  #   IO.inspect(test)
  # end
end
