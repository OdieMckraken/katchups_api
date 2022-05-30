defmodule KatchupsApi.AccountsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `KatchupsApi.Accounts` context.
  """

  @doc """
  Generate a user.
  """
  def user_fixture(attrs \\ %{}) do
    {:ok, user} =
      attrs
      |> Enum.into(%{
        avatar: "some avatar",
        email: "some email",
        favorite_friends: [],
        favorite_restaurants: [],
        first_name: "some first_name",
        last_name: "some last_name",
        password_hash: "some password_hash"
      })
      |> KatchupsApi.Accounts.create_user()

    user
  end
end
