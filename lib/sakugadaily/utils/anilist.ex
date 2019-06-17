defmodule Sakugadaily.Utils.Anilist do
  alias Sakugadaily.Utils.SakugaScraper

  def post() do
    {:ok, sakuga_post_url, video_url} = SakugaScraper.sakuga_data()

    content = "webm(#{video_url})
    [Source](#{sakuga_post_url})"

    Neuron.query("""
      mutation ($text: String) {
        SaveTextActivity(text: $text) {
          id
          text
        }
      }
    """,
    %{text: content},
    url: "https://graphql.anilist.co",
    headers: [authorization: "Bearer #{Application.get_env(:sakugadaily, :bearer_token)}"]
    )

    IO.puts("Created Post: " <> sakuga_post_url)

  end
end
