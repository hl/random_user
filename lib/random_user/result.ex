defmodule RandomUser.Result do
  @moduledoc """
  Result
  """

  alias RandomUser.User

  defstruct amount: 0, users: []

  @type t :: %__MODULE__{
          amount: non_neg_integer(),
          users: [RandomUser.User.t()]
        }

  @spec new(users :: [map()], amount :: non_neg_integer()) :: t()
  def new(users, amount) do
    struct(__MODULE__, amount: amount, users: Enum.map(users, &User.new/1))
  end
end
