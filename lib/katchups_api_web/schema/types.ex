defmodule KatchupsGraphqlApiWeb.Schema.Types do
  use Absinthe.Schema.Notation
  alias KatchupsGraphqlApiWeb.Schema.Types

  import_types(Types.UserType)
end
