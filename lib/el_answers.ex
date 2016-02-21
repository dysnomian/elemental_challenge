defmodule ElAnswers do
  @doc """
  Given a collection, determines the most expensive items per type.
  """
  def most_expensive_per_type(collection) do
    collection |>
    ElCollection.by_type |>
    Enum.map(fn {k, v} -> {k, ElCollection.most_expensive(v)} end)
  end

  @doc """
  Given a collection, lists the items with a type of :cd with a running time
  over an hour.
  """
  def cds_with_hour_plus_running_times(coll) do
    ElCollection.by_type(coll) |>
    Map.fetch!(:cd) |>
    Enum.filter(fn (cd) -> cd_length(cd) > 3600 end)
  end

  @doc """
  Given a collection, lists the authors with both CDs and books (as determined by the :type field).
  """
  def authors_with_cds(collection) do
  end

  @doc """
  Given a collection, lists the items where the title, track, or chapter
  contains a probable year.
  """
  def items_containing_years(collection) do
  end

  defp cd_length(cd_map) do
    Map.fetch!(cd_map, :tracks) |>
    Enum.reduce(0, &(&1.seconds + &2))
  end
end
