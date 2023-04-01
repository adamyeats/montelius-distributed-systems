defmodule Primy.Worker do
  @moduledoc """
  Documentation for `Primy.Worker`.
  """

  use GenServer

  @doc """
  Starts the worker.
  """
  def start_link(_arg) do
    GenServer.start_link(__MODULE__, [], name: __MODULE__)
  end

  @doc """
  Schedule the first check for the next prime number and return the initial
  state.
  """
  def init([]) do
    # schedule the first check
    schedule_next_prime_check()

    initial_state = %{
      # 2 is the first prime number
      highest_prime: 2,
      next_to_examine: Primy.next_candidate()
    }

    {:ok, initial_state}
  end

  @doc """
  Check for the next prime number.
  """
  def handle_info(:check_for_next_prime, state) do
    # schedule the next check
    schedule_next_prime_check()

    {:noreply, Primy.next_prime_check(state)}
  end

  defp schedule_next_prime_check() do
    Process.send_after(self(), :check_for_next_prime, 1000)
  end
end
