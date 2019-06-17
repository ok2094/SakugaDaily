defmodule Sakugadaily.DailySakuga do
  use GenServer

  alias Sakugadaily.Utils.Anilist
  def start_link([]) do
    GenServer.start_link(__MODULE__, :ok, name: :daily_sakuga)
  end

  def init(state) do
    post_sakuga()
    {:ok, state}
  end

  def post_sakuga do
    Anilist.post()
    receive do
    after
      36_000_000 ->
        post_sakuga()
    end
  end
end
