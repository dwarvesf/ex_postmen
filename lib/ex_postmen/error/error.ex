defmodule ExPostmen.Error do
  defstruct [
    type: -1,
    code: -1,
    message: "",
    data: nil,
    retry_count: 0,
    response_body: nil,
  ]

  def request_error(type, error_data) do
    %ExPostmen.Error {
      data: error_data,
      type: type
    }
  end

  def sdk_error(error_enum, error_data) do
    %ExPostmen.Error {
      type: error_enum.type,
      message: error_enum.message,
      data: error_data,
    }
  end

  def api_error(status_code, response_body, retry_count \\ 1) do
    %ExPostmen.Error {
      type: response_body.meta.code,
      message: response_body.meta.message,
      code: status_code,
      data: response_body.data,
      response_body: response_body,
      retry_count: retry_count,
    }
  end

  def server_side_error() do
    %ExPostmen.Error {
      message: "Something went wrong on server side",
      code: 500,
    }
  end
end