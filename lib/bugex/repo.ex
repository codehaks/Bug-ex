defmodule Bugex.Repo do
  use Ecto.Repo,
    otp_app: :bugex,
    adapter: Ecto.Adapters.Postgres
end
