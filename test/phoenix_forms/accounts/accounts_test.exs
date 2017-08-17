defmodule PhoenixForms.AccountsTest do
  use PhoenixForms.DataCase

  alias PhoenixForms.Accounts

  describe "users" do
    alias PhoenixForms.Accounts.User

    @valid_attrs %{address: "some address", date_of_birth: ~N[2010-04-17 14:00:00.000000], email: "some email", first_name: "some first_name", last_name: "some last_name", notifications_enabled: true, number_of_children: 42}
    @update_attrs %{address: "some updated address", date_of_birth: ~N[2011-05-18 15:01:01.000000], email: "some updated email", first_name: "some updated first_name", last_name: "some updated last_name", notifications_enabled: false, number_of_children: 43}
    @invalid_attrs %{address: nil, date_of_birth: nil, email: nil, first_name: nil, last_name: nil, notifications_enabled: nil, number_of_children: nil}

    def user_fixture(attrs \\ %{}) do
      {:ok, user} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Accounts.create_user()

      user
    end

    test "list_users/0 returns all users" do
      user = user_fixture()
      assert Accounts.list_users() == [user]
    end

    test "get_user!/1 returns the user with given id" do
      user = user_fixture()
      assert Accounts.get_user!(user.id) == user
    end

    test "create_user/1 with valid data creates a user" do
      assert {:ok, %User{} = user} = Accounts.create_user(@valid_attrs)
      assert user.address == "some address"
      assert user.date_of_birth == ~N[2010-04-17 14:00:00.000000]
      assert user.email == "some email"
      assert user.first_name == "some first_name"
      assert user.last_name == "some last_name"
      assert user.notifications_enabled == true
      assert user.number_of_children == 42
    end

    test "create_user/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Accounts.create_user(@invalid_attrs)
    end

    test "update_user/2 with valid data updates the user" do
      user = user_fixture()
      assert {:ok, user} = Accounts.update_user(user, @update_attrs)
      assert %User{} = user
      assert user.address == "some updated address"
      assert user.date_of_birth == ~N[2011-05-18 15:01:01.000000]
      assert user.email == "some updated email"
      assert user.first_name == "some updated first_name"
      assert user.last_name == "some updated last_name"
      assert user.notifications_enabled == false
      assert user.number_of_children == 43
    end

    test "update_user/2 with invalid data returns error changeset" do
      user = user_fixture()
      assert {:error, %Ecto.Changeset{}} = Accounts.update_user(user, @invalid_attrs)
      assert user == Accounts.get_user!(user.id)
    end

    test "delete_user/1 deletes the user" do
      user = user_fixture()
      assert {:ok, %User{}} = Accounts.delete_user(user)
      assert_raise Ecto.NoResultsError, fn -> Accounts.get_user!(user.id) end
    end

    test "change_user/1 returns a user changeset" do
      user = user_fixture()
      assert %Ecto.Changeset{} = Accounts.change_user(user)
    end
  end
end
