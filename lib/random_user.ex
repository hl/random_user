defmodule RandomUser do
  @moduledoc """
  RandomUser API
  """

  @callback get_users(results :: non_neg_integer(), page :: non_neg_integer()) ::
              {:ok, RandomUser.Result.t()} | {:error, RandomUser.Error.t()}

  def get_users(results, page), do: impl().get_users(results, page)

  @doc false
  def impl, do: Application.get_env(:random_user, __MODULE__, RandomUser.API)
end
