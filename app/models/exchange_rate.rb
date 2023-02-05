# frozen_string_literal: true

# An ApplicationRecord that defines an exchange rate record in the database generated by an ExchangeRateProvider.
class ExchangeRate < ApplicationRecord
  belongs_to :exchange_rate_provider

  scope :published_at, ->(date) { where('published_at = ?', date) }
  scope :currency, ->(currencies) { where('currency IN (?)', currencies) }
end
