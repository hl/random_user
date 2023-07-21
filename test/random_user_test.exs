defmodule RandomUserTest do
  use ExUnit.Case, async: true

  import Mox

  setup :verify_on_exit!

  describe "get_users/0" do
    test "gets a list of users" do
      user_data = %{"email" => "email"}

      expect(RandomUserMock, :get_users, fn results, _page ->
        {:ok, RandomUser.Result.new([user_data], results)}
      end)

      results = 100
      page = 1

      assert {:ok, result} = RandomUser.get_users(results, page)
      assert ^results = RandomUser.Result.amount(result)
      assert RandomUser.User.new(user_data) in RandomUser.Result.users(result)
    end

    # TODO: expand tests
    test "returns a generic error" do
      expect(RandomUserMock, :get_users, fn _results, _page ->
        {:error, RandomUser.Error.new(nil)}
      end)

      results = 100
      page = 1

      assert {:error, error} = RandomUser.get_users(results, page)
      assert 1 == RandomUser.Error.code(error)
      assert "generic" == RandomUser.Error.message(error)
    end
  end
end
