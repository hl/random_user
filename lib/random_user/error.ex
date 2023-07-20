defmodule RandomUser.Error do
  @moduledoc """
  Error
  """

  defstruct [:code, :message]

  @type t :: %__MODULE__{
          code: non_neg_integer() | nil,
          message: String.t() | nil
        }

  # TODO: expand cases
  @spec new(map()) :: t()
  def new(_error) do
    struct(__MODULE__, code: 1, message: "Not implemented yet")
  end
end
