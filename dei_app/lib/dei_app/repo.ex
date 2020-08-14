defmodule DeiApp.Repo do
  use Ecto.Repo,
    otp_app: :dei_app,
    adapter: Ecto.Adapters.Postgres
end
