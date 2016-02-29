defmodule MostExpensive do
  @doc """
  Given a collection, determines the most expensive items per type.
  """
  def run(collection) do
    collection |>
    InputMap.by_type |>
    Enum.map(fn {k, v} ->
      {k, most_expensive(v)}
    end)
  end

  def present(collection) do
    run(collection) |>
    MostExpensivePresenter.present
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
