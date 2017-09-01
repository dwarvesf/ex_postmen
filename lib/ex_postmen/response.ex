defmodule ExPostmen.Response do
  
  def parse(response) do
    case response do
      {:ok, response = %{status_code: status_code}} when status_code in 200..299 ->
        {:ok, response}
      {:ok, %{body: body, status_code: status_code}} when status_code >= 400 ->
        IO.puts body
        {:error, {:http_error, status_code, Poison.decode!(body)}}
      {:error, %{reason: reason}} ->
        {:error, {:client_error, reason}}
    end  
  end
end