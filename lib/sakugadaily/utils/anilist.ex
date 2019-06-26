defmodule Sakugadaily.Utils.Anilist do
  alias Sakugadaily.Utils.SakugaScraper

  def post(token) do
    {:ok, sakuga_post_url, video_url, artist, source} = SakugaScraper.sakuga_data()

    IO.puts(DateTime.to_string(DateTime.utc_now()) <> " Creating: " <> sakuga_post_url)

    content = """
    webm(#{video_url})
    Key Animation: #{list_to_string(artist)}
    Source: #{list_to_string(source)}
    [sakugabooru](#{sakuga_post_url})
    """

    Neuron.query(
      """
        mutation ($text: String) {
          SaveTextActivity(text: $text) {
            id
            text
          }
        }
      """,
      %{text: content},
      url: "https://graphql.anilist.co",
      headers: [authorization: "Bearer #{token}"]
    )

    IO.puts(DateTime.to_string(DateTime.utc_now()) <> " Created Post: " <> sakuga_post_url)
  end

  defp list_to_string(list) do
    if list != [] do
      [head | tail] = Enum.reverse(list)

      tail =
        tail
        |> Enum.map(&(&1 <> ", "))

      [head | tail]
      |> Enum.reverse()
      |> List.to_string()
      |> String.replace("_", " ")
    else
      "unknown"
    end
  end
end
