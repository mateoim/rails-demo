# frozen_string_literal: true

require 'test_helper'

class ExchangeRateTest < ActiveSupport::TestCase
  test 'test single table inheritance' do
    one = exchange_rate_providers(:one)
    assert_equal(one.class, CzechNationalBank)
  end

  test 'test exchange rates' do
    one = exchange_rate_providers(:one)
    one.exchange_rates.each do |rate|
      assert_equal(rate.exchange_rate_provider_id, one.id)
    end
  end
end
