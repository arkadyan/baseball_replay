defmodule BaseballReplay.Play.Splits do
  @derive Jason.Encoder

  defstruct [
    :batter,
    :pitcher,
    :men_on_base
  ]

  @type batter_split :: :vs_lhp | :vs_rhp
  @type pitcher_split :: :vs_lhb | :vs_rhb
  @type men_on_base :: :empty | :men_on | :risp

  @type t :: %__MODULE__{
          batter: batter_split(),
          pitcher: pitcher_split(),
          men_on_base: men_on_base()
        }

  @spec parse(map()) :: {:ok, t()}
  def parse(json) do
    {:ok,
     %__MODULE__{
       batter: batter_split(json["batter"]),
       pitcher: pitcher_split(json["pitcher"]),
       men_on_base: men_on_base(json["menOnBase"])
     }}
  end

  @spec batter_split(map()) :: batter_split() | nil
  defp batter_split("vs_LHP"), do: :vs_lhp
  defp batter_split("vs_RHP"), do: :vs_rhp
  defp batter_split(_), do: nil

  @spec pitcher_split(map()) :: pitcher_split() | nil
  defp pitcher_split("vs_LHB"), do: :vs_lhb
  defp pitcher_split("vs_RHB"), do: :vs_rhb
  defp pitcher_split(_), do: nil

  defp men_on_base("Empty"), do: :empty
  defp men_on_base("Men_On"), do: :men_on
  defp men_on_base("RISP"), do: :risp
  defp men_on_base(_), do: nil
end
