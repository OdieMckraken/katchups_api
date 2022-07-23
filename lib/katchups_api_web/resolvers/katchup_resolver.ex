defmodule KatchupsApiWeb.Resolvers.KatchupResolver do
  alias KatchupsApi.Users
  alias KatchupsApi.Accounts
  require IEx

  def katchups(_, _, %{context: context}) do  
    {:ok, Users.list_katchups(context.current_user.id)}
  end

  def new_katchup(_, %{input: input}, _) do
    Users.create_katchup(input)
  end
end