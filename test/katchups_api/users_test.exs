defmodule KatchupsApi.UsersTest do
  use KatchupsApi.DataCase

  alias KatchupsApi.Users

  describe "friendships" do
    alias KatchupsApi.Users.Friendship

    import KatchupsApi.UsersFixtures

    @invalid_attrs %{}

    test "list_friendships/0 returns all friendships" do
      friendship = friendship_fixture()
      assert Users.list_friendships() == [friendship]
    end

    test "get_friendship!/1 returns the friendship with given id" do
      friendship = friendship_fixture()
      assert Users.get_friendship!(friendship.id) == friendship
    end

    test "create_friendship/1 with valid data creates a friendship" do
      valid_attrs = %{}

      assert {:ok, %Friendship{} = friendship} = Users.create_friendship(valid_attrs)
    end

    test "create_friendship/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Users.create_friendship(@invalid_attrs)
    end

    test "update_friendship/2 with valid data updates the friendship" do
      friendship = friendship_fixture()
      update_attrs = %{}

      assert {:ok, %Friendship{} = friendship} = Users.update_friendship(friendship, update_attrs)
    end

    test "update_friendship/2 with invalid data returns error changeset" do
      friendship = friendship_fixture()
      assert {:error, %Ecto.Changeset{}} = Users.update_friendship(friendship, @invalid_attrs)
      assert friendship == Users.get_friendship!(friendship.id)
    end

    test "delete_friendship/1 deletes the friendship" do
      friendship = friendship_fixture()
      assert {:ok, %Friendship{}} = Users.delete_friendship(friendship)
      assert_raise Ecto.NoResultsError, fn -> Users.get_friendship!(friendship.id) end
    end

    test "change_friendship/1 returns a friendship changeset" do
      friendship = friendship_fixture()
      assert %Ecto.Changeset{} = Users.change_friendship(friendship)
    end
  end

  describe "katchups" do
    alias KatchupsApi.Users.Katchup

    import KatchupsApi.UsersFixtures

    @invalid_attrs %{addressee_list: nil, distance: nil, location: nil, requester_list: nil, restaurant_id: nil, starts_at: nil, status: nil}

    test "list_katchups/0 returns all katchups" do
      katchup = katchup_fixture()
      assert Users.list_katchups() == [katchup]
    end

    test "get_katchup!/1 returns the katchup with given id" do
      katchup = katchup_fixture()
      assert Users.get_katchup!(katchup.id) == katchup
    end

    test "create_katchup/1 with valid data creates a katchup" do
      valid_attrs = %{addressee_list: [], distance: "some distance", location: "some location", requester_list: [], restaurant_id: "some restaurant_id", starts_at: ~N[2022-07-22 00:03:00], status: "some status"}

      assert {:ok, %Katchup{} = katchup} = Users.create_katchup(valid_attrs)
      assert katchup.addressee_list == []
      assert katchup.distance == "some distance"
      assert katchup.location == "some location"
      assert katchup.requester_list == %[]
      assert katchup.restaurant_id == "some restaurant_id"
      assert katchup.starts_at == ~N[2022-07-22 00:03:00]
      assert katchup.status == "some status"
    end

    test "create_katchup/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Users.create_katchup(@invalid_attrs)
    end

    test "update_katchup/2 with valid data updates the katchup" do
      katchup = katchup_fixture()
      update_attrs = %{addressee_list: [], distance: "some updated distance", location: "some updated location", requester_list: [], restaurant_id: "some updated restaurant_id", starts_at: ~N[2022-07-23 00:03:00], status: "some updated status"}

      assert {:ok, %Katchup{} = katchup} = Users.update_katchup(katchup, update_attrs)
      assert katchup.addressee_list == []
      assert katchup.distance == "some updated distance"
      assert katchup.location == "some updated location"
      assert katchup.requester_list == []
      assert katchup.restaurant_id == "some updated restaurant_id"
      assert katchup.starts_at == ~N[2022-07-23 00:03:00]
      assert katchup.status == "some updated status"
    end

    test "update_katchup/2 with invalid data returns error changeset" do
      katchup = katchup_fixture()
      assert {:error, %Ecto.Changeset{}} = Users.update_katchup(katchup, @invalid_attrs)
      assert katchup == Users.get_katchup!(katchup.id)
    end

    test "delete_katchup/1 deletes the katchup" do
      katchup = katchup_fixture()
      assert {:ok, %Katchup{}} = Users.delete_katchup(katchup)
      assert_raise Ecto.NoResultsError, fn -> Users.get_katchup!(katchup.id) end
    end

    test "change_katchup/1 returns a katchup changeset" do
      katchup = katchup_fixture()
      assert %Ecto.Changeset{} = Users.change_katchup(katchup)
    end
  end
end
