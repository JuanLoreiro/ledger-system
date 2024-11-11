defmodule LedgerMaster.Transactions.Transaction do
  use Ecto.Schema
  import Ecto.Changeset

  schema "transactions" do
    field :date, :naive_datetime
    field :description, :string
    field :amount, :decimal
    field :account_id, :id

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(transaction, attrs) do
    transaction
    |> cast(attrs, [:amount, :date, :description])
    |> validate_required([:amount, :date, :description])
  end
end
