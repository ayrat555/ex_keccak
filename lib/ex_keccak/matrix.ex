defmodule ExKeccak.Matrix do
  @type int_list :: [integer()]
  @type t :: [int_list]

  @spec new(integer(), integer()) :: t
  def new(rows, columns) do
    0..(rows - 1)
    |> Enum.map(fn(_) ->
      0..(columns - 1)
      |> Enum.map(fn(_) ->
        0
      end)
    end)
  end

  @spec reduce_rows(t, fun()) :: list()
  def reduce_rows(matrix, operation) do
    matrix
    |> Enum.map(fn(row) ->
      row
      |> Enum.reduce(fn(el, acc) ->
        operation.(acc, el)
      end)
    end)
  end
end
