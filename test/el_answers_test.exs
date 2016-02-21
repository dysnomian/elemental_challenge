defmodule ElAnswersTest do
  use ExUnit.Case, async: true

  @mock_data InputMap.data

  test "most_expensive_per_type/1 works with mock data" do
    expected = [book: [%{author: "liss", chapters: ["one", "two", "three"], price: 29.99, title: "foo", type: "book", year: 1999},
        %{author: "anna", chapters: ["one", "two", "three"], price: 25.99, title: "foo", type: "book", year: 1999},
        %{author: "joan", chapters: ["one", "two", "three"], price: 19.99, title: "foo", type: "book", year: 1999},
        %{author: "mark", chapters: ["one", "two", "three"], price: 15.99, title: "foo", type: "book", year: 1999},
        %{author: "mary", chapters: ["one", "two", "three"], price: 15.99, title: "foo", type: "book", year: 1999}],
      cd: [%{author: "μ's", price: 20.99, title: "baz", tracks: [%{name: "one", seconds: 180}, %{name: "two", seconds: 200}], type: "cd", year: 2000},
        %{author: "hanayo", price: 19.99, title: "baz", tracks: [%{name: "one", seconds: 180}, %{name: "two", seconds: 200}], type: "cd", year: 2000},
        %{author: "nagisa", price: 18.99, title: "cheese", tracks: [%{name: "one", seconds: 180}, %{name: "two", seconds: 200}], type: "cd", year: 2000},
        %{author: "rin", price: 18.99, title: "baz", tracks: [%{name: "one", seconds: 180}, %{name: "two", seconds: 200}], type: "cd", year: 2000},
        %{author: "joan", price: 15.99, title: "baz", tracks: [%{name: "one", seconds: 180}, %{name: "two", seconds: 200}], type: "cd", year: 2000}],
      dvd: [%{director: "madoka", minutes: 90, price: 35.99, title: "bar", type: "dvd", year: 2004},
        %{director: "sayaka", minutes: 90, price: 34.99, title: "bar", type: "dvd", year: 2004},
        %{director: "mami", minutes: 90, price: 33.99, title: "bar", type: "dvd", year: 2004},
        %{director: "homura", minutes: 90, price: 32.99, title: "bar", type: "dvd", year: 2004},
        %{director: "kyoko", minutes: 90, price: 31.99, title: "bar", type: "dvd", year: 2004}]]

    assert ElAnswers.most_expensive_per_type(@mock_data) == expected
  end

  test "cds_with_hour_plus_running_times/1 returns correctly with mock data" do
    coll = InputMap.data('test/hour_plus.json')

    expected =
    [%{author: "hanayo", price: 19.99, title: "baz",
        tracks: [%{name: "one", seconds: 3601}],
        type: "cd", year: 2000},
      %{author: "μ's", price: 20.99, title: "baz",
        tracks:
        [%{name: "one", seconds: 300},
          %{name: "two", seconds: 3330}],
        type: "cd", year: 2013}]

    assert ElAnswers.cds_with_hour_plus_running_times(coll) == expected
  end
end
