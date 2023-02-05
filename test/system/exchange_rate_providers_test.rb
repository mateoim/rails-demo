# frozen_string_literal: true

require 'application_system_test_case'

class ExchangeRateProvidersTest < ApplicationSystemTestCase
  setup do
    @exchange_rate_provider = exchange_rate_providers(:one)
  end

  test 'visiting the index' do
    visit exchange_rate_providers_url
    assert_selector 'h1', text: 'Exchange rate providers'
  end
end
