defmodule Challenge do
  def main(args) do
    args |>
    parse_args |>
    process
  end

  defp process([]) do
    IO.puts "No input given. use the `--input` switch prior to naming " <>
    "your input file."
  end

  defp process(options) do
    input_map = case options[:test] do
        true  -> InputMap.data
        nil   -> InputMap.data(options[:input])
      end

    input_map |>
    present
  end

  defp parse_args(args) do
    {options, _, _} = OptionParser.parse(args,
    switches: [input: :string, test: :boolean]
    )
    options
  end

  defp present(input_map) do
    [MostExpensive.present(input_map),
     LongCds.present(input_map),
     AuthorsWithCds.present(input_map),
     ItemsContainingYears.present(input_map)] |>
    Enum.join |>
    IO.puts
  end
end
