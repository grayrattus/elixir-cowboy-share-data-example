defmodule ElixirRegistryExampleTest do
  use ExUnit.Case
  doctest ElixirRegistryExample

  test "greets the world" do
    assert ElixirRegistryExample.hello() == :world
  end
end
