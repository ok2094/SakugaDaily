defmodule Sakugadaily.DailySakuga do
  use GenServer

  alias Sakugadaily.Utils.SakugaScraper

  def start_link([]) do
    GenServer.start_link(__MODULE__, :ok, name: :daily_sakuga)
  end

  def init(state) do
    post_sakuga()
    {:ok, state}
  end

  def post_sakuga do
    SakugaScraper.sakuga_data()
    receive do
    after
      10_000 ->
        post_sakuga()
    end
  end
end
