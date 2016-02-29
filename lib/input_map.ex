defmodule InputMap do
  import Poison
  alias Poison.Parser, as: JSON

  def data(filename \\ 'test/test_data.json') do
    case File.read(filename) do
      {:ok, json}      -> JSON.parse!(json, keys: :atoms)
      {:error, reason} -> IO.puts("The file couldn't be read: " <> reason)
    end
  end

  @doc """
  Group items in collection by their :type value.
  """
  def by_type(coll) do
    Enum.group_by(coll, &(String.to_atom(&1.type)))
  end
end
