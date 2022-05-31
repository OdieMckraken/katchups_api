defmodule KatchupsApiWeb.Schema do
  use Absinthe.Schema

  # import types
  import_types(KatchupsGraphqlApiWeb.Schema.Types)

  query do
    @desc "Get all users"
    field :users, list_of(:user_type) do
      # resolver
      resolve(&Resolvers.UserResolver.users/3)
    end
  end

  # mutate do
  # end

  # subscription do
  # end
end
