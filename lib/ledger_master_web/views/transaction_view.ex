defmodule LedgerMasterWeb.TransactionView do
  use LedgerMasterWeb, :view

  def render("index.json", %{transactions: transactions}) do
    %{data: render_many(transactions, LedgerMasterWeb.TransactionView, "transaction.json")}
  end

  def render("show.json", %{transaction: transaction}) do
    %{data: render_one(transaction, LedgerMasterWeb.TransactionView, "transaction.json")}
  end

  def render("transaction.json", %{transaction: transaction}) do
    %{
      id: transaction.id,
      amount: transaction.amount,
      date: transaction.date,
      description: transaction.description
    }
  end
end
