defmodule PhoenixForms.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset
  alias PhoenixForms.Accounts.User


  schema "users" do
    field :address, :string
    field :date_of_birth, :naive_datetime
    field :email, :string
    field :first_name, :string
    field :last_name, :string
    field :notifications_enabled, :boolean, default: false
    field :number_of_children, :integer

    timestamps()
  end

  @doc false
  def changeset(%User{} = user, attrs) do
    user
    |> cast(attrs, [:first_name, :last_name, :address, :email, :date_of_birth, :number_of_children, :notifications_enabled])
    |> validate_required([:first_name, :last_name, :address, :email, :date_of_birth, :number_of_children, :notifications_enabled])
    |> validate_length(:address, min: 3)
    |> validate_number(:number_of_children, greater_than_or_equal_to: 0)
    |> unique_constraint(:email)
  end
end
