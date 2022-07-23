defmodule KatchupsApi.Users.Katchup do
  use Ecto.Schema
  import Ecto.Changeset

  schema "katchups" do
    field :addressee_list, {:array, :string}, default: []
    field :distance, :integer
    field :location, :string
    field :requester_list, {:array, :string}, default: []
    field :restaurant_id, :string
    field :starts_at, :utc_datetime
    field :status, :string, default: "pending"
    field :addressee_type, :string
    belongs_to :requester, User
    belongs_to :addressee, User

    timestamps()
  end

  @doc false
  def changeset(katchup, attrs) do
    katchup
    |> cast(attrs, [
      :requester_list,
      :addressee_list,
      :restaurant_id,
      :starts_at,
      :location,
      :distance,
      :status,
      :addressee_id,
      :addressee_type,
      :requester_id
    ])
    |> validate_required([
      :location,
      :distance,
      :status,
      :requester_list,
      :starts_at,
      :addressee_type,
      :requester_id
    ])
    |> validate_length(:requester_list, min: 1)
  end
end
