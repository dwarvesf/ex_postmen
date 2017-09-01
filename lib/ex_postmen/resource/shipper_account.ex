defmodule ExPostmen.ShipperAccount do
  @moduledoc """
    ShipperAccount object in Postmen
  """
  use ExPostmen.Resource, import: [
    :create,
    :find,
    :list,
    :delete
  ]

  @doc false
  def create_url, do: "shipper-accounts"
  
  @doc false
  def find_url(id), do: "shipper-accounts/#{id}"

  @doc false
  def list_url(), do: "shipper-accounts"

  @doc false
  def delete_url(id), do: "shipper-accounts/#{id}"

  @doc false
  def update_credentials_url(id), do: "shipper-accounts/#{id}/credentials"

  def update_credentials(id, params) do
    path = update_credentials_url(id)

    ExPostmen.Request.new(%{
      http_method: :put,
      params: params,
      path: path
    })
  end

  @doc false
  def update_info_url(id), do: "shipper-accounts/#{id}/info"
  
  def update_info(id, params) do
    path = update_info_url(id)

    ExPostmen.Request.new(%{
      http_method: :put,
      params: params,
      path: path
    })
  end

end