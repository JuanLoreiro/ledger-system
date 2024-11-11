defmodule LedgerMaster.TransactionsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `LedgerMaster.Transactions` context.
  """

  @doc """
  Generate a transaction.
  """
  def transaction_fixture(attrs \\ %{}) do
    {:ok, transaction} =
      attrs
      |> Enum.into(%{
        amount: "120.5",
        date: ~N[2024-11-10 09:34:00],
        description: "some description"
      })
      |> LedgerMaster.Transactions.create_transaction()

    transaction
  end
end
