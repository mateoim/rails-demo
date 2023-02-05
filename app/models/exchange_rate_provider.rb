# frozen_string_literal: true

# A base ApplicationRecord used to define exchange rate providers. It can have multiple ExchangeRates saved in the database.
class ExchangeRateProvider < ApplicationRecord
  has_many :exchange_rates, dependent: :destroy

  def fetch_data(date = nil); end
end
