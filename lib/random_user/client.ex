defmodule RandomUser.Client do
  @moduledoc """
  Client
  """

  use Tesla

  alias RandomUser.Error
  alias RandomUser.Result

  @config Application.compile_env(:random_user, __MODULE__)

  plug Tesla.Middleware.BaseUrl, @config[:base_url]
  plug Tesla.Middleware.JSON

  @behaviour RandomUser

  @impl RandomUser
  def get_users(results, page) do
    case get("/api", query: [results: results, page: page]) do
      {:ok, %Tesla.Env{body: %{"results" => users, "info" => %{"results" => amount}}}} ->
        {:ok, Result.new(users, amount)}

      {:error, error} ->
        {:error, Error.new(error)}
    end
  end
end
