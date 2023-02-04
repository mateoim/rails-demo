# frozen_string_literal: true

class ExchangeRateProvider < ApplicationRecord
  has_many :exchange_rates, dependent: :destroy

  def fetch_data; end
end
