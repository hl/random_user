defmodule RandomUserTest do
  use ExUnit.Case, async: true

  import Mox

  setup :verify_on_exit!

  describe "get_users/0" do
    test "gets a list of users" do
      expect(RandomUserMock, :get_users, fn results, _page ->
        {:ok, RandomUser.Result.new([%{"email" => "email"}], results)}
      end)

      results = 100
      page = 1

      assert {:ok, %RandomUser.Result{amount: ^results, users: users}} =
               RandomUser.get_users(results, page)

      assert %RandomUser.User{email: "email"} in users
    end

    # TODO: expand tests
    test "returns a generic error" do
      expect(RandomUserMock, :get_users, fn _results, _page ->
        {:error, %RandomUser.Error{code: 1, message: "generic"}}
      end)

      results = 100
      page = 1

      assert {:error, %RandomUser.Error{code: 1, message: "generic"}} =
               RandomUser.get_users(results, page)
    end
  end
end
