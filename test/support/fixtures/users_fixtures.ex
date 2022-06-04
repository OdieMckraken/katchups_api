defmodule KatchupsApi.UsersFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `KatchupsApi.Users` context.
  """

  @doc """
  Generate a friendship.
  """
  def friendship_fixture(attrs \\ %{}) do
    {:ok, friendship} =
      attrs
      |> Enum.into(%{

      })
      |> KatchupsApi.Users.create_friendship()

    friendship
  end
end
