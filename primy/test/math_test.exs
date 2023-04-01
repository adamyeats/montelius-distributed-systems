defmodule FermatTest do
  use ExUnit.Case

  test "is_prime/1 returns true for prime numbers" do
    assert Fermat.is_prime(2) == true
    assert Fermat.is_prime(3) == true
    assert Fermat.is_prime(5) == true
    assert Fermat.is_prime(7) == true
    assert Fermat.is_prime(11) == true
    assert Fermat.is_prime(13) == true
    assert Fermat.is_prime(17) == true
    assert Fermat.is_prime(19) == true
  end

  test "is_prime/1 returns false for composite numbers" do
    assert Fermat.is_prime(1) == false
    assert Fermat.is_prime(4) == false
    assert Fermat.is_prime(6) == false
    assert Fermat.is_prime(8) == false
    assert Fermat.is_prime(9) == false
    assert Fermat.is_prime(10) == false
    assert Fermat.is_prime(12) == false
    assert Fermat.is_prime(15) == false
  end
end
