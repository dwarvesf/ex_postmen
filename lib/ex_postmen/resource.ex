defmodule ExPostmen.Resource do
  @moduledoc false

  defmacro __using__(options) do
    import_functions = options[:import] || []

    quote bind_quoted: [import_functions: import_functions] do
      if :create in import_functions do
        @spec create(map) :: ExPostmen.Request.t
        def create(params) do
          request(:post, create_url(), params)
        end
      end

      if :delete in import_functions do
        @spec delete(binary) :: ExPostmen.Request.t
        def delete(id) do
          request(:delete, delete_url(id))
        end
      end

      if :find in import_functions do
        @spec find(binary, map) :: ExPostmen.Request.t
        def find(id, params \\ %{}) do
          request(:get, find_url(id), params)
        end
      end

      if :list in import_functions do
        @spec list(map) :: ExPostmen.Request.t
        def list(params \\ %{}) do
          request(:get, list_url(), params)
        end
      end

      if :update in import_functions do
        @spec update(binary, map) :: ExPostmen.Request.t
        def update(id, params \\ nil) do
          request(:put, update_url(id), params)
        end
      end

      defp request(http_method, path, params \\ %{}) do
        ExPostmen.Request.new(%{
          http_method: http_method,
          params: params,
          path: path
        })
      end
    end
  end
end