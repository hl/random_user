defmodule RandomUser.Error do
  @moduledoc """
  Error
  """

  defstruct [:code, :message]

  @opaque t :: %__MODULE__{
            code: code() | nil,
            message: message() | nil
          }
  @type code :: non_neg_integer()
  @type message :: String.t()

  # TODO: expand cases
  @spec new(map()) :: t()
  def new(_error) do
    struct(__MODULE__, code: 1, message: "generic")
  end

  @spec code(t()) :: code() | nil
  def code(%__MODULE__{code: code}), do: code

  @spec message(t()) :: message() | nil
  def message(%__MODULE__{message: message}), do: message
end
