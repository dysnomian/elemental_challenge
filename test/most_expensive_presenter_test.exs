defmodule MostExpensivePresenterTest do
  use ExUnit.Case, async: true

  test ".convert_results_to_string produces a formatted string of results" do
    coll = [
      {:book, [%{author: "steven", price: 29.99, title: "foo", type: "book", year: 1999}]},
      {:cd, [%{author: "garnet", price: 29.99, title: "foo", type: "cd"}]},
      {:dvd, [%{director: "amethyst", price: 29.99, title: "foo", type: "dvd"}]},
      {:misc, [%{author: "pearl", price: 29.99, title: "foo", type: "misc"}]}]

    expected = "5 Most Expensive By Category\n\n" <>
               "Books\n" <>
               "------\n" <>
               "  steven, 'Foo': $29.99\n" <>
               "Cds\n" <>
               "----\n" <>
               "  garnet, 'Foo': $29.99\n" <>
               "Dvds\n" <>
               "-----\n" <>
               "  amethyst, 'Foo': $29.99\n" <>
               "Miscs\n" <>
               "------\n" <>
               "  pearl, 'Foo': $29.99"

    assert MostExpensivePresenter.convert_results_to_string(coll) == expected
  end
end
