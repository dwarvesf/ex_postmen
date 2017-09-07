defmodule ExPostmen.ErrorEnum do
  def constructor_invalid_api_key do
    %{
      type: :constructor_error,
      message: "ConstructorError: Invalid API key"
    }
  end

  def constructor_invalid_region do
    %{
      type: :constructor_error,
      message: "ConstructorError: Invalid Region value"
    }
  end

  def constructor_invalid_config do
    %{
      type: :constructor_error,
      message: "ConstructorError: Invalid Config value"
    }
  end

  def constructor_invalid_endpoint do
    %{
      type: :constructor_error,
      message: "ConstructorError: Invalid Endpoint value"
    }
  end

  def constructor_invalid_proxy do
    %{
      type: :constructor_error,
      message: "ConstructorError: Invalid Proxy value"
    }
  end

  def constructor_invalid_retry do
    %{
      type: :constructor_error,
      message: "ConstructorError: Invalid Retry value"
    }
  end

  def constructor_invalid_rate do
    %{
      type: :constructor_error,
      message: "ConstructorError: Invalid Rate value"
    }
  end

  def constructor_invalid_raw do
    %{
      type: :constructor_error,
      message: "ConstructorError: Invalid Raw value"
    }
  end

  # Handle Error
  def handler_invalid_method do
    %{
      type: :handler_error,
      message: "HandlerError: Invalid Method value"
    }
  end

  def handler_invalid_resource do
    %{
      type: :handler_error,
      message: "HandlerError: Invalid Resource value"
    }
  end

  def handler_invalid_inputs do
    %{
      type: :handler_error,
      message: "HandlerError: Invalid Inputs value"
    }
  end

  def handler_invalid_config do
    %{
      type: :handler_error,
      message: "HandlerError: Invalid Config value"
    }
  end

  def handler_invalid_body do
    %{
      type: :handler_error,
      message: "HandlerError: Invalid Body value"
    }
  end

  def handler_invalid_query do
    %{
      type: :handler_error,
      message: "HandlerError: Invalid Query value"
    }
  end

  def handler_invalid_raw do
    %{
      type: :handler_error,
      message: "HandlerError: Invalid Raw value"
    }
  end

  def handler_invalid_retry do
    %{
      type: :handler_error,
      message: "HandlerError: Invalid Retry value"
    }
  end

  def handler_invalid_api_key do
    %{
      type: :handler_error,
      message: "HandlerError: Invalid Api Key"
    }
  end
end