defmodule RandomUser.Result do
  @moduledoc """
  Result
  """

  alias RandomUser.User

  defstruct amount: 0, users: []

  @opaque t :: %__MODULE__{
            amount: amount() | nil,
            users: [RandomUser.User.t()]
          }
  @type amount :: non_neg_integer()

  @spec new(users :: [map()], amount :: non_neg_integer()) :: t()
  def new(users, amount) do
    struct(__MODULE__, amount: amount, users: Enum.map(users, &User.new/1))
  end

  @spec amount(t()) :: amount() | nil
  def amount(%__MODULE__{amount: amount}), do: amount

  @spec users(t()) :: [RandomUser.User.t()]
  def users(%__MODULE__{users: users}), do: users
end
