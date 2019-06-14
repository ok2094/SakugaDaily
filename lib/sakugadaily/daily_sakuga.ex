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
    SakugaScraper.get_html()
    receive do
    after
      2_000 ->
        post_sakuga()
    end
  end
end
