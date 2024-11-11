defmodule LedgerMaster.Accounts.Account do
  use Ecto.Schema
  import Ecto.Changeset

  schema "accounts" do
    field :balance, :decimal
    belongs_to :user, LedgerMaster.Accounts.User
    has_many :transactions, LedgerMaster.Accounts.Transaction

    timestamps(type: :utc_datetime)
  end

  def changeset(account, attrs) do
    account
    |> cast(attrs, [:balance, :user_id])
    |> validate_required([:balance, :user_id])
    |> assoc_constraint(:user)
  end
end
