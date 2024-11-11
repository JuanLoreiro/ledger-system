def change do
  create table(:users) do
    add :name, :string
    add :email, :string, unique: true

    timestamps(type: :utc_datetime)
  end
end
