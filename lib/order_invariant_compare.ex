defmodule OrderInvariantCompare do
  @moduledoc """
  OrderInvariantCompare defines the <~> operator which is used to compare two
  items. If they are equal, then it returns true. If they are lists, then it
  returns true if those lists contain the same elements, even if those elements
  are not in the same order.

  This can be useful for when you need to test collections of elements which
  are generated in some random manner
  """

  def left <~> right when is_list(left) and is_list(right) do
    Enum.sort(left) == Enum.sort(right)
  end
  def left <~> right do
    left == right
  end
end
