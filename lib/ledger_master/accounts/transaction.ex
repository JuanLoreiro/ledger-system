defmodule LedgerMaster.Accounts.Transaction do
  use Ecto.Schema
  import Ecto.Changeset

  schema "transactions" do
    field :type, :string
    field :amount, :decimal
    belongs_to :account, LedgerMaster.Accounts.Account

    timestamps(type: :utc_datetime)
  end

  def changeset(transaction, attrs) do
    transaction
    |> cast(attrs, [:amount, :type, :account_id])
    |> validate_required([:amount, :type, :account_id])
    |> assoc_constraint(:account)
  end
end
