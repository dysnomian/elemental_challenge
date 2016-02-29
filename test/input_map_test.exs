defmodule InputMapTest do
  use ExUnit.Case, async: true

  test "by_type/1 returns data grouped by type" do
    coll = [%{:type => "book"}, %{:type => "book"}, %{:type => "dvd"}]
    expected = %{
      :book => [%{type: "book"}, %{type: "book"}],
      :dvd  => [%{type: "dvd"}]
    }

    assert InputMap.by_type(coll) == expected
  end
end
