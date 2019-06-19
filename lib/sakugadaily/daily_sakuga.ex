defmodule Sakugadaily.DailySakuga do
  use GenServer

  alias Sakugadaily.Utils.Anilist
  alias Sakugadaily.Utils.Auth

  def start_link([]) do
    GenServer.start_link(__MODULE__, :ok, name: :daily_sakuga)
  end

  def init(state) do
    {:ok, client} = Auth.initialize()
    token = client.token.access_token
    post_sakuga(token)
    {:ok, state}
  end

  def post_sakuga(token) do
    Anilist.post(token)

    receive do
    after
      7_200_000 ->
        post_sakuga(token)
    end
  end
end
