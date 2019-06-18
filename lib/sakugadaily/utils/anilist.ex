defmodule Sakugadaily.Utils.Anilist do
  alias Sakugadaily.Utils.SakugaScraper

  def post(token) do
    {:ok, sakuga_post_url, video_url, artist, source} = SakugaScraper.sakuga_data()

    content = """
    webm(#{video_url})
    Key Animation: #{List.to_string(Enum.map(artist, &("[" <> &1 <> "] ")))}
    Source: #{List.to_string(Enum.map(source, &("[" <> &1 <> "] ")))}
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
end
