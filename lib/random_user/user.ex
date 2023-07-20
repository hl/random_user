defmodule RandomUser.User do
  @moduledoc """
  User
  """

  defstruct [:email]

  @type t :: %__MODULE__{
          email: String.t() | nil
        }

  @spec new(%{String.t() => term()}) :: t()
  def new(data) do
    struct(__MODULE__, email: data["email"])
  end
end
