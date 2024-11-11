def change do
  create table(:transactions) do
    add :type, :string
    add :amount, :decimal
    add :account_id, references(:accounts, on_delete: :nothing)

    timestamps(type: :utc_datetime)
  end

  create index(:transactions, [:account_id])
end
