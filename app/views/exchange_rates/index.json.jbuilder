json.array! @exchange_rate do |rate|
  json.partial! "exchange_rates/exchange_rate", exchange_rate: rate
end
