defmodule KatchupsApiWeb.Schema do
  use Absinthe.Schema
  alias KatchupsApiWeb.Resolvers
  alias KatchupsApiWeb.Schema.Middleware
  import_types(KatchupsApiWeb.Schema.Types)

  query do
    @desc "Get all users"
    field :users, list_of(:user_type) do
      middleware(Middleware.Authorize, :any)
      resolve(&Resolvers.UserResolver.users/3)
    end

    @desc "Get friends"
    field :friends, list_of(:friend_type) do
      middleware(Middleware.Authorize, :any)
      resolve(&Resolvers.FriendResolver.friends/3)
    end

    @desc "Get katchups"
    field :katchups, list_of(:katchup_type) do
      middleware(Middleware.Authorize, :any)
      resolve(&Resolvers.KatchupResolver.katchups/3)
    end
  end

  mutation do
    @desc "Register a new user"
    field :register_user, type: :user_type do
      arg(:input, non_null(:user_input_type))
      resolve(&Resolvers.UserResolver.register_user/3)
    end

    @desc "Log in a user and return a JWT"
    field :login_user, type: :session_type do
      arg(:input, non_null(:session_input_type))
      resolve(&Resolvers.SessionResolver.login_user/3)
    end

    @desc "Add a friend"
    field :create_friendship, type: :friend_type do
      arg(:input, non_null(:friend_input_type))
      resolve(&Resolvers.FriendResolver.add_friend/3)
    end

    @desc "New katchup"
    field :create_katchup, type: :katchup_type do
      arg(:input, non_null(:katchup_input_type))
      resolve(&Resolvers.KatchupResolver.new_katchup/3)
    end
  end

  # subscription do
  # end
end
