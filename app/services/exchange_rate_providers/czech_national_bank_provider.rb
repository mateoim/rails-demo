# frozen_string_literal: true

module ExchangeRateProviders
  class CzechNationalBankProvider < Service
    def initialize(url)
      @url = url
    end

    def call
      fetch_exchange_rate
    end

    private

    def fetch_exchange_rate
      response = DataFetcher.call @url
      lines = response.split /\n/
      return if lines.empty?

      date = Date.parse lines.first
      data = []

      lines[2..-1]&.each { |line|
        parts = line.split
        data << parts.join(' ')
      }

      data
    end
  end
end
