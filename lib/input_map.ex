defmodule InputMap do
  import Poison
  alias Poison.Parser, as: JSON

  def data(filename \\ 'test/test_data.json') do
    {:ok, json} = File.read(filename)
    JSON.parse!(json, keys: :atoms)
  end
end
