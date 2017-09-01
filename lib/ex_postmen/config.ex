defmodule ExPostmen.Config do
  defstruct [
    api_key: "",
    sand_box: true,
    scheme: "https",
    failover: false,
  ]

  def new(api_key, sand_box \\ true) do
    %ExPostmen.Config {
      api_key: api_key,
      sand_box: sand_box
    }
  end
  
end