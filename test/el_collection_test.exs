defmodule ElCollectionTest do
  use ExUnit.Case, async: true

  @mock_data InputMap.data

  test "by_type/1 returns data grouped by type" do
    coll = [%{:type => "book"}, %{:type => "book"}, %{:type => "dvd"}]
    expected = %{
      :book => [%{type: "book"}, %{type: "book"}],
      :dvd  => [%{type: "dvd"}]
    }

    assert ElCollection.by_type(coll) == expected
  end

  test "most_expensive/1 returns the items with the highest price value" do
    coll = [%{:price => 1},
             %{:price => 2},
             %{:price => 3},
             %{:price => 4},
             %{:price => 5},
             %{:price => 6},
             %{:price => 7}]
    expected = [%{:price => 7},
                 %{:price => 6},
                 %{:price => 5},
                 %{:price => 4},
                 %{:price => 3}]

    assert ElCollection.most_expensive(coll) == expected
  end
end
