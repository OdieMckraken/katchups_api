defmodule KatchupsApiWeb.Schema.Types do
  use Absinthe.Schema.Notation
  alias KatchupsApiWeb.Schema.Types

  import_types(Types.UserType)
  import_types(Types.FriendType)
  import_types(Types.SessionType)
  import_types(Types.KatchupType)
end
