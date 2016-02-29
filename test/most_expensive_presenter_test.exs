defmodule MostExpensivePresenterTest do
  use ExUnit.Case, async: true

  test ".convert_results_to_string produces a formatted string of results" do
    coll = [
      {:book, [%{author: "steven", price: 29.99, title: "foo", type: "book", year: 1999}]},
      {:cd, [%{author: "garnet", price: 29.99, title: "foo", type: "cd"}]},
      {:dvd, [%{director: "amethyst", price: 29.99, title: "foo", type: "dvd"}]},
      {:misc, [%{author: "pearl", price: 29.99, title: "foo", type: "misc"}]}]

    # This mess is an ANSI-escaped string, and has been verified visually.
    expected = [[[[[[[[[[] | "\e[1m"], "5 Most Expensive By Category"], "\n"], "============================"], "\n\n"] | "\e[0m"],
              "\e[4mBooks\n\e[0m  1) steven, 'Foo': $29.99\e[0m\n\n\e[4mCds\n\e[0m  1) garnet, 'Foo': $29.99\e[0m\n\n\e[4mDvds\n\e[0m  1) amethyst, 'Foo': $29.99\e[0m\n\n\e[4mMiscs\n\e[0m  1) pearl, 'Foo': $29.99\e[0m"],
             "\n\n\n\n"] | "\e[0m"]

    assert MostExpensivePresenter.present(coll) == expected
  end
end
