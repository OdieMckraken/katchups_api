defmodule KatchupsApi.Users do
  @moduledoc """
  The Users context.
  """

  import Ecto.Query, warn: false
  import Ecto.Changeset
  import Ecto.Query

  alias KatchupsApi.Repo
  alias KatchupsApi.Users.Friendship
  alias KatchupsApi.Users.Katchup

  @doc """
  Returns the list of friendships.

  ## Examples

      iex> list_friendships()
      [%Friendship{}, ...]

  """
  def list_friends(user_id) do
    friends = Friendship 
      |> where([f], f.from_user_id == ^user_id or f.to_user_id == ^user_id)
      |> where([f], f.status == "confirmed")
      Repo.all(friends)
      |> Repo.preload(:to_user)
      |> Repo.preload(:from_user)
  end

  @doc """
  Gets a single friendship.

  Raises `Ecto.NoResultsError` if the Friendship does not exist.

  ## Examples

      iex> get_friendship!(123)
      %Friendship{}

      iex> get_friendship!(456)
      ** (Ecto.NoResultsError)

  """
  def get_friendship!(id), do: Repo.get!(Friendship, id)

  @doc """
  Creates a friendship.

  ## Examples

      iex> create_friendship(%{field: value})
      {:ok, %Friendship{}}

      iex> create_friendship(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_friendship(attrs \\ %{}) do
    %Friendship{}
    |> Friendship.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a friendship.

  ## Examples

      iex> update_friendship(friendship, %{field: new_value})
      {:ok, %Friendship{}}

      iex> update_friendship(friendship, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_friendship(%Friendship{} = friendship, attrs) do
    friendship
    |> Friendship.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a friendship.

  ## Examples

      iex> delete_friendship(friendship)
      {:ok, %Friendship{}}

      iex> delete_friendship(friendship)
      {:error, %Ecto.Changeset{}}

  """
  def delete_friendship(%Friendship{} = friendship) do
    Repo.delete(friendship)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking friendship changes.

  ## Examples

      iex> change_friendship(friendship)
      %Ecto.Changeset{data: %Friendship{}}

  """
  def change_friendship(%Friendship{} = friendship, attrs \\ %{}) do
    Friendship.changeset(friendship, attrs)
  end

  alias KatchupsApi.Users.Katchup

  @doc """
  Returns the list of katchups.

  ## Examples

      iex> list_katchups()
      [%Katchup{}, ...]

  """
  def list_katchups(user_id) do
    katchups = Katchup 
      |> where([k], k.requester_id == ^user_id or k.addressee_id == ^user_id)
      Repo.all(katchups)
      |> Repo.preload(:requester) 
      |> Repo.preload(:addressee)
  end

  @doc """
  Gets a single katchup.

  Raises `Ecto.NoResultsError` if the Katchup does not exist.

  ## Examples

      iex> get_katchup!(123)
      %Katchup{}

      iex> get_katchup!(456)
      ** (Ecto.NoResultsError)

  """
  def get_katchup!(id), do: Repo.get!(Katchup, id)

  @doc """
  Creates a katchup.

  ## Examples

      iex> create_katchup(%{field: value})
      {:ok, %Katchup{}}

      iex> create_katchup(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_katchup(attrs \\ %{}) do
    %Katchup{}
    |> Katchup.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a katchup.

  ## Examples

      iex> update_katchup(katchup, %{field: new_value})
      {:ok, %Katchup{}}

      iex> update_katchup(katchup, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_katchup(%Katchup{} = katchup, attrs) do
    katchup
    |> Katchup.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a katchup.

  ## Examples

      iex> delete_katchup(katchup)
      {:ok, %Katchup{}}

      iex> delete_katchup(katchup)
      {:error, %Ecto.Changeset{}}

  """
  def delete_katchup(%Katchup{} = katchup) do
    Repo.delete(katchup)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking katchup changes.

  ## Examples

      iex> change_katchup(katchup)
      %Ecto.Changeset{data: %Katchup{}}

  """
  def change_katchup(%Katchup{} = katchup, attrs \\ %{}) do
    Katchup.changeset(katchup, attrs)
  end
end
