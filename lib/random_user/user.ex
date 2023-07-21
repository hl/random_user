defmodule RandomUser.User do
  @moduledoc """
  User
  """

  defstruct [:email]

  @opaque t :: %__MODULE__{
            email: String.t() | nil
          }

  # TODO: expand User fields
  @spec new(%{String.t() => term()}) :: t()
  def new(data) do
    struct(__MODULE__, email: data["email"])
  end
end
