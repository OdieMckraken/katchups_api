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
  end

  # subscription do
  # end
end
