defmodule ExPostmen.Response do
  
  def parse(response) do
    case response do
      {:ok, response = %{body: body, status_code: status_code, headers: headers}} when status_code == 429 ->
        json = Poison.decode!(body) |> parse_response
        {:error, ExPostmen.Error.api_error(status_code, json)}

      {:ok, response = %{body: body, status_code: status_code}} when status_code == 200 ->
        json = Poison.decode!(body) |> parse_response

        case json.meta.code do
          200 -> {:ok, json.data}
          4153 -> {:error, ExPostmen.Error.api_error(status_code, json)}
          _ -> {:error, ExPostmen.Error.api_error(status_code, json)}
        end

      {:ok, %{body: body, status_code: status_code}} when status_code >= 400 ->
        json = Poison.decode!(body) |> parse_response
        {:error, ExPostmen.Error.api_error(status_code, json)}

      {:error, %{reason: reason}} ->
        {:error, ExPostmen.Error.request_error(999, reason)}
    end  
  end

  defp parse_response(data) do
    ExPostmen.Helper.convert_to_atom_map(data)
  end
end