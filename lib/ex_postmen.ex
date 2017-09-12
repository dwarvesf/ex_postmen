defmodule ExPostmen do
  @moduledoc """
  Documentation for ExPostmen.
  """

  @spec request(ExPostmen.Request.t, ExPostmen.Config.t) :: {:ok, term} | {:error, term}
  def request(request, config) do
    ExPostmen.Request.perform(request, config)
  end

  @api_key "a602565f-9f3f-4bde-8bba-ff22727291d7"
  @sand_box true

  @spec request(ExPostmen.Request.t, String.t, boolean, Integer) :: {:ok, term} | {:error, term}
  def request(request, api_key, sand_box, timeout) do
    ExPostmen.Request.perform(request, ExPostmen.Config.new(api_key, sand_box, timeout))
  end

  @spec request(ExPostmen.Request.t) :: {:ok, term} | {:error, term}
  def request(request) do
    ExPostmen.Request.perform(request, ExPostmen.Config.new(@api_key, @sand_box))
  end
end
