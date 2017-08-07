defmodule ExKeccak.MatrixTest do
  use ExUnit.Case
  alias ExKeccak.Matrix

  test 'creates blank matrix' do
    expected_matix = [
      [0, 0],
      [0, 0],
      [0, 0],
      [0, 0],
      [0, 0]
    ]
    matrix = Matrix.new(5, 2)

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

    result = Matrix.reduce_rows(matrix, operation)

    assert result == expected_result
  end
end
