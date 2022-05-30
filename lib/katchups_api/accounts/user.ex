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
    field :password, :string, virtual: true
    field :password_confirmation, :string, virtual: true
    field :password_hash, :string
    field :role, :string, default: "user" 

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [
      :first_name,
      :last_name,
      :email,
      :password,
      :password_confirmation,
      :avatar,
      :favorite_friends,
      :favorite_restaurants
    ])
    |> validate_required([
      :first_name,
      :last_name,
      :email,
      :password,
      :password_confirmation
      :avatar
    ]) |> unique_constraint([
    :email
    ]) |> validate_format(:email, ~r/@/)
    |> update_change(:email, &String.downcase(&1))
    |> validate_length(:password, min: 8, max: 100)
    |> validate_confirmation(:passowrd)
    |> hash_password
  end

  defp hash_password(changeset) do
    changeset
  end
end