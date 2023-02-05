# frozen_string_literal: true

require 'test_helper'

class ExchangeRateProvidersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @exchange_rate_provider = exchange_rate_providers(:one)
  end

  test 'should get index' do
    get exchange_rate_providers_url
    assert_response :success
  end

  test 'should show exchange_rate_provider' do
    get exchange_rate_provider_url(@exchange_rate_provider)
    assert_redirected_to exchange_rate_provider_exchange_rates_url(@exchange_rate_provider)
    assert_response :redirect
  end
end
