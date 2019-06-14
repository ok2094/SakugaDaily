defmodule Sakugadaily.Utils.SakugaScraper do
  @url "https://www.sakugabooru.com/post/random"

  def get_html do
    HTTPoison.get(@url)
    |> Map.get(&())
    |> IO.inspect
  end

end
