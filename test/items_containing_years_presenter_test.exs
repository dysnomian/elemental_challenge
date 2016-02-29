defmodule ItemsContainingYearsPresenterTest do
  use ExUnit.Case, async: true

  test "run/1 returns correctly with mock data" do
    coll = [
      %{author: "mary",
        chapters: ["Journal from 1987", "two", "three"],
        price: 15.99,
        title: "Journals",
        type: "book",
        year: 1999},
      %{author: "μ's",
        price: 20.99,
        title: "Love Live!",
        tracks: [%{name: "Bokura wa Ima no Naka de (Live 2013)", seconds: 180}, %{name: "two", seconds: 200}],
        type: "cd",
        year: 2000},
      %{author: "nagisa",
        price: 18.99,
        title: "Cheeses I Came Back For",
        tracks: [%{name: "one", seconds: 180}, %{name: "Mascarpone in 2014", seconds: 200}],
        type: "cd",
        year: 2000}]
    expected = [[[[[[[[[[] | "\e[1m"], "CDs with lengths greater than 1 hour"], "\n"], "===================================="], "\n\n"] | "\e[0m"],
              "  1) mary, 'Journals': $15.99\n  2) μ's, 'Love live!': $20.99\n  3) nagisa, 'Cheeses i came back for': $18.99"], "\n\n\n\n"] | "\e[0m"]

    assert ItemsContainingYearsPresenter.present(coll) == expected
  end
end
