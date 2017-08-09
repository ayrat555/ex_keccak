defmodule ExKeccak.Hash do
  import Bitwise
  alias ExKeccak.Matrix

  @rc [
    0x0000000000000001, 0x0000000000008082,
    0x800000000000808a, 0x8000000080008000,
    0x000000000000808b, 0x0000000080000001,
    0x8000000080008081, 0x8000000000008009,
    0x000000000000008a, 0x0000000000000088,
    0x0000000080008009, 0x000000008000000a,
    0x000000008000808b, 0x800000000000008b,
    0x8000000000008089, 0x8000000000008003,
    0x8000000000008002, 0x8000000000000080,
    0x000000000000800a, 0x800000008000000a,
    0x8000000080008081, 0x8000000000008080,
    0x0000000080000001, 0x8000000080008008
  ]

  @r [
    1, 3, 6, 10, 15, 21, 28, 36,
    45, 55, 2, 14, 27, 41, 56, 8,
    25, 43, 62, 18, 39, 61, 20, 44
  ]

  def f1600(a) do
    0..24
    |> Enum.reduce(fn(round_num, acc) ->
      round(acc, round_num)
    end)
  end

  def round(a, round_num) do
    a
    |> theta_step(round_num)
    |> rho_and_pi_step()
    |> iota_step()
  end

  def theta_step(state, round_num) do
    rc = @rc |> Enum.at(round_num)

    f1 = fn(x, y) -> x ^^^ y end
    c = state |> List.reduce_matrix_rows(f1)

    f2 = fn(list, el
  end

  def rho_and_pi_step(state) do
  end

  def iota_step(state) do

  end
end
