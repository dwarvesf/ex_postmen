defmodule ExPostmen.Rate do
  @moduledoc """
    Rate object in Postmen
  """
  use ExPostmen.Resource, import: [
    :create,
    :find,
    :list
  ]

  @doc false
  def create_url, do: "rates"
  
  @doc false
  def find_url(id), do: "rates/#{id}"

  @doc false
  def list_url(), do: "rates"

end