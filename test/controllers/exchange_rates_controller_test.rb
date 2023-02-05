# frozen_string_literal: true

require 'test_helper'

class ExchangeRatesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @exchange_rate_provider = exchange_rate_providers(:one)
    @exchange_rate = exchange_rates(:one)
  end

  test 'should get index' do
    get exchange_rate_provider_exchange_rates_url(@exchange_rate_provider)
    assert_response :success
  end

  test 'should show exchange_rate_provider' do
    get exchange_rate_provider_exchange_rate_url(@exchange_rate_provider, @exchange_rate)
    assert_response :success
  end

  test 'not found' do
    get exchange_rate_provider_exchange_rate_url(@exchange_rate_provider, exchange_rates(:three))
    assert_response :missing
  end
end
