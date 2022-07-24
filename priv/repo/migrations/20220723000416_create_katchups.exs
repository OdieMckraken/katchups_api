defmodule KatchupsApi.Repo.Migrations.CreateKatchups do
  use Ecto.Migration

  def change do
    create table(:katchups) do
      add :requester_list, {:array, :string}
      add :addressee_list, {:array, :string}
      add :restaurant_id, :string
      add :starts_at, :utc_datetime
      add :location, :string
      add :distance, :integer
      add :status, :string
      add :requester_id, references(:users)
      add :addressee_id, references(:users)
      add :addressee_type, :string

      timestamps()
    end
  end
end
