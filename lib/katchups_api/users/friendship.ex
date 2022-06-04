defmodule KatchupsApi.Users.Friendship do
  use Ecto.Schema
  import Ecto.Changeset
  alias KatchupsApi.Accounts.User

  schema "friendships" do
    field :status , :string
    belongs_to :from_user, User
    belongs_to :to_user, User

    timestamps()
  end

  @doc false
  def changeset(friendship, attrs) do
    friendship
    |> cast(attrs, [
      :from_user,
      :to_user,
      :status
    ])
    |> validate_required([
      :from_user,
      :to_user,
      :status
    ])
  end
end
