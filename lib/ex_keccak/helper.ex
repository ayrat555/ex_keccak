defmodule ExKeccak.Helper do
  import Bitwise

  @spec rotate(integer(), integer()) :: integer()
  def rotate(x, n) do
    n = n |> modulo(64)

    res = (x <<< n) ^^^ (x >>> (64 - n))
    res |> rem(1 <<< 64)
  end

  @spec modulo(integer(), integer()) :: integer()
  def modulo(x, y) do
    res = rem(x, y)

    if res < 0, do: res + y, else: res
  end
end
