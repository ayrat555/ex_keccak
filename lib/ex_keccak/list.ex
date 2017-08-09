defmodule ExKeccak.List do
  @type int_list :: [integer()]
  @type matrix :: [int_list]

  @spec new_matrix(integer(), integer()) :: matrix
  def new_matrix(rows, columns) do
    0..(rows - 1)
    |> Enum.map(fn(_) ->
      0..(columns - 1)
      |> Enum.map(fn(_) ->
        0
      end)
    end)
  end

  @spec reduce_matrix_rows(matrix, fun()) :: list()
  def reduce_matrix_rows(matrix, operation) do
    matrix
    |> Enum.map(fn(row) ->
      row
      |> Enum.reduce(fn(el, acc) ->
        operation.(acc, el)
      end)
    end)
  end

  @spec map(int_list, fun()) :: list()
  def map(list, operation) do
    list
    |> Enum.with_index
    |> Enum.map(fn({el, index}) ->
      operation.(list, el, index)
    end)
  end

  @spec map_matrix(matrix, fun()) :: matrix
  def map_matrix(matrix, operation) do
    matrix
    |> Enum.with_index
    |> Enum.map(fn({row, row_index}) ->
      row
      |> Enum.with_index
      |> Enum.map(fn({el, col_index}) ->
        operation.(el, row_index, col_index)
      end)
    end)
  end
end
