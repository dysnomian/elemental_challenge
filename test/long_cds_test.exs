defmodule LongCdsTest do
  use ExUnit.Case, async: true

  test "run/1 returns correctly with mock data" do
    coll = InputMap.data

    expected = [%{author: "hanayo", price: 19.99, title: "baz", tracks: [%{name: "one", seconds: 3601}], type: "cd", year: 2000},
            %{author: "μ's", price: 20.99, title: "Love Live!", tracks: [%{name: "Bokura wa Ima no Naka de (Live 2013)", seconds: 300}, %{name: "two", seconds: 3330}],
              type: "cd", year: 2000}]

    assert LongCds.run(coll) == expected
  end
end
