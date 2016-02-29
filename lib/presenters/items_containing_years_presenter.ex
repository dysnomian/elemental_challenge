defmodule ItemsContainingYearsPresenter do
  def present(results) do
    formatted_results = results |>
    Enum.map(&(media_string(&1))) |>
    TermPresenter.numbered_list

    TermPresenter.section(title, formatted_results)
  end

  defp title do
    "CDs with lengths greater than 1 hour"
  end

  defp media_string(media) do
    case Map.has_key?(media, :author) do
      true -> [media.author, ", '", String.capitalize(media.title), "': $", media.price]
      false -> [media.director, ", '", String.capitalize(media.title), "': $", media.price]
    end |>
    Enum.join
  end
end
