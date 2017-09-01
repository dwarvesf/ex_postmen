defmodule ExPostmen.Helper do
  @moduledoc """
    Helpers is a helper functions for Postmen
  """
  def convert_to_atom_map(map), do: to_atom_map(map)
  
  defp to_atom_map(x) when is_map(x) do
    Map.new(x, fn {k, v} -> {String.to_atom(k), to_atom_map(v)} end)
  end
  defp to_atom_map(x) when is_list(x) do
    Enum.map(x, fn(val) -> to_atom_map(val) end)
  end
  defp to_atom_map(x), do: x
end