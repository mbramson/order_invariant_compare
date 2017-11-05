defmodule OrderInvariantCompareTest do
  use ExUnit.Case
  use Quixir
  doctest OrderInvariantCompare

  import OrderInvariantCompare

  test "comparison of equal values is alwaus true" do
    ptest value: any() do
      assert value <~> value
    end
  end

  test "comparison of lists with unordered elements" do
    ptest value: list() do
      assert value <~> Enum.shuffle(value)
    end
  end

  test "comparison of different elements is false" do
    refute [1, 2] <~> [1]
  end
end
