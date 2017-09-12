defmodule ExPostmen.Config do
  defstruct [
    api_key: "",
    sand_box: true,
    scheme: "https",
    failover: false,
    timeout: 5000,
  ]

  def new(api_key, sand_box \\ true, timeout \\ 5000) do
    %ExPostmen.Config {
      api_key: api_key,
      sand_box: sand_box,
      timeout: timeout
    }
  end
  
end