defmodule KatchupsApi.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field :avatar, :string
    field :email, :string
    field :favorite_friends, {:array, :integer}
    field :favorite_restaurants, {:array, :string}
    field :first_name, :string
    field :last_name, :string
    field :password_hash, :string

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [
      :first_name,
      :last_name,
      :email,
      :password_hash,
      :avatar,
      :favorite_friends,
      :favorite_restaurants
    ])
    |> validate_required([
      :first_name,
      :last_name,
      :email,
      :password_hash,
      :avatar,
      :favorite_friends,
      :favorite_restaurants
    ])
  end
end
