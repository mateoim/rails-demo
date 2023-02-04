# frozen_string_literal: true

module ExchangeRateProviders
  class CzechNationalBankProvider < Service
    def initialize(provider)
      @provider = provider
    end

    def call
      fetch_exchange_rate
    end

    private

    def fetch_exchange_rate
      response = DataFetcher.call @provider.source_url
      lines = response.split(/\n/)
      return [] if lines.empty?

      date = Date.parse lines.first
      data = []

      lines[2..]&.each do |line|
        parts = line.split(/\|/)

        params = {
          currency: parts[3],
          amount: parts[2],
          value: parts[4],
          exchange_rate_provider_id: @provider.id,
          published_at: date
        }

        exchange_rate = ExchangeRate.new params
        data << exchange_rate
      end

      data
    end
  end
end
