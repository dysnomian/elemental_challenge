defmodule ElCollection do
  @doc """
  Group items in collection by their :type value.
  """
  def by_type(coll) do
    Enum.group_by(coll, &(String.to_atom(&1.type)))
  end

  @doc """
  Find the items with the highest :price value, sorted by price in
  descending order. The default selection is 5 items.
  """
  def most_expensive(coll, count \\ 5) do
    Enum.sort_by(coll, &(&1.price), &>=/2) |>
    Enum.take(count)
  end
end
