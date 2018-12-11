defmodule PbtTest do
  use ExUnit.Case
  use PropCheck

  alias Pbt

  property "always works" do
    forall type <- my_type() do
      boolean(type)
    end
  end

  property "biggest" do
    forall lst <- non_empty(list(integer())) do
      Pbt.biggest(lst) == model_biggest(lst)
    end
  end

  property "picks last number" do
    forall {lst, known_last} <- {non_empty(list(number())), number()} do
      known_list = lst ++ [known_last]
      known_last == List.last(known_list)
    end
  end

  # helpers
  def boolean(_), do: true

  def model_biggest(list), do: list |> Enum.sort() |> List.last()

  # generators
  def my_type, do: term()
end
