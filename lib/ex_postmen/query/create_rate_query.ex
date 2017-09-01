defmodule ExPostmen.CreateRateQuery do
  defstruct [
    shipment: nil,
    async: false,
    is_document: false,
    shipper_accounts: nil,
  ]

  def new(shipment, async, is_document, shipper_accounts) do
    %ExPostmen.CreateRateQuery {
      shipment: shipment,
      async: async,
      is_document: is_document,
      shipper_accounts: shipper_accounts,
    }
  end
  
end