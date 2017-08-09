defmodule ExKeccak.HelperTest do
  use ExUnit.Case
  alias ExKeccak.Helper

  test 'does bitwise rotation' do
    num = 5
    expected_result = 20

    result = Helper.rotate(num, 2)

    assert result == expected_result
  end

  test 'calculates modulus' do
    expected_result = 6

    result = Helper.modulo(-5, 11)

    assert result == expected_result
  end
end
