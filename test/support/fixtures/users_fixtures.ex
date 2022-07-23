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

  @doc """
  Generate a katchup.
  """
  def katchup_fixture(attrs \\ %{}) do
    {:ok, katchup} =
      attrs
      |> Enum.into(%{
        addressee_list: [],
        distance: "some distance",
        location: "some location",
        requester_array: [],
        restaurant_id: "some restaurant_id",
        starts_at: ~N[2022-07-22 00:03:00],
        status: "some status"
      })
      |> KatchupsApi.Users.create_katchup()

    katchup
  end
end
