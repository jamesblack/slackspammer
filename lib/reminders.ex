defmodule Reminders.Application do
  use Application

  def start(_type, _args) do
    slack_token = Application.get_env(:reminders, Reminders.Slack)[:token]
    IO.puts(slack_token)

    children = [
      %{
        id: Slack.Bot,
        start:
          {Slack.Bot, :start_link, [Reminders.Slack, [], slack_token, %{name: :ReminderSlack}]}
      },
      ElixirReminders
    ]

    opts = [strategy: :one_for_all, name: RemindersSupervisor]
    Supervisor.start_link(children, opts)
  end
end
