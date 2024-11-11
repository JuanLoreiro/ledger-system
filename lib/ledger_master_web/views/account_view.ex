defmodule LedgerMasterWeb.AccountView do
  use LedgerMasterWeb, :view

  def render("index.json", %{accounts: accounts}) do
    %{data: render_many(accounts, LedgerMasterWeb.AccountView, "account.json")}
  end

  def render("show.json", %{account: account}) do
    %{data: render_one(account, LedgerMasterWeb.AccountView, "account.json")}
  end

  def render("account.json", %{account: account}) do
    %{
      id: account.id,
      balance: account.balance,
      account_number: account.account_number
    }
  end
end
