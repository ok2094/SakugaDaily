defmodule Sakugadaily.Utils.SakugaScraper do
  @url "https://www.sakugabooru.com/post/random"

  def sakuga_data do
    {:ok, url, html} = get_html()

    video_url =
      html
      |> Floki.attribute(".original-file-unchanged", "href")
      |> List.first()

    artist =
      html
      |> Floki.attribute(".tag-type-artist", "data-name")

    source =
      html
      |> Floki.attribute(".tag-type-copyright", "data-name")

    {:ok, url, video_url, artist, source}
  end

  defp get_html(data \\ {}, score \\ 0)

  defp get_html(data, score) when score >= 30 do
    data
  end

  defp get_html(_data, _score) do
    post_url =
      @url
      |> HTTPoison.head()
      |> get_headers
      |> get_location

    post_body =
      post_url
      |> HTTPoison.get()
      |> get_body

    score =
      post_body
      |> Floki.find("span[id^='post-score-']")
      |> Floki.text()
      |> String.to_integer()

    data = {:ok, post_url, post_body}

    if Floki.find(post_body, ".original-file-unchanged") == [] do
      get_html()
    else
      get_html(data, score)
    end
  end

  defp get_location(response) do
    {"Location", location} = List.keyfind(response, "Location", 0)
    String.replace_leading(location, "http:", "https:")
  end

  defp get_headers({:ok, response}) do
    response.headers
  end

  defp get_body({:ok, response}) do
    response.body
  end
end
