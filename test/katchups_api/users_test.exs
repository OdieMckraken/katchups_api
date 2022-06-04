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
end
