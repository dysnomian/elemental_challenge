defmodule ElAnswers do
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
end
