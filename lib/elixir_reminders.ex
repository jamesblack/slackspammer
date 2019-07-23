defmodule ElixirReminders do
  use Task
  require Logger

  @blake "<@U9YJQLSV8>"

  def start_link(_arg) do
    Task.start_link(&tick/0)
  end

  def tick() do
    handle_tick()

    receive do
    after
      # 1 * 60 minutes per hour * 60 seconds per minute * 1000 ms
      # 1 * 60 * 60 * 1_000 ->
      5_000 ->
        tick()
    end
  end

  @messages [
    "#{@blake} have you heard of the Elixir Guild? It's a thing you started that you haven't kept up with, you should get on that!",
    "#{@blake}, you better be sick, dead, or falling apart. Why aren't you talking in the Elixir Guild?"
  ]
  defp handle_tick() do
    Logger.log(:debug, "5 seconds later")

    send(
      :ReminderSlack,
      {:message, Enum.random(@messages), "GLNGXG3JR"}
    )

    # send_message("Attempting to Spam <@U9YJQLSV8>", "GLNGXG3JR", slack)
  end
end
