defmodule LongCdsPresenter do
  def present(results) do
    convert_results_to_string(results)
  end

  def convert_results_to_string(results) do
    formatted_results = results |>
    Enum.map(&(album_string(&1))) |>
    TermPresenter.numbered_list

    TermPresenter.section(title, formatted_results)
  end

  defp title do
    "CDs with lengths greater than 1 hour"
  end

  defp album_string(album) do
    album.author <> ", '" <> album.title <> "': " <>
    seconds_to_time(LongCds.cd_length(album))
  end

  defp seconds_to_time(seconds) do
    hours = {div(seconds, 3600), rem(seconds, 3600)}
    hours_s = Integer.to_string(elem(hours, 0)) <> " hours"

    {minutes, seconds} = {
      div(elem(hours, 1), 60),
      rem(elem(hours, 1), 60)
    }
    minutes_s = Integer.to_string(minutes) <> " minutes"
    seconds_s = Integer.to_string(seconds) <> " seconds"
    [hours_s, minutes_s, seconds_s] |>
    Enum.join(", ")
  end
end
