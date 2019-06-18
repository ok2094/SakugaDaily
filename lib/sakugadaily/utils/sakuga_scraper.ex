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

  defp get_html do
    post_url =
      @url
      |> HTTPoison.head()
      |> get_headers
      |> get_location

    post_body =
      post_url
      |> HTTPoison.get()
      |> get_body

    {:ok, post_url, post_body}
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
