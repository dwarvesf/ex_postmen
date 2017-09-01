defmodule ExPostmen.Label do
  @moduledoc """
    Label object in Postmen
  """
  use ExPostmen.Resource, import: [
    :create,
    :find,
    :list
  ]

  @doc false
  def create_url, do: "labels"
  
  @doc false
  def find_url(id), do: "labels/#{id}"

  @doc false
  def list_url(), do: "labels"

  @doc false
  def cancel_url(), do: "cancel-labels"
  def cancel_url(id), do: "cancel-labels/#{id}"

  def get_cancel_label(label_id, params \\ nil) do
    request(:get, cancel_url(label_id), params)
  end

  def cancel_label(label_id) do
    params = %{
      async: false,
      label: %{
        id: label_id
      }
    }
    request(:post, cancel_url(), params)
  end

  def cancel_label_list(params \\ nil) do
    request(:get, cancel_url(), params)
  end

end