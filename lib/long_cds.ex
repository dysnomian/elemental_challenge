defmodule LongCds do
  @doc """
  Given a collection, lists the items with a type of :cd with a running time over an hour.
  """
  def run(coll) do
    InputMap.by_type(coll) |>
    Map.fetch!(:cd) |>
    Enum.filter(fn (cd) -> cd_length(cd) > 3600 end)
  end

  def present(coll) do
    run(coll) |>
    LongCdsPresenter.present
  end

  def cd_length(cd_map) do
    Map.fetch!(cd_map, :tracks) |>
    Enum.reduce(0, &(&1.seconds + &2))
  end
end
