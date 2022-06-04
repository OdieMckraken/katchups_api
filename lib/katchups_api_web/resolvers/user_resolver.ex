defmodule KatchupsApiWeb.Resolvers.UserResolver do
  alias KatchupsApi.Accounts

  def users(_, _, %{context: _context}) do
    {:ok, Accounts.list_users()}
  end

  def register_user(_, %{input: input}, _) do
    Accounts.create_user(input)
  end
end
