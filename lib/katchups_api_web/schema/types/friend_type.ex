defmodule KatchupsApiWeb.Schema.Types.FriendType do
  use Absinthe.Schema.Notation
  use Absinthe.Ecto, repo: KatchupsApi.Repo

  object :friend_type do
    field(:from_user, :user_type, resolve: assoc(:from_user))
    field(:to_user, :user_type, resolve: assoc(:to_user))
    field(:status, :string)
    field(:id, :id)
  end

  input_object :friend_input_type do
    field(:from_user_id, non_null(:id))
    field(:to_user_id, non_null(:id))
    field(:status, non_null(:string))
  end
end