json.array! @exchange_rate_providers do |provider|
  json.partial! "exchange_rate_providers/exchange_rate_provider", exchange_rate_provider: provider
end
