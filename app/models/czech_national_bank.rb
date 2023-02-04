# frozen_string_literal: true

class CzechNationalBank < ExchangeRateProvider
  def fetch_data
    provider_service.call self
  end

  def self.model_name
    ExchangeRateProvider.model_name
  end

  private

  def provider_service
    ExchangeRateProviders::CzechNationalBankProvider
  end
end
