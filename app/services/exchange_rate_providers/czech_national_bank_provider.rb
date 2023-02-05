# frozen_string_literal: true

module ExchangeRateProviders

  # A Service that fetches data for ExchangeRateProviders type CzechNationalBank and parses it into ExchangeRates,
  # but doesn't save them.
  # It takes an optional parameter date to fetch ExchangeRates for the given date.
  # Returns an array of ExchangeRates.
  class CzechNationalBankProvider < Service
    def initialize(provider, date)
      @provider = provider
      @date = date
    end

    def call
      fetch_exchange_rate
    end

    private

    def fetch_exchange_rate
      url = @provider.source_url

      url = "#{url}?date=#{@date.strftime('%d.%m.%Y.')}" unless @date.nil?

      response = DataFetcher.call url
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
