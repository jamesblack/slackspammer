defmodule ElixirRemindersTest do
  use ExUnit.Case
  doctest ElixirReminders

  test "greets the world" do
    assert ElixirReminders.hello() == :world
  end
end
