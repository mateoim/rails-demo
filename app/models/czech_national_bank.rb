# frozen_string_literal: true

# An ExchangeRateProvider used for exchange rates provided by the Czech National Bank. It is linked to a Service that
# can fetch and parse new ExchangeRates.
class CzechNationalBank < ExchangeRateProvider
  def fetch_data(date = nil)
    provider_service.call(self, date)
  end

  def self.model_name
    ExchangeRateProvider.model_name
  end

  private

  def provider_service
    ExchangeRateProviders::CzechNationalBankProvider
  end
end
