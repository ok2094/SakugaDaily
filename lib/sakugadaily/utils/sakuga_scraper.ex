defmodule Sakugadaily.Utils.SakugaScraper do
  @url "https://www.sakugabooru.com/post/random"

  def sakuga_data() do
    {:ok, url, html} = get_html()

    sakuga_url = Floki.attribute(html, ".original-file-unchanged", "href")
    |> List.first

    {:ok, url, sakuga_url}
  end

  defp get_html() do
    post_url = HTTPoison.head(@url)
    |> get_headers
    |> get_location

    post_body = HTTPoison.get(post_url)
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
