defmodule KatchupsApi.Repo do
  use Ecto.Repo,
    otp_app: :katchups_api,
    adapter: Ecto.Adapters.Postgres
end
