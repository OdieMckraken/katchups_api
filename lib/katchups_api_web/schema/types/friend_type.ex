defmodule KatchupsApiWeb.Schema.Types.FriendType do
  use Absinthe.Schema.Notation
  use Absinthe.Ecto, repo: KatchupsApi.Repo

  object :friend_type do
    field(:friend, :user_type)
    field(:status, :string)
    field(:id, :id)
  end

  input_object :friend_input_type do
    field(:from_user_id, non_null(:id))
    field(:to_user_id, non_null(:id))
    field(:status, non_null(:string))
  end
end