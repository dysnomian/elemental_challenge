defmodule AuthorsWithCds do
  @doc """
  Given a collection, intersect the set of book authors with the set of CD authors.
  """
  def run(collection) do
    author_set(collection, :book) |>
    MapSet.intersection(author_set(collection, :cd)) |>
    MapSet.to_list
  end

  def present(collection) do
    author_list = run(collection) |>
    Enum.map(&("  " <> &1)) |>
    Enum.join("\n")

    "Authors who also have CDs\n\n" <> author_list
  end

  # Given a collection and a media type, returns a set of authors listed under that media type.
  defp author_set(collection, media_type) do
    InputMap.by_type(collection) |>
    Map.fetch!(media_type) |>
    Enum.reduce(%MapSet{}, &(MapSet.put(&2, &1.author)))
  end
end
