defmodule Fermat do
  @moduledoc """
  Documentation for `Fermat`.
  """

  @doc """
  Fermat's primality test.
  """
  def is_prime(2), do: true
  def is_prime(n) when n < 2, do: false
  def is_prime(n) when rem(n, 2) == 0, do: false
  def is_prime(n) do
    # n - 1 = 2^s * d
    r = :rand.uniform(n - 2) + 1

    # t = r^d mod n
    t = NumberTheory.mpow(r, n - 1, n)

    # t = 1 or t = n - 1
    t == 1
  end
end

defmodule NumberTheory do
  @moduledoc """
  Documentation for `NumberTheory`.
  """
  @doc """
  Modular exponentiation. Direct translation of the Erlang code from
  page 1 of https://people.kth.se/~johanmon/dse/primy.pdf.
  """
  def mpow(n, 1, _), do: n

  def mpow(n, k, m) do
    mpow(rem(k, 2), n, k, m)
  end

  def mpow(0, n, k, m) do
    x = mpow(n, div(k, 2), m)
    rem(x * x, m)
  end

  def mpow(_, n, k, m) do
    x = mpow(n, k - 1, m)
    rem(x * n, m)
  end
end
