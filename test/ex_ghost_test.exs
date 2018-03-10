defmodule ExGhostTest do
  use ExUnit.Case
  doctest ExGhost

  test "greets the world" do
    assert ExGhost.hello() == :world
  end
end
