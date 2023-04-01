defmodule Primy do
  @moduledoc """
  Documentation for `Primy`.
  """

  @doc """
  Returns the next candidate for primality testing.
  """
  def next_candidate() do
    :rand.uniform(1_000_000_000_000)
  end

  @doc """
  Returns the next number to examine for primality, and the new highest prime number if applicable.
  """
  def next_prime_check(state) do
    %{
      highest_prime: highest_prime,
      next_to_examine: next_to_examine
    } = state

    next = next_candidate()

    case Fermat.is_prime(next_to_examine) do
      true ->
        IO.inspect(next_to_examine, label: "Worker found the next prime number")

        cond do
          next_to_examine > highest_prime ->
            IO.inspect(next_to_examine, label: "Worker found a new highest prime number")
            %{state | highest_prime: next_to_examine, next_to_examine: next}

          true ->
            %{state | next_to_examine: next}
        end

      false ->
        %{state | next_to_examine: next}
    end
  end
end
