defmodule KatchupsApiWeb.Schema.Types do
  use Absinthe.Schema.Notation
  alias KatchupsApiWeb.Schema.Types

  import_types(Types.UserType)
end
