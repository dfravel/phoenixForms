defmodule PhoenixForms.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :first_name, :string
      add :last_name, :string
      add :address, :string
      add :email, :string
      add :date_of_birth, :naive_datetime
      add :number_of_children, :integer
      add :notifications_enabled, :boolean, default: false, null: false

      timestamps()
    end

    create unique_index(:users, [:email])
  end
end
