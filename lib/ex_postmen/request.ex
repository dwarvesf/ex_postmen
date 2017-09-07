defmodule ExPostmen.Request do
  
    defstruct [
      headers: [],
      http_method: nil,
      params: nil,
      path: nil,
      retry_count: 0,
      retry: false,
    ]
  
    @api_base "https://api.easypost.com/v2"
    @http_opts []
    @open_timeout 30
    @timeout 60
    
    # Main domain used during normal usage.
    @main_domain "postmen.com"
    
    # Failover domain used during DNS issues with main domain
    @failover_domain "postmen.net"
  
    @type t :: %__MODULE__{}
  
    def new(config) do
      struct(%__MODULE__{}, config)
    end
  
    def perform(request, config) do
      request(request, config)
      |> parse()
    end
  
    # private
  
    defp build_url(request, config) do
      api_base_url = api_base_url(config)
      endpoint = request.path
      "#{api_base_url}/v3/#{endpoint}"
    end

    defp sub_domain(sand_box) do
      if sand_box == true, do: "sandbox-api", else: "production-api"
    end

    defp domain_url(failover) do
      if failover, do: @failover_domain, else: @main_domain
    end

    defp api_base_url(config) do
      scheme = config.scheme
      sub_domain = sub_domain(config.sand_box)
      domain_url = domain_url(config.failover)

      "#{scheme}://#{sub_domain}.#{domain_url}"
    end
  
    defp request(request, config) do
      api_key = config.api_key
      url = build_url(request, config)
  
      request(request.http_method, url, request.params, request.headers, api_key)
    end
  
    defp parse(response), do: ExPostmen.Response.parse(response)
    
    defp request(http_method, url, params, headers, api_key) do
      all_headers = build_headers(headers, api_key)

      url = if http_method == :get, do: url <> "?" <> URI.encode_query(params), else: url

      data = if http_method == :get, do: "", else: Poison.encode!(params)
  
      response = HTTPoison.request(http_method, url, data, all_headers, @http_opts)
      
    end
  
    defp build_headers(headers, api_key) do
      headers ++ [
        {"content-type", "application/json"},
        {"postmen-api-key", "#{api_key}"},
        {"User-Agent", "ExPostmen/v3 ElixirClient1.0"},
        {"Connection", "keep-alive"},
      ]
    end
  end