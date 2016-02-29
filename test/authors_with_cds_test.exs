defmodule AuthorsWithCdsTest do
  use ExUnit.Case, async: true

  @mock_data InputMap.data

  test "run/1 returns correctly with mock data" do
    coll = InputMap.data('test/test_data.json')
    expected = ["joan"]

    assert AuthorsWithCds.run(coll) == expected
  end
end
