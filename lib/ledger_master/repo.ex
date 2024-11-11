defmodule LedgerMaster.Repo do
  use Ecto.Repo,
    otp_app: :ledger_master,
    adapter: Ecto.Adapters.Postgres
end
