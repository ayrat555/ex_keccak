defmodule ExKeccak.ListTest do
  use ExUnit.Case
  alias ExKeccak.List
  import ExKeccak.Helper

  test 'creates blank matrix' do
    expected_matix = [
      [0, 0],
      [0, 0],
      [0, 0],
      [0, 0],
      [0, 0]
    ]
    matrix = List.new_matrix(5, 2)

    assert matrix == expected_matix
  end

  test 'reduces rows' do
    matrix = [
      [1, 2, 2],
      [4, 2, 0],
      [5, 1, 1]
    ]
    operation = fn(num1, num2) -> num1 + num2 end
    expected_result = [5, 6, 7]

    result = List.reduce_matrix_rows(matrix, operation)

    assert result == expected_result
  end

  test 'maps list elements' do
    list = [6, 7, 8]
    expected_result = [-2, 1, 1]
    func = fn(list, el, index) ->
        prev_el_ind = (index - 1) |> modulo(3)
        prev_el = list |> Enum.at(prev_el_ind)

        el - prev_el
      end

    result = list |> List.map(func)

    assert result == expected_result
  end

end
