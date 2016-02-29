defmodule MostExpensivePresenter do
  def present(results) do
    formatted_results = results |>
    Enum.map(&(subsection(&1))) |>
    Enum.join("\n\n")

    TermPresenter.section(title, formatted_results)
  end

  defp title do
    "5 Most Expensive By Category"
  end

  defp subsection(category) do
    TermPresenter.subsection(category_heading(category),
    category_body(category))
  end

  defp category_body(category) do
    elem(category, 1) |>
    Enum.map(&(media_string(&1))) |>
    TermPresenter.numbered_list
  end

  defp category_heading(category) do
    category_head = elem(category, 0) |>
    Atom.to_string |>
    String.capitalize

    category_head <> "s"
  end

  defp media_string(media) do
    case Map.has_key?(media, :author) do
      true -> [media.author, ", '", String.capitalize(media.title), "': $", media.price]
      false -> [media.director, ", '", String.capitalize(media.title), "': $", media.price]
    end |>
    Enum.join
  end
end
