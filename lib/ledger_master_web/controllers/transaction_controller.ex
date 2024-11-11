defmodule LedgerMasterWeb.TransactionController do
  use LedgerMasterWeb, :controller

  alias LedgerMaster.Accounts
  alias LedgerMaster.Accounts.Transaction

  def index(conn, _params) do
    transactions = Accounts.list_transactions()
    render(conn, "index.json", transactions: transactions)
  end

  def show(conn, %{"id" => id}) do
    case Accounts.get_transaction(id) do
      nil -> send_resp(conn, :not_found, "")
      transaction -> render(conn, "show.json", transaction: transaction)
    end
  end

  def create(conn, %{"transaction" => transaction_params}) do
    with {:ok, %Transaction{} = transaction} <- Accounts.create_transaction(transaction_params) do
      conn
      |> put_status(:created)
      |> render("show.json", transaction: transaction)
    end
  end

  def update(conn, %{"id" => id, "transaction" => transaction_params}) do
    transaction = Accounts.get_transaction!(id)

    with {:ok, %Transaction{} = transaction} <- Accounts.update_transaction(transaction, transaction_params) do
      render(conn, "show.json", transaction: transaction)
    end
  end

  def delete(conn, %{"id" => id}) do
    transaction = Accounts.get_transaction!(id)

    with {:ok, %Transaction{}} <- Accounts.delete_transaction(transaction) do
      send_resp(conn, :no_content, "")
    end
  end
end
