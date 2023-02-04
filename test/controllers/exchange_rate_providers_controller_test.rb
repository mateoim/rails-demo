require "test_helper"

class ExchangeRateProvidersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @exchange_rate_provider = exchange_rate_providers(:one)
  end

  test "should get index" do
    get exchange_rate_providers_url
    assert_response :success
  end

  test "should get new" do
    get new_exchange_rate_provider_url
    assert_response :success
  end

  test "should create exchange_rate_provider" do
    assert_difference("ExchangeRateProvider.count") do
      post exchange_rate_providers_url, params: { exchange_rate_provider: {} }
    end

    assert_redirected_to exchange_rate_provider_url(ExchangeRateProvider.last)
  end

  test "should show exchange_rate_provider" do
    get exchange_rate_provider_url(@exchange_rate_provider)
    assert_response :success
  end

  test "should get edit" do
    get edit_exchange_rate_provider_url(@exchange_rate_provider)
    assert_response :success
  end

  test "should update exchange_rate_provider" do
    patch exchange_rate_provider_url(@exchange_rate_provider), params: { exchange_rate_provider: {} }
    assert_redirected_to exchange_rate_provider_url(@exchange_rate_provider)
  end

  test "should destroy exchange_rate_provider" do
    assert_difference("ExchangeRateProvider.count", -1) do
      delete exchange_rate_provider_url(@exchange_rate_provider)
    end

    assert_redirected_to exchange_rate_providers_url
  end
end
