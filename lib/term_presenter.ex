defmodule TermPresenter do
  def section(title, body) do
    IO.ANSI.format(
    [:bright,
      title,
      "\n",
      separator_line(title, "="),
      "\n\n",
      :reset,
      body,
      "\n\n\n\n"],
    true)
  end

  def subsection(title, body) do
    IO.ANSI.format(
    [:underline,
      title,
      "\n",
      :reset,
      body],
    true)
  end

  def separator_line(string, character \\ "-") do
    string |>
    String.to_char_list |>
    Enum.reduce([], fn(_e, acc) ->
      acc ++ [character]
    end) |>
    Enum.join
  end

  def numbered_list(list, offset \\ "  ") do
    Enum.with_index(list) |>
    Enum.map(fn(e) ->
      offset <> Integer.to_string(elem(e, 1) + 1) <> ") " <> elem(e, 0)
    end) |>
    Enum.join("\n")
  end
end
