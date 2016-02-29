defmodule ItemsContainingYearsTest do
  use ExUnit.Case, async: true

  @mock_data InputMap.data

  test "run/1 returns correctly with mock data" do
    coll = InputMap.data
    expected = [%{author: "mary",
        chapters: ["Journal from 1987", "two", "three"],
        price: 15.99,
        title: "Journals",
        type: "book",
        year: 1999},
      %{author: "μ's",
        price: 20.99,
        title: "Love Live!",
        tracks: [
          %{name: "Bokura wa Ima no Naka de (Live 2013)", seconds: 300},
          %{name: "two", seconds: 3330}],
        type: "cd",
        year: 2000},
      %{author: "Tomoe Nagisa",
        price: 18.99,
        title: "Cheeses I Came Back For",
        tracks: [
          %{name: "one", seconds: 180},
          %{name: "Mascarpone in 2014", seconds: 200}],
        type: "cd",
        year: 2000}]

    assert ItemsContainingYears.run(coll) == expected
  end
end
