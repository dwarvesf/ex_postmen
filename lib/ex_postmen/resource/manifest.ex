defmodule ExPostmen.Manifest do
  @moduledoc """
    Manifest object in Postmen
  """
  use ExPostmen.Resource, import: [
    :create,
    :find,
    :list
  ]

  @doc false
  def create_url, do: "manifests"
  
  @doc false
  def find_url(id), do: "manifests/#{id}"

  @doc false
  def list_url(), do: "manifests"

end