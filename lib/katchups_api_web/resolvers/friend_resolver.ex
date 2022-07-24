defmodule KatchupsApiWeb.Resolvers.FriendResolver do
  alias KatchupsApi.Users
  alias KatchupsApi.Accounts
  require IEx

  def friends(_, _, %{context: context}) do  
    friends = Enum.map(Users.list_friends(context.current_user.id), 
      fn x -> define_friends(x, context.current_user.id) end)
    {:ok, friends}
  end

  def add_friend(_, %{input: input}, _) do
    user = Accounts.get_user!(input.from_user_id)
    friend_user = Accounts.get_user!(input.to_user_id)
    Users.create_friendship(input)
  end

  defp define_friends(friendship, user_id) do
    from = friendship.from_user_id
    to = friendship.to_user_id
    case user_id do
      ^from ->
        %{
          id: friendship.id,
          friend: friendship.to_user,
          status: friendship.status
        } 
      ^to ->
        %{
          id: friendship.id,
          friend: friendship.from_user,
          status: friendship.status
        }
    end
  end
end