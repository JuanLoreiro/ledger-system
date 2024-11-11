def change do
  create table(:accounts) do
    add :balance, :decimal
    add :user_id, references(:users, on_delete: :nothing)

    timestamps(type: :utc_datetime)
  end

  create index(:accounts, [:user_id])
end
