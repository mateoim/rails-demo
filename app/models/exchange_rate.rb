# frozen_string_literal: true

class ExchangeRate < ApplicationRecord
  belongs_to :exchange_rate_provider
end
