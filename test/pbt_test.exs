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
      Pbt.biggest(lst) == lst |> Enum.sort() |> List.last()
    end
  end

  # helpers
  def boolean(_), do: true

  # generators
  def my_type, do: term()
end
