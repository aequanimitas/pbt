defmodule Pbt do
  @moduledoc """
  Documentation for Pbt.
  """

  def biggest([head | tail]), do: biggest(tail, head)
  def biggest([], max), do: max
  def biggest([head | tail], bggst) when head >= bggst do
    biggest(tail, head)
  end
  def biggest([head | tail], bggst) when head < bggst do
    biggest(tail, bggst)
  end
end
