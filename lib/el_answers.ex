defmodule ElAnswers do
  @doc """
  Given a collection, determines the most expensive items per type.
  """
  def most_expensive_per_type(collection) do
    collection |>
    InputMap.by_type |>
    Enum.map(fn {k, v} -> {k, ElCollection.most_expensive(v)} end)
  end

  @doc """
  Given a collection, intersect the set of book authors with the set of CD authors.
  """
  def authors_with_cds(collection) do
    author_set(collection, :book) |>
    MapSet.intersection(author_set(collection, :cd)) |>
    MapSet.to_list
  end

  @doc """
  Given a collection, lists the items where the title, track, or chapter
  contains a probable year.
  """
  def items_containing_years(collection) do
    Enum.filter(collection, &(match_fields(&1)))
  end

  defp match_fields(record) do
    match_title(record) or
    match_chapters(record) or
    match_tracks(record)
  end

  def match_title(record) do
    string_contains_year?(Map.get(record, :title))
  end

  def match_chapters(record) do
    Map.get(record, :chapters, [""]) |>
    Enum.any?(&(string_contains_year?(&1)))
  end

  def match_tracks(record) do
    if Map.has_key?(record, :tracks) do
      Map.get(record, :tracks) |>
      Enum.any?(fn(record) ->
        Map.fetch!(record, :name) |>
        string_contains_year?
      end)
    end
  end

  # Naive date regex. Assumes that all positive 4 digit numbers are years.
  def string_contains_year?(string) do
    Regex.match?(~r/\b\d{4}\b/, string)
  end

  # Given a collection and a media type, returns a set of authors listed under that media type.
  defp author_set(collection, media_type) do
    InputMap.by_type(collection) |>
    Map.fetch!(media_type) |>
    Enum.reduce(%MapSet{}, &(MapSet.put(&2, &1.author)))
  end
end
