# frozen_string_literal: true

class ExchangeRate < ApplicationRecord
  belongs_to :exchange_rate_provider

  scope :published_at, ->(date) { where('published_at = ?', date) }
end
