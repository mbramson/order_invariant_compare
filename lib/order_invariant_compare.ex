defmodule OrderInvariantCompare do
  @moduledoc """
  OrderInvariantCompare defines the `<~>` operator which is used to compare two
  items for equality. If they are lists, then it returns true if those lists
  contain the same elements, even if those elements are not in the same order.

  This can be useful for when you need to test collections of elements which
  are generated in some random manner.

  This module implements the `<~>` operator, which is by default unused by
  elixir. If another module also implements this function, you can also use the
  `equal?/2` function which behaves exactly the same.
  """

  @doc """
  Returns true if the values on the left and right are equal. If the values are
  lists, then this function also returns true if the lists contain the exact
  same elements, but in a different order.

  # Examples

      iex> [1, 2, 3] == [3, 2, 1]
      false

      iex> [1, 2, 3] <~> [3, 2, 1]
      true
  """
  @spec (term <~> term) :: boolean
  def left <~> right when is_list(left) and is_list(right) do
    equal?(left, right)
  end
  def left <~> right do
    equal?(left, right)
  end

  @doc """
  Returns true if the two values are equal. If the values are lists, then this
  function also returns true if the lists contain the exact same elements, but
  in a different order.

  # Examples

      iex> OrderInvariantCompare.equal?([1, 2, 3], [3, 2, 1])
      true

  This function is identical to the `<~>/2` function.
  """
  @spec equal?(term, term) :: boolean
  def equal?(first, second) when is_list(first) and is_list(second) do
    Enum.sort(first) == Enum.sort(second)
  end
  def equal?(first, second) do
    first == second
  end
end
