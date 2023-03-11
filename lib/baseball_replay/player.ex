defmodule BaseballReplay.Player do
  @moduledoc """
  Represent an individual player.
  """

  @derive Jason.Encoder

  defstruct [
    :id,
    :full_name,
    :link
  ]

  @type id :: non_neg_integer()

  @type t :: %__MODULE__{
          id: id(),
          full_name: String.t(),
          link: String.t()
        }

  @spec parse(map()) :: {:ok, t()}
  def parse(json) do
    {:ok,
     %__MODULE__{
       id: json["id"],
       full_name: json["fullName"],
       link: json["link"]
     }}
  end
end
