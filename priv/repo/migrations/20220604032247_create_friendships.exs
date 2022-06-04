defmodule KatchupsApi.Repo.Migrations.CreateFriendships do
  use Ecto.Migration

  def change do
    create table(:friendships) do
      add :from_user_id, references(:users)
      add :to_user_id, references(:users)
      add :status, :string

      timestamps()
    end
    create unique_index(:friendships, [:from_user_id, :to_user_id])
  end
end
