defmodule KatchupsApiWeb.Schema.Types.KatchupType do
  use Absinthe.Schema.Notation
  use Absinthe.Ecto, repo: KatchupsApi.Repo

  import_types Absinthe.Type.Custom

  object :katchup_type do
    field(:id, :id)
    field(:addressee_list, list_of(:string))
    field(:distance, :integer)
    field(:location, :string)
    field(:requester_list, list_of(:string))
    field(:restaurant_id, :string)
    field(:starts_at, :datetime)
    field(:status, :string)
    field(:addressee, :user_type)
    field(:addressee_type, :string)
    field(:requester, :user_type)
  end

  input_object :katchup_input_type do
    field(:addressee_list, non_null(list_of(:id)))
    field(:distance, non_null(:integer))
    field(:location, non_null(:string))
    field(:requester_list, non_null(list_of(:id)))
    field(:restaurant_id, :string)
    field(:starts_at, non_null(:datetime))
    field(:status, non_null(:string))
    field(:addressee_id, :id)
    field(:addressee_type, non_null(:string))
    field(:requester_id, non_null(:id))
  end
end