defmodule MostExpensivePresenter do
  def present(results) do
    convert_results_to_string(results)
  end

  def convert_results_to_string(results) do
    formatted_results = results |>
    Enum.map(fn(category) ->
      [category_heading(category), category_string(category)]
    end) |>
    Enum.join("\n")

    title <> formatted_results
  end

  defp title do
    "5 Most Expensive By Category\n\n"
  end

  defp category_string(category) do
    elem(category, 1) |>
    Enum.map(&(media_string(&1, "  "))) |>
    Enum.join("\n")
  end

  defp category_heading(category) do
    chs = category_head_string(category)
    chs <> separator_line(chs)
  end

  defp category_head_string(category) do
    category_head = elem(category, 0) |>
    Atom.to_string |>
    String.capitalize

    category_head <> "s\n"
  end

  defp separator_line(string) do
    separator = string |>
    String.to_char_list |>
    Enum.reduce([], fn(e, acc) ->
      acc ++ ["-"]
    end) |>
    Enum.join

    separator <> "\n"
  end

  defp media_string(media, offset \\ "") do
    case Map.has_key?(media, :author) do
      true -> [offset, media.author, ", '", String.capitalize(media.title), "': $", media.price]
      false -> [offset, media.director, ", '", String.capitalize(media.title), "': $", media.price]
    end |>
    Enum.join
  end
end
