require "application_system_test_case"

class ExchangeRateProvidersTest < ApplicationSystemTestCase
  setup do
    @exchange_rate_provider = exchange_rate_providers(:one)
  end

  test "visiting the index" do
    visit exchange_rate_providers_url
    assert_selector "h1", text: "Exchange rate providers"
  end

  test "should create exchange rate provider" do
    visit exchange_rate_providers_url
    click_on "New exchange rate provider"

    click_on "Create Exchange rate provider"

    assert_text "Exchange rate provider was successfully created"
    click_on "Back"
  end

  test "should update Exchange rate provider" do
    visit exchange_rate_provider_url(@exchange_rate_provider)
    click_on "Edit this exchange rate provider", match: :first

    click_on "Update Exchange rate provider"

    assert_text "Exchange rate provider was successfully updated"
    click_on "Back"
  end

  test "should destroy Exchange rate provider" do
    visit exchange_rate_provider_url(@exchange_rate_provider)
    click_on "Destroy this exchange rate provider", match: :first

    assert_text "Exchange rate provider was successfully destroyed"
  end
end
