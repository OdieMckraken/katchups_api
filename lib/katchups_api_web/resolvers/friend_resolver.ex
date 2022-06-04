defmodule KatchupsApiWeb.Resolvers.FriendResolver do
  alias KatchupsApi.Users
  alias KatchupsApi.Accounts

  def friends(_, _, %{context: context}) do
    {:ok, Users.list_friends(context.current_user.id)}
  end

  def add_friend(_, %{input: input}, _) do
    user = Accounts.get_user!(input.from_user_id)
    friend_user = Accounts.get_user!(input.to_user_id)
    Users.create_friendship(user, friend_user)
  end
end