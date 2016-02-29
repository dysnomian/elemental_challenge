defmodule LongCdsPresenterTest do
  use ExUnit.Case, async: true

  test "run/1 returns correctly with mock data" do
    coll =
    [%{author: "hanayo", price: 19.99, title: "baz",
        tracks: [%{name: "one", seconds: 3601}],
        type: "cd", year: 2000},
      %{author: "μ's", price: 20.99, title: "baz",
        tracks:
        [%{name: "one", seconds: 300},
          %{name: "two", seconds: 3330}],
        type: "cd", year: 2013}]

    # This mess is an ANSI-escaped string, and has been verified visually.
    expected = [[[[[[[[[[] | "\e[1m"], "CDs with lengths greater than 1 hour"], "\n"], "===================================="], "\n\n"] | "\e[0m"],
              "  1) hanayo, 'baz': 1 hours, 0 minutes, 1 seconds\n  2) μ's, 'baz': 1 hours, 0 minutes, 30 seconds"], "\n\n\n\n"] | "\e[0m"]

    assert LongCdsPresenter.present(coll) == expected
  end
end
