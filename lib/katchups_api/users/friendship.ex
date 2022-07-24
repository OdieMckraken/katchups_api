defmodule KatchupsApi.Users.Friendship do
  use Ecto.Schema
  import Ecto.Changeset
  alias KatchupsApi.Accounts.User

  schema "friendships" do
    field :status , :string, default: "pending"
    belongs_to :from_user, User
    belongs_to :to_user, User

    timestamps()
  end

  @doc false
  def changeset(friendship, attrs) do
    friendship
    |> cast(attrs, [
      :from_user_id,
      :to_user_id,
      :status
    ])
    |> validate_required([
      :from_user_id,
      :to_user_id,
      :status
    ])
  end
end
